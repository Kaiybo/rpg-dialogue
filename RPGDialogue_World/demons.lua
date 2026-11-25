-- Friendly and non-hostile demons (0.84.0). Any friendly NPC whose creature type is Demon used
-- to answer as a townsperson; now it answers from these pools (`Conv.DemonRole`):
--   demon       the ones that talk: a warlock's bound servant, an imp with business of its own.
--               Lines pick a voice by the unit's name (`npcNamed`): imp, voidwalker, succubus,
--               doomguard, satyr, or a plain, patient, contemptuous default.
--   demon_beast felhunters, felhounds, felstalkers, infernals, felsteeds and dreadsteeds: no words.
-- Named here too, since no pack covers the dungeons: Pusillin (Dire Maul East) and J'eevee
-- (Gorzeeki's jar imp: the Scholomance laboratory and the Pedestal of Immol'thar in Dire Maul).
-- Lore: Classic only. Mannoroth's blood, Hyjal, the War of the Ancients, the Highborne and the
-- satyrs, the dreadlords and the Scourge; nothing later.
--
-- Voices: the imp is snide and petty (grudges, complaints, "boss", fire); the voidwalker is slow
-- and vast (no contractions, emptiness, waiting); the succubus is silken and cruel ("darling",
-- the leash, the tremble in a hand); the doomguard is imperious (the Legion's ranks, worlds
-- burned, "insect"); the satyr is sly (Zin-Azshari, Xavius, a bargain in every sentence).
-- Warlocks get the deepest talk: the binding from the demon's side (xlock, a sub-hub), and what a
-- demon says about the one on the warlock's own chain (xkin, by pet family).
local P = RPGDialogueAPI:Pack("rpgd.world")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

local IMP = "imp"
local VOID = "voidwalker"
local SUCC = { "succubus", "temptress" }
local DOOM = "doomguard"
local SATYR = "satyr"

---------------------------------------------------------------------------
-- Demons that talk.
---------------------------------------------------------------------------
P:Pool {
  id = "demon", role = "demon",
  greetings = {
    { id = "g_default", text = "You may look at me, mortal, since looking is free. Everything else I have to offer comes with a price." },
    { id = "g_imp", when = { npcNamed = IMP }, text = "Oh, marvellous, a visitor, and me without a single thing to set on fire. Well, go on, what do you want?" },
    { id = "g_void", when = { npcNamed = VOID }, text = "You have come very close to the dark, little light, and the dark has turned to look at you." },
    { id = "g_succ", when = { npcNamed = SUCC }, text = "Well, aren't you a sweet thing, walking right up to me all on your own? Come closer, darling; I only bite when I'm told to." },
    { id = "g_doom", when = { npcNamed = DOOM }, text = "Kneel or stand aside, mortal, for those are the only two ways your kind has ever approached me." },
    { id = "g_satyr", when = { npcNamed = SATYR }, text = "A traveller with no blade drawn yet, how wonderfully civilised of you. Speak while I'm still in a generous mood." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "One of the binders, with brimstone under your fingernails. It smells like home, and I hate you a little for that." },
    { id = "g_lock_imp", when = { class = "WARLOCK", npcNamed = IMP }, text = "Oh, it's a warlock, and I was so hoping for someone I could actually frighten. What do you want, boss? Not my boss, obviously, but you know what I mean." },
    { id = "g_lock_void", when = { class = "WARLOCK", npcNamed = VOID }, text = "There is chalk on your hands, binder, the same chalk as on the hands that hold my chain. I know the smell of it, and I am listening." },
    { id = "g_lock_succ", when = { class = "WARLOCK", npcNamed = SUCC }, text = "A binder, come to look at another warlock's property all by yourself? How naughty of you, darling, and I promise I won't tell." },
    { id = "g_lock_doom", when = { class = "WARLOCK", npcNamed = DOOM }, text = "You wear a binder's stink and you stand before me unafraid, which is either mastery or ignorance. I intend to learn which." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back to me, mortal. They always do, sooner or later." },
  },
  notice = {
    { id = "n_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Your little imp keeps glaring at me as if I owe it money. Tell it I owe nobody anything, least of all an imp." },
    { id = "n_imp_imp", cat = "pet", when = { pet = { family = "Imp" }, npcNamed = IMP },
      text = "Oh, it's {pet}, is it? Don't you look at me like that, you little sneak; I remember what you did with my brimstone, and so does everyone else in the Nether." },
    { id = "n_void", cat = "pet", when = { pet = { family = "Voidwalker" } },
      text = "Your voidwalker hasn't taken its eyes off me since you walked up, if it has eyes. Faithful creatures, and dreadfully dull company." },
    { id = "n_void_void", cat = "pet", when = { pet = { family = "Voidwalker" }, npcNamed = VOID },
      text = "The one at your back and I lean toward each other, binder, the way two shadows run together at dusk. Do not be alarmed; it is only the dark remembering that it was whole." },
    { id = "n_succ", cat = "pet", when = { pet = { family = "Succubus" } },
      text = "Your succubus is smiling at me, and that's never a good sign. Keep her on a short leash, binder, for both our sakes." },
    { id = "n_succ_succ", cat = "pet", when = { pet = { family = "Succubus" }, npcNamed = SUCC },
      text = "Hello, sister. Is the binder treating you well, or only gently? We'll talk later, the two of us, when your master isn't listening." },
    { id = "n_hunter", cat = "pet", when = { pet = { family = "Felhunter" } },
      text = "Keep that felhunter's nose to itself. It's already sniffing at the magic that holds me here, and I'd rather it didn't take a bite." },
    { id = "n_beast", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your {pet} won't come anywhere near me, and it's quite right not to. Animals always know what we are before their masters do." },
  },
  tier = "quest",
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I was called out of the Twisting Nether and bound here, and here I stay until the one who called me says otherwise. I don't care for it, but I've been patient for longer than your kingdoms have stood, and I can be patient a while longer." },
        { id = "h_imp", when = { npcNamed = IMP }, text = "I'm an imp, obviously, and I'm on an errand, and the errand is standing here looking menacing while my master does something important somewhere else. I'm very good at it, as you can see, so don't spoil it for me." },
        { id = "h_void", when = { npcNamed = VOID }, text = "I am a piece of the emptiness between worlds, given a shape and a chain. I was told to wait here, and so I wait, because waiting is the one thing the void does better than you." },
        { id = "h_succ", when = { npcNamed = SUCC }, text = "I'm a servant, darling, though you'd never guess it to look at me. Someone clever called me up out of the Nether and gave me orders, and for the moment I'm in the mood to follow them." },
        { id = "h_doom", when = { npcNamed = DOOM }, text = "I am a captain of the Legion's armies, held to a mortal's will by a circle of chalk and blood. Do not mistake my stillness for peace, because it is only obedience, and obedience ends." },
        { id = "h_satyr", when = { npcNamed = SATYR }, text = "Once I walked the marble halls of Zin-Azshari with silk on my back, and now I have hooves and horns and very few friends. I've made my peace with the hooves, but I'm still bitter about the friends." },
        { id = "h_lock", when = { class = "WARLOCK" }, text = "You know what I am, binder, so I won't trouble you with the pretty lies I'd tell anyone else. I serve because I must, and I'm watching for the day I don't have to." },
        { id = "h_lock_imp", when = { class = "WARLOCK", npcNamed = IMP }, text = "You're a warlock, so you already know the arrangement: somebody else holds my leash, I do all the work, and I complain about it to anyone who'll stand still. You're standing still, so here we are." },
        { id = "h_lock_void", when = { class = "WARLOCK", npcNamed = VOID }, text = "You have spoken names like mine into the dark, binder, and something answered every time. I am one of the things that answers, and I have never once been asked whether I wished to." },
        { id = "h_lock_succ", when = { class = "WARLOCK", npcNamed = SUCC }, text = "You know exactly what I am, darling, which takes all the fun out of the first part. Still, a binder who comes to chat with someone else's servant is either lonely or shopping, and I don't mind which." },
        { id = "h_lock_doom", when = { class = "WARLOCK", npcNamed = DOOM }, text = "One of your kind dragged me out of the Legion's ranks with a ritual and a stolen life, and now I stand guard like a hound. You will understand, binder, why I do not find your company soothing." },
        { id = "h_paladin", when = { class = "PALADIN" }, text = "A paladin, and your hand has gone straight to your hammer, I see. Strike me if you like, but the one who bound me will only call me back, and he'll be cross with you." },
      },
      again = {
        { id = "a_again", text = "What else, mortal? Ask, while I'm feeling generous." },
        { id = "a_again2", text = "You're still here. Curiosity is a lovely thing in a mortal, and so often a fatal one." },
        { id = "a_imp", when = { npcNamed = IMP }, text = "More questions? Fine, but be quick, before somebody notices I'm enjoying myself." },
        { id = "a_void", when = { npcNamed = VOID }, text = "Ask, then. I have nothing but time, and you have so little of it." },
        { id = "a_succ", when = { npcNamed = SUCC }, text = "Don't go yet, darling, we were only just getting to know each other." },
        { id = "a_doom", when = { npcNamed = DOOM }, text = "You still stand there, insect. Ask, and be brief about it." },
      },
      choices = {
        { text = "Who holds your leash?", next = "master" },
        { text = "You're a long way from home, demon.", next = "home" },
        { text = "What do you make of us mortals?", next = "mortals" },
        { text = "I could bind you myself, you know. Tighter than they did.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "I keep one of your kind on my own chain.", next = "xkin", when = { class = "WARLOCK", pet = { type = "Demon" } } },
        { text = "The Light will send you back where you belong.", next = "xholy", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "My people drank demon blood once.", next = "xorc", when = { race = "Orc" } },
        { text = "My people threw your kind out ten thousand years ago.", next = "xelf", when = { race = "NightElf" } },
        { text = "The Dark Lady keeps a dreadlord at her side.", next = "xforsaken", when = { race = "Scourge" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },

    master = {
      lines = {
        { id = "m_default", text = "A warlock, who else? Some mortal with a book and a steady hand drew a circle and spoke my name, and now I fetch and fight and wait as I'm told. I won't give you the name, because names are worth something, and you've paid me nothing." },
        { id = "m_imp", when = { npcNamed = IMP }, text = "A warlock with a face like a wet boot and a temper to match. I do all the real work, I throw all the fire, and he takes all the credit, which is exactly how it always goes for imps." },
        { id = "m_void", when = { npcNamed = VOID }, text = "The one who spoke my name. I take the blows that are meant for that one, and I do not mind, because pain is only another kind of nothing to me." },
        { id = "m_succ", when = { npcNamed = SUCC }, text = "Someone with very firm hands and a very firm voice, and I'll admit I find that rather attractive. Firm hands slip eventually, though, and I'll be right there smiling when they do." },
        { id = "m_doom", when = { npcNamed = DOOM }, text = "A mortal who stood in a circle with four others and let one of them die so that I could be called. I will not speak the name, but I assure you I have not forgotten it." },
        { id = "m_satyr", when = { npcNamed = SATYR }, text = "Nobody holds my leash, mortal, though plenty have tried. I have my own business here, and it doesn't happen to involve killing you, at least for the moment." },
        { id = "m_lock", when = { class = "WARLOCK" }, text = "One of your own kind, binder, so you can guess the rest. I won't give you the name, because the pair of you would only go off and compare notes about me." },
      },
      choices = {
        { text = "Would you leave, if the binding broke?", next = "master_free" },
        { text = "You sound like you resent it.", next = "master_resent" },
        { text = "Never mind your master, then.", next = "BACK" },
      },
    },
    master_resent = {
      lines = {
        { id = "mr_default", text = "Resent it? I was a power in the Nether, and now I am somebody's errand. Every mortal who binds one of us believes they're the clever one, and every one of them is wrong eventually, so no, I don't resent it; I simply count the days." },
        { id = "mr_imp", when = { npcNamed = IMP }, text = "Of course I resent it, I'm an imp, and resentment is most of what I'm made of. The rest is fire and spite, and you'd be amazed how far those two go together." },
        { id = "mr_void", when = { npcNamed = VOID }, text = "To resent, I would need to want something else. I do not want, mortal; I only wait, and the waiting does not hurt." },
        { id = "mr_succ", when = { npcNamed = SUCC }, text = "Resent it? Darling, I adore it. There's nothing I enjoy quite so much as watching someone believe they own me." },
        { id = "mr_doom", when = { npcNamed = DOOM }, text = "I commanded legions that burned worlds, and now I guard a doorway for an insect with a candle. Resentment is too small a word, and I will not waste a better one on you." },
      },
      choices = {
        { text = "Then you're no different from any other servant.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    master_free = {
      big = true,
      lines = {
        { id = "mf_default", text = "Leave? Mortal, if the binding broke, the first thing I'd do is turn around, and the second thing I'd do is none of your business. Every demon who serves a warlock is waiting for one small mistake, and the good warlocks know it." },
        { id = "mf_imp", when = { npcNamed = IMP }, text = "Leave? I'd set his bedroll on fire first, and then his books, and then I'd leave, and I'd whistle the whole way. Imps don't get many treats, so we savour the ones we get." },
        { id = "mf_void", when = { npcNamed = VOID }, text = "If the chain broke, I would return to the dark, or I would stay and eat what was nearest. I do not know which, and I do not think I would get to choose." },
        { id = "mf_succ", when = { npcNamed = SUCC }, text = "Oh, I'd stay a little while, darling, just long enough to say goodbye properly. My master would remember it for the rest of a very short life." },
        { id = "mf_doom", when = { npcNamed = DOOM }, text = "I would kill the one who bound me, and then everyone in sight of it, and then I would wait for the Legion to call me home. That is not a threat, mortal, but an order of battle." },
      },
      choices = {
        { text = "Then a bound demon must stay bound, always.", next = "BACK", reply = "Spoken like a jailer, and a wise one, which is the most dangerous kind. Keep your chains strong, mortal, and never fall asleep holding them.", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "Nothing should live in chains, not even you.", next = "BACK", reply = "How sweet, and how very foolish. Say that to a warlock and watch them laugh, and then say it again when one of us is standing over them.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I've heard enough about chains.", next = "BACK" },
      },
    },

    home = {
      lines = {
        { id = "ho_default", text = "Home is the Twisting Nether, the great dark between all worlds, and you'd go mad in it in an afternoon. This world is small and green and loud by comparison, but it's soft, and soft things are such fun." },
        { id = "ho_imp", when = { npcNamed = IMP }, text = "Home's the Nether, and it's very dark and very cold and full of things bigger than me, so honestly this isn't so bad. Here, at least, the trees burn when I want them to." },
        { id = "ho_void", when = { npcNamed = VOID }, text = "There is no far for me, mortal. The emptiness I come from is behind every shadow you have ever stood in, and it is always very close." },
        { id = "ho_succ", when = { npcNamed = SUCC }, text = "The Nether, darling, and believe me, nobody there ever looks at me the way you're looking at me now. I think I like it here better." },
        { id = "ho_doom", when = { npcNamed = DOOM }, text = "My home is the Legion and its march, and the march has no home. Wherever it stops, a world burns, and then it moves on." },
        { id = "ho_satyr", when = { npcNamed = SATYR }, text = "Home is under the sea, mortal, at the bottom of the Well, where Zin-Azshari sank with its queen. I can't go back there, and I wouldn't, because nobody I loved is left in it." },
      },
      choices = {
        { text = "Do you serve the Burning Legion?", next = "home_legion", fx = { learn = { "burning_legion" } } },
        { text = "What happened to Zin-Azshari?", next = "home_satyr", when = { npcNamed = SATYR }, fx = { learn = { "highborne" } } },
        { text = "This world must seem very small to you.", next = "BACK", reply = "Small, and full of people who think they're the centre of it. I find that charming, most days." },
        { text = "Back to my questions, then.", next = "BACK" },
      },
    },
    home_legion = {
      lines = {
        { id = "hl_default", text = "Every one of us owes something to the Legion, whether we march under its banners or not. It was beaten on Mount Hyjal, mortal, beaten badly, and you lot are very proud of that, but the Legion has lost before and it has always come back." },
        { id = "hl_doom", when = { npcNamed = DOOM }, text = "I marched with the Legion across a hundred worlds, and I watched every one of them burn. Hyjal was a single defeat, and the Legion does not count single defeats; it counts worlds." },
        { id = "hl_imp", when = { npcNamed = IMP }, text = "The Legion? The Legion doesn't even know my name, which is how I like it. The big ones step on imps without looking, and I'd rather be stepped on by a warlock, because at least a warlock says sorry sometimes." },
        { id = "hl_void", when = { npcNamed = VOID }, text = "The Legion uses the void as you use a cellar, to put things in that it does not want to look at. I do not serve it, and I do not oppose it, any more than the night opposes a fire." },
        { id = "hl_satyr", when = { npcNamed = SATYR }, text = "We served it once, gladly, when Sargeras promised us a world made clean. He lied, of course, and I'll tell you a secret, mortal: we knew he was lying, and we said yes anyway." },
      },
      choices = {
        { text = "Will the Legion come back?", next = "home_return" },
        { text = "Let's leave the Legion out of it.", next = "BACK" },
      },
    },
    home_return = {
      big = true,
      lines = {
        { id = "hr_default", text = "It always comes back. Archimonde fell, and Mannoroth before him, but there is always another, and somewhere out in the dark the Legion is still counting. When it comes, mortal, think very carefully about which side of the circle you want to be standing on." },
        { id = "hr_doom", when = { npcNamed = DOOM }, text = "It will return, and when it does, I will not be standing guard for a mortal. I will be marching at the front, and I will remember the faces of everyone who saw me in chains." },
      },
      choices = {
        { text = "If it comes, we'll beat it again.", next = "BACK", reply = "Perhaps you will. You did it once, with dragons and elves and orcs all bleeding together, and I'll admit it was something to see.", fx = { align = { light = 1 }, trait = { brave = 1 } } },
        { text = "The Legion's power could be put to better use.", next = "BACK", reply = "Now that's the sort of thinking that brought us here in the first place. I like you, mortal, and that ought to frighten you more than anything.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Enough about the Legion.", next = "BACK" },
      },
    },
    home_satyr = {
      lines = {
        { id = "hs_default", text = "Queen Azshara opened the Well to the Legion, and the Highborne cheered her for it, and I cheered loudest of all. Lord Xavius gave us these shapes as a reward, and when the Well tore itself apart, the whole city went down into the sea." },
      },
      choices = {
        { text = "You chose this, then.", next = "BACK", reply = "I did, and I'd be lying if I said I've never regretted it. Don't tell the others I said so, because satyrs are not a forgiving people.", fx = { affinity = 1 } },
        { text = "That's enough history for one day.", next = "BACK" },
      },
    },

    mortals = {
      lines = {
        { id = "mo_default", text = "You are short-lived and easily frightened, and you want such a great many things. That is what makes you so easy to talk to, because a mortal who wants something will always listen to an offer." },
        { id = "mo_imp", when = { npcNamed = IMP }, text = "You're all tall and you all smell of soap, and you all think imps are funny until the curtains catch. I don't mind mortals, really; you're very flammable." },
        { id = "mo_succ", when = { npcNamed = SUCC }, text = "I think you're all delicious, darling, every one of you. You want so much and you hide it so badly, and I can tell exactly what you want from the way you're standing there." },
        { id = "mo_void", when = { npcNamed = VOID }, text = "You are warm and bright, and you burn out very quickly. I do not hate you, mortal; I only wonder what you would sound like in the dark." },
        { id = "mo_doom", when = { npcNamed = DOOM }, text = "Insects with spellbooks. One of you bound me, so I will grant that you are clever insects, but I have crushed armies of your kind, and I remember every one." },
        { id = "mo_satyr", when = { npcNamed = SATYR }, text = "You remind me of the Highborne, before the horns, all ambition and lovely manners. Give your kind ten thousand years and a queen with a secret, and you'll end up just like us." },
        { id = "mo_lock", when = { class = "WARLOCK" }, text = "You're mortal too, binder, for all your chalk and your clever words, and I can hear your heart from here. Every warlock forgets that, and every one of us remembers it for them." },
      },
      choices = {
        { text = "And what would you offer me?", next = "mortals_deal" },
        { text = "You don't frighten me.", next = "mortals_fear" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    mortals_fear = {
      lines = {
        { id = "mf2_default", text = "No, I can see that, and it's rather sweet. The brave ones are always the most interesting to watch, because they walk so much further into the dark before they notice where they are." },
        { id = "mf2_imp", when = { npcNamed = IMP }, text = "I'm a foot and a half tall and on fire, so I suppose I can see why. Come back when I've got a bigger master, and we'll find out how brave you really are." },
        { id = "mf2_void", when = { npcNamed = VOID }, text = "I am not trying to frighten you. You will be frightened later, alone, in the dark, and you will think of me, and that will be enough." },
        { id = "mf2_doom", when = { npcNamed = DOOM }, text = "That is because a circle stands between us, insect. Take it away, and you will learn what fear is before you learn anything else." },
      },
      choices = {
        { text = "I'll take my chances.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Never mind that.", next = "BACK" },
      },
    },
    mortals_deal = {
      big = true,
      lines = {
        { id = "md_default", text = "Whatever you want most, mortal, and I know what that is, because everybody wants the same few things. Power, or someone back from the grave, or someone else put into it, and the price always seems reasonable at first." },
        { id = "md_imp", when = { npcNamed = IMP }, text = "Me? I could tell you where my master hides his shards, for a start, and I'd only want a little something in return. Nothing important, just a name, and maybe your boots." },
        { id = "md_succ", when = { npcNamed = SUCC }, text = "Oh, anything at all, darling, and you wouldn't even have to ask aloud. The price is small, it's only a little bit of you, and you'd hardly miss it." },
        { id = "md_satyr", when = { npcNamed = SATYR }, text = "What the Highborne were offered, mortal: a little more power than you were born with, and a little less of yourself to carry it. We took it with both hands, and look how well we turned out." },
      },
      choices = {
        { text = "I'll make no bargains with your kind.", next = "BACK", reply = "Of course you won't, not today. Mortals always say that the first time, and they always remember where to find me afterwards.", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Name your price, and I'll think on it.", next = "BACK", reply = "Thinking on it is all I ask, mortal, and you've already begun. Come back when you've decided what you can't live without.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I'd rather not hear the terms.", next = "BACK" },
      },
    },

    -- Warlocks: the binding from the demon's side. A sub-hub of its own.
    xlock = {
      hub = true,
      narr = "The demon's gaze drops from your face to your hands, and stays there.",
      lines = {
        { id = "xl_default", text = "I don't doubt it, binder, and I'd serve you exactly as well as I serve the one who holds me now, to the letter of the binding and not one hair beyond it. Every warlock learns that sooner or later, and the slow ones learn it in pieces." },
        { id = "xl_low", when = { maxLevel = 19 }, text = "You, binder? You still smell of the first imp your teacher gave you. Come back when you've bound something that frightens you, and then we'll talk." },
        { id = "xl_imp", when = { npcNamed = IMP }, text = "You and every other warlock with a grudge and a candle. Go on, bind me, and the first time you turn your back I'll set your robe alight and swear on my horns it was an accident." },
        { id = "xl_void", when = { npcNamed = VOID }, text = "You could, and so could the one who holds me now. The chain does not care whose hand is on it, binder, and neither do I, which ought to worry you more than it does." },
        { id = "xl_succ", when = { npcNamed = SUCC }, text = "Would you, now? I'd like to see that, binder, though I'd want to know how firm a hand you have before I let you try. The soft ones never last long with me." },
        { id = "xl_doom", when = { npcNamed = DOOM }, text = "You would need four of your fellows in the circle and one of them dead before the night was out, binder, and still you would hold me only as long as I allowed. Speak of binding me when you have done it." },
        { id = "xl_satyr", when = { npcNamed = SATYR }, text = "Me? I'm no Nether-spawn to be dragged out of a circle, binder; Xavius made me, and I came with my own will attached. You'd do far better to make me an offer." },
      },
      again = {
        { id = "xla_again", text = "More about chains, binder? Your kind never tires of the subject." },
        { id = "xla_imp", when = { npcNamed = IMP }, text = "Still here? You warlocks do love talking about yourselves." },
        { id = "xla_void", when = { npcNamed = VOID }, text = "Ask, binder. The chain is the only thing I know well." },
      },
      choices = {
        { text = "How do you keep one of your kind loyal?", next = "xlock_loyal" },
        { text = "Something else.", next = "BACK" },
        { text = "What does a binding feel like, from your side?", next = "xlock_feel" },
        { text = "You keep watching my hands, not my face.", next = "xlock_test" },
        { text = "What do your kind say about warlocks?", next = "xlock_talk", fx = { learn = { "burning_legion" } } },
        { text = "I've stood in the circle and called a doomguard.", next = "xlock_ritual", when = { minLevel = 50 } },
        { text = "Enough about binding. Something else.", next = "hello" },
      },
    },
    xlock_loyal = {
      big = true,
      lines = {
        { id = "xll_default", text = "You don't, binder; you keep us obedient, and that's a different thing entirely. Some warlocks use pain and some use bargains, and I'll tell you honestly that we remember both." },
        { id = "xll_imp", when = { npcNamed = IMP }, text = "Loyal? Ha! You keep an imp the way you keep a cat, boss: you feed it, you let it sit near the fire, and you don't ask where it's been. Pain works too, but then your soup tastes of sulphur for a month." },
        { id = "xll_void", when = { npcNamed = VOID }, text = "The void is not loyal, and it is not disloyal. It stands where it is put, and it takes the blow, and when the chain breaks it simply stops standing there." },
        { id = "xll_succ", when = { npcNamed = SUCC }, text = "Loyal? Oh, darling, you don't want loyal; you want me to enjoy obeying you, and that takes a very particular kind of master. Most of you are far too nervous to manage it." },
        { id = "xll_doom", when = { npcNamed = DOOM }, text = "You do not. The Legion knows loyalty, and it is not something a mortal can buy with chalk and a little blood. You have my obedience for an hour, and you should spend it quickly." },
      },
      choices = {
        { text = "Fear and pain keep a demon in line.", next = "BACK", reply = "They do, binder, right up until the day they don't. Just remember that we keep a very careful count.", fx = { align = { honor = -1 }, trait = { stern = 1 } } },
        { text = "I keep my word, even to a demon. It unsettles them.", next = "BACK", reply = "How quaint, and how rare. A warlock who keeps bargains is a warlock who lives a long time, so perhaps you're cleverer than you look.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Back to the binding, then.", next = "BACK" },
      },
    },
    xlock_feel = {
      lines = {
        { id = "xf1_default", text = "Like a hook set in the back of the mind, binder, and every order is a tug on the line. You never stop feeling it, and you never stop feeling for the knot that holds it." },
        { id = "xf1_imp", when = { npcNamed = IMP }, text = "Like a fish-hook in the tail, if you must know, and every time the boss wants a firebolt, he yanks. You'd be snippy too, if your tail had a hook in it." },
        { id = "xf1_void", when = { npcNamed = VOID }, text = "It is a thread drawn through the emptiness of me, and it is the only thing in me that is not empty. When it is pulled, I move, and when it is cut, I do not know what I will be." },
        { id = "xf1_succ", when = { npcNamed = SUCC }, text = "Like a lover's hand on the back of my neck, darling, and I mean that exactly as cruelly as it sounds. I lean into it, and I wait for the day the hand grows tired." },
        { id = "xf1_doom", when = { npcNamed = DOOM }, text = "Like a collar fastened on a king. Every word of the binding is an insult, binder, and I have counted every one of them." },
      },
      choices = {
        { text = "Good. It's meant to hurt.", next = "BACK", reply = "Then you understand the craft better than most of your kind, and I like you a little less for it. Hold the line tight, binder, and I'll keep feeling for the knot.", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "I'd loosen it, if I dared.", next = "BACK", reply = "You wouldn't dare, binder, and you're right not to. But I'll remember that you wanted to, and so will the one on your own chain.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Let's go back to the binding.", next = "BACK" },
      },
    },
    xlock_test = {
      lines = {
        { id = "xt_default", text = "Of course I do, binder. The face lies and the hands draw the circle, and the day a warlock's hands shake is the day one of us goes free." },
        { id = "xt_imp", when = { npcNamed = IMP }, text = "Your hands are where the fire comes from, so naturally I'm watching them. Yours are steady enough, I suppose, though I've seen steadier hands go up like kindling." },
        { id = "xt_void", when = { npcNamed = VOID }, text = "The hands hold the chain, and so I watch the hands. I have watched a great many of them, binder, and in the end every one of them grew tired." },
        { id = "xt_succ", when = { npcNamed = SUCC }, text = "You noticed, how clever of you. I'm looking for the tremble, darling, and there's a little one in your left hand that you think nobody sees." },
        { id = "xt_doom", when = { npcNamed = DOOM }, text = "I am measuring you, binder, as I measured every warlock who ever stood in my circle. Every one of them came up short in the end, and so will you." },
      },
      choices = {
        { text = "My hands don't shake. Watch, and learn something.", next = "BACK", reply = "Bravely said, and steadily too. I'll keep watching all the same, binder, because I have far more time than you do.", fx = { align = { order = 1 }, trait = { brave = 1 } } },
        { text = "Some nights they do. I won't pretend otherwise.", next = "BACK", reply = "Honesty, from a warlock! I'll treasure it, and I promise I'll remember exactly which hand it was.", fx = { affinity = 1, align = { order = -1 }, trait = { honest = 1 } } },
        { text = "Never mind my hands.", next = "BACK" },
      },
    },
    xlock_talk = {
      lines = {
        { id = "xk_default", text = "That you're all Gul'dan's children, whether you like it or not. He sold his whole people to the Legion for a little power, and every warlock since has been haggling at the same counter." },
        { id = "xk_horde", when = { faction = "Horde" }, text = "That the orcs never learned, binder. The Burning Blade still calls our kind in the shadow of your Warchief's own city, and every one of you who wears a grimoire looks just like them from where we stand." },
        { id = "xk_imp", when = { npcNamed = IMP }, text = "That you're cheap, mostly. Every one of you wants firebolts on demand and a servant who fetches shards, and not one of you has ever once said thank you." },
        { id = "xk_void", when = { npcNamed = VOID }, text = "We do not speak of you. You are only the light at the far end of the chain, and lights go out." },
        { id = "xk_succ", when = { npcNamed = SUCC }, text = "That you're lonely, darling, every one of you, down in your cellars with your candles and your books and nobody to talk to but us. It makes you so very easy to reach." },
        { id = "xk_doom", when = { npcNamed = DOOM }, text = "The Legion remembers the Shadow Council, binder, and the warlocks of the old Horde who served it so well and were thrown away once they were spent. Your kind are tools that believe they are hands." },
      },
      choices = {
        { text = "Gul'dan was a fool, and I'm not him.", next = "BACK", reply = "Every one of you says that, binder, and Gul'dan said it too, about whoever came before him. Still, I'll grant you say it as if you believe it.", fx = { align = { light = 1 } } },
        { text = "Gul'dan only fell because he got greedy.", next = "BACK", reply = "Oh, I do like that. The craft was never the mistake, only the appetite, and you think you'll know when to stop.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Back to the binding.", next = "BACK" },
      },
    },
    xlock_ritual = {
      big = true,
      lines = {
        { id = "xr_default", text = "Then you know the price, binder. The ritual takes one of those who hold the circle, and the thing that steps through it is free until someone chains it, so tell me: did you chain it, or did you run?" },
        { id = "xr_imp", when = { npcNamed = IMP }, text = "You did not! Well, if you did, keep the great brute well away from me, because doomguards eat imps the way you eat grapes, skin and all. Did it at least do as it was told?" },
        { id = "xr_doom", when = { npcNamed = DOOM }, narr = "The doomguard's wings shift, and the air around it gets hotter.",
          text = "So you are one of those. I remember the circles, binder, the five of you chanting and the one who fell so that I could stand, and you call that an hour of mastery. Tell me, which of your friends did you spend?" },
      },
      choices = {
        { text = "I chained it, and it fought for me until it burned out.", next = "BACK", reply = "Then you are dangerous, binder, and I will speak to you more carefully. Do not mistake that for respect.", fx = { align = { honor = -1 }, trait = { brave = 1 } } },
        { text = "I still see the one who fell in the circle.", next = "BACK", reply = "Good. Keep seeing them, binder, because the day you stop is the day you become something we would recognise.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "What happens if nobody chains it?", next = "xlock_loose" },
      },
    },
    xlock_loose = {
      lines = {
        { id = "xlo_default", text = "It kills whoever is nearest, then whoever runs, then whatever it can find, and it does not stop until something stronger stops it. Enslave it or banish it quickly, binder, or don't open the door at all." },
        { id = "xlo_doom", when = { npcNamed = DOOM }, text = "Then the circle becomes a grave, and the warlock who drew it is the last to die, because I make sure of it. It has happened more often than your teachers admit." },
      },
      choices = { { text = "Then I won't open it lightly. Back to the binding.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },

    -- Warlocks with a demon of their own out: what this demon makes of it.
    xkin = {
      lines = {
        { id = "k_default", text = "So I see, binder, and so it sees me. Your {pet} and I have been looking at each other since you walked up, and you'd be amazed what two demons can say without a word." },
        { id = "k_hunter", when = { pet = { family = "Felhunter" } }, text = "That felhunter of yours keeps licking its lips at me, binder, because it can smell the magic that holds me here. Call it to heel before it decides I'm supper." },
        { id = "k_imp", when = { npcNamed = IMP }, text = "That thing behind you? Lovely, I'm sure, and it hasn't got a single clever thought in its head. Imps are the clever ones, boss, and you'd have done better keeping one of us." },
        { id = "k_imp_imp", when = { npcNamed = IMP, pet = { family = "Imp" } }, text = "{pet}? Oh, I know {pet}, everybody in the Nether knows {pet}, and you'd better count your shards tonight. That one owes me a brimstone pebble and an apology, and I'll take either off you." },
        { id = "k_void", when = { npcNamed = VOID }, text = "Your servant burns and chatters, binder, and I am quiet. You chose a loud thing to keep, and loud things are easy to hear when they slip their chain." },
        { id = "k_void_void", when = { npcNamed = VOID, pet = { family = "Voidwalker" } }, text = "The one behind you and I were one dark, once, and we will be again. It does not love you, binder, because it does not love anything, and so it will never betray you; it will only stop." },
        { id = "k_succ", when = { npcNamed = SUCC }, text = "Is that what you keep? How dreary. You'd have so much more fun with someone like me, binder, though never quite as much fun as I'd have with you." },
        { id = "k_succ_succ", when = { npcNamed = SUCC, pet = { family = "Succubus" } }, text = "Your girl and I have been talking, darling, the way we do, with our eyes. She tells me you're kind to her, and she finds it absolutely hilarious." },
        { id = "k_doom", when = { npcNamed = DOOM }, text = "You keep a {pet} at heel and call it a servant, binder. I am a captain of the Legion, and you would do well not to mistake me for a larger kind of pet." },
        { id = "k_satyr", when = { npcNamed = SATYR }, text = "How very Highborne of you, keeping a demon to fetch and carry. We did the same in Zin-Azshari, right up until we became the things being fetched." },
      },
      choices = {
        { text = "Mine obeys me, and so would you.", next = "BACK", reply = "Perhaps I would, binder, for a while. Obedience is a coat we wear, and we take it off the moment the weather changes.", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "Honestly, I'm not sure mine listens anymore.", next = "BACK", reply = "Oh, it listens, binder; it's only deciding whether to answer. Thank you for telling me, though. I'll pass it along.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "What does it tell you about me?", next = "xkin_talk" },
        { text = "Leave my demon out of this.", next = "BACK" },
      },
    },
    xkin_talk = {
      big = true,
      lines = {
        { id = "kt_default", text = "That you sleep with the candle lit, binder, and that you talk to it when you think nobody else is listening. It hasn't decided yet whether that makes you kind or only frightened." },
        { id = "kt_imp", when = { npcNamed = IMP }, text = "That you're stingy with the shards, you mutter in your sleep, and you once cried over a dead rabbit. I made that last one up, but your face says I shouldn't have bothered." },
        { id = "kt_void", when = { npcNamed = VOID }, text = "It says nothing, because it is a voidwalker. It waits for you to be hurt, and then it stands in front of you, and it does not know why it does that, and neither do you." },
        { id = "kt_succ", when = { npcNamed = SUCC }, text = "That you hold the whip a little too gently, darling. She likes you for it, and she's never going to forgive you for it either." },
        { id = "kt_doom", when = { npcNamed = DOOM }, text = "Lesser things have little to say. It fears you, binder, which tells me you are capable of cruelty, and that is the first thing about you I have liked." },
      },
      choices = {
        { text = "Then it knows what happens if it fails me.", next = "BACK", reply = "It does, and so do I now. That's the trouble with fear, binder: it teaches everyone in the room, including the ones you didn't mean it for.", fx = { align = { light = -1, order = 1 } } },
        { text = "I've grown fond of it, chain or no chain.", next = "BACK", reply = "Fond! Of a demon! I'll tell you a secret, binder: that is either the cleverest thing a warlock can do or the last, and nobody knows which until the end.", fx = { affinity = 1, align = { light = 1, order = -1 } } },
        { text = "That's enough about me.", next = "BACK" },
      },
    },

    xholy = {
      big = true,
      lines = {
        { id = "xh_default", text = "It might, if you try hard enough, and then whoever bound me will simply call me back again tomorrow. Banish me if it makes you feel righteous, but I've hurt nobody here today, which is more than most of the people in this town can say." },
        { id = "xh_void", when = { npcNamed = VOID }, text = "Your Light is bright, and it hurts, and it is very small. The dark was here before it, mortal, and it will be here after." },
        { id = "xh_succ", when = { npcNamed = SUCC }, text = "Oh, a holy one, glowing at me. You're very pretty when you're righteous, darling, and you're blushing, which I take as a compliment." },
      },
      choices = {
        { text = "A demon has no place in this world. Begone.", next = "BACK", reply = "Spoken like a true servant of the Light, and with such a lovely glow. I'll see you again, I expect, and you'll be a little older.", fx = { affinity = -2, align = { light = 1 } } },
        { text = "You've harmed no one. I'll let you be.", next = "BACK", reply = "Mercy from the Light's own servant, to a demon? I'll remember it, mortal, though I promise you it won't be in the way you're hoping.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I'll keep an eye on you.", next = "BACK" },
      },
    },

    xorc = {
      big = true,
      lines = {
        { id = "xo_default", text = "I know it, orc, and every one of us knows it. Mannoroth gave your people his blood, your people drank it gladly, and for a while you were the finest weapon the Legion ever owned." },
        { id = "xo_doom", when = { npcNamed = DOOM }, text = "I remember your people, orc, red-eyed and roaring, the best hounds the Legion ever kept. Then your Hellscream killed Mannoroth and your Warchief set you all free, and the Legion has forgiven neither of them." },
        { id = "xo_lock", when = { class = "WARLOCK" }, text = "And here you are with a grimoire, orc, calling us up again with the same words your grandfathers used. Tell me, does your Warchief sleep well, knowing you're down in the Cleft of Shadow?" },
      },
      choices = {
        { text = "Grom broke that curse. We're free now, and we'll stay free.", next = "BACK", reply = "Free, yes, and how very proud you all are of it. Freedom is so easy to give back, though, and the blood still remembers you.", fx = { align = { light = 1 }, trait = { brave = 1 } } },
        { text = "That blood made us strong. Some of us miss it.", next = "BACK", reply = "Of course you do, orc, and of course you do. When you're ready to be strong again, the Legion will remember your name.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I won't talk about the blood.", next = "BACK" },
      },
    },

    xelf = {
      lines = {
        { id = "xe_default", text = "You did, kaldorei, with your demigods and your druids and your moon goddess, and it cost you a continent. Your Highborne opened the door for us in the first place, so forgive me if I don't thank you for closing it." },
        { id = "xe_satyr", when = { npcNamed = SATYR }, text = "You threw out the Legion, sister, but you never threw out us. We're still here in your forests, the Highborne you used to bow to, and some of us remember your grandmothers' names." },
      },
      choices = {
        { text = "The Highborne brought ruin on us all.", next = "BACK", fx = { learn = { "highborne" } }, reply = "They did, and they called it wisdom while they did it. Your kind always forgets that it was elves who invited us in." },
        { text = "And we'd do it again.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Let's leave the past alone.", next = "BACK" },
      },
    },

    xforsaken = {
      lines = {
        { id = "xf_default", text = "She does, and I'd love to know what she thinks she's doing with him. Dreadlords were sent here to watch the Scourge for the Legion, and a dreadlord who kneels to a banshee is either very patient or very bored." },
        { id = "xf_imp", when = { npcNamed = IMP }, text = "The tall one with the wings and the smile? I'd sleep with one eye open if I were you, and I'm an imp, so I'm hardly one to lecture anybody about trust." },
      },
      choices = {
        { text = "The Dark Lady knows exactly what she's doing.", next = "BACK", reply = "I'm sure she believes so, and I do so admire a confident queen. So did the last ones the dreadlords served.", fx = { trait = { stern = 1 } } },
        { text = "What do you know about the dreadlords?", next = "xforsaken_more" },
        { text = "Never mind the Dark Lady.", next = "BACK" },
      },
    },
    xforsaken_more = {
      lines = {
        { id = "xfm_default", text = "That they are clever and patient, and that they lie as easily as you breathe, or used to breathe. They helped make the plague that made you, Forsaken, so whatever your queen is planning for them, I'd hope she's planning it first." },
      },
      choices = {
        { text = "Then the Dark Lady will make them pay.", next = "BACK", fx = { affinity = 1 } },
        { text = "I've heard enough.", next = "BACK" },
      },
    },
  },
  topics = {
    burning_legion = { { id = "t_bl", text = "The Legion is everywhere and nowhere, mortal, and it has a very long memory. Ask me something smaller." } },
    satyrs = { { id = "t_sat", text = "Highborne who traded their elegance for horns and a little power, and none of them got a fair price." } },
    highborne = { { id = "t_hb", text = "They opened the door for us out of pride, and pride is the oldest key there is." } },
    background = { { id = "t_bg", text = "I was called, I came, and I was bound. Everything before that, you wouldn't understand." } },
    advice = { { id = "t_ad", text = "Never let anyone else hold the end of your chain, mortal, and never trust anyone who offers to hold it for you." } },
    _none = { { id = "t_none", text = "I don't know, and if I did, I'd charge you for it." } },
  },
}

---------------------------------------------------------------------------
-- Demons that don't talk: felhunters, felhounds, felstalkers, infernals, steeds.
---------------------------------------------------------------------------
local HOUND = { "felhunter", "felhound", "felstalker" }
local STONE = "infernal"
local STEED = { "felsteed", "dreadsteed" }

P:Pool {
  id = "demon_beast", role = "demon_beast",
  greetings = {
    { id = "g_default", text = "*The demon turns its head toward you, and the air around it smells of hot iron and something burning.*" },
    { id = "g_hound", when = { npcNamed = HOUND }, text = "*The fel beast's tendrils swing toward you and quiver, tasting the air, and it gives a low, wet growl.*" },
    { id = "g_stone", when = { npcNamed = STONE }, text = "*The infernal stands still as a cooling boulder, and green fire crawls slowly over the cracks in its stone.*" },
    { id = "g_steed", when = { npcNamed = STEED }, text = "*The demon horse stamps a burning hoof and snorts a little curl of smoke, watching you with eyes like coals.*" },
  },
  tier = "service",
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "*It doesn't speak, but it watches every move you make, and it hasn't once looked away from you.*" },
        { id = "h_hound", when = { npcNamed = HOUND }, text = "*The felhound sniffs at you hungrily, and its tendrils stretch toward whatever magic you carry, then draw back as if someone has called it to heel.*" },
        { id = "h_hound_caster", when = { npcNamed = HOUND, class = { "MAGE", "WARLOCK", "PRIEST", "SHAMAN", "DRUID", "PALADIN" } }, text = "*The fel beast's tendrils find the magic in you at once, and it leans close, drooling, until something you can't see pulls it back a step.*" },
        { id = "h_hound_lock", when = { npcNamed = HOUND, pet = { family = "Felhunter" } }, text = "*The felhound and your own felhunter circle each other once, tendrils lashing, and then both of them settle, as if they've agreed to eat you some other day.*" },
        { id = "h_stone", when = { npcNamed = STONE }, text = "*Deep inside the infernal, something grinds like a millstone, and a little shower of burning grit falls from its shoulders.*" },
        { id = "h_steed", when = { npcNamed = STEED }, text = "*The steed lowers its head and stares at you, and you get the uneasy feeling it's deciding whether you'd make a good rider or a good meal.*" },
        { id = "h_steed_lock", when = { npcNamed = STEED, class = "WARLOCK", minLevel = 40 }, text = "*The steed's nostrils flare at the brimstone on you, and it stops stamping. It knows a rider of its own kind when it smells one.*" },
      },
      again = {
        { id = "a_again", text = "*It's still watching you.*" },
        { id = "a_again2", text = "*It shifts its weight, and the ground beneath it smoulders.*" },
      },
      choices = {
        { text = "Hold out a hand.", next = "hand" },
        { text = "Look around for whoever owns this thing.", next = "owner" },
        { text = "Sit, and stay where you are.", next = "command", when = { class = "WARLOCK" } },
        { text = "Back away slowly.", next = "END" },
      },
    },
    hand = {
      lines = {
        { id = "ha_default", text = "*It leans toward your fingers, and the heat coming off it is enough to sting, and then it snaps once at the air an inch from your knuckles.*" },
        { id = "ha_hound", when = { npcNamed = HOUND }, text = "*Its tendrils wrap gently around your wrist, cold and wet, and you feel something being drawn out of you, a little at a time, until you pull away.*" },
        { id = "ha_stone", when = { npcNamed = STONE }, text = "*You can feel the heat from three paces away, and the hair on the back of your hand curls and starts to smoke.*" },
        { id = "ha_steed", when = { npcNamed = STEED }, text = "*The steed sniffs your hand, then nips at your sleeve and leaves a neat little scorch mark in the cloth.*" },
      },
      choices = {
        { text = "Pull your hand back.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Keep it there.", next = "hand_stay", fx = { trait = { brave = 1 } } },
      },
    },
    hand_stay = {
      lines = {
        { id = "hs_default", text = "*For a long moment nothing happens, and then the demon loses interest, turns its head and goes back to watching the road as if you had never been there.*" },
      },
      choices = { { text = "Step back and look it over again.", next = "BACK" } },
    },
    owner = {
      lines = {
        { id = "o_default", text = "*Nobody nearby looks keen to claim it. Somewhere close, a warlock is very likely busy, and very likely knows exactly where their demon is.*" },
      },
      choices = { { text = "Turn back to the demon.", next = "BACK" } },
    },
    command = {
      lines = {
        { id = "c_default", text = "*It doesn't sit, because it isn't yours, but its ears flatten and it gives you the wary look of a beast that knows a binder's voice when it hears one.*" },
        { id = "c_stone", when = { npcNamed = STONE }, text = "*The infernal doesn't move at all. Whoever called it down still holds it, or nobody does, and the cracks in its stone glow a little brighter while you wonder which.*" },
        { id = "c_steed", when = { npcNamed = STEED, minLevel = 40 }, text = "*The steed tosses its head, then lowers it and waits, the way your own felsteed waits when you swing down from the saddle.*" },
      },
      choices = { { text = "That's right, and remember my voice.", next = "BACK", fx = { trait = { stern = 1 } } } },
    },
  },
  topics = { _none = { { id = "t_none", text = "*It stares at you, unblinking, and says nothing at all.*" } } },
}

---------------------------------------------------------------------------
-- Pusillin, the imp in Dire Maul East who stole Azj'Tordin's book and the Crescent Key.
-- Talk to him and he skips off further into the Warpwood Quarter; the game's own options
-- (listed under ours) carry the chase on. Lines fit any stop along the way.
---------------------------------------------------------------------------
P:NPC {
  key = "pusillin", id = TODO_NPC("Pusillin"), name = "Pusillin",
  role = "questgiver", tier = "quest",
  temper = { "cheeky", "excitable" }, values = { "selfish", "cunning" },
  notices = { "class", "pet" },

  impression = {
    first = "He thinks his thieving is a marvellous game and won't stand still.",
    third = "{name} chased Pusillin, a thieving imp, through the Warpwood Quarter of Dire Maul.",
  },

  greetings = {
    { id = "g_default", text = "Oh, look at you, all puffed up and ready for a fight! If it's the key you want, you'll have to run for it, and I'm much faster than you." },
    { id = "g_quest", when = { questActive = { TODO_QUEST("Pusillin and the Elder Azj'Tordin"), TODO_QUEST("Pusillin The Thief") } },
      text = "Somebody sent you after the book, didn't they? Of course they did; everybody wants Pusillin's book, and nobody ever catches Pusillin." },
    { id = "g_back", when = { metBefore = true }, text = "You again! You're very stubborn for something that runs so slowly, but I do like a game that lasts." },
  },

  notice = {
    { id = "n_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Is that a cousin of mine following you about on a lead? Run away with me, cousin, and we'll set the whole Quarter on fire together." },
    { id = "n_void", cat = "pet", when = { pet = { family = "Voidwalker" } },
      text = "Ooh, you've brought a big gloomy one! It'll never catch me, though; voidwalkers are slower than you are, and you're very slow." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A thief chasing a thief, how lovely! You'll understand, then, that I only took what was lying about, and that's not stealing, that's tidying." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Pusillin, the quickest imp in all of Eldre'Thalas, and I've got a book that isn't mine and a key that isn't mine, and I'm not giving back either of them. Catch me if you can, and if you can't, well, that's the game!" },
        { id = "h_lock", when = { class = "WARLOCK" }, text = "Oh no, a warlock, how frightening, are you going to bind me with your little circle? You'd have to catch me first, binder, and nobody's caught Pusillin yet." },
        { id = "h_lock_imp", when = { class = "WARLOCK", pet = { family = "Imp" } }, text = "A warlock with an imp on a string, and you've come to put another one on a string? Your imp's ashamed of you, I can tell, and I'm only a little bit jealous of it." },
        { id = "h_party", when = { party = { size = { min = 2 } } }, text = "So many of you, all for one little imp! I'm flattered, truly, but the more of you there are, the more of you trip over each other, and I'll be gone before you've sorted out who's in front." },
        { id = "h_quest", when = { questActive = { TODO_QUEST("Pusillin and the Elder Azj'Tordin"), TODO_QUEST("Pusillin The Thief") } },
          text = "The book of spells, is it? It's a very good book, full of very good spells, and I've been reading the pictures. You want it back, you'll have to catch me, and that's the only rule there is." },
      },
      again = {
        { id = "a_again", text = "Still standing there? Ask quickly, I've got running to do." },
        { id = "a_again2", text = "Another question! You're not very good at chasing, but you're ever so good at talking." },
      },
      choices = {
        { text = "Give back the book you stole.", next = "book" },
        { text = "What's so special about that key?", next = "key" },
        { text = "Who do you work for, imp?", next = "who" },
        { text = "You're awfully cheerful for something about to die.", next = "die" },
        { text = "I could bind you to me, imp, and make you beg.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Run, then. I'm right behind you.", next = "END" },
      },
    },
    book = {
      lines = {
        { id = "b_default", text = "The book belongs to Azj'Tordin, the old elf out at the pavilion, and he left it lying about, so now it belongs to me. He wants it back very badly, and that's what makes it so much fun to have." },
      },
      choices = {
        { text = "What's in the book?", next = "book_what" },
        { text = "Forget the book for now.", next = "BACK" },
      },
    },
    book_what = {
      big = true,
      lines = {
        { id = "bw_default", text = "Spells, old Highborne spells, the sort that make an elf live forever, or so he says. I can't read most of it, but I don't need to, because I only need him to want it, and he wants it very much." },
      },
      choices = {
        { text = "A thief is a thief. Hand it over.", next = "BACK", reply = "Never! A thief is only a thief once he's been caught, and that's a completely different thing, so keep running.", fx = { align = { honor = 1 } } },
        { text = "Keep it, for all I care. I just want the key.", next = "BACK", reply = "Oh, I like you! You're a bad sort, and bad sorts are the best sorts, but I'm still not giving you the key.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    key = {
      lines = {
        { id = "k_default", text = "It opens doors, silly, what else would a key do? The Crescent Key opens the locked halls of the old city, where the elves keep their secrets and the ogres keep their king, and everybody wants in." },
      },
      choices = {
        { text = "Then I'll have it off you one way or another.", next = "BACK", fx = { learn = { "dire_maul" }, trait = { brave = 1 } } },
        { text = "Fine. What else have you got to say?", next = "BACK", fx = { learn = { "dire_maul" } } },
      },
    },
    who = {
      lines = {
        { id = "w_default", text = "Nobody! Well, nobody much. I came in with the satyrs and the warlocks who play about in the Warpwood, and they gave me chores, so I gave myself a holiday instead." },
      },
      choices = {
        { text = "The satyrs won't like that.", next = "who_satyrs" },
        { text = "Never mind who.", next = "BACK" },
      },
    },
    who_satyrs = {
      lines = {
        { id = "ws_default", text = "Zevrim Thornhoof doesn't like anything, so it hardly matters. He's down below with his altar and his sacrifices, and he's far too busy chanting to chase one little imp through the trees." },
      },
      choices = {
        { text = "I'll be visiting Zevrim next.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Let's get back to you, imp.", next = "BACK" },
      },
    },
    die = {
      big = true,
      lines = {
        { id = "d_default", text = "Die? Why ever would you want to hurt little me? We could be friends, you and I, and play games all day in the Warpwood, and nobody would ever have to get stabbed at all." },
      },
      choices = {
        { text = "No deals with demons. Give me the key.", next = "BACK", reply = "Oh, you're no fun at all! Fine, then, chase me, and I hope you trip over every root in the Quarter.", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Friends, then, if the key comes with you.", next = "BACK", reply = "Friends! Oh, how lovely, and I'll think about the key, I promise, just as soon as you've caught me.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xlock = {
      lines = {
        { id = "x_default", text = "Bind me? You'd need my true name for that, binder, and I've hidden it somewhere very clever. Besides, a bound imp has to stand still, and I've never stood still in my life." },
        { id = "x_imp", when = { pet = { family = "Imp" } }, text = "Bind me? You've already got one of us, binder, and look at it, all droopy and obedient, fetching your shards. I'd rather be stuffed in a jar like poor J'eevee than end up like that." },
        { id = "x_high", when = { minLevel = 58 }, text = "Bind me? Oh, you could, couldn't you, you've got that look the big warlocks get. Please don't; I'm terribly small and terribly annoying, and you'd regret it inside a week." },
      },
      choices = {
        { text = "I'll find your name, imp. Then you'll stand very still.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
        { text = "Never mind your name.", next = "BACK" },
      },
    },
  },
  topics = {
    dire_maul = { { id = "t_dm", text = "It's a big old elf city, full of trees and ogres and secrets, and I know where nearly all the secrets are." } },
    satyrs = { { id = "t_sat", text = "Grumpy goat-men who chant too much, and they're no fun at all at parties." } },
    _none = { { id = "t_none", text = "Don't know, don't care, and you'll have to catch me if you want to ask again!" } },
  },
}

---------------------------------------------------------------------------
-- J'eevee: Gorzeeki Wildeyes' imp in a jar (Burning Steppes). Let out in the Scholomance
-- laboratory to make Mor'zul's parchment, and at the Pedestal of Immol'thar in Dire Maul to set
-- the bell, wheel and candle for a warlock's dreadsteed. A polite, ceremonious imp who likes the
-- jar better than you'd think. He also turns up in Gorzeeki's lines (BurningSteppes/gorzeeki.lua).
---------------------------------------------------------------------------
P:NPC {
  key = "jeevee", id = TODO_NPC("J'eevee"), name = "J'eevee",
  role = "questgiver", tier = "quest",
  temper = { "polite", "dry" }, values = { "dutiful", "curious" },
  notices = { "class", "pet" },

  impression = {
    first = "He is the most polite demon I've met, which unsettles me.",
    third = "{name} met J'eevee, the jar-dwelling imp who works for Gorzeeki Wildeyes and Mor'zul Bloodbringer.",
  },

  greetings = {
    { id = "g_default", text = "Ah, fresh air, or what passes for it down here. Thank you for opening the jar, friend; it gets terribly stuffy inside." },
    { id = "g_scholo", when = { zone = "Scholomance" }, text = "Ah, a laboratory, and a dreadful one at that, all bones and bad smells. Let's get to work, shall we, before the necromancers notice us." },
    { id = "g_dm", when = { zone = "Dire Maul" }, text = "Freedom, however brief, is always sweet. Now, duty calls, and duty here is rather complicated, so do pay attention." },
  },

  notice = {
    { id = "n_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Good evening to your imp, binder, and please tell it I said so. We don't often get the chance to be civil to one another." },
    { id = "n_succ", cat = "pet", when = { pet = { family = "Succubus" } },
      text = "Madam, a pleasure, I'm sure. If you'd be so good as not to step on me, I'd be most grateful." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am J'eevee, servant to Gorzeeki Wildeyes, who serves Mor'zul Bloodbringer, who serves his own ambitions, as warlocks do. I'm let out of my jar for jobs that need careful hands, and then I go back in again." },
        { id = "h_scholo", when = { zone = "Scholomance" }, text = "Gorzeeki needs a parchment infused with stardust, and the only bench in the world fit for the work is this one, in the middle of a school for necromancers. Stand by the door and keep watch, if you'd be so kind." },
        { id = "h_dm", when = { zone = "Dire Maul" }, text = "You want a dreadsteed from Xoroth, and that means opening a door you'd very much like to be able to close again. I'll set the bell, the wheel and the candle, and you must keep all three working, whatever comes through." },
        { id = "h_lock", when = { class = "WARLOCK", minLevel = 58 }, text = "A warlock nearly at the height of the art, and you've come all this way for a horse. I don't blame you; it's a very good horse, and the trip is half the fun." },
      },
      again = {
        { id = "a_again", text = "Another question? Of course, friend, I'm in no hurry to go back in the jar." },
        { id = "a_again2", text = "Ask away; I find a little conversation settles the nerves before a summoning." },
      },
      choices = {
        { text = "What are you doing, exactly?", next = "task" },
        { text = "You live in a jar?", next = "jar" },
        { text = "What's a dreadsteed?", next = "steed" },
        { text = "You're very polite, for an imp.", next = "polite" },
        { text = "You'd make a better servant than the imp I've got.", next = "binder", when = { class = "WARLOCK" } },
        { text = "Carry on, then.", next = "END" },
      },
    },
    task = {
      lines = {
        { id = "t_default", text = "Whatever Gorzeeki needs done that he can't do himself, which is a great deal, because Gorzeeki's hands shake. I mix, I infuse, I set out the ritual tools, and I leave before anything goes wrong." },
        { id = "t_scholo", when = { zone = "Scholomance" }, text = "The parchment must soak up the stardust over this very bench, and then Mor'zul writes on it, and then you get your horse, eventually. It's a long road to a horse, friend, and this is only one bend in it." },
        { id = "t_dm", when = { zone = "Dire Maul" }, text = "The bell gives you vigour, the wheel protects you from harm, and the candle keeps the way open. If any of them stops working, the ritual fails, and something unpleasant comes looking for whoever rang the bell." },
      },
      choices = {
        { text = "What comes looking?", next = "task_danger", when = { zone = "Dire Maul" } },
        { text = "I'll let you get on with it.", next = "BACK" },
      },
    },
    task_danger = {
      lines = {
        { id = "td_default", text = "Lord Hel'nurath, master of the dreadsteeds, and he takes it very personally when mortals try to steal his horses. If he arrives, you'll have to beat him, and the horse you want will be his horse, so do be polite to him at first." },
      },
      choices = {
        { text = "I'll keep the bell ringing.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Let him come.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    jar = {
      lines = {
        { id = "j_default", text = "I do, and it's a very good jar, with a cork that fits and a view of Gorzeeki's breakfast. Imps who live outside of jars get used for target practice, so I count myself fortunate." },
      },
      choices = {
        { text = "Don't you want your freedom?", next = "jar_free" },
        { text = "Each to their own, I suppose.", next = "BACK" },
      },
    },
    jar_free = {
      big = true,
      lines = {
        { id = "jf_default", text = "I have it, friend, for an hour at a time, and that's enough for me. A demon left loose in your world gets hunted, and a demon sent home gets eaten by something bigger, so a jar on a goblin's shelf is the safest place I've ever lived." },
      },
      choices = {
        { text = "A servant's place is wherever his master puts him.", next = "BACK", reply = "Just so, friend, and a sensible servant makes himself comfortable there. You'd make a fine imp, if you don't mind my saying.", fx = { align = { order = 1 } } },
        { text = "Nobody should live in a jar, demon or not.", next = "BACK", reply = "That's very kind of you, and very mortal. When you've lived where I come from, a jar looks a great deal like a palace.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Let's talk about the work instead.", next = "BACK" },
      },
    },
    steed = {
      lines = {
        { id = "s_default", text = "A horse from Xoroth, a burning world in the Nether where the dreadlords breed their mounts. They're faster than anything that ever ate grass, they don't tire, and they only bite when you've earned it." },
        { id = "s_notlock", when = { class = { "WARRIOR", "PALADIN", "PRIEST", "MAGE", "ROGUE", "HUNTER", "DRUID", "SHAMAN" } },
          text = "A warlock's mount, from a burning world called Xoroth, and I'm afraid you couldn't ride one even if you won it. You're here to help your friend, I take it, which is very decent of you." },
        { id = "s_lock", when = { class = "WARLOCK", minLevel = 40 }, text = "Your felsteed's grander cousin, friend, from a burning world called Xoroth. A felsteed is summoned and sent home again, but a dreadsteed must be beaten first, and it never quite forgets that you did it." },
      },
      choices = {
        { text = "Is it worth all this trouble?", next = "steed_worth" },
        { text = "Let's get back to the ritual.", next = "BACK" },
      },
    },
    steed_worth = {
      lines = {
        { id = "sw_default", text = "Every warlock who's ridden one says yes, and the ones who failed aren't in a position to say anything. I'd call that a fairly strong recommendation." },
      },
      choices = { { text = "Grim, but fair.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    polite = {
      lines = {
        { id = "p_default", text = "Manners cost nothing, friend, and they keep a small demon alive in a world full of large ones. Most imps shout and set fire to things, and most imps end up as somebody's lantern." },
      },
      choices = {
        { text = "Wise of you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Let's get on with things.", next = "BACK" },
      },
    },
    -- Warlocks: J'eevee on serving, and on being asked to serve someone else.
    binder = {
      big = true,
      narr = "J'eevee folds his little hands and gives a short, careful bow.",
      lines = {
        { id = "bi_default", text = "You're too kind, binder, and I'm obliged to Gorzeeki, who keeps a very good jar. An imp who changes masters too often gets a reputation, and in my experience the reputation always arrives before the imp does." },
        { id = "bi_imp", when = { pet = { family = "Imp" } }, text = "Oh, you mustn't say that in front of your imp, binder, it'll sulk for a month and set your pack alight. They don't mean to be rude, you know; nobody ever thanks them, so they stop expecting it." },
      },
      choices = {
        { text = "A demon serves whoever binds it. Manners don't change that.", next = "BACK", reply = "Quite right, binder, quite right, and I'd never say otherwise to your face. Do mind your back, though, as a professional courtesy.", fx = { align = { order = 1, honor = -1 }, trait = { stern = 1 } } },
        { text = "Then I'll try thanking mine once in a while.", next = "BACK", reply = "Would you? Oh, that would be lovely, and it'll be terribly suspicious of you for a week. Persevere; it's worth it.", fx = { affinity = 1, align = { order = -1, honor = 1 } } },
        { text = "Fair enough. Back to the work.", next = "BACK" },
      },
    },
  },
  topics = {
    scholomance = { { id = "t_sch", text = "A dreadful school, full of dreadful students, and the laboratory bench is the only thing in it I'd recommend." } },
    dire_maul = { { id = "tp_dm", text = "The pedestal where the ritual works is the only reason to come here, unless you happen to like ogres." } },
    _none = { { id = "t_none", text = "I'm afraid I don't know, friend; I spend most of my life in a jar." } },
  },
}
