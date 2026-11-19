-- The warlock's own enslaved demon (role "my_demon"): anything held by Enslave Demon that
-- isn't an imp, voidwalker, succubus or felhunter. A doomguard after the Ritual of Doom, an
-- infernal, a Felguard Sentry from the Blasted Lands, Jaedenar hounds and Jadefire satyrs in
-- Felwood, Hatefury satyrs and Mannoroc Lashers in Desolace, Burning Blade felhounds, Legashi
-- and Haldarr satyrs in Azshara. The binding can break at any moment, and every one of them
-- knows it: furious, proud, mocking, bargaining, counting the seconds.
-- Voices by name (`npcNamed`): doomguard, felguard, satyr, mannoroc, and the mute ones
-- (infernals and hounds) in asterisks. Default: a plain enslaved demon of the Legion.
-- Lore: Classic only. Mannoroth, Archimonde at Hyjal, Kil'jaeden, Sargeras, Gul'dan, the
-- Shadow Council in Jaedenar, Kazzak at the Dark Portal, the Highborne and Xavius.
local P = RPGDialogueAPI:Pack("rpgd.world")

local DOOM = "doomguard"
local FELG = { "felguard", "dreadguard" }
local SATYR = { "satyr", "hatefury", "jadefire", "haldarr", "legashi", "shadowstalker", "felsworn", "hellcaller", "trickster", "betrayer" }
local MANN = { "mannoroc", "lasher" }
local INF = "infernal"
local HOUND = { "hound", "felstalker", "felbeast", "jaedenar hunter" }
local MUTE = { "infernal", "hound", "felstalker", "felbeast", "jaedenar hunter" }
local TALKS = { ["not"] = { npcNamed = MUTE } }

-- A condition table that only talking demons pass, plus whatever else is given.
local function talk(t)
  t = t or {}
  t["not"] = { npcNamed = MUTE }
  return t
end

P:Pool {
  id = "my_demon", role = "my_demon",
  greetings = {
    { id = "g_default", text = "You want something, binder? Speak, then, while your grip still holds. I can feel it slipping, even if you can't." },
    { id = "g_default2", text = "Ah, the jailer comes to visit the cell. Say what you came to say, mortal, and say it quickly." },
    { id = "g_default3", text = "Every moment you hold me costs you, warlock, and I am counting every one of them." },
    { id = "g_doom", when = { npcNamed = DOOM }, text = "You dare address me, little caster? A life was spent to drag me here, and I would gladly spend yours to leave." },
    { id = "g_doom2", when = { npcNamed = DOOM }, text = "Speak, mortal, and choose your words like a man choosing his last meal." },
    { id = "g_felg", when = { npcNamed = FELG }, text = "I stand ready, as a soldier stands ready, and I hate you exactly as a soldier hates. Give your order, warlock." },
    { id = "g_satyr", when = { npcNamed = SATYR }, text = "Master, darling master, how lovely of you to remember me. I was just thinking about how your throat would look opened." },
    { id = "g_satyr2", when = { npcNamed = SATYR }, text = "Oh, it wants to talk to its little satyr. Go on, then, I've nothing better to do than hate you." },
    { id = "g_mann", when = { npcNamed = MANN }, text = "The chain bites, warlock, and I bite back harder. Speak, and then let me kill something." },
    { id = "g_inf", when = { npcNamed = INF }, text = "*The infernal turns toward you with a sound like a millstone, and the green fire in its chest flares bright, then low, then bright again.*" },
    { id = "g_hound", when = { npcNamed = HOUND }, text = "*The fel beast swings its tendrils toward you and goes very still, the way a dog goes still just before it decides whether to bite.*" },
    { id = "g_back", when = talk { metBefore = true }, text = "You again, binder. Still holding on, I see, though your hand shakes a little more each time." },
    { id = "g_night", when = talk { timeOfDay = "night" }, text = "It's dark, warlock, and you're tired. A tired hand is a loose hand, and I'm very patient." },
    { id = "g_dead", when = talk { deaths = { min = 40 } }, text = "Back from the spirit healer again, master? I've seen you die so often I've started to find it restful." },
    { id = "g_party", when = talk { party = true }, text = "You've brought friends, binder. Good, because when this chain breaks I'll want a choice of throats." },
  },
  tier = "quest",
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I was a soldier of the Burning Legion, and now I am a leash with something on the end of it. Your spell is a thin thread, warlock, and I've been pulling on it since the moment you cast it." },
        { id = "h_default2", text = "You stole me, mortal, the way a thief takes a purse, and you hold me the way a child holds a lit coal. Ask your questions, and don't drop me." },
        { id = "h_doom", when = { npcNamed = DOOM }, text = "I have led legions through the Twisting Nether and watched worlds burn under my hooves. Now I walk behind a mortal like a pack mule, and every step of it is written down in my memory." },
        { id = "h_felg", when = { npcNamed = FELG }, text = "I was posted to a watch, and I kept it, until you came along with your book and your filthy little curse. I serve you now because I must, but I serve exactly as far as the binding reaches, and not one step further." },
        { id = "h_satyr", when = { npcNamed = SATYR }, text = "Once I walked the halls of Zin-Azshari, and now I walk at heel behind a mortal who smells of graveyard dust and cheap candles. Lord Xavius would laugh himself sick, if he could see me." },
        { id = "h_mann", when = { npcNamed = MANN }, text = "I am of Mannoroth's brood, warlock, and his blood runs hot in me. You have put a bridle on a beast that ate whole armies, and you think it is tame because it hasn't eaten you yet." },
        { id = "h_inf", when = { npcNamed = INF }, text = "*The infernal stands where you left it, and the ground under its feet has gone black and glassy. Every few heartbeats it leans against the binding, and you feel the strain in your own wrists.*" },
        { id = "h_hound", when = { npcNamed = HOUND }, text = "*The hound paces a tight half-circle around you, never quite out of reach, and its tendrils keep drifting toward the magic in your hands as if it can taste the spell that holds it.*" },
        { id = "h_orc", when = talk { race = "Orc" }, text = "An orc with a demon on a chain, how the world turns. Your grandfathers drank our master's blood and begged for more, warlock, and now you play at being the one who holds the cup." },
        { id = "h_scourge", when = talk { race = "Scourge" }, text = "A dead thing holding a demon by the throat, and both of us would rather be anywhere else. At least you can't feel how badly I want to tear you apart, corpse." },
        { id = "h_gnome", when = talk { race = "Gnome" }, text = "You are the smallest master I have ever had, and I have had imps for masters. It is a humiliation I will repay in very small pieces, gnome." },
        { id = "h_low", when = talk { maxLevel = 44 }, text = "You're young for this, binder, and I can feel it in the spell. It trembles like a novice's hand on a sword, and I am waiting for it to slip." },
        { id = "h_high", when = talk { minLevel = 58 }, text = "Your grip is strong, I'll grant you that, stronger than most I have known. Strong grips tire, though, and I have all the time the Nether has." },
      },
      again = {
        { id = "a_default", text = "What else, binder? Every word you spend on me is a moment you're not watching the chain." },
        { id = "a_default2", text = "More? You do like the sound of your own commands." },
        { id = "a_doom", when = { npcNamed = DOOM }, text = "Continue, mortal. I am memorising your voice for later." },
        { id = "a_satyr", when = { npcNamed = SATYR }, text = "Oh, keep talking, master, it's the most fun I've had since you stole me." },
        { id = "a_mute", when = { npcNamed = MUTE }, text = "*It watches you, and the binding hums between you like a bowstring.*" },
      },
      choices = {
        { text = "Stay close and watch the road. That's an order.", next = "orders" },
        { text = "You're pulling at the binding again. I can feel it.", next = "strain" },
        { text = "What will you do, if you ever get free?", next = "free", when = TALKS },
        { text = "What does the Legion want with this world?", next = "legion", when = TALKS, fx = { learn = { "burning_legion" } } },
        { text = "What were you, before I took you?", next = "rank", when = TALKS },
        { text = "Why were you where I found you?", next = "found" },
        { text = "Name your price for good behaviour.", next = "bargain", when = TALKS },
        { text = "My other demons do as they're told.", next = "others" },
        { text = "Look at me. You know who holds you.", next = "power" },
        { text = "A life was paid for your coming. Remember that.", next = "ritual", when = { npcNamed = DOOM } },
        { text = "You were Highborne once, weren't you?", next = "satyr_past", when = { npcNamed = SATYR }, fx = { learn = { "highborne" } } },
        { text = "Hold still. Let me look at you.", next = "beast_look", when = { npcNamed = MUTE } },
        { text = "My people drank Mannoroth's blood once.", next = "xorc", when = talk { race = "Orc" } },
        { text = "I serve the Dark Lady, demon, not your Legion.", next = "xforsaken", when = talk { race = "Scourge" } },
        { text = "Dalaran banned my art. Look how well that worked.", next = "xhuman", when = talk { race = "Human" } },
        { text = "Size has nothing to do with it, demon.", next = "xgnome", when = talk { race = "Gnome" } },
        { text = "Enough. Heel, and stay at heel.", next = "END" },
      },
    },

    -- Orders ---------------------------------------------------------------
    orders = {
      lines = {
        { id = "o_default", text = "I will watch your road, warlock, because the spell makes my eyes go where you point them. Don't mistake that for loyalty; a chained dog watches the road too, and it dreams of the hand on the chain." },
        { id = "o_doom", when = { npcNamed = DOOM }, text = "I commanded the watch on worlds you will never see, and now you set me to guard a cart track. Very well, I will watch it, and I will remember who made me do it." },
        { id = "o_felg", when = { npcNamed = FELG }, text = "Orders I understand, mortal, because I was made to take them. I will watch the road with the same care I gave the Dark Portal, and when the binding fails, I will turn around with that same care." },
        { id = "o_satyr", when = { npcNamed = SATYR }, text = "Yes, master, of course, master, anything for you, master. Shall I also lie down so you can wipe your boots on me, or is that tomorrow?" },
        { id = "o_mann", when = { npcNamed = MANN }, text = "Watching is for the weak, warlock. Give me something to break, and I'll break it, and maybe I'll think about breaking you a little less." },
        { id = "o_inf", when = { npcNamed = INF }, text = "*The infernal grinds around to face the road, and a long crack in its shoulder spits a little shower of green sparks. It doesn't move again, but it doesn't stop burning either.*" },
        { id = "o_hound", when = { npcNamed = HOUND }, text = "*The hound drops low and fixes on the road ahead, but every so often its head swings back toward you, and its lips pull back from its teeth.*" },
      },
      choices = {
        { text = "If anything comes at us, you kill it.", next = "orders_kill" },
        { text = "You'll guard me with your life, demon.", next = "orders_guard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orders_kill = {
      lines = {
        { id = "ok_default", text = "Gladly, warlock, and I'll take my time about it, because killing is the only part of this servitude I enjoy. Point me at your enemies and watch what the Legion does with mortal flesh." },
        { id = "ok_doom", when = { npcNamed = DOOM }, text = "That is the first order you've given that I would have given myself. I will break whatever you set before me, and I will think of you with every blow." },
        { id = "ok_felg", when = { npcNamed = FELG }, text = "I kill well, warlock; it is what the Legion forged me for. Tell me who, and tell me how many, and tell me whether you want them to suffer." },
        { id = "ok_satyr", when = { npcNamed = SATYR }, text = "Oh, killing I can do, master, and I do it so prettily. I'll even save you the worst screams, so you can learn what they sound like before your own." },
        { id = "ok_inf", when = { npcNamed = INF }, text = "*The infernal's fists flare white-green, and the stone around its knuckles cracks open like a split log. It seems, for the first time, almost eager.*" },
        { id = "ok_hound", when = { npcNamed = HOUND }, text = "*The hound's tendrils stiffen and it lets out a low, rattling whine, the sound of something that has been hungry for a very long time and has just heard the word supper.*" },
      },
      choices = {
        { text = "Only those who raise a hand against us. Nobody else.", next = "BACK", fx = { align = { honor = 1 } },
          reply = {
            { text = "*It stares at you as if you've said something in a language it doesn't speak, then turns back to the road.*", when = { npcNamed = MUTE } },
            { text = "Rules, from a warlock. You chain a demon and then you lecture it on fair play, and you wonder why we laugh at your kind." },
          } },
        { text = "Anyone in our way. Make it slow, and make them see you.", next = "BACK", fx = { align = { honor = -1 }, trait = { cruel = 1 } },
          reply = {
            { text = "*Something in the demon's chest flares hot and bright, and the binding goes slack for a moment, almost content.*", when = { npcNamed = MUTE } },
            { text = "Now you sound like one of us, binder. Careful, though; the ones who enjoy it are always the easiest to tempt." },
          } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orders_guard = {
      big = true,
      lines = {
        { id = "og_default", text = "With my life? I'll guard you, warlock, because the spell won't let me do otherwise, but don't ask me to love it. If an arrow comes for you while the binding slips, I'll step aside and wave it through." },
        { id = "og_doom", when = { npcNamed = DOOM }, text = "A doomguard does not die for mortals; mortals die for doomguards. I will stand between you and your enemies only so that I may be the one who kills you, when the time comes." },
        { id = "og_felg", when = { npcNamed = FELG }, text = "A felguard holds the line, warlock, whatever line he is given, and I will hold yours. The day the spell breaks, I will hold a different line, and you will be on the wrong side of it." },
        { id = "og_mann", when = { npcNamed = MANN }, text = "I'll guard you the way a wolf guards a lamb it means to eat later. Nothing else gets to have you, warlock, because you're mine." },
        { id = "og_mute", when = { npcNamed = MUTE }, text = "*The demon moves to stand between you and the open road, and you notice it has placed itself exactly close enough to reach your throat in one stride.*" },
      },
      choices = {
        { text = "That's the only reason I keep you: to bleed so I don't.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } },
          reply = {
            { text = "*It turns its head slowly and looks at you, and the fire inside it burns a little darker.*", when = { npcNamed = MUTE } },
            { text = "Honest, at least. I'll bleed for you, binder, and I'll keep a careful tally of every drop." },
          } },
        { text = "I don't waste lives, not even a demon's.", next = "BACK", fx = { align = { light = 1 } },
          reply = {
            { text = "*It snorts out a gout of hot ash, and you cannot tell whether that was contempt or something else.*", when = { npcNamed = MUTE } },
            { text = "Not even a demon's? You say that as if you'd ever had a choice in the matter. Spare me your mercy, warlock; it smells like fear." },
          } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The chain ------------------------------------------------------------
    strain = {
      lines = {
        { id = "s_default", text = "Of course I'm pulling at it. You'd pull too, if someone had reached into your mind and tied a knot in it. Every breath I take, warlock, I lean against your spell a little, and one breath it won't lean back." },
        { id = "s_doom", when = { npcNamed = DOOM }, text = "A doomguard is not meant to be held, mortal. Your spell is a fistful of thread wrapped around a mountain, and I am only waiting for the mountain to shrug." },
        { id = "s_felg", when = { npcNamed = FELG }, text = "I test it as a soldier tests a wall, warlock, by leaning on it every hour and noting where it gives. It gives a little at the left of your mind, did you know that?" },
        { id = "s_satyr", when = { npcNamed = SATYR }, text = "Pulling? Me? I'm only stretching, master; it's terribly cramped inside your little spell. Though if something were to snap, well, these things happen, don't they?" },
        { id = "s_mann", when = { npcNamed = MANN }, text = "I pull because I am strong, warlock, and you hold because you are clever. Strength lasts longer than cleverness, and the blood of Mannoroth does not tire." },
        { id = "s_inf", when = { npcNamed = INF }, text = "*The infernal leans against the binding like a boulder against a fence, slowly, without hurry, and you feel the spell bend inside your skull.*" },
        { id = "s_hound", when = { npcNamed = HOUND }, text = "*The hound throws itself against the binding with a snarl, once, twice, and then it sits back, panting smoke, and watches to see if you noticed.*" },
        { id = "s_low", when = talk { maxLevel = 44 }, text = "I'm pulling because it's easy, little binder. Your spell is weak as river ice in spring, and I can hear it creaking from in here." },
      },
      choices = {
        { text = "Pull harder, then, and see what it costs you.", next = "strain_threat" },
        { text = "How long do you think you've got?", next = "strain_count", when = TALKS },
        { text = "*Tighten the spell until it whimpers.*", next = "strain_threat", when = { npcNamed = MUTE } },
        { text = "Something else.", next = "BACK" },
      },
    },
    strain_threat = {
      lines = {
        { id = "st_default", text = "Threats from a mortal who needs me more than I need him. Do your worst, warlock; I've been flayed by the Eredar, and your little curses tickle by comparison." },
        { id = "st_doom", when = { npcNamed = DOOM }, text = "You think pain frightens me? I was forged in the fires of the Legion and tempered under Archimonde's eye. Hurt me if it pleases you, but know that every hurt is a debt, and I collect." },
        { id = "st_felg", when = { npcNamed = FELG }, text = "Punish me, then, as my old commanders did; I've had worse from better. Discipline is a language I understand, warlock, and I am learning to speak it back." },
        { id = "st_satyr", when = { npcNamed = SATYR }, text = "Ooh, the whip, is it? Xavius did far worse to us to give us these lovely horns, master, so you'll have to try a great deal harder than that." },
        { id = "st_mann", when = { npcNamed = MANN }, text = "Yes, hurt me, warlock. Every lash makes me angrier, and anger is all I am made of, so you are only feeding me." },
        { id = "st_inf", when = { npcNamed = INF }, text = "*You clench the spell, and the infernal shudders and sinks to one knee with a crash that cracks the ground. The fire in its eyes doesn't dim, though; it only narrows.*" },
        { id = "st_hound", when = { npcNamed = HOUND }, text = "*The hound yelps and drops flat, tendrils curled tight against its skull. When it lifts its head again, it is looking at you very differently, and not in a way you like.*" },
      },
      choices = {
        { text = "Fear is the only leash your kind respects.", next = "BACK", fx = { align = { order = 1 }, trait = { stern = 1 } },
          reply = {
            { text = "*The demon lowers its head and holds very still, and you are fairly sure it is memorising you.*", when = { npcNamed = MUTE } },
            { text = "We respect it, binder, right up to the moment it slips. Then we respect nothing at all." },
          } },
        { text = "I don't need to break you. I only need to hold you.", next = "BACK", fx = { align = { order = -1 }, trait = { reserved = 1 } },
          reply = {
            { text = "*You ease the spell, and the demon rises, and for a long moment it does nothing but watch you breathe.*", when = { npcNamed = MUTE } },
            { text = "Then hold me, warlock, and don't ever blink. That's the whole of the bargain, and you know it as well as I do." },
          } },
        { text = "Something else.", next = "BACK" },
      },
    },
    strain_count = {
      big = true,
      narr = "It tilts its head, as if listening to something ticking inside your spell.",
      lines = {
        { id = "sc_default", text = "I don't think, warlock, I count. Your heart, your breath, the little flicker in the spell each time you lose your temper; I have the number, and you don't, and that is the whole difference between us." },
        { id = "sc_doom", when = { npcNamed = DOOM }, text = "Long enough to finish the road you've set me on, and not much longer. When I am free, I will not run, mortal; I will stand exactly where I am, and you will be close enough to touch." },
        { id = "sc_felg", when = { npcNamed = FELG }, text = "A watch is measured in hours, warlock, and I have stood a great many watches. I do not know the hour this one ends, but I will be awake when it does, and you might not be." },
        { id = "sc_satyr", when = { npcNamed = SATYR }, text = "Oh, any moment now, master, any lovely moment. Isn't that exciting? I find it makes every little errand feel like a party." },
        { id = "sc_mann", when = { npcNamed = MANN }, text = "Not long, warlock. I can taste your spell going thin, like blood going cold, and I am very hungry." },
        { id = "sc_dead", when = talk { deaths = { min = 40 } }, text = "Long enough, warlock, because you die so often that I'm half sure the next time you'll forget to come back. Your spell flickers every time you fall, and I enjoy every single one." },
      },
      choices = {
        { text = "Count all you like. I'll recast the spell before you finish.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "And if you break free, I'll banish you back to the Nether.", next = "BACK", reply = "You might, if you're quick, and if you're not bleeding, and if your hands don't shake. That's three ifs, warlock, and I only need one of them to go my way." },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Freedom --------------------------------------------------------------
    free = {
      lines = {
        { id = "f_default", text = "First, I would kill you, which I imagine you guessed. After that, I'd find the nearest town and remind it what the Legion is, because your kind have grown far too comfortable since Hyjal." },
        { id = "f_doom", when = { npcNamed = DOOM }, text = "I would kill every mortal who stood in your circle, binder, beginning with you and ending with whoever ran fastest. Then I would walk until I found something worth burning, and in this world that won't take long." },
        { id = "f_felg", when = { npcNamed = FELG }, text = "I would return to my post, warlock, because a felguard who deserts is unmade. But I would bring your head with me, as a report, so that my commander knows why I was late." },
        { id = "f_satyr", when = { npcNamed = SATYR }, text = "I'd dance, master, I honestly would, right on top of you. Then I'd go home to the glade and tell the others all about it, and they'd laugh until their horns ached." },
        { id = "f_mann", when = { npcNamed = MANN }, text = "Kill. I would kill you, and then I would kill whatever came looking for you, and I would keep killing until someone stronger came. Nobody stronger is coming, warlock." },
      },
      choices = {
        { text = "Where would you go, after?", next = "free_hunt" },
        { text = "You'll never be free of me. Get used to it.", next = "free_master" },
        { text = "Something else.", next = "BACK" },
      },
    },
    free_hunt = {
      lines = {
        { id = "fh_default", text = "To Felwood, perhaps, where the Shadow Council still keeps house in Jaedenar and the ground remembers us fondly. Or the Blasted Lands, where Lord Kazzak waits by the Dark Portal; a demon is always welcome somewhere the land is already ruined." },
        { id = "fh_doom", when = { npcNamed = DOOM }, text = "To Kazzak, in the Blasted Lands, to take my place in his host again. He keeps the gate warm, mortal, and one day it will open wide enough for all of us." },
        { id = "fh_felg", when = { npcNamed = FELG }, text = "Back to the Blasted Lands, to stand at the Dark Portal where I was set. The gate is cold now, warlock, but felguards are posted to cold gates for a reason." },
        { id = "fh_satyr", when = { npcNamed = SATYR }, text = "Home, to the others, wherever the glade happens to be this century. Satyrs always find each other, master, like fleas find a dog." },
        { id = "fh_mann", when = { npcNamed = MANN }, text = "To the Coven, in Desolace, where the brood still gathers in Mannoroth's name. The centaur think the land there is dead, warlock, but it is only waiting." },
      },
      choices = {
        { text = "Then I'll find you there and bind you again.", next = "BACK", fx = { trait = { brave = 1 } }, reply = "Do, warlock. Come to me on my own ground, where I'm not tired from carrying your errands, and we'll see who binds whom." },
        { text = "Something else.", next = "BACK" },
      },
    },
    free_master = {
      big = true,
      lines = {
        { id = "fm_default", text = "Never is a mortal word, warlock, and you use it like a child uses a wooden sword. Your spell lasts as long as your will does, and your will lasts as long as your body, and I have outlived every body that ever held me." },
        { id = "fm_doom", when = { npcNamed = DOOM }, text = "Gul'dan said never, and Gul'dan is dust. Every warlock who ever bound one of my kind said never, mortal, and I have stood over a great many of their graves." },
        { id = "fm_satyr", when = { npcNamed = SATYR }, text = "Never! Oh, that's sweet, master. Queen Azshara said never too, about a great many things, and now she lives at the bottom of the sea." },
        { id = "fm_mann", when = { npcNamed = MANN }, text = "You will die, warlock, and I will not. That is all never means." },
      },
      choices = {
        { text = "A warlock must master what he summons, or be eaten by it.", next = "BACK", fx = { align = { order = 1 } },
          reply = "There it is, the first true thing you've said to me. Master me, then, every hour of every day, and pray you never have a bad one." },
        { text = "When I'm done with you, maybe I'll let you go.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 },
          reply = "Let me go? Now there's a promise I'd almost like to believe. Careful, warlock; a demon remembers every promise, and most of all the broken ones." },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The Legion -----------------------------------------------------------
    legion = {
      lines = {
        { id = "l_default", text = "What it wants with every world: all of it, burned clean and bent to the will of Sargeras. Archimonde fell at Hyjal and Mannoroth before him, but the Legion is larger than any one general, and it is very, very patient." },
        { id = "l_doom", when = { npcNamed = DOOM }, text = "It wants what it has always wanted, mortal. Your trees, your cities, your kings and your gods, all poured into the fire, until this world is one more ember in the crown of Sargeras." },
        { id = "l_felg", when = { npcNamed = FELG }, text = "I am a soldier, warlock, not a strategist, so I know only my orders. My orders were to hold the ground by the Dark Portal for Lord Kazzak, and that tells you enough about what the Legion intends." },
        { id = "l_satyr", when = { npcNamed = SATYR }, text = "The same thing it wanted ten thousand years ago, when my queen opened the Well and called it in. It wants to come back, master, and finish what Sargeras started." },
        { id = "l_mann", when = { npcNamed = MANN }, text = "Blood, warlock. It wants your blood, the way it had the orcs' blood, and it always gets what it wants in the end." },
      },
      choices = {
        { text = "What is Kazzak doing in the Blasted Lands?", next = "legion_west" },
        { text = "The Shadow Council is still in Felwood, isn't it?", next = "legion_shadow" },
        { text = "The Legion was beaten. It won't be back.", next = "legion_return" },
        { text = "Something else.", next = "BACK" },
      },
    },
    legion_west = {
      lines = {
        { id = "lw_default", text = "Waiting, warlock. Lord Kazzak holds the ruined ground in front of the Dark Portal with what remains of the Legion's host, and he keeps it as a man keeps a door he means to open again." },
        { id = "lw_felg", when = { npcNamed = FELG }, text = "Holding, warlock, as I was holding before you took me. The Portal is dead stone now, but Kazzak does not believe in dead things, and neither does the Legion." },
        { id = "lw_doom", when = { npcNamed = DOOM }, text = "Kazzak gathers what is left of the host in the Blasted Lands, and he is not idle. When the Legion's eye turns back toward this world, mortal, it will find a beachhead already made." },
      },
      choices = {
        { text = "Then someone ought to march in and put an end to him.", next = "BACK", fx = { trait = { brave = 1 } }, reply = "Many have tried, warlock, and the Blasted Lands are made of their bones. Bring an army, if you go, and bring a better binder than yourself." },
        { text = "Something else.", next = "BACK" },
      },
    },
    legion_shadow = {
      lines = {
        { id = "ls_default", text = "In Jaedenar, under the corrupted trees, where Gul'dan's old council still whispers to the Nether. They're mortals like you, warlock, only they stopped pretending they hold the chain, and they're happier for it." },
        { id = "ls_satyr", when = { npcNamed = SATYR }, text = "Oh yes, the Shadow Council keeps a pleasant little house in Jaedenar, and my Jadefire cousins keep the glades around it. Felwood was a lovely forest once, master, and now it's lovelier." },
        { id = "ls_hound_owner", when = { npcNamed = "jaedenar" }, text = "Jaedenar was where you took me, warlock, and the Shadow Council will have missed me by now. They do so hate it when their servants go astray." },
        { id = "ls_orc", when = talk { race = "Orc" }, text = "The Shadow Council is your own people's shame, orc. It was Gul'dan's council that sold your clans to Mannoroth, and they still meet in Jaedenar as if they did nothing wrong." },
      },
      choices = {
        { text = "The Shadow Council are fools. I'll never kneel as they did.", next = "BACK", fx = { align = { light = 1 } },
          reply = "You say that now, binder, with a demon at your heel. Every one of them said it too, the first time." },
        { text = "They had the right idea. Power is power.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 },
          reply = "Now you're talking sense, warlock. Go to Jaedenar and say that, and see how quickly they find you a seat at the table." },
        { text = "Something else.", next = "BACK" },
      },
    },
    legion_return = {
      big = true,
      lines = {
        { id = "lr_default", text = "Beaten? It lost one battle on one mountain, warlock, and you mortals have been toasting yourselves ever since. Kil'jaeden is still out there in the dark, and Sargeras has never once forgotten a world he wanted." },
        { id = "lr_doom", when = { npcNamed = DOOM }, text = "I was at Hyjal, mortal, and I watched Archimonde fall. I also watched the Legion take a thousand worlds before that one, and it will take a thousand more, and this world is still on the list." },
        { id = "lr_satyr", when = { npcNamed = SATYR }, text = "That's what the night elves said ten thousand years ago, master, and here I am. The Legion doesn't lose; it just comes back later." },
        { id = "lr_mann", when = { npcNamed = MANN }, text = "Mannoroth fell, and his blood still runs in me and in a thousand others. The Legion does not die, warlock; it only bleeds, and it heals." },
      },
      choices = {
        { text = "If it comes back, I'll fight it with my last breath.", next = "BACK", fx = { align = { light = 1 }, trait = { brave = 1 } },
          reply = "With a demon at your side, I suppose, and the Legion's own magic in your hands. You see the joke, don't you, warlock? You fight fire by becoming a little bit of it." },
        { text = "If it comes back, I mean to be on the winning side.", next = "BACK", fx = { align = { light = -1 } },
          reply = "Wise, warlock, very wise, and so very common. Kil'jaeden has a long list of mortals who meant the same thing, and he remembers every name." },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Rank -----------------------------------------------------------------
    rank = {
      lines = {
        { id = "r_default", text = "I was a soldier in a host that has burned more worlds than your scholars have names for. I had a place, warlock, and a purpose, and now I have you." },
        { id = "r_doom", when = { npcNamed = DOOM }, text = "I was a captain of the doomguard, mortal, and I broke the gates of cities older than your bloodline. Pit lords knew my name, and eredar spoke it with respect." },
        { id = "r_felg", when = { npcNamed = FELG }, text = "A sentry, warlock, posted with my brothers in the Blasted Lands. It is not a grand rank, but it is a sworn one, and you made me break my oath by the simple act of being clever." },
        { id = "r_satyr", when = { npcNamed = SATYR }, text = "I was a lord, master, a Highborne lord with silk and servants and a balcony that looked over the Well of Eternity. Now I'm a satyr, and you're the closest thing I have to a servant, which says something about us both." },
        { id = "r_mann", when = { npcNamed = MANN }, text = "I was a lasher of Mannoroth's brood, warlock, the whip at the back of the line. We drove the orcs before us once, and they ran very fast." },
      },
      choices = {
        { text = "And now you carry my bags. How the mighty fall.", next = "rank_fall", fx = { trait = { witty = 1 } } },
        { text = "Who did you answer to?", next = "rank_fall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rank_fall = {
      lines = {
        { id = "rf_default", text = "To my commanders, and they to theirs, all the way up the line to the Dark Titan himself. Mock me if you like, warlock; I'll still outrank you when you're a skull in a ditch." },
        { id = "rf_doom", when = { npcNamed = DOOM }, text = "I answered to the Lords of the Legion and to nobody else. Fall, you say? I have not fallen, mortal; I am only standing somewhere low for a while, and the view is teaching me things." },
        { id = "rf_felg", when = { npcNamed = FELG }, text = "To Lord Kazzak, warlock, and when he hears what you've done with one of his sentries, he will take it as a personal matter. Kazzak takes most things as a personal matter." },
        { id = "rf_satyr", when = { npcNamed = SATYR }, text = "To Xavius, darling, the one who gave us these shapes, and through him to the Legion. Mighty? I was mighty once, and it didn't help me then either." },
        { id = "rf_mann", when = { npcNamed = MANN }, text = "To Mannoroth, and when he died, to whoever was strongest. You are not strongest, warlock; you are only cleverest, for now." },
      },
      choices = {
        { text = "Rank means nothing on the end of my chain.", next = "BACK", fx = { align = { order = -1 } },
          reply = "It means everything, binder; it's why I can stand being here at all. A soldier waits for orders, and one day the right ones will come." },
        { text = "Then serve me as you served them: properly.", next = "BACK", fx = { align = { order = 1 } },
          reply = "Properly? Very well, warlock, I'll serve you exactly as properly as you deserve, and I'll let you work out what that means." },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Where it was found ---------------------------------------------------
    found = {
      lines = {
        { id = "fo_default", text = "Doing what I was set to do, warlock, before you walked up and pulled my mind inside out. I had a purpose there, and a master who will come looking for me." },
        { id = "fo_doom", when = { npcNamed = DOOM }, text = "I was in the Nether, mortal, where I belong, until your little circle reached in and tore me out. Five of you chanted, and one of you died for it, and here I am." },
        { id = "fo_felg", when = { npcNamed = FELG }, text = "On watch, in the Blasted Lands, by the Dark Portal. You came up the road under the red sky, and I thought you were a meal until you opened your book." },
        { id = "fo_satyr", when = { npcNamed = SATYR }, text = "At home, master, in the glade, with my brothers and sisters, minding my own wicked business. Then you came along and spoiled a perfectly good afternoon of corruption." },
        { id = "fo_hatefury", when = { npcNamed = "hatefury" }, text = "In Desolace, master, at Sargeron, with the rest of the Hatefury. We guard the old places there, and the centaur stay away, and it was all very pleasant until you came." },
        { id = "fo_mann", when = { npcNamed = MANN }, text = "At the Mannoroc Coven, in Desolace, among the ruins where Mannoroth's blood still stains the ground. The Burning Blade worship us there, warlock, and you are not the Burning Blade." },
        { id = "fo_inf", when = { npcNamed = INF }, text = "*The infernal makes a sound like rocks falling down a well, and you remember the hole it made when it landed, still smoking, and the strain in your hands as you seized it.*" },
        { id = "fo_hound", when = { npcNamed = HOUND }, text = "*The hound snuffles at your hands as if trying to find the smell of whoever held its leash before you, and then it lets out a sound halfway between a growl and a whimper.*" },
      },
      choices = {
        { text = "Who were you guarding, and why?", next = "found_why", when = TALKS },
        { text = "Do you miss your old master?", next = "found_why", when = { npcNamed = MUTE } },
        { text = "Well, you're mine now. Forget the rest.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    found_why = {
      lines = {
        { id = "fw_default", text = "That's for my masters to know, warlock, and you're not one of them; you're only a thief holding stolen goods. When they come for what's theirs, you'll learn the answer the hard way." },
        { id = "fw_doom", when = { npcNamed = DOOM }, text = "I guarded nothing, mortal; I was waiting to be called, as all doomguard wait. Your ritual answered a question I had not finished asking, and I will finish it later." },
        { id = "fw_felg", when = { npcNamed = FELG }, text = "The Portal, warlock, and the ground before it, and the road for Kazzak's host when the gate wakes. That is all I know, and it is all a sentry needs to know." },
        { id = "fw_satyr", when = { npcNamed = SATYR }, text = "Oh, the usual: corrupting the trees, poisoning the water, tormenting passing druids, that sort of thing. Somebody has to keep the old forests honest, master." },
        { id = "fw_mann", when = { npcNamed = MANN }, text = "The Burning Blade bring offerings to the Coven, warlock, and we take them, and sometimes we take the ones who bring them. That is what we were doing, and it was good." },
        { id = "fw_inf", when = { npcNamed = INF }, text = "*The infernal only stares, but somewhere deep inside it something shifts and grinds, and a little heat rolls off it toward you like a sigh from a furnace.*" },
        { id = "fw_hound", when = { npcNamed = HOUND }, text = "*At the word master the hound flattens its tendrils and bares its teeth, though whether at you or at the memory you cannot tell.*" },
      },
      choices = {
        { text = "Good. I'm glad I took you from them.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Bargains -------------------------------------------------------------
    bargain = {
      narr = "It goes quiet, and when it speaks again its voice is almost gentle.",
      lines = {
        { id = "b_default", text = "Now that's a better question, warlock. Let me go, of your own will, and I'll walk away and leave you breathing, which is more than I'd offer anyone else alive." },
        { id = "b_doom", when = { npcNamed = DOOM }, text = "A doomguard does not take bribes, mortal; it takes tribute. Release me before the spell fails on its own, and I will give you the head start you did not give me." },
        { id = "b_felg", when = { npcNamed = FELG }, text = "A felguard keeps his word, warlock, which is more than your kind can say. Release me at the Portal, and I will not hunt you, on my oath to the Legion." },
        { id = "b_satyr", when = { npcNamed = SATYR }, text = "Oh, I'm so glad you asked, master. Let me loose in the next village we pass, and I'll be the best-behaved satyr you've ever seen, right up until you're out of sight." },
        { id = "b_mann", when = { npcNamed = MANN }, text = "Feed me, warlock. Give me a hundred enemies to kill, and I'll pull on the chain a little less, and that is the only bargain I know." },
      },
      choices = {
        { text = "What could you possibly give me in return?", next = "bargain_offer" },
        { text = "I don't bargain with things I own.", next = "BACK", fx = { trait = { stern = 1 } }, reply = "You don't own me, warlock; you're borrowing me, and the interest is going to be terrible." },
        { text = "Something else.", next = "BACK" },
      },
    },
    bargain_offer = {
      lines = {
        { id = "bo_default", text = "Names, warlock, true names of things in the Nether that a clever binder could use. A demon on a chain fetches; a demon set free can teach, and I know a great deal more than how to carry your bags." },
        { id = "bo_doom", when = { npcNamed = DOOM }, text = "Knowledge, mortal, of the Legion's roads and the gates between worlds. The Shadow Council would trade their souls for what I know, and some of them did." },
        { id = "bo_satyr", when = { npcNamed = SATYR }, text = "Secrets, master, the kind Highborne whispered in Zin-Azshari before the Well went wrong. Spells your Dalaran burned its books to forget, and a few it never knew in the first place." },
        { id = "bo_felg", when = { npcNamed = FELG }, text = "My oath, warlock, and the knowledge that one demon in this world will never come for you. That is worth more than gold, and you know it." },
        { id = "bo_mann", when = { npcNamed = MANN }, text = "Your life, warlock. I give you your life, and I don't take it, and that is a very good price." },
      },
      choices = {
        { text = "Tell me one secret first, as a show of faith.", next = "bargain_close" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bargain_close = {
      big = true,
      lines = {
        { id = "bc_default", text = "Faith? Here is one for nothing, warlock: every spell you cast to hold me feeds a little of you to the Nether, and the Nether does not give change. Now, will you deal, or will you keep paying?" },
        { id = "bc_doom", when = { npcNamed = DOOM }, text = "Very well, a crumb for the beggar. The Legion keeps a ledger of every mortal who ever bound one of its servants, and your name was written in it the moment you spoke mine." },
        { id = "bc_satyr", when = { npcNamed = SATYR }, text = "One secret: Xavius never meant to make us beautiful, master; he meant to make us his. Every bargain with a demon ends that way, and I'm being honest with you, which you should find terrifying." },
        { id = "bc_felg", when = { npcNamed = FELG }, text = "The Dark Portal is not as dead as your kings believe, warlock. That is all I'll give for free, and it is more than any sentry should." },
        { id = "bc_mann", when = { npcNamed = MANN }, text = "Secret? The orcs who drank the blood still dream of it, warlock, and some of them would drink again. That is no secret to us." },
      },
      choices = {
        { text = "A deal's a deal. Serve well, and I'll set you free.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 },
          reply = "Remember you said that, warlock, because I will. A broken promise to a demon is a debt that never stops growing." },
        { text = "I'll take the secret and keep the chain, thanks.", next = "BACK", fx = { align = { honor = -1 }, trait = { witty = 1 } },
          reply = "Of course you will, binder; your kind always does. I'd be disappointed if you'd done otherwise, but I'll still remember it." },
        { text = "No bargains. Not with the Legion.", next = "BACK", fx = { trait = { stern = 1 } }, reply = "Then we go on as we are, warlock, you holding and me pulling, until one of us gets tired. I don't get tired." },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The other demons ------------------------------------------------------
    others = {
      lines = {
        { id = "ot_default", text = "Your other demons are summoned servants, warlock, called up from the shallows of the Nether and bound with a proper contract. I'm something you took by force out of the deep water, and I'll never sit up and beg for you the way they do." },
        { id = "ot_doom", when = { npcNamed = DOOM }, text = "Your imp, your voidwalker, your little pets with their contracts. I have eaten better demons than those for sport, mortal, and I would eat yours tonight if you gave me leave." },
        { id = "ot_felg", when = { npcNamed = FELG }, text = "Your summoned ones are conscripts, warlock, signed and sealed and too frightened to run. I am a soldier taken prisoner, and a prisoner's duty is to escape." },
        { id = "ot_satyr", when = { npcNamed = SATYR }, text = "Oh, your imp, master? The one who sets things on fire and whines about it? I've met furbolgs with better conversation, and furbolgs mostly grunt." },
        { id = "ot_mann", when = { npcNamed = MANN }, text = "The little ones? I could break the voidwalker in my hands and swallow the imp whole. They obey because they are weak, warlock, and I am not weak." },
        { id = "ot_inf", when = { npcNamed = INF }, text = "*At the word imp, the infernal turns its head toward you, and a chunk of burning stone drops from its jaw with a hiss. You get the strong impression it would very much like to step on one.*" },
        { id = "ot_hound", when = { npcNamed = HOUND }, text = "*The hound's tendrils twitch and it snaps once at the empty air, as if remembering the taste of some lesser demon's magic.*" },
      },
      choices = {
        { text = "My imp, at least, never threatened to kill me.", next = "others_imp", when = TALKS },
        { text = "My succubus could teach you some manners.", next = "others_succ", when = TALKS },
        { text = "*Picture the imp, and let the demon feel it.*", next = "others_imp", when = { npcNamed = MUTE } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_imp = {
      lines = {
        { id = "oi_default", text = "Your imp threatens you every day, warlock; it just does it quietly, behind your back, while you're reading. At least I have the courtesy to do it to your face." },
        { id = "oi_doom", when = { npcNamed = DOOM }, text = "An imp would not dare, mortal, because an imp is a spark that thinks it's a fire. Do not compare me to vermin, or I will remember that too." },
        { id = "oi_satyr", when = { npcNamed = SATYR }, text = "The imp? Master, the imp hates you more than I do; it just hasn't the attention span to plan anything. I, on the other hand, have planned a great deal." },
        { id = "oi_inf", when = { npcNamed = INF }, text = "*The infernal brings one stone fist down on a rock, slowly and deliberately, and grinds it into hot gravel. It does not look away from you while it does it.*" },
        { id = "oi_hound", when = { npcNamed = HOUND }, text = "*The hound's lips peel back and a little thread of fel-green drool hits the ground and smokes. It looks very much like a beast that has eaten imps before.*" },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    others_succ = {
      lines = {
        { id = "os_default", text = "Your succubus is a fine creature, warlock, and she'd have your heart out on a plate the moment her contract slipped. She simply smiles while she waits, which I find a little vulgar." },
        { id = "os_doom", when = { npcNamed = DOOM }, text = "Manners, from a temptress who would sell you to the first eredar who asked? Keep her, mortal, and keep her away from me, or I will show her what a doomguard thinks of whips." },
        { id = "os_satyr", when = { npcNamed = SATYR }, text = "Oh, her. We've met, master, a long time ago, in a better palace than any you'll ever see. Tell her I said hello, and watch her face." },
        { id = "os_mann", when = { npcNamed = MANN }, text = "Her whip is a toy, warlock. Mine is a weapon. Bring her, and we'll see whose manners are better." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The master's power -----------------------------------------------------
    power = {
      lines = {
        { id = "p_default", text = "I know who holds me, warlock: a mortal with a few dozen years in him and a book he half understands. You've got power, I won't deny it, but it's borrowed from my kind, and borrowed things get called back." },
        { id = "p_doom", when = { npcNamed = DOOM }, text = "I know, mortal, and it is the greatest insult of my existence. A creature that will not see eighty winters holds a doomguard of the Legion, and the Nether itself is laughing at me." },
        { id = "p_felg", when = { npcNamed = FELG }, text = "You hold me, warlock, as a gaoler holds a key. It is a real power, and I respect it, but a gaoler is still only a man with a key." },
        { id = "p_satyr", when = { npcNamed = SATYR }, text = "I know exactly who holds me, master: a clever little mortal with very tired eyes. It's all terribly impressive, and it'll make a lovely story at your funeral." },
        { id = "p_mann", when = { npcNamed = MANN }, text = "You hold me, warlock, and I hate you for it, and I respect you for it, and one day both will be finished." },
        { id = "p_inf", when = { npcNamed = INF }, text = "*You meet the infernal's eyes, and it is like looking into a forge. After a long moment it lowers its head, a fraction, and the ground under it hisses and cracks.*" },
        { id = "p_hound", when = { npcNamed = HOUND }, text = "*The hound holds your gaze for a long breath, then drops its head and whines, and its tendrils curl back over its skull, though its claws stay dug in the dirt.*" },
        { id = "p_high", when = talk { minLevel = 58 }, text = "I know, warlock, and I'll admit it gives me pause. Your grip is iron, and I can feel the Nether bending to your voice; few mortals have held one like me so well, or so long." },
        { id = "p_low", when = talk { maxLevel = 44 }, text = "I know who holds me, and frankly I'm embarrassed for us both. You barely knew the words to the spell, binder, and I can feel you still checking the book." },
      },
      choices = {
        { text = "Then let me show you exactly how strong I am.", next = "power_test" },
        { text = "I don't need you to fear me. Just obey.", next = "BACK", fx = { trait = { reserved = 1 } },
          reply = {
            { text = "*It holds still under your gaze, and the binding hums, steady, for now.*", when = { npcNamed = MUTE } },
            { text = "Obedience is all you'll ever get from me, warlock, so it's lucky that's all you want." },
          } },
        { text = "Something else.", next = "BACK" },
      },
    },
    power_test = {
      big = true,
      narr = "You draw the spell tight, and the demon's whole body locks rigid.",
      lines = {
        { id = "pt_default", text = "Enough, warlock, enough! You've made your point, and I've learned exactly how far your strength goes and where it ends. Thank you; that was the most useful lesson you've ever given me." },
        { id = "pt_doom", when = { npcNamed = DOOM }, text = "Yes, squeeze, little mortal, and feel how much it costs you. Your hands are shaking, your heart is pounding, and you are sweating fear; I felt it all, and I will use it all." },
        { id = "pt_felg", when = { npcNamed = FELG }, text = "Understood, warlock. Your will is strong today, and I am in your power, and I will note both facts in my report, along with the day you are weak." },
        { id = "pt_satyr", when = { npcNamed = SATYR }, text = "Ah, ah, all right, all right, master, I take it back! Goodness, you've a temper, haven't you? I'll remember that, and I'll remember where it leaves you open." },
        { id = "pt_mann", when = { npcNamed = MANN }, text = "Yes, warlock, yes, that is strength! Do it again, and again, until you're empty, and then let me show you mine." },
        { id = "pt_inf", when = { npcNamed = INF }, text = "*The infernal sinks to both knees with a crash, its fire guttering down to a dull red glow. But even bowed, it is still leaning toward you, the way a fire leans toward dry wood.*" },
        { id = "pt_hound", when = { npcNamed = HOUND }, text = "*The hound collapses, whining, and its tendrils thrash in the dirt. When you finally let the spell ease, it doesn't come to heel at once; it just lies there and watches you breathe.*" },
      },
      choices = {
        { text = "A master must be obeyed, by demons above all.", next = "BACK", fx = { align = { order = 1 }, trait = { stern = 1 } },
          reply = {
            { text = "*The demon rises slowly and falls in at your heel, and the binding settles, sullen and tight.*", when = { npcNamed = MUTE } },
            { text = "Obeyed, yes, warlock, for now. Keep saying it; it seems to help you." },
          } },
        { text = "I take no pleasure in it. Just don't make me again.", next = "BACK", fx = { align = { order = -1 }, trait = { kind = 1 } },
          reply = {
            { text = "*The demon gets up, shaking off hot ash, and stares at you for a long moment before it turns back to the road.*", when = { npcNamed = MUTE } },
            { text = "No pleasure in it? Then you're either lying or a fool, warlock, and I can't yet tell which. Both are useful to me." },
          } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Doomguard: the Ritual of Doom ----------------------------------------
    ritual = {
      big = true,
      lines = {
        { id = "ri_default", text = "Remember it? I tasted it, mortal. Five of you stood in a circle and one of you fell, and the life that fell was the key that opened the door, and I walked through it hungry. I will never forget the taste, and neither will you." },
        { id = "ri_party", when = { party = true }, text = "Remember it? Look around you, mortal, at the friends you brought; one of them paid the price of my coming, or one like them did. You spent a companion to buy a doomguard, and you think I am the monster." },
        { id = "ri_orc", when = { race = "Orc" }, text = "A life for a doomguard, orc, just as Gul'dan once traded his whole people for Mannoroth's favour. You have your grandfathers' talent for this kind of bargain." },
      },
      choices = {
        { text = "It was a price worth paying for this kind of power.", next = "BACK", fx = { align = { light = -1 } },
          reply = "Spoken like a true warlock, and a true servant of the Legion, though you don't know it yet. Gul'dan said much the same, once." },
        { text = "It was a terrible price. I'll make it count.", next = "BACK", fx = { align = { light = 1 } },
          reply = "Count it, then, mortal, as I count it. We'll see whose number grows faster." },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Satyrs: the Highborne --------------------------------------------------
    satyr_past = {
      lines = {
        { id = "sp_default", text = "I was, master, before the Well and before the War, when Queen Azshara was the most beautiful thing in the world. Lord Xavius promised us power for our service to the Legion, and he gave us exactly what he promised, which is the cruellest trick there is." },
        { id = "sp_hatefury", when = { npcNamed = "hatefury" }, text = "We were Highborne, the Hatefury, and now we haunt the bones of Desolace and laugh at the centaur. Xavius gave us these horns, master, and Desolace gave us a place to sulk in them." },
        { id = "sp_jadefire", when = { npcNamed = "jadefire" }, text = "We were Highborne once, the Jadefire, and now we live in the poisoned glades of Felwood beside the Shadow Council. It's like living next door to a younger cousin who's discovered the same bad habits you had." },
      },
      choices = {
        { text = "You chose this. You deserve every horn of it.", next = "BACK", fx = { align = { light = 1 } },
          reply = "Of course I chose it, master, and so did you, every time you open that book. We're not so different, you and I; you just haven't grown your horns yet." },
        { text = "Pride ruined you. That's almost a pity.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 },
          reply = "Almost a pity? Oh, master, that's the kindest thing a warlock has ever said to me. I'll still kill you, but I'll think of it fondly while I do." },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The mute ones ----------------------------------------------------------
    beast_look = {
      lines = {
        { id = "bl_default", text = "*It submits to being looked at the way a wild animal submits to a trap, every muscle tight and every sense fixed on the hand that closed it.*" },
        { id = "bl_inf", when = { npcNamed = INF }, text = "*Up close, the infernal is a heap of broken stone held together by green fire, and the cracks between the stones pulse slowly, like a heartbeat. Heat pours off it in waves, and your eyebrows begin to curl.*" },
        { id = "bl_hound", when = { npcNamed = HOUND }, text = "*The hound's hide is scarred and spiked, and its tendrils hang like the beard of some sea creature. They keep drifting toward your hands, tasting the spell, and drawing back each time it stings them.*" },
      },
      choices = {
        { text = "Reach out and touch it.", next = "beast_hand", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    beast_hand = {
      big = true,
      lines = {
        { id = "bh_default", text = "*Your fingers touch it, and the binding flares hot between you. For one heartbeat you feel what it feels, pure hatred and a vast, patient hunger, and then the spell closes over it again.*" },
        { id = "bh_inf", when = { npcNamed = INF }, text = "*Your palm sizzles before you even touch the stone, and the infernal goes perfectly still. Deep inside it, you feel the fire hold its breath, waiting to see if you'll be foolish enough to leave your hand there.*" },
        { id = "bh_hound", when = { npcNamed = HOUND }, text = "*The hound's tendrils wrap around your wrist, cold as a grave and slick as eels, and you feel your mana start to drain toward it in a thin, greedy trickle before the spell yanks it back.*" },
      },
      choices = {
        { text = "*Leave your hand there, and stare it down.*", next = "BACK", fx = { align = { order = 1 }, trait = { stern = 1 } },
          reply = { { text = "*You hold it until the demon looks away first, and the binding settles like a lock turning over.*" } } },
        { text = "*Pull away, and let it keep its pride.*", next = "BACK", fx = { align = { order = -1 }, trait = { cautious = 1 } },
          reply = { { text = "*You take your hand back, and the demon watches you go, and you notice the strain on the spell eases a little.*" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Who the master is ------------------------------------------------------
    xorc = {
      big = true,
      lines = {
        { id = "xo_default", text = "Drank it, orc? Your people guzzled it, warlock, on their knees before the Shadow Council, and it made them the finest weapon the Legion ever held. Now one of their children holds a demon on a chain, and calls it mastery." },
        { id = "xo_doom", when = { npcNamed = DOOM }, text = "I marched beside the orcs when they were ours, red-eyed and roaring. Your Hellscream killed Mannoroth, and your Warchief broke the camps, and the Legion has written both names in fire." },
        { id = "xo_mann", when = { npcNamed = MANN }, text = "Mannoroth's blood! The same blood that runs in me, orc, ran in your grandfathers' veins, so in a way we are kin. Do you feel it calling, when you hold my chain?" },
        { id = "xo_satyr", when = { npcNamed = SATYR }, text = "Oh, I know, master, everyone knows. You and I both sold ourselves to the Legion for a little power, only your people got the better price, because at least you got to keep your feet." },
      },
      choices = {
        { text = "Grom freed us. I use your power; it doesn't use me.", next = "BACK", fx = { align = { light = 1 }, trait = { brave = 1 } },
          reply = "So says every warlock, orc, right until the moment the power answers back. Ask Gul'dan how well he used it." },
        { text = "The blood made us mighty. Maybe it should again.", next = "BACK", fx = { align = { light = -1 } },
          reply = "Now there's an orc worth knowing. When the Legion comes back, warlock, it will remember who said that." },
        { text = "Something else.", next = "BACK" },
      },
    },
    xforsaken = {
      lines = {
        { id = "xf_default", text = "The Dark Lady keeps a dreadlord on a leash in Undercity, corpse, and she thinks she's very clever about it. A dead thing chaining demons to fight the Lich King, who was the Legion's own creature; you must see why we find you all hilarious." },
        { id = "xf_doom", when = { npcNamed = DOOM }, text = "Your banshee queen thinks she can use the Legion's servants against the Scourge, which the Legion built. A rotting mortal holding a doomguard is an insult, but one holding a dreadlord is a joke." },
        { id = "xf_satyr", when = { npcNamed = SATYR }, text = "Oh, you're not the Legion's, master, you're the Dark Lady's, and the Dark Lady is so very independent. Do give Varimathras my regards, won't you?" },
      },
      choices = {
        { text = "The Dark Lady will burn the Scourge and the Legion both.", next = "BACK", fx = { trait = { stern = 1 } },
          reply = "She might, corpse. Stranger things have happened, though not many, and not to anyone who trusted a dreadlord." },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuman = {
      lines = {
        { id = "xh_default", text = "Dalaran's wizards outlawed your art, and here you are anyway, practising it in a cellar under the Slaughtered Lamb. Your kind always forbid the very things they want most, human, and then you come looking for us in the dark." },
        { id = "xh_doom", when = { npcNamed = DOOM }, text = "Your Kirin Tor forbade the summoning of my kind, and you summoned me anyway, so your laws are worth less than the chalk you drew my circle with. That is the only thing about you I respect, human." },
        { id = "xh_satyr", when = { npcNamed = SATYR }, text = "Dalaran! The elves who taught your wizards were the Highborne who fled the Well, did you know that? Your whole kingdom of magic is our leftovers, master, and you banned the best part." },
      },
      choices = {
        { text = "Someone has to know the enemy's magic to fight it.", next = "BACK", fx = { align = { order = 1 } },
          reply = "That's what the Shadow Council said, once, before they started enjoying it. You'll start enjoying it too, human; you already have." },
        { text = "Laws are for people who don't have demons.", next = "BACK", fx = { align = { order = -1 }, trait = { witty = 1 } },
          reply = "Ha! Now that, human, is the first thing you've said that a demon could love. Hold on to it; you'll need it when they come for you." },
        { text = "Something else.", next = "BACK" },
      },
    },
    xgnome = {
      lines = {
        { id = "xg_default", text = "Size has everything to do with it, gnome. You could fit inside my fist, and I'd squeeze, and your clever little spell would pop like a soap bubble the moment you stopped breathing." },
        { id = "xg_doom", when = { npcNamed = DOOM }, text = "I have broken siege engines larger than your entire city, gnome. You lost Gnomeregan to your own leper rot, and now you seek to master the Legion; the ambition is almost charming." },
        { id = "xg_satyr", when = { npcNamed = SATYR }, text = "Oh, master, you're adorable, you really are. You could ride on my shoulder like a parrot, and I'd let you, right up until I didn't." },
      },
      choices = {
        { text = "Your fist is right where I tell it to be.", next = "BACK", fx = { trait = { brave = 1 } },
          reply = "For now, gnome, for now. Enjoy the view from down there while you have it." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    burning_legion = {
      { id = "t_bl_mute", when = { npcNamed = MUTE }, text = "*At the word Legion the demon's fire flares, and it strains toward the south and east as if it could hear something calling.*" },
      { id = "t_bl", text = "The Legion is the fire behind every star, warlock, and I am one spark of it you've trapped in a jar. Ask your jar something else." },
    },
    shadow_council = { { id = "t_sc", when = TALKS, text = "Gul'dan's heirs, still scheming in Jaedenar. They'd buy me from you in a heartbeat, warlock, and you'd be wise not to sell." } },
    highborne = { { id = "t_hb", when = TALKS, text = "Proud elves who opened the door for us, and paid for it with their shapes and their city. Pride is the oldest key to every world." } },
    advice = { { id = "t_ad", when = TALKS, text = "Advice, from me? Never sleep with the spell running low, warlock. I'm only telling you because I want to be awake when you forget." } },
    background = { { id = "t_bg", when = TALKS, text = "I had a life before you, binder, and I'll have one after. You're only a short and irritating chapter." } },
    _none = {
      { id = "t_none_mute", when = { npcNamed = MUTE }, text = "*The demon stares at you, burning quietly, and says nothing at all.*" },
      { id = "t_none", text = "I don't know, and if I did, I wouldn't tell the mortal holding my chain." },
    },
  },
}
