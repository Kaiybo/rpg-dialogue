-- The hunter's own beast (role "my_beast"). Beasts don't speak, so the hunter does the talking:
-- praise, scolding, feeding, old memories and the things a hunter only says to an animal that
-- can't repeat them. Every NPC line is the beast's reaction, written as narration in asterisks,
-- with {npc} as the pet's name. Lines vary by family (pet = { family = ... }), race, level,
-- time of day, deaths, drink and party.
-- Lore: Classic only. Tame Beast and the taming rod, Feed Pet, happiness and loyalty (an unfed
-- pet grows sullen and can run off), Mend Pet, Revive Pet, Eyes of the Beast, Feign Death,
-- Beast Training and training points (tricks learned from wild beasts), the stable master,
-- the trainers of Teldrassil, Dun Morogh, Durotar and Mulgore, Cenarius and the druids.
-- Abandoning is only talked about here; the game decides nothing.
local P = RPGDialogueAPI:Pack("rpgd.world")

local CAT, WOLF, BOAR, BEAR = { family = "Cat" }, { family = "Wolf" }, { family = "Boar" }, { family = "Bear" }
local RAPTOR, OWL, BAT, CRAB = { family = "Raptor" }, { family = "Owl" }, { family = "Bat" }, { family = "Crab" }
local CROC, GORILLA, HYENA = { family = "Crocolisk" }, { family = "Gorilla" }, { family = "Hyena" }
local SCORPID, SPIDER, STRIDER = { family = "Scorpid" }, { family = "Spider" }, { family = "Tallstrider" }
local TURTLE, SERPENT, CARRION = { family = "Turtle" }, { family = "Wind Serpent" }, { family = "Carrion Bird" }
local FLIERS = { family = { "Owl", "Bat", "Carrion Bird", "Wind Serpent" } }
local MEATEATERS = { family = { "Cat", "Wolf", "Raptor", "Owl", "Scorpid", "Spider", "Carrion Bird", "Hyena", "Crocolisk" } }
local GREENEATERS = { family = { "Turtle", "Tallstrider", "Gorilla", "Bat" } }

P:Pool {
  id = "my_beast", role = "my_beast",
  greetings = {
    { id = "g_default", text = "*{npc} pads up to you and pushes its head against your hand, then settles at your side as if it had never been anywhere else.*" },
    { id = "g_night", when = { timeOfDay = "night" }, text = "*In the dark, {npc}'s eyes catch the light of the moon, two pale coins hanging at the height of your knee, and then it comes close enough to touch.*" },
    { id = "g_dawn", when = { timeOfDay = "dawn" }, text = "*{npc} is already awake and watching the treeline, with dew beaded on its back, and it only turns to you once the morning has proved itself safe.*" },
    { id = "g_back", when = { metBefore = true }, text = "*{npc} lifts its head the moment you turn toward it, the way it always does, as though your voice were the only sound in the world worth hearing.*" },
    { id = "g_often", when = { timesTalked = 6 }, text = "*{npc} settles down before you've said a word, because it has learned that when you stop and turn to it like this, you mean to talk for a while.*" },
    { id = "g_low", when = { maxLevel = 15 }, text = "*{npc} still flinches a little when you reach for it, because the taming is new, but it holds its ground and lets your hand find its neck.*" },
    { id = "g_dead", when = { deaths = 15 }, text = "*{npc} sniffs you over from boots to collar, slowly and thoroughly, the way it always does now after you've come back from the spirit healer.*" },
    { id = "g_drunk", when = { drunk = true }, text = "*{npc} gets one whiff of your breath, sneezes hard, and backs off a step to watch you sway with grave and open suspicion.*" },
    { id = "g_hunter", when = { party = { class = "HUNTER" } }, text = "*{npc} keeps one eye on the other hunter's beast the whole time it comes to you, stiff-legged and very proper, like a guard dog passing a rival's gate.*" },
    { id = "g_druid", when = { party = { class = "DRUID" } }, text = "*{npc} comes to you by a long and wary route, giving the druid in your party a wide berth, because it has never yet decided whether that one is a person or a beast.*" },
    { id = "g_cat", when = { pet = CAT }, text = "*{npc} saunters over at its own pace, sits down just out of reach, and begins to wash one forepaw as if it had come for some other reason entirely.*" },
    { id = "g_wolf", when = { pet = WOLF }, text = "*{npc} trots up and leans its whole weight against your leg, tail swinging low, and looks up at you with its tongue hanging out.*" },
    { id = "g_boar", when = { pet = BOAR }, text = "*{npc} trots up grunting, roots once at the ground by your boot, and then shoves its bristly snout into your palm in the hope of something to eat.*" },
    { id = "g_bear", when = { pet = BEAR }, text = "*{npc} lumbers over and sits down heavily on its haunches in front of you, like a big furry man settling into a chair, and huffs at you through its nose.*" },
    { id = "g_raptor", when = { pet = RAPTOR }, text = "*{npc} comes at you in quick, bobbing strides that would frighten anyone else, then stops short and tilts its head, clicking softly in its throat.*" },
    { id = "g_owl", when = { pet = OWL }, text = "*{npc} turns its head all the way round to look at you, blinks once, very slowly, and ruffles its feathers into a round grey ball of patience.*" },
    { id = "g_bat", when = { pet = BAT }, text = "*{npc} flutters in a tight circle round your head, chittering, and then hooks itself upside down on the nearest branch to watch you with its ears turning.*" },
    { id = "g_crab", when = { pet = CRAB }, text = "*{npc} sidles up to you sideways, the only way it knows, and clacks both claws in greeting while a few bubbles froth at its mouth.*" },
    { id = "g_croc", when = { pet = CROC }, text = "*{npc} lies so still in front of you that it might be a log, until one gold eye opens and fixes on you and its jaws part slowly in what you choose to call a smile.*" },
    { id = "g_gorilla", when = { pet = GORILLA }, text = "*{npc} knuckles over, thumps its chest twice to let the whole valley know you've arrived, and then starts picking gently through your hair.*" },
    { id = "g_hyena", when = { pet = HYENA }, text = "*{npc} slinks up with its head low and gives a short, cackling laugh that would curdle milk, which you have learned is its way of saying it missed you.*" },
    { id = "g_scorpid", when = { pet = SCORPID }, text = "*{npc} skitters to your feet, clacking its pincers, and its tail curls up and over in a slow, polite arc that keeps the sting well away from your face.*" },
    { id = "g_spider", when = { pet = SPIDER }, text = "*{npc} picks its way toward you on all eight legs, rubbing its forelegs together, and every one of its eyes catches the light at once.*" },
    { id = "g_strider", when = { pet = STRIDER }, text = "*{npc} high-steps toward you on its long legs, bobbing its head with every stride, and then stops on one foot and peers down at you from a great height.*" },
    { id = "g_turtle", when = { pet = TURTLE }, text = "*{npc} begins to walk toward you, and keeps walking toward you, and after a good long while it arrives, entirely unbothered by how long that took.*" },
    { id = "g_serpent", when = { pet = SERPENT }, text = "*{npc} coils through the air toward you with a low hum, and the hair on your arms stands up from the static that crackles along its wings.*" },
    { id = "g_carrion", when = { pet = CARRION }, text = "*{npc} hops toward you with its wings half open, hunches its bald neck, and gives you a long, measuring look, the look it gives anything that might one day be dinner.*" },
  },
  tier = "major",
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", text = "*{npc} sits back with its eyes on your face and its ears turned your way, and waits to see whether you mean to give an order or simply to talk.*" },
        { id = "h_low", when = { maxLevel = 20 }, text = "*{npc} still watches you the way a wild thing watches a camp, ready to bolt, but it stays where it is, and that is more than it would have done a week ago.*" },
        { id = "h_high", when = { minLevel = 50 }, text = "*{npc} lies down at your feet with a long sigh, as easy with you now as any beast that has followed one hunter through a great many bad places.*" },
        { id = "h_dusk", when = { timeOfDay = "dusk" }, text = "*As the light goes, {npc} lifts its head and tests the wind, the way its kind always do when the night hunters wake, and then turns back to you.*" },
        { id = "h_cat", when = { pet = CAT }, text = "*{npc} has finished with its paw and moved on to its ear, and it keeps washing while you talk, but one ear stays turned toward you the whole time.*" },
        { id = "h_wolf", when = { pet = WOLF }, text = "*{npc} sits pressed against your shin, warm and solid, and its ears flick forward every time you say its name.*" },
        { id = "h_boar", when = { pet = BOAR }, text = "*{npc} has dug a neat hole beside your boot while you weren't looking, and it lifts a muddy snout out of it to listen.*" },
        { id = "h_bear", when = { pet = BEAR }, text = "*{npc} scratches its back against the nearest tree with long, contented groans, then drops onto all fours and gives you its full and shaggy attention.*" },
        { id = "h_raptor", when = { pet = RAPTOR }, text = "*{npc} taps the hooked claw on its foot against a stone, tick, tick, tick, the way a bored sentry drums his fingers, and waits for you.*" },
        { id = "h_owl", when = { pet = OWL }, text = "*{npc} sits on a low branch at the height of your shoulder and swivels its head between you and the shadows, never quite letting either out of its sight.*" },
        { id = "h_bat", when = { pet = BAT }, text = "*{npc} hangs upside down from a branch, wings wrapped round itself like a little cloak, and clicks quietly while its ears turn toward your voice.*" },
        { id = "h_crab", when = { pet = CRAB }, text = "*{npc} has settled into the dirt with only its eyestalks showing, and they swivel up to you, one and then the other.*" },
        { id = "h_croc", when = { pet = CROC }, text = "*{npc} has found the one patch of sun around and lies flat in it with its jaws open, cooling its teeth, and it rolls one eye toward you.*" },
        { id = "h_gorilla", when = { pet = GORILLA }, text = "*{npc} sits with its great arms folded and its brow furrowed, looking almost exactly like a sergeant waiting for a recruit to explain himself.*" },
        { id = "h_hyena", when = { pet = HYENA }, text = "*{npc} lies with its chin on its paws, sniffing at the air for anything dead, and lets out a little giggle every time the wind changes.*" },
        { id = "h_scorpid", when = { pet = SCORPID }, text = "*{npc} clacks its pincers in a slow rhythm while it waits, click, click, like a smith tapping out a horseshoe.*" },
        { id = "h_spider", when = { pet = SPIDER }, text = "*{npc} has already spun a few strands between your boot and a nearby root, and it sits in the middle of them watching you with every eye it has.*" },
        { id = "h_strider", when = { pet = STRIDER }, text = "*{npc} pecks at something in the grass, finds it disappointing, and stands on one leg to look down at you while it thinks about where else to peck.*" },
        { id = "h_turtle", when = { pet = TURTLE }, text = "*{npc} has its head halfway out of its shell, which is as far as it ever comes for conversation, and it blinks at you with a calm that nothing seems to touch.*" },
        { id = "h_serpent", when = { pet = SERPENT }, text = "*{npc} hovers beside you in slow coils, humming, and a faint blue spark jumps from its feathers to the buckle of your belt.*" },
        { id = "h_carrion", when = { pet = CARRION }, text = "*{npc} stands with its head cocked and keeps sniffing at you, very interested, the way it sniffs anything that smells a little of the grave.*" },
        { id = "h_nightelf", when = { race = "NightElf" }, text = "*{npc} turns its face up to the sky for a moment, as though it can feel Elune's light the way you can, and then looks back at you.*" },
        { id = "h_tauren", when = { race = "Tauren" }, text = "*{npc} comes and stands in your shadow, which is a very large shadow, and seems to find it as good a place to rest as any tree.*" },
        { id = "h_forsaken", when = { race = "Scourge" }, text = "*{npc} sniffs at your cold hand and doesn't pull away, which is more than most living things will do, and settles down beside you.*" },
      },
      again = {
        { id = "a_again", text = "*{npc} is still there, still listening, with its ears turned toward you.*" },
        { id = "a_again2", text = "*{npc} scratches behind one ear with a hind foot, then looks back up at you and waits.*" },
        { id = "a_again3", text = "*{npc} yawns wide enough to show you every tooth it owns, and waits for you to go on.*" },
        { id = "a_turtle", when = { pet = TURTLE }, text = "*{npc} has not moved at all, and it would not move for anything short of a landslide.*" },
        { id = "a_cat", when = { pet = CAT }, text = "*{npc} has started on its other paw, and it keeps an ear on you while it works.*" },
      },
      choices = {
        { text = "Come here, {npc}. Let me look you over.", next = "inspect" },
        { text = "Good hunting today. You earned your supper.", next = "praise" },
        { text = "You ran off and left me fighting alone, you rascal.", next = "scold" },
        { text = "Hungry? Let's see what's in the pack.", next = "feed" },
        { text = "Do you remember the day I tamed you?", next = "tamed" },
        { text = "Time to learn something new, if you're willing.", next = "trick" },
        { text = "We're moving on. Let me tell you where.", next = "onward" },
        { text = "You waited by me when I died, didn't you?", next = "dead" },
        { text = "What do you make of the other beasts out there?", next = "others" },
        { text = "The druids would have something to say about us.", next = "druids" },
        { text = "I'm leaving you at the stable for a while.", next = "stable" },
        { text = "I've been thinking about letting you go.", next = "letgo" },
        { text = "Our people bonded with the nightsabers before the world broke.", next = "xnightelf", when = { race = "NightElf" } },
        { text = "Grif Wildheart said a beast knows a liar by smell.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "The Frostwolves ride their wolves into battle, you know.", next = "xorc", when = { race = "Orc" } },
        { text = "De loa of de hunt be watchin' us both, mon.", next = "xtroll", when = { race = "Troll" } },
        { text = "The Earth Mother made us both, little one.", next = "xtauren", when = { race = "Tauren" } },
        { text = "Most of the living flee my smell. Why didn't you?", next = "xforsaken", when = { race = "Scourge" } },
        { text = "Stormwind folk keep hounds and horses. Nothing like you.", next = "xhuman", when = { race = "Human" } },
        { text = "I once tried to build a mechanical one of you.", next = "xgnome", when = { race = "Gnome" } },
        { text = "You've never seen the world from the floating isles.", next = "xskyborne", when = { race = "Skyborne" } },
        { text = "That's all. Back to heel, and keep your ears up.", next = "END" },
      },
    },

    ------------------------------------------------------------------
    -- Looking it over.
    ------------------------------------------------------------------
    inspect = {
      narr = "You run a hand along the beast's flank, feeling for heat, for swelling, for anything the last fight left behind.",
      lines = {
        { id = "in_default", text = "*{npc} stands still and lets you look, though it shifts its weight off one foreleg when your hand comes near it, and gives a short, warning grunt.*" },
        { id = "in_high", when = { minLevel = 50 }, text = "*{npc} stands for inspection like an old soldier, and you can count the scars under your fingers, every one of them from a fight you started.*" },
        { id = "in_cat", when = { pet = CAT }, text = "*{npc} tolerates your hands for exactly as long as it chooses, then twists round and bites your wrist, gently, to let you know the inspection is over.*" },
        { id = "in_bear", when = { pet = BEAR }, text = "*{npc} rolls over onto its back without being asked, all four paws in the air, and there are burrs and briars caught in its belly fur from the last three forests.*" },
        { id = "in_turtle", when = { pet = TURTLE }, text = "*{npc} pulls its head into its shell the moment you crouch, and you find yourself inspecting a very old, very mossy rock with a long scratch across it.*" },
        { id = "in_crab", when = { pet = CRAB }, text = "*{npc} holds up one claw for inspection, then the other, and you find a fresh crack along the shell where something big tried to open it like a mussel.*" },
        { id = "in_scorpid", when = { pet = SCORPID }, text = "*{npc} lowers its tail so you can see the sting, and a single drop of venom beads at the tip and catches the light like a drop of honey.*" },
        { id = "in_serpent", when = { pet = SERPENT }, text = "*{npc} spreads its feathered wings for you, and a crackle of static runs from tip to tip and stings your fingers when you touch a frayed quill.*" },
        { id = "in_spider", when = { pet = SPIDER }, text = "*{npc} lets you count its legs, and you count them twice, because one is shorter than the others where it has started to grow back.*" },
      },
      choices = {
        { text = "That leg again. Who did that to you?", next = "inspect_wound" },
        { text = "Hold still. Let me mend it.", next = "inspect_mend" },
        { text = "Sometimes I look through your eyes, you know.", next = "inspect_eyes" },
        { text = "You're a scruffy thing, and I wouldn't trade you for a kingdom.", next = "BACK", reply = "*{npc} snorts at you and leans its full weight into your leg, which nearly knocks you over and is probably meant to.*", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    inspect_wound = {
      lines = {
        { id = "iw_default", text = "*{npc} flinches when you touch the joint, where an old gash has healed in a ridge of bare skin, the kind a gnoll's cleaver leaves, and a growl starts somewhere deep in its chest.*" },
        { id = "iw_low", when = { maxLevel = 25 }, text = "*{npc} flinches when you touch the joint, where a kobold's candle-lit pickaxe caught it in the dark, and it looks at you as though it still doesn't understand why anyone would live underground.*" },
      },
      choices = {
        { text = "I should have called you back sooner. That's my fault.", next = "inspect_blame" },
        { text = "You charged in alone. Next time, wait for me.", next = "BACK", reply = "*{npc} lowers its head and licks the scar, slowly, which is as close as it comes to admitting anything.*", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    inspect_blame = {
      big = true,
      lines = {
        { id = "ib_default", text = "*{npc} doesn't seem to know what to do with an apology, so it does what beasts do: it presses its head into your chest and holds it there until you stop talking.*" },
      },
      choices = {
        { text = "A hunter answers for every wound on his beast.", next = "BACK", reply = "*{npc} huffs warm breath into your shirt and stays exactly where it is.*", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Wounds heal. It's what you're for, in the end.", next = "BACK", reply = "*{npc} pulls back and looks at you a moment, then shakes itself from nose to tail and walks off a few paces.*", fx = { align = { honor = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    inspect_mend = {
      narr = "The green light of Mend Pet runs from your hands into the beast's hide, and the old wound eases under it.",
      lines = {
        { id = "im_default", text = "*{npc} stiffens at the first touch of the spell, then slowly lets its weight go, and by the end it has half closed its eyes and is leaning on you like a sleepy child.*" },
        { id = "im_cat", when = { pet = CAT }, text = "*{npc} begins to purr under your hands, a deep, rattling sound you feel in your own ribs, and it kneads the ground with its claws out.*" },
        { id = "im_turtle", when = { pet = TURTLE }, text = "*{npc} puts its head back out of its shell to see what the warmth is, decides it approves, and leaves it out, which counts as high praise.*" },
      },
      choices = {
        { text = "There. Good as new, or near enough.", next = "BACK", reply = "*{npc} tests the leg, puts its weight on it, and then gives your hand a rough lick before it trots off to try it properly.*", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    inspect_eyes = {
      lines = {
        { id = "ie_default", text = "*{npc} looks at you strangely, and you wonder whether it remembers the moment you slipped behind its eyes with Eyes of the Beast, and how the world went sharp and loud and full of smells.*" },
        { id = "ie_flier", when = { pet = FLIERS }, text = "*{npc} looks at you strangely, and you remember the day you borrowed its eyes and flew with it, and how small everything looked, and how much you hated coming back down.*" },
      },
      choices = {
        { text = "Everything was so loud. How do you bear it?", next = "inspect_loud" },
        { text = "Something else.", next = "BACK" },
      },
    },
    inspect_loud = {
      big = true,
      lines = {
        { id = "il_default", text = "*{npc} turns its ears toward a sound you can't hear at all, then back to you, patient, as if to say that it has always been this loud, and you are the one who is deaf.*" },
      },
      choices = {
        { text = "I'd stay in your skin forever, if I could.", next = "BACK", reply = "*{npc} sniffs at you as though checking you're still in your own, and then sits down very close.*", fx = { align = { order = -1 }, trait = { curious = 1 } } },
        { text = "It's a gift, but I belong on my own two feet.", next = "BACK", reply = "*{npc} gives a short huff and settles, as though it agrees that one of each is plenty.*", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ------------------------------------------------------------------
    -- Praise.
    ------------------------------------------------------------------
    praise = {
      lines = {
        { id = "pr_default", text = "*{npc} knows the word supper perfectly well, and it trots a tight circle round you, then another, and finishes sitting at your feet with its eyes on your pack.*" },
        { id = "pr_dead", when = { deaths = 30 }, text = "*{npc} trots round you happily, but it also noses at the spot on your chest where the last killing blow landed, and keeps nosing it until you push its head away.*" },
        { id = "pr_wolf", when = { pet = WOLF }, text = "*{npc} throws back its head and gives a short, joyful howl, then looks embarrassed by it and licks your hand.*" },
        { id = "pr_cat", when = { pet = CAT }, text = "*{npc} accepts the praise as no more than its due, and turns its head aside, but its tail curls up into a hook at the tip.*" },
        { id = "pr_gorilla", when = { pet = GORILLA }, text = "*{npc} beats its chest with both fists, hard enough to echo off the rocks, and then sits down looking enormously pleased with itself.*" },
      },
      choices = {
        { text = "That kill on the ridge was all yours. I barely loosed an arrow.", next = "praise_kill" },
        { text = "You held them off me with Growl like a proper guardian.", next = "praise_growl" },
        { text = "You're not a pet. You're my partner.", next = "praise_partner" },
        { text = "Something else.", next = "BACK" },
      },
    },
    praise_kill = {
      lines = {
        { id = "pk_default", text = "*{npc} lifts its head high and stalks a few proud steps, showing you exactly how it brought the thing down, and then looks back to make sure you were watching.*" },
        { id = "pk_raptor", when = { pet = RAPTOR }, text = "*{npc} rakes the ground with its hooked claw, tearing up a long strip of turf, to show you exactly how it opened the thing's belly.*" },
        { id = "pk_spider", when = { pet = SPIDER }, text = "*{npc} rubs its forelegs together with a dry, rasping sound, very pleased, and you remember the way it wrapped the thing up before you'd even drawn a bead.*" },
      },
      choices = {
        { text = "Do that again tomorrow and you'll eat like a king.", next = "BACK", reply = "*{npc}'s ears prick up at once, and it watches your pack for the rest of the evening.*", fx = { affinity = 1 } },
        { text = "Don't get proud. I'd have had it with the next arrow.", next = "BACK", reply = "*{npc} sits back and gives you a long, flat look that says it remembers the fight rather differently.*", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    praise_growl = {
      lines = {
        { id = "pg_default", text = "*{npc} rumbles low in its chest, the same sound it threw at the enemy, softer now, as if to prove it still has it.*" },
        { id = "pg_bear", when = { pet = BEAR }, text = "*{npc} rears up onto its hind legs and roars, just a little, just to show you, and then drops back down so hard the ground shakes.*" },
        { id = "pg_turtle", when = { pet = TURTLE }, text = "*{npc} makes a low hiss that is as close as a turtle comes to a growl, and looks quietly satisfied, as a thing that took every blow and simply didn't care.*" },
      },
      choices = {
        { text = "You stood between me and three of them. Why?", next = "praise_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    praise_why = {
      big = true,
      lines = {
        { id = "pw_default", text = "*{npc} looks at you as if it doesn't understand the question, and then it simply moves to stand in front of you again, facing outward, as if the answer were obvious.*" },
      },
      choices = {
        { text = "I'd do the same for you, every time.", next = "BACK", reply = "*{npc} glances back over its shoulder at you and gives its tail one slow wag, and then goes on watching the trees.*", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Good. That's your job, and I need you doing it.", next = "BACK", reply = "*{npc} keeps its post without looking back, a guard on duty, and you can't tell whether it heard the warmth in your voice or the lack of it.*", fx = { align = { honor = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    praise_partner = {
      big = true,
      lines = {
        { id = "pp_default", text = "*{npc} cocks its head at the new word, and then, because your voice is warm, it decides the word is a good one and pushes its nose into your hand.*" },
      },
      choices = {
        { text = "In the wild, hunters and beasts are equals. So are we.", next = "BACK", reply = "*{npc} sits beside you, shoulder to shoulder, rather than at your feet, and you don't move it.*", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Partner, yes, but you'll still do as I say.", next = "BACK", reply = "*{npc} gives a huff that sounds very like resignation, and lies down where you point.*", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ------------------------------------------------------------------
    -- Scolding.
    ------------------------------------------------------------------
    scold = {
      lines = {
        { id = "sc_default", text = "*{npc} lowers its head, but it doesn't look very sorry, and there's still a bit of something's fur caught in its teeth.*" },
        { id = "sc_cat", when = { pet = CAT }, text = "*{npc} turns its back on you and begins washing, very thoroughly, which is a cat's way of saying that it has heard you and doesn't care.*" },
        { id = "sc_wolf", when = { pet = WOLF }, text = "*{npc} flattens its ears and creeps toward you on its belly, and its eyes are so mournful that you have to look away to stay angry.*" },
        { id = "sc_boar", when = { pet = BOAR }, text = "*{npc} grunts at you, unrepentant, and goes back to rooting in the dirt where it found something better than your good opinion.*" },
        { id = "sc_hyena", when = { pet = HYENA }, text = "*{npc} laughs, a long, rising cackle, and you have to remind yourself that it isn't laughing at you, though it certainly sounds like it.*" },
        { id = "sc_turtle", when = { pet = TURTLE }, text = "*{npc} withdraws its head into its shell, slowly and with great dignity, and you are left scolding a rock.*" },
      },
      choices = {
        { text = "You chased that deer halfway across the valley.", next = "scold_ran" },
        { text = "You pulled the whole pack down on top of us!", next = "scold_pack" },
        { text = "Sit. Bad beast. I mean it.", next = "scold_sit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scold_ran = {
      lines = {
        { id = "sr_default", text = "*{npc} looks off toward where the deer went, and its legs twitch, and it's quite clear that it would do the whole thing again given half a chance.*" },
        { id = "sr_strider", when = { pet = STRIDER }, text = "*{npc} looks off toward where the deer went with an air of mild surprise, as if its long legs had simply decided on their own and taken it along for the ride.*" },
      },
      choices = {
        { text = "The wild still pulls at you, doesn't it?", next = "scold_wild" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scold_wild = {
      big = true,
      narr = "Somewhere off in the trees, something calls, and the beast's whole body goes still to listen.",
      lines = {
        { id = "sw_default", text = "*{npc} doesn't answer the call, but it doesn't look away from the trees either, not until you put your hand on its neck.*" },
      },
      choices = {
        { text = "Next time you stay. No arguments, no deer.", next = "BACK", reply = "*{npc} sighs through its nose and leans back against your hand, and lets you have your way, for now.*", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "Chase it, then. I'd not cage what's wild in you.", next = "BACK", reply = "*{npc} turns and looks at you, and then bolts off into the trees, and comes back an hour later, muddy and delighted.*", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scold_pack = {
      lines = {
        { id = "sp_default", text = "*{npc} glances back the way you came, where the bodies are, and then up at you, and its ears go flat as if it has only now counted them.*" },
        { id = "sp_low", when = { maxLevel = 25 }, text = "*{npc} glances back toward the camp it charged into, where the kobolds or the gnolls or whatever they were are still shouting, and its ears go flat.*" },
      },
      choices = {
        { text = "I'm putting you on defensive, and you can sulk about it.", next = "BACK", reply = "*{npc} lies down and puts its chin on its paws in a sulk so complete that even the birds go quiet.*", fx = { trait = { stern = 1 } } },
        { text = "Honestly? That was the best fight I've had all week.", next = "BACK", reply = "*{npc} perks up at once, ears high, and nearly trips over itself coming to you.*", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scold_sit = {
      big = true,
      lines = {
        { id = "ss_default", text = "*{npc} sits, slowly, and keeps its eyes on yours the whole way down, the way a wild thing sits for someone it hasn't quite decided to obey.*" },
        { id = "ss_low", when = { maxLevel = 20 }, text = "*{npc} doesn't sit at first, and you can feel the taming tug between you like a line with a fish on it, before it finally lowers its hindquarters to the ground.*" },
      },
      choices = {
        { text = "I'm sorry I shouted. You were frightened too.", next = "BACK", reply = "*{npc} lifts its head at your softer voice, and after a moment it comes and lays its head on your knee.*", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "You don't have to understand. You have to obey.", next = "BACK", reply = "*{npc} stays sitting, perfectly still and perfectly obedient, and doesn't look at you again for a long while.*", fx = { align = { honor = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ------------------------------------------------------------------
    -- Feeding: happiness and loyalty.
    ------------------------------------------------------------------
    feed = {
      lines = {
        { id = "fe_default", text = "*{npc} is on its feet before you've finished the word, nose working at the flap of your pack, and a thread of drool swings from its jaw.*" },
        { id = "fe_cat", when = { pet = CAT }, text = "*{npc} pretends not to hear you, for almost a heartbeat, and then it is winding round your ankles and crying in a voice far too small for a cat that size.*" },
        { id = "fe_boar", when = { pet = BOAR }, text = "*{npc} squeals and shoves its whole snout into your pack, because a boar will eat anything at all, and it means to start with the pack itself.*" },
        { id = "fe_bear", when = { pet = BEAR }, text = "*{npc} sits up and begs like a dog at a dinner table, and you remember that a bear will eat whatever you put in front of it, from cheese to fish to the cloth it came wrapped in.*" },
        { id = "fe_turtle", when = { pet = TURTLE }, text = "*{npc} turns its head toward the pack, slowly, and begins to walk toward it, slowly, with the air of a beast that knows supper isn't going anywhere.*" },
        { id = "fe_bat", when = { pet = BAT }, text = "*{npc} drops from its branch and flutters round your head, chittering, until you find the apples it likes, and then it hangs from your sleeve to eat.*" },
        { id = "fe_strider", when = { pet = STRIDER }, text = "*{npc} pecks at the buckle on your pack, then at your fingers, then at the buckle again, because it can smell the cheese in there and has no patience at all.*" },
        { id = "fe_serpent", when = { pet = SERPENT }, text = "*{npc} coils round you, humming, and noses at the bread in your pack, because wind serpents will turn up their snouts at good meat and fight you for a stale loaf.*" },
        { id = "fe_carrion", when = { pet = CARRION }, text = "*{npc} hops closer and peers into your pack with one eye, then the other, hoping as always that the meat in there has been dead for a good long while.*" },
      },
      choices = {
        { text = "Here. Fresh meat, still warm from the hunt.", next = "feed_meat" },
        { text = "It's bread or nothing tonight, I'm afraid.", next = "feed_bread" },
        { text = "You're looking thin. When did I last feed you?", next = "feed_thin" },
        { text = "Half for you, half for me. We're both starving.", next = "BACK", reply = "*{npc} eats its half in one gulp and then sits and watches you eat yours, without blinking, until you give in and pass it the rest.*", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    feed_meat = {
      lines = {
        { id = "fm_default", text = "*{npc} snatches the meat from your hand and carries it a few steps off to eat in private, and it growls once over its shoulder to keep you honest.*" },
        { id = "fm_meat", when = { pet = MEATEATERS }, text = "*{npc} takes the meat from your hand with surprising care, and then tears into it with no care at all, and you feel the content come off it like heat from a fire.*" },
        { id = "fm_green", when = { pet = GREENEATERS }, text = "*{npc} sniffs at the meat, looks up at you with deep reproach, and then turns away, because it eats fruit and fungus and the like, and you know perfectly well it does.*" },
        { id = "fm_crab", when = { pet = CRAB }, text = "*{npc} pinches the meat, considers it, and drops it in the dirt, then looks hopefully at your pack, where you keep the fish.*" },
      },
      choices = {
        { text = "There. Now you'll follow me anywhere, won't you?", next = "BACK", reply = "*{npc} licks its jaws clean and comes to lie at your feet, warm and heavy and entirely content.*", fx = { affinity = 1 } },
        { text = "Fine, fine. I'll find you something you'll actually eat.", next = "BACK", reply = "*{npc} watches you dig through your pack with its full attention, as though you are finally being sensible.*", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    feed_bread = {
      lines = {
        { id = "fb_default", text = "*{npc} sniffs the bread, looks at you, and sniffs it again, and then turns its back on it with a sigh that could shame a starving orphan.*" },
        { id = "fb_eaters", when = { pet = { family = { "Boar", "Bear", "Wind Serpent", "Crab" } } }, text = "*{npc} gulps the bread down without a second thought and looks up for more, crumbs all over its face.*" },
        { id = "fb_strider", when = { pet = STRIDER }, text = "*{npc} pecks at the bread, then at your hand, as if it knows there's a bit of cheese in there somewhere and you're holding out on it.*" },
      },
      choices = {
        { text = "You're spoiled, do you know that? Utterly spoiled.", next = "BACK", reply = "*{npc} doesn't argue the point, but it doesn't eat the bread either.*", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    feed_thin = {
      narr = "You can feel the ribs under your hand, more of them than there should be.",
      lines = {
        { id = "ft_default", text = "*{npc} doesn't come when you call it this time; it stays where it is and watches you with flat, dull eyes, the way an unhappy beast watches a hunter it has started to doubt.*" },
        { id = "ft_high", when = { minLevel = 50 }, text = "*{npc} comes to you anyway, because it has followed you too long to do anything else, but it moves slowly and its coat has lost its shine.*" },
      },
      choices = {
        { text = "The trainer says an unhappy beast might just leave one day.", next = "feed_leave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    feed_leave = {
      lines = {
        { id = "fl_default", text = "*{npc} turns its head toward the open country, and you remember the trainers' warnings: a beast that's hungry long enough stops trusting you, and a beast that stops trusting you will one day simply walk into the trees and not come back.*" },
      },
      choices = {
        { text = "I let you down. I won't do that again.", next = "feed_promise" },
        { text = "Something else.", next = "BACK" },
      },
    },
    feed_promise = {
      big = true,
      lines = {
        { id = "fp_default", text = "*{npc} sniffs at the food you set down, and eats, slowly at first and then not slowly at all, and when it's done it comes and leans against you, heavy and forgiving.*" },
      },
      choices = {
        { text = "You'll eat before I do, every night. I swear it.", next = "BACK", reply = "*{npc} licks its jaws and settles against your side, and its breathing slows until it is nearly asleep.*", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Hunger keeps a hunter sharp. That goes for both of us.", next = "BACK", reply = "*{npc} lifts its head and looks at you for a long moment, then lies down a little farther off than before.*", fx = { align = { honor = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ------------------------------------------------------------------
    -- The taming.
    ------------------------------------------------------------------
    tamed = {
      lines = {
        { id = "ta_default", text = "*{npc} goes still at your tone, and you remember the moment the taming took hold: the fight going out of it all at once, and its eyes clearing, and the strange quiet after.*" },
        { id = "ta_nightelf", when = { race = "NightElf" }, text = "*{npc} glances up at the great boughs overhead, and you remember Teldrassil, and the trainer in Dolanaar, and the taming rod that hummed in your hand like a bee in a jar.*" },
        { id = "ta_dwarf", when = { race = "Dwarf" }, text = "*{npc} sneezes, as if it can still smell the snows of Dun Morogh, and you remember Grif Wildheart's taming rod and your frozen fingers on it.*" },
        { id = "ta_orc", when = { race = { "Orc", "Troll" } }, text = "*{npc} shakes itself as if it can still feel the red dust of Durotar in its coat, and you remember the trainer at Razor Hill and the taming rod that hummed in your fist.*" },
        { id = "ta_tauren", when = { race = "Tauren" }, text = "*{npc} looks out over the grass, and you remember Mulgore, and the trainer at Bloodhoof Village, and the long golden afternoon it took to win this one over.*" },
        { id = "ta_skyborne", when = { race = "Skyborne" }, text = "*{npc} looks at you as if it still doesn't quite believe someone who fell from the sky could tame anything, and you remember how badly your hands shook that day.*" },
        { id = "ta_turtle", when = { pet = TURTLE }, text = "*{npc} blinks at you, and you remember that the taming was the easiest of your life, because it simply didn't bother to run away.*" },
        { id = "ta_spider", when = { pet = SPIDER }, text = "*{npc} rubs its forelegs together, and you remember that it had you halfway wrapped in silk before the taming took, and that you've never told anyone.*" },
      },
      choices = {
        { text = "You nearly took my arm off before it took.", next = "tamed_fight" },
        { text = "Why did I choose you, of all the beasts out there?", next = "tamed_why" },
        { text = "Did you have a den, before me? A mate?", next = "tamed_den" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tamed_fight = {
      lines = {
        { id = "tf_default", text = "*{npc} gives a short, rough sound, half growl and half something else, and noses at the white scar on your forearm as if it remembers putting it there.*" },
        { id = "tf_croc", when = { pet = CROC }, text = "*{npc} opens its jaws slowly and closes them again, and you remember how close they came to closing on your leg before the taming took.*" },
        { id = "tf_scorpid", when = { pet = SCORPID }, text = "*{npc} arcs its tail and taps the sting, very lightly, against your forearm, right on the spot where it once didn't tap lightly at all.*" },
      },
      choices = {
        { text = "I deserved it. I'd have bitten me too.", next = "BACK", reply = "*{npc} licks the scar, once, carefully, as if checking that it healed right.*", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tamed_why = {
      big = true,
      lines = {
        { id = "tw_default", text = "*{npc} holds your eyes, the way it did that first day across the clearing, when every other beast had run and it alone stood its ground and looked at you.*" },
      },
      choices = {
        { text = "You looked at me like an equal. That's why.", next = "BACK", reply = "*{npc} holds the look a moment longer, then blinks first, slowly, the way beasts do when they mean no harm.*", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "You were the strongest there. I take the best.", next = "BACK", reply = "*{npc} stretches, every muscle standing out, as if determined to prove you right.*", fx = { align = { order = 1 }, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tamed_den = {
      lines = {
        { id = "td_default", text = "*{npc} turns its head toward the hills, and keeps it turned there a long time, and you can't tell whether it remembers anything at all or only smells the wind.*" },
        { id = "td_wolf", when = { pet = WOLF }, text = "*{npc} lifts its nose and howls, low and long, and somewhere far off another wolf answers, and {npc} listens to it until it stops.*" },
      },
      choices = {
        { text = "I took you from something. I won't pretend otherwise.", next = "tamed_took" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tamed_took = {
      big = true,
      lines = {
        { id = "tt_default", text = "*{npc} turns back from the hills at the sound of your voice, and comes to you, because you are here and the hills are not.*" },
      },
      choices = {
        { text = "Then I'll be a pack worth what you lost.", next = "BACK", reply = "*{npc} sits down against your legs and stays, and the hills can do as they like.*", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "That's the hunt. The strong take, and the rest follow.", next = "BACK", reply = "*{npc} sits, because you've stopped walking, and looks off toward the hills one last time.*", fx = { align = { honor = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ------------------------------------------------------------------
    -- Tricks and training.
    ------------------------------------------------------------------
    trick = {
      lines = {
        { id = "tr_default", text = "*{npc} cocks its head at you, ears forward, because it has learned that this tone means a long afternoon of trying something new and a reward at the end of it.*" },
        { id = "tr_low", when = { maxLevel = 20 }, text = "*{npc} watches your hands closely, still learning what each gesture means, and its whole body trembles with the effort of understanding.*" },
      },
      choices = {
        { text = "Your bite's getting stronger. Show me.", next = "trick_bite" },
        { text = "Another rank of Claw. Rake that stump for me.", next = "BACK", reply = "*{npc} goes at the stump in a flurry of claws and leaves it in splinters, then looks back at you for approval.*", when = { pet = { family = { "Cat", "Bear", "Raptor", "Scorpid", "Crab", "Owl", "Carrion Bird" } } }, fx = { affinity = 1 } },
        { text = "Dash. Run like the wind, and come straight back.", next = "BACK", reply = "*{npc} is gone before you've finished, a blur across the grass, and it comes back panting and very pleased, though not exactly straight.*", when = { pet = { family = { "Cat", "Wolf", "Hyena", "Tallstrider" } } }, fx = { affinity = 1 } },
        { text = "Prowl. Low and quiet, and let them come to us.", next = "trick_prowl", when = { pet = CAT } },
        { text = "Let's hear that Screech of yours. The whole forest, please.", next = "BACK", reply = "*{npc} lets out a shriek that sends every bird in the forest into the air at once and leaves your ears ringing for an hour.*", when = { pet = { family = { "Bat", "Owl", "Carrion Bird" } } }, fx = { trait = { witty = 1 } } },
        { text = "Lightning Breath. Aim it at the rock, not at me.", next = "trick_breath", when = { pet = SERPENT } },
        { text = "Furious Howl. Let them hear you all the way to the next valley.", next = "BACK", reply = "*{npc} throws back its head and howls, and the sound runs through you like strong drink, so that your next arrow flies harder for it.*", when = { pet = WOLF }, fx = { trait = { brave = 1 } } },
        { text = "Charge! Straight at the target, tusks first.", next = "BACK", reply = "*{npc} lowers its head and goes, and the practice target goes over in pieces, and so does the fence behind it.*", when = { pet = BOAR }, fx = { trait = { witty = 1 } } },
        { text = "Shell Shield. Go on, hide, but I'll know you're in there.", next = "BACK", reply = "*{npc} pulls in its head and legs with immense satisfaction, as though you have finally asked it to do the thing it does best.*", when = { pet = TURTLE }, fx = { trait = { witty = 1 } } },
        { text = "Scorpid Poison. On the dummy, and only the dummy.", next = "BACK", reply = "*{npc} drives its sting into the straw, again and again, and the straw turns a sickly green around the holes.*", when = { pet = SCORPID }, fx = { trait = { stern = 1 } } },
        { text = "I tamed a wild one just to learn that trick. Then I let it go.", next = "trick_wild" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trick_bite = {
      lines = {
        { id = "tb_default", text = "*{npc} seizes the stick you hold out and bites through it with one clean crunch, then drops the halves at your feet and waits to be told how clever it is.*" },
        { id = "tb_croc", when = { pet = CROC }, text = "*{npc} takes the stick you hold out, and your hand very nearly with it, and closes its jaws with a sound like a door slamming in a stone house.*" },
        { id = "tb_gorilla", when = { pet = GORILLA }, text = "*{npc} takes the stick, examines it, bites it in half, and then hands both halves back to you with tremendous ceremony.*" },
      },
      choices = {
        { text = "The pet trainer says you've used up all your training.", next = "trick_points" },
        { text = "Good. Very good. Now let go of my sleeve.", next = "BACK", reply = "*{npc} lets go of your sleeve with visible reluctance, and the sleeve is never quite the same.*", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trick_points = {
      lines = {
        { id = "tp_default", text = "*{npc} doesn't know anything about training points, but it knows your sigh, and it comes and nudges your hand as if to say it will learn whatever you like, as soon as it's allowed.*" },
        { id = "tp_high", when = { minLevel = 50 }, text = "*{npc} doesn't know anything about training points, but it has followed you long enough that its loyalty runs deep, and the trainer says there's room in it for more yet.*" },
      },
      choices = {
        { text = "The trainer says loyalty makes room for more learning.", next = "BACK", reply = "*{npc} rests its head on your boot, which is all the loyalty it knows how to show, and quite enough.*", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trick_prowl = {
      lines = {
        { id = "tpr_default", text = "*{npc} sinks down until its belly brushes the grass and seems to vanish into it, and you only know it's still there because the tip of its tail is twitching.*" },
      },
      choices = {
        { text = "Our Sentinels would be jealous of you.", next = "BACK", reply = "*{npc} rises out of the grass a yard from where you were looking, and that's answer enough.*", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trick_breath = {
      lines = {
        { id = "tbr_default", text = "*{npc} draws in a long, humming breath, and the air goes sharp and metallic, and then a crackling bolt leaps from its jaws and blackens the rock and most of the grass around it.*" },
      },
      choices = {
        { text = "That rock will never be the same, and neither will my eyebrows.", next = "BACK", reply = "*{npc} hums smugly, and a last little spark drifts from its nostril and lands on your boot.*", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trick_wild = {
      big = true,
      narr = "You remember the other beast's eyes, and how they cleared and then went wild again when you let the taming go.",
      lines = {
        { id = "twi_default", text = "*{npc} sniffs you over for a long time, slowly, as if it can still smell that other beast on you, and then it sits down a little apart and watches you.*" },
      },
      choices = {
        { text = "It's how the craft works. They're beasts, and I'm a hunter.", next = "BACK", reply = "*{npc} doesn't come any closer, but it doesn't go any farther either.*", fx = { align = { honor = -1 }, trait = { stern = 1 } } },
        { text = "I told it I was sorry when I let it go. I meant it.", next = "BACK", reply = "*{npc} gets up after a while and comes back to your side, and pushes its head under your hand.*", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ------------------------------------------------------------------
    -- Where next.
    ------------------------------------------------------------------
    onward = {
      lines = {
        { id = "on_default", text = "*{npc} gets up at the sound of the word, because it knows that tone means a road, and stands facing the way you're facing with its nose working.*" },
        { id = "on_low", when = { maxLevel = 25 }, text = "*{npc} looks out toward the edge of the only country it has ever known, and then up at you, as if it isn't sure the world goes on past the next hill.*" },
        { id = "on_high", when = { minLevel = 48 }, text = "*{npc} stands and stretches its old aches out, and looks at you with the calm of a beast that has crossed half the world at your heel and expects to cross the other half.*" },
      },
      choices = {
        { text = "There's a crater down south where the beasts are the size of houses.", next = "onward_crater", when = { minLevel = 45 } },
        { text = "North, to the snows. You'll hate it, then love it.", next = "BACK", reply = "*{npc} shakes itself all over, as if shaking off snow that hasn't fallen yet.*", fx = { trait = { witty = 1 } } },
        { text = "We're going to the city. Behave yourself this time.", next = "onward_city" },
        { text = "Honestly, I don't know where we're going.", next = "onward_unknown" },
        { text = "Something else.", next = "BACK" },
      },
    },
    onward_crater = {
      lines = {
        { id = "ocr_default", text = "*{npc} lifts its nose as if it can already smell the hot, wet jungle of Un'Goro and the great thunder lizards in it, and its hackles rise, slowly, all the way down its back.*" },
        { id = "ocr_raptor", when = { pet = RAPTOR }, text = "*{npc} clicks and bobs its head and rakes the ground, eager, as though it knows that crater is full of its own kind, only bigger, and it means to meet them.*" },
      },
      choices = {
        { text = "We'll stay together, and we'll both come back.", next = "BACK", reply = "*{npc} presses against your side, close as a shadow, and stays there the rest of the evening.*", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    onward_city = {
      lines = {
        { id = "oc_default", text = "*{npc}'s ears go flat at the word city, because it remembers the crowds and the guards and the stable boy who tried to pat it on the nose.*" },
        { id = "oc_ally", when = { race = { "NightElf", "Dwarf", "Human", "Gnome" } }, text = "*{npc}'s ears go flat, and you remember the last time in Ironforge, when it lay across the bridge into the Great Forge and no dwarf in the city could make it move.*" },
        { id = "oc_horde", when = { race = { "Orc", "Troll", "Tauren", "Scourge" } }, text = "*{npc}'s ears go flat, and you remember the last time in Orgrimmar, when it ate a peon's lunch and the peon cried, and then you had to buy him another.*" },
      },
      choices = {
        { text = "If anyone kicks you, I'll knock their teeth out.", next = "BACK", reply = "*{npc} looks up at you with something like delight, and trots ahead toward the road with its head high.*", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "City rules: no biting the guards, whatever they do.", next = "BACK", reply = "*{npc} sighs through its nose and falls in at your heel, very close and very correct, like a recruit on parade.*", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    onward_unknown = {
      big = true,
      lines = {
        { id = "ou_default", text = "*{npc} doesn't seem troubled by that at all, because it has never once known where you were going, and it has always come anyway.*" },
      },
      choices = {
        { text = "Wherever the hunt leads. That's the only map I need.", next = "BACK", reply = "*{npc} lifts its nose into the wind and picks a direction, and you follow it for once.*", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "I'll make a plan tonight, and we'll stick to it.", next = "BACK", reply = "*{npc} lies down to wait while you unroll your maps, and goes to sleep long before you've finished.*", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ------------------------------------------------------------------
    -- The dead: corpses, Feign Death, Revive Pet.
    ------------------------------------------------------------------
    dead = {
      lines = {
        { id = "de_default", text = "*{npc} goes quiet and comes close, pressing against you, and you remember waking at the spirit healer's side and walking all the way back, and finding it still sitting beside your body.*" },
        { id = "de_many", when = { deaths = 25 }, text = "*{npc} sighs and lies down at your feet, because you have died so often now that it has learned the whole business by heart: the fall, the long wait, and you coming back with that grey look on you.*" },
        { id = "de_carrion", when = { pet = CARRION }, text = "*{npc} looks at you with an expression you'd rather not read too closely, because carrion birds know exactly what a body is for, and it has sat beside yours more than once and been very good.*" },
        { id = "de_forsaken", when = { race = "Scourge" }, text = "*{npc} sniffs at you, and you wonder whether it can even tell the difference between you dead and you walking, since you smell much the same either way.*" },
      },
      choices = {
        { text = "You stayed by my body the whole time, didn't you?", next = "dead_waited" },
        { text = "I wasn't really dead earlier. That was Feign Death.", next = "dead_feign" },
        { text = "When you fell, I called you back. Do you remember?", next = "dead_revive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead_waited = {
      narr = "You can picture it plainly: the beast sitting over your body in the dirt, and nothing able to make it leave.",
      lines = {
        { id = "dw_default", text = "*{npc} puts its head against your chest and holds it there, the way it must have held it against you while you lay still, waiting for a heartbeat that wasn't coming.*" },
        { id = "dw_turtle", when = { pet = TURTLE }, text = "*{npc} blinks at you, entirely calm, as if it had always assumed you'd come back and simply waited, the way it waits for everything.*" },
      },
      choices = {
        { text = "If I fall again, you run, and you don't look back.", next = "dead_run" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead_run = {
      big = true,
      lines = {
        { id = "dr_default", text = "*{npc} looks at you as if you've spoken some foreign language, and then it lies down across your feet, which is the only answer it knows how to give.*" },
      },
      choices = {
        { text = "Fine. Stay, then. That's what loyalty is.", next = "BACK", reply = "*{npc} stays exactly where it is, heavy on your boots, as if to practise.*", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I mean it. Your life's yours, not mine to spend.", next = "BACK", reply = "*{npc} doesn't move from your feet, and you know as well as it does that it will never obey this one order.*", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead_feign = {
      lines = {
        { id = "df_default", text = "*{npc} sniffs at you suspiciously, all over, the way it sniffed at you when you dropped to the ground in the middle of the fight, and nudged you, and whined, and then got up to see if it was still being attacked.*" },
        { id = "df_hyena", when = { pet = HYENA }, text = "*{npc} sniffs at you, then giggles, and you have the uncomfortable feeling that it understood the trick perfectly well and found it the funniest thing it had ever seen.*" },
      },
      choices = {
        { text = "It's a hunter's lie. Lies like that keep us both alive.", next = "dead_lie" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead_lie = {
      big = true,
      lines = {
        { id = "dl_default", text = "*{npc} sits down and looks at you with its head on one side, and you can't help thinking about how frightened it was, and how quickly you were up again laughing.*" },
      },
      choices = {
        { text = "A good trick is worth a little fright. You'll learn.", next = "BACK", reply = "*{npc} snorts, and pokes you hard in the ribs with its nose, as if checking you're really alive this time.*", fx = { align = { honor = -1 }, trait = { witty = 1 } } },
        { text = "I hate fooling you, even to fool the enemy.", next = "BACK", reply = "*{npc} pushes its nose into your hand and leaves it there, and the fright goes out of it all at once.*", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead_revive = {
      lines = {
        { id = "dre_default", text = "*{npc} lowers its head, and you remember kneeling over it with Revive Pet, and how long it took, and how it came back sullen and slow and wouldn't eat for an hour.*" },
      },
      choices = {
        { text = "That was the worst moment of my life, you know.", next = "BACK", reply = "*{npc} doesn't know, but it comes and sits so close that it's leaning on you, which may be the same thing.*", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ------------------------------------------------------------------
    -- Other beasts and other hunters' pets.
    ------------------------------------------------------------------
    others = {
      lines = {
        { id = "ot_default", text = "*{npc} lifts its nose and works it at the wind, sorting out every beast for a mile, and you'd give a great deal to know what it thinks of them all.*" },
        { id = "ot_hunter", when = { party = { class = "HUNTER" } }, text = "*{npc} turns its head toward the other hunter's beast and holds it there, ears pricked, very polite and very stiff, the way two strange dogs meet in a market square.*" },
      },
      choices = {
        { text = "Behave yourself with that other hunter's beast, now.", next = "BACK", reply = "*{npc} goes and sniffs the other beast nose to tail, and the other beast sniffs back, and after a while they lie down together as if nothing had happened.*", when = { party = { class = "HUNTER" } }, fx = { affinity = 1 } },
        { text = "Leave the druid alone. That cat is a person.", next = "BACK", reply = "*{npc} looks from the druid to you and back again, deeply unconvinced, and keeps a wary eye on them for the rest of the day.*", when = { party = { class = "DRUID" } }, fx = { trait = { witty = 1 } } },
        { text = "Does it bother you, the beasts we hunt?", next = "others_hunt" },
        { text = "Warlocks keep demons the way I keep you. Imagine that.", next = "others_demons" },
        { text = "Do the wild ones still call to you?", next = "others_call" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_hunt = {
      lines = {
        { id = "oh_default", text = "*{npc} looks at you with no shame at all, because it is a hunter too, and the beasts you kill are only food that ran.*" },
        { id = "oh_green", when = { pet = GREENEATERS }, text = "*{npc} looks at you with something close to reproach, because it eats fruit and fungus and never asked for any of this killing, though it has helped with plenty of it.*" },
      },
      choices = {
        { text = "We take only what we need, like any hunter in the wild.", next = "BACK", reply = "*{npc} sits and licks a forepaw, unbothered, as if you've told it something it knew from birth.*", fx = { align = { honor = 1 } } },
        { text = "Leatherworkers pay well for hides. That's the end of it.", next = "BACK", reply = "*{npc} glances at the skinning knife at your belt and moves, quite deliberately, to your other side.*", fx = { align = { honor = -1 }, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_demons = {
      lines = {
        { id = "od_default", text = "*{npc}'s hackles rise at the very word, because it has met an imp or two in its time, and it remembers the smell of brimstone and the shrieking and the singed whiskers.*" },
      },
      choices = {
        { text = "A beast is honest. A demon never is.", next = "BACK", reply = "*{npc} settles back down with a rumble that sounds a great deal like agreement.*", fx = { align = { light = 1 } } },
        { text = "Power's power. I'll not judge the warlocks.", next = "BACK", reply = "*{npc} gives you a long look and sneezes, as if it has caught a faint whiff of brimstone on you after all.*", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_call = {
      big = true,
      narr = "Far off, something of its own kind is calling, and the beast's ears swing toward it.",
      lines = {
        { id = "ocl_default", text = "*{npc} listens to the call for a long moment, quite still, and then looks back at you, and doesn't answer it.*" },
        { id = "ocl_wolf", when = { pet = WOLF }, text = "*{npc} lifts its head and nearly howls back, you can see it in its throat, but then it looks at you and the howl dies there.*" },
      },
      choices = {
        { text = "You're with me now. Let the wild call all it likes.", next = "BACK", reply = "*{npc} turns its back on the hills and lies down facing you.*", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "Answer them sometimes. You're not all mine.", next = "BACK", reply = "*{npc} throws back its head and answers, once, and then comes back to your side, satisfied.*", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ------------------------------------------------------------------
    -- The druids, and how the kaldorei see taming.
    ------------------------------------------------------------------
    druids = {
      lines = {
        { id = "dr2_default", text = "*{npc} sniffs at the word as if it smells of moss and moonlight, because every druid you've met has smelled of exactly that, and every one of them has looked at it a little too long.*" },
        { id = "dr2_nightelf", when = { race = "NightElf" }, text = "*{npc} looks up at you while you talk of the Cenarion Circle, and you remember the druid in Darnassus who watched you walk by with it, and said nothing, and frowned.*" },
        { id = "dr2_tauren", when = { race = "Tauren" }, text = "*{npc} turns toward Thunder Bluff and the Elder Rise, where the tauren druids keep their own counsel, and you think of the shu'halo and how gently they speak of the beasts.*" },
      },
      choices = {
        { text = "Some druids think taming steals a beast's will.", next = "druids_will" },
        { text = "The Druids of the Claw become great bears. You'd like them.", next = "BACK", reply = "*{npc} looks deeply doubtful about anyone who can turn into a bear and back again, and edges a step closer to you.*", fx = { trait = { witty = 1 } } },
        { text = "Cenarius is a son of the forest. He'd know you.", next = "druids_cenarius" },
        { text = "The Sentinels ride nightsabers into war, you know.", next = "BACK", reply = "*{npc} watches you as you talk of the great saber-cats of the Sentinels, and gives a short, low sound you've never heard from it before.*", when = { race = "NightElf" }, fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druids_will = {
      big = true,
      narr = "You think of the moment the taming took, and of how much of the beast you have and how much you only borrow.",
      lines = {
        { id = "dwi_default", text = "*{npc} looks at you with steady eyes, its own eyes, and whatever is behind them doesn't look stolen to you, though you would have to admit you're not the right one to judge.*" },
      },
      choices = {
        { text = "Maybe they're right. I'll treat you all the better for it.", next = "BACK", reply = "*{npc} pushes its nose into your palm, unconcerned with philosophy, and very concerned with your hand.*", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Druids talk. Hunters hunt. I'll not apologize for you.", next = "BACK", reply = "*{npc} stands and shakes itself and looks at you as if it, at least, has never apologized for anything.*", fx = { align = { honor = -1 }, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druids_cenarius = {
      lines = {
        { id = "dce_default", text = "*{npc} turns its head south, toward Moonglade or the wild places, or nowhere you could name, and holds very still as if listening to something in the trees.*" },
        { id = "dce_nightelf", when = { race = "NightElf" }, text = "*{npc} turns its head toward Moonglade, where the Circle keeps its quiet, and you think of the old songs, that Cenarius taught your ancestors before there were any hunters at all.*" },
      },
      choices = {
        { text = "They say he loved every beast in the forest.", next = "BACK", reply = "*{npc} lies down at your feet in the leaves, as if the forest is the only place it ever cared to be loved.*", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ------------------------------------------------------------------
    -- The stable.
    ------------------------------------------------------------------
    stable = {
      lines = {
        { id = "st_default", text = "*{npc} knows the word stable very well, and it sits down hard and looks at you with reproach, as if you have just told it that there will be no supper ever again.*" },
        { id = "st_cat", when = { pet = CAT }, text = "*{npc} turns its back on you at the word stable and begins to wash, slowly and pointedly, the way it does whenever you have disappointed it.*" },
        { id = "st_turtle", when = { pet = TURTLE }, text = "*{npc} doesn't seem to mind at all, because the stable is warm and full of hay, and one place is very much like another to a turtle.*" },
        { id = "st_bat", when = { pet = BAT }, text = "*{npc} chitters and clings to your sleeve, wings wrapped tight, because the last stable had a rafter it hated and a stable boy who flapped at it.*" },
      },
      choices = {
        { text = "Only a few days. The stable master will treat you well.", next = "BACK", reply = "*{npc} doesn't believe a word of it, but it lets you lead it to the stable all the same, dragging its feet.*", fx = { affinity = 1 } },
        { text = "There's a beast I need to tame for a trick. Then I'll be back.", next = "stable_tame" },
        { text = "Don't look at me like that. It isn't forever.", next = "BACK", reply = "*{npc} looks at you like that anyway, and keeps looking at you like that until you're out of sight.*", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stable_tame = {
      big = true,
      lines = {
        { id = "stt_default", text = "*{npc} sniffs at your hands as if it can smell the other beast already, and sits down very straight, the way it does when it is trying hard not to be jealous.*" },
      },
      choices = {
        { text = "You're my first. Whatever I tame, nothing changes that.", next = "BACK", reply = "*{npc} lets out a long breath and leans against you, and lets itself be led to the stable without any fuss at all.*", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "If the new one's faster, it might be staying.", next = "BACK", reply = "*{npc} looks at you, and then looks away, and walks into the stable on its own without being led.*", fx = { align = { honor = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ------------------------------------------------------------------
    -- Letting it go. Only a talk: the game decides nothing here.
    ------------------------------------------------------------------
    letgo = {
      narr = "The beast must hear something in your voice, because it goes very still.",
      lines = {
        { id = "lg_default", text = "*{npc} looks up at you, waiting for the order to follow, because there has never been any other order between you that mattered.*" },
        { id = "lg_wolf", when = { pet = WOLF }, text = "*{npc} presses against your leg, harder than usual, as if it has heard that tone before from someone else and didn't like what came after.*" },
        { id = "lg_turtle", when = { pet = TURTLE }, text = "*{npc} blinks at you, slowly, as if it has all the time in the world to wait for you to come to your senses.*" },
        { id = "lg_cat", when = { pet = CAT }, text = "*{npc} stops washing in the middle of a stroke and looks at you with one paw still raised, quite still, and doesn't put it down.*" },
      },
      choices = {
        { text = "Go on. Go home, back to the wild where you belong.", next = "letgo_go" },
        { text = "You deserve better than a life at my heel.", next = "letgo_better" },
        { text = "No. Never mind. Forget I said anything.", next = "BACK", reply = "*{npc} lets out a long breath and puts its head on your boot, and you leave your hand on it a while.*", fx = { affinity = 1 } },
      },
    },
    letgo_go = {
      lines = {
        { id = "lgg_default", text = "*{npc} doesn't go. It wags once, uncertain, and takes one step toward the trees because you're pointing at them, and then stops and looks back at you to see whether you're coming.*" },
        { id = "lgg_turtle", when = { pet = TURTLE }, text = "*{npc} doesn't go. It considers the trees, and considers you, and settles down exactly where it is, because you are clearly not making any sense.*" },
        { id = "lgg_flier", when = { pet = FLIERS }, text = "*{npc} lifts into the air because you've thrown your arm up, circles once over your head, and lands right back on the ground beside you.*" },
      },
      choices = {
        { text = "Go on, I said! Get away from me!", next = "letgo_shout" },
        { text = "I can't do this. Come here.", next = "letgo_back" },
      },
    },
    letgo_shout = {
      big = true,
      narr = "Your voice comes out harder than you meant, and the beast flinches as if you had struck it.",
      lines = {
        { id = "lgs_default", text = "*{npc} backs away, a step, then another, with its head low and its eyes never leaving yours, and then it stops at the edge of the trees, and sits down, and waits for you to call it.*" },
        { id = "lgs_hyena", when = { pet = HYENA }, text = "*{npc} backs away with its head low, and for once it doesn't laugh at all, and that silence is worse than any sound it has ever made.*" },
      },
      choices = {
        { text = "{npc}. Come here. You're staying, and that's the end of it.", next = "letgo_back", fx = { align = { order = 1 } } },
        { text = "Then I'll walk away, and you'll not follow me.", next = "letgo_walk", fx = { align = { order = -1 } } },
      },
    },
    letgo_better = {
      big = true,
      lines = {
        { id = "lgb_default", text = "*{npc} has no idea what better might be. It knows your smell and your voice and the feel of your hand, and it pushes its head into your palm as though that were the whole of the world.*" },
      },
      choices = {
        { text = "Then maybe better is staying right here with me.", next = "letgo_back", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "The wild is your home, not my side. Go.", next = "letgo_go", fx = { align = { order = -1 } } },
      },
    },
    letgo_back = {
      narr = "You kneel down, and the beast comes to you at a run.",
      lines = {
        { id = "lgk_default", text = "*{npc} crashes into you so hard it knocks you backward into the grass, and then it's all over you, nose and paws and warm breath, as if you had been gone for a year.*" },
        { id = "lgk_turtle", when = { pet = TURTLE }, text = "*{npc} comes to you, eventually, and puts its old head against your knee, and stays there, which from a turtle is very nearly a parade.*" },
        { id = "lgk_cat", when = { pet = CAT }, text = "*{npc} comes to you, unhurried, and climbs into your lap as though it owned it, and begins to purr loudly enough to drown out every foolish thing you've said.*" },
      },
      choices = {
        { text = "I'm sorry, truly. I'll never say that to you again.", next = "BACK", fx = { affinity = 2 } },
        { text = "All right, all right. You win. You always win.", next = "BACK", reply = "*{npc} settles down at your side as if nothing happened at all, which is a beast's way of forgiving.*", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    letgo_walk = {
      narr = "You turn your back and walk, and you don't let yourself look round for a long time.",
      lines = {
        { id = "lgw_default", text = "*When at last you do look back, {npc} is still sitting where you left it, small in the distance, its head turned after you, and it hasn't moved at all.*" },
        { id = "lgw_wolf", when = { pet = WOLF }, text = "*When at last you do look back, {npc} is still sitting where you left it, and as you watch it lifts its head and howls, once, long and thin, and doesn't stop.*" },
      },
      choices = {
        { text = "Goodbye, {npc}. Run well.", next = "END", fx = { trait = { stern = 1 } } },
        { text = "No, I can't do it. Come here, {npc}, come on!", next = "letgo_back" },
      },
    },

    ------------------------------------------------------------------
    -- Race asides.
    ------------------------------------------------------------------
    xnightelf = {
      lines = {
        { id = "xn_default", text = "*{npc} sits still while you speak of the old days, when your people ran with the nightsabers under the moon long before Teldrassil was ever planted, and it turns its face up to the stars as if it remembers too.*" },
      },
      choices = {
        { text = "The Sundering broke the world, but not the bond between us.", next = "xnightelf_bond" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xnightelf_bond = {
      big = true,
      lines = {
        { id = "xnb_default", text = "*{npc} presses close against you in the dark, and the moon catches its eyes, and for a moment it's easy to believe that Elune watches over hunter and beast alike.*" },
      },
      choices = {
        { text = "Elune gave the beasts into our keeping. We keep them well.", next = "BACK", reply = "*{npc} settles under your hand, content to be kept.*", fx = { align = { order = 1 } } },
        { text = "No one keeps you. You walk with me because you choose to.", next = "BACK", reply = "*{npc} looks up at you for a long moment and then stays, which seems to prove your point.*", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdwarf = {
      lines = {
        { id = "xd_default", text = "*{npc} sniffs you over at the mention of Grif Wildheart, and then sneezes, because you've been at the Thunderbrew again and it can smell every drop.*" },
      },
      choices = {
        { text = "Aye, laugh. Old Grif'd still say you're the finest beast in Dun Morogh.", next = "xdwarf_grif" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdwarf_grif = {
      big = true,
      lines = {
        { id = "xdg_default", text = "*{npc} sits up very straight, as though it has understood the compliment, and gives a short, proud huff that fogs in the cold air.*" },
      },
      choices = {
        { text = "A dwarf stands by his kin, and you're kin, beastie.", next = "BACK", reply = "*{npc} leans against you, warm and solid as a stone wall.*", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Mind ye, a good ram's worth two of you on a mountain.", next = "BACK", reply = "*{npc} turns its back on you and refuses to look round again until supper.*", fx = { align = { honor = -1 }, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xorc = {
      lines = {
        { id = "xo_default", text = "*{npc} lifts its head at your tone, which is the tone of an orc remembering war, and you think of the Frostwolf riders and their great white wolves charging down out of Alterac.*" },
        { id = "xo_wolf", when = { pet = WOLF }, text = "*{npc} pricks its ears at the word Frostwolf, as if it knows its own kind have carried your people into battle since before the Dark Portal.*" },
      },
      choices = {
        { text = "In the camps, we had no beasts. Only chains.", next = "xorc_camps" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xorc_camps = {
      big = true,
      lines = {
        { id = "xoc_default", text = "*{npc} doesn't know anything about camps or chains, but it knows your voice has gone hard and quiet, and it comes and sits against you, solid and warm, like a shield wall of one.*" },
      },
      choices = {
        { text = "You'll never wear a chain. I swear it on my blood.", next = "BACK", reply = "*{npc} pushes its head under your arm, unchained and content.*", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Even a free orc obeys the Warchief. You'll obey me.", next = "BACK", reply = "*{npc} sits up at your sharper voice, at attention, ready for whatever order comes next.*", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtroll = {
      lines = {
        { id = "xt_default", text = "*{npc} goes quiet at the word loa, and its ears swing toward the dark between the trees, as though something out there has heard its name spoken.*" },
        { id = "xt_raptor", when = { pet = RAPTOR }, text = "*{npc} clicks and bobs its head at the word loa, and you think of the old troll tales of raptor spirits, and of how long your people have hunted with its kind.*" },
      },
      choices = {
        { text = "Vol'jin say de Darkspear owe Thrall. You owe me, eh?", next = "xtroll_debt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtroll_debt = {
      big = true,
      lines = {
        { id = "xtd_default", text = "*{npc} flicks its tail and looks at you sidelong, the way a clever beast looks at someone who's trying to be clever with it.*" },
      },
      choices = {
        { text = "Nah, mon. We be square, you and me. Always.", next = "BACK", reply = "*{npc} lies down beside you, entirely at ease, and closes its eyes.*", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "You owe me plenty, beast. I be collectin' every day.", next = "BACK", reply = "*{npc} snorts and turns away, which is about what you'd expect from anyone told they're in debt.*", fx = { align = { honor = -1 }, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtauren = {
      lines = {
        { id = "xta_default", text = "*{npc} lies down in the long grass while you talk of the Earth Mother, and it seems as easy there as if the grass had grown up around it.*" },
        { id = "xta_strider", when = { pet = STRIDER }, text = "*{npc} stands on one leg in the long grass while you talk, as plainstriders do across all of Mulgore, and looks as much a part of the plains as the wind.*" },
      },
      choices = {
        { text = "My people say every beast carries a spirit. I hear yours.", next = "xtauren_spirit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtauren_spirit = {
      big = true,
      lines = {
        { id = "xts_default", text = "*{npc} looks up at you, very calm, and then rests its head against your hoof, as if whatever you hear in it is welcome to stay.*" },
      },
      choices = {
        { text = "We walk together under An'she, not as master and beast.", next = "BACK", reply = "*{npc} sighs and settles deeper into the grass beside you.*", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "The herd needs a leader. In ours, that is me.", next = "BACK", reply = "*{npc} gets up and falls in at your side, as if the herd were moving on.*", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xforsaken = {
      lines = {
        { id = "xf_default", text = "*{npc} sniffs at your sunken chest and your cold hands, and it doesn't flinch from them the way other beasts do, and it settles at your side as if you smelled of nothing worse than a long road.*" },
        { id = "xf_carrion", when = { pet = CARRION }, text = "*{npc} sniffs at you with deep, professional interest, and then settles beside you looking extremely comfortable, which you choose not to think about too hard.*" },
      },
      choices = {
        { text = "Most of the living flinch from me. You never did.", next = "xforsaken_living" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xforsaken_living = {
      big = true,
      lines = {
        { id = "xfl_default", text = "*{npc} puts its warm head on your cold knee and leaves it there, and its warmth seeps into you in a way you'd almost forgotten.*" },
      },
      choices = {
        { text = "You make me remember what it was to be alive.", next = "BACK", reply = "*{npc} doesn't move, and the warmth stays.*", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "You're only useful because the living fear you. As they fear me.", next = "BACK", reply = "*{npc} lifts its head off your knee and sits up beside you instead, watchful, and the warmth goes with it.*", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuman = {
      lines = {
        { id = "xh_default", text = "*{npc} looks at you sidelong, as if it can hear in your voice every Stormwind hound and Westfall plough-horse you ever knew, and wants you to know it is nothing like them.*" },
      },
      choices = {
        { text = "Back home they'd chain you in a yard. Not me.", next = "xhuman_yard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuman_yard = {
      big = true,
      lines = {
        { id = "xhy_default", text = "*{npc} lies down at your feet with its head up, free and watchful, as though it has heard the word yard and wants nothing to do with it.*" },
      },
      choices = {
        { text = "A beast should run free, whatever the guards think.", next = "BACK", reply = "*{npc} stretches out long in the grass, very free indeed.*", fx = { align = { order = -1 } } },
        { text = "You'll keep to the roads and the laws, like anyone else.", next = "BACK", reply = "*{npc} sighs and falls in at your heel, as dutiful as any Stormwind watchman's dog.*", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xgnome = {
      lines = {
        { id = "xg_default", text = "*{npc} looks at you with great suspicion while you describe the gears and springs and the tiny steam boiler, and edges away from your toolbag as if it might bite.*" },
      },
      choices = {
        { text = "It exploded, of course. You're much more reliable.", next = "xgnome_reliable" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xgnome_reliable = {
      big = true,
      lines = {
        { id = "xgr_default", text = "*{npc} comes back and sniffs at the singed patch on your sleeve, the last remnant of the prototype, and then puts its head on your lap as if to say that it, at least, will never explode.*" },
      },
      choices = {
        { text = "Flesh and blood beats clockwork. I'll put that in my notes.", next = "BACK", reply = "*{npc} sighs contentedly and goes to sleep across your notes.*", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Clockwork does as it's told, mind. You could learn from it.", next = "BACK", reply = "*{npc} gets up off your lap and walks away from your toolbag, very slowly and very pointedly.*", fx = { align = { order = 1 }, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xskyborne = {
      lines = {
        { id = "xs_default", text = "*{npc} looks up at the sky when you point, the way you always point when you talk about Zephras Isle, and then looks back at you, entirely content with the ground it's standing on.*" },
        { id = "xs_flier", when = { pet = FLIERS }, text = "*{npc} looks up at the sky when you point, and then at you, as if to ask why anyone who misses the sky so much doesn't simply fly, the way it does.*" },
      },
      choices = {
        { text = "We rode hippogryphs over the isles. I miss the wind.", next = "xskyborne_wind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xskyborne_wind = {
      big = true,
      lines = {
        { id = "xsw_default", text = "*{npc} lifts its nose into the breeze for you, as if it could catch the wind you've lost and bring it back, and then comes and stands very close.*" },
      },
      choices = {
        { text = "The isles are gone. Down here is home now, with you.", next = "BACK", reply = "*{npc} lies down at your feet in the grass, and for once the ground doesn't feel so far down.*", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'll find a way back up someday, and take you with me.", next = "BACK", reply = "*{npc} looks at the sky with grave doubt and then at you, and stays close, just in case.*", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  confides = {
    { id = "cnf_1", text = "*{npc} lifts its nose and turns toward the nearest water, and you remember that it always knows where to drink long before you do.*" },
    { id = "cnf_2", text = "*{npc} growls low at a patch of ground nobody else has noticed, and when you look closer there are tracks there far bigger than anything you have hunted yet.*" },
  },
  topics = {
    beasts = { { id = "t_beasts", text = "*{npc} lifts its nose and works the wind, and you can tell it knows every beast for a mile, and has opinions about all of them.*" } },
    background = { { id = "t_bg", text = "*{npc} turns its head toward the hills where you found it, and then back to you, and settles.*" } },
    advice = { { id = "t_ad", text = "*{npc} sniffs at your pack, then at you, and sits down pointedly beside the pack, which is about as clear as advice gets.*" } },
    _none = { { id = "t_none", text = "*{npc} tilts its head at you, ears forward, and waits for something it can actually understand, like supper.*" } },
    grievance = {
      { id = "gv1", text = "*{npc} turns its back on you and lies down facing the other way, ears flat, and refuses to look round no matter what you say.*" },
      { id = "gv_wronged", when = { grudge = "wronged" }, text = "*{npc} flinches when your hand comes near, and it has not done that since the day you tamed it.*" },
    },
    amends = {
      { id = "am1", text = "*{npc} looks at your pack, then at you, and then at your pack again, as if pointing out the obvious answer.*" },
      { id = "am2", text = "*{npc} walks a few paces off and waits, and only comes back once you have sat down and stayed quiet for a good long while.*" },
    },
    spite = {
      { id = "sp1", text = "*{npc} bares its teeth at you, not quite a snarl, and holds your eye far longer than any tame beast should.*" },
    },
    regard = {
      { id = "rg_1", text = "*{npc} looks up at you for a long moment, then presses its whole flank against your legs and stays there, as plain an answer as any beast has ever given.*" },
      { id = "rg_2", text = "*{npc} sniffs your hand, your sleeve and your face, as if checking that every part of you is still there, and then settles at your feet with a contented sigh.*" },
      { id = "rg_wolf", when = { pet = WOLF }, text = "*{npc} rears up, puts its paws on your shoulders and licks your chin once, firmly, the way a wolf greets the one who leads the pack.*" },
      { id = "rg_cat", when = { pet = CAT }, text = "*{npc} considers you, then slowly closes its eyes at you and opens them again, which from a cat is very nearly a declaration of love.*" },
      { id = "rg_dark", when = { alignment = { axis = "light", max = -30 } }, text = "*{npc} sniffs at the shadow that clings to you, entirely unbothered, as though whatever dark you carry is only one more smell of home.*" },
    },
    confide = {
      { id = "cf_1", text = "*{npc} leads you a few steps off the path and paws at the ground under a bush, where it has buried something it was clearly saving for a special occasion.*" },
      { id = "cf_2", text = "*{npc} looks over its shoulder toward the wilds where you found it, and its ears go back for just a moment, as though it remembers something it has never shown you.*" },
    },
    trust = {
      { id = "tr_1", text = "*{npc} looks from you to everyone nearby in turn, and its hackles stay down only for you, which tells you exactly how far its trust extends.*" },
      { id = "tr_2", text = "*{npc} lifts its nose and sorts through every scent on the wind, and then turns its back on all of them and faces you.*" },
    },
    watchout = {
      { id = "wo_1", text = "*{npc} stiffens and stares hard at the treeline, a low rumble starting in its chest, until you look where it is looking.*" },
      { id = "wo_2", text = "*{npc} circles you twice with its nose to the ground, and then plants itself on your downwind side, where anything creeping up would have to go through it first.*" },
    },
    worries = {
      { id = "wy_1", text = "*{npc} pushes its nose under your hand and holds still there, and you realise it is checking, as it always does, whether you smell of blood today.*" },
      { id = "wy_2", text = "*{npc} whines softly and keeps glancing at the ground at your feet, as though it still does not trust the earth not to take you again the way it did the last time you fell.*" },
    },
    hopes = {
      { id = "hp_1", text = "*{npc} stretches out in the sun at your feet with its belly to the sky, and you suspect that this, a full stomach with you nearby, is the whole of what it hopes for.*" },
      { id = "hp_2", text = "*{npc} looks out across open country and its muscles bunch, eager, as though it would like nothing better than to run the whole of it with you at its side.*" },
    },
    favor = {
      { id = "fv_1", text = "*{npc} sits pointedly beside your pack and looks from it to you and back again, with the patience of a creature that knows exactly where the food is kept.*" },
      { id = "fv_2", text = "*{npc} drops a stick at your feet, steps back and waits, with the air of one asking a very small favour that would mean a great deal.*" },
    },
    friendship = {
      { id = "fr_1", text = "*{npc} leans into you with all its weight and closes its eyes, and you understand that the question was never in doubt.*" },
      { id = "fr_2", text = "*{npc} lies down across your feet so that you could not leave without waking it, and that is answer enough.*" },
      { id = "fr_high", when = { minLevel = 50 }, text = "*{npc} rests its head on your knee, as it has after a hundred hard fights together, and sighs as though there were nowhere else in the world.*" },
    },
    never_told = {
      { id = "nt_1", text = "*{npc} goes very still and looks at you, and in its eyes is something of the wild thing you tamed, the one that chose to stay when it could have run. It has never let you see that before.*" },
      { id = "nt_2", text = "*{npc} lies down with its chin on your boot, and for once it lets you see how tired it is from keeping up with you, as if trusting you not to think less of it.*" },
    },
  },
}
