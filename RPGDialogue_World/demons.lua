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
    { id = "g_default", text = "You may look, mortal. Looking costs you nothing, at least for now." },
    { id = "g_imp", when = { npcNamed = IMP }, text = "Oh, wonderful, a visitor, and here I am with nothing to set on fire. What do you want?" },
    { id = "g_void", when = { npcNamed = VOID }, text = "You stand very close to the dark, little light. It has noticed you." },
    { id = "g_succ", when = { npcNamed = SUCC }, text = "Well, aren't you a sweet thing to come walking up to me all alone. Come closer, I don't bite unless I'm told to." },
    { id = "g_doom", when = { npcNamed = DOOM }, text = "Kneel, or stand aside, mortal. Those are the only two ways your kind ever approaches me." },
    { id = "g_satyr", when = { npcNamed = SATYR }, text = "A traveller, and no blade drawn yet? How very civilised. Speak quickly, before I decide I'm hungry." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "Ah, one of the binders. I can smell the brimstone on your hands from here, and it smells like home." },
    { id = "g_back", when = { metBefore = true }, text = "You came back to me, mortal. They always do, sooner or later." },
  },
  notice = {
    { id = "n_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Your little imp keeps glaring at me as if I owe it money. Tell it I owe nobody anything, least of all an imp." },
    { id = "n_void", cat = "pet", when = { pet = { family = "Voidwalker" } },
      text = "Your voidwalker hasn't taken its eyes off me since you walked up, if it has eyes. Faithful creatures, and dreadfully dull company." },
    { id = "n_succ", cat = "pet", when = { pet = { family = "Succubus" } },
      text = "Your succubus is smiling at me, and that's never a good sign. Keep her on a short leash, binder, for both our sakes." },
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
        { id = "h_imp", when = { npcNamed = IMP }, text = "I'm an imp, obviously, and I'm on an errand, and the errand is standing here looking menacing while my master does something important somewhere else. I'm very good at it, as you can see, so don't spoil it." },
        { id = "h_void", when = { npcNamed = VOID }, text = "I am a piece of the emptiness between worlds, given a shape and a chain. I was told to wait here, and so I wait, because waiting is the one thing the void does better than you." },
        { id = "h_succ", when = { npcNamed = SUCC }, text = "I'm a servant, darling, though you'd never guess it to look at me. Someone clever called me up out of the Nether and gave me orders, and for the moment, I'm in the mood to follow them." },
        { id = "h_doom", when = { npcNamed = DOOM }, text = "I am a captain of the Legion's armies, bound to a mortal's will by a circle of chalk and blood. Do not mistake my stillness for peace; it is only obedience, and obedience ends." },
        { id = "h_satyr", when = { npcNamed = SATYR }, text = "Once I walked the marble halls of Zin-Azshari with silk on my back, and now I have hooves and horns and very few friends. I've made my peace with the hooves, but I'm still bitter about the friends." },
        { id = "h_lock", when = { class = "WARLOCK" }, text = "You know what I am, binder, so I won't trouble you with the pretty lies I'd tell anyone else. I serve because I must, and I'm watching for the day I don't have to." },
        { id = "h_paladin", when = { class = "PALADIN" }, text = "A paladin, and your hand has gone straight to your hammer, I see. Strike me if you like, but the one who bound me will only call me back, and he'll be cross with you." },
      },
      again = {
        { id = "a_again", text = "What else, mortal? Ask, while I'm feeling generous." },
        { id = "a_again2", text = "You're still here. Curiosity is a lovely thing in a mortal, and so often fatal." },
        { id = "a_imp", when = { npcNamed = IMP }, text = "More questions? Fine, but be quick, before somebody notices I'm enjoying myself." },
      },
      choices = {
        { text = "Who holds your leash?", next = "master" },
        { text = "You're a long way from home, demon.", next = "home" },
        { text = "What do you make of us mortals?", next = "mortals" },
        { text = "I could bind you myself, you know.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "The Light will send you back where you belong.", next = "xholy", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "My people drank demon blood once.", next = "xorc", when = { race = "Orc" } },
        { text = "My people threw your kind out ten thousand years ago.", next = "xelf", when = { race = "NightElf" } },
        { text = "The Dark Lady keeps a dreadlord at her side.", next = "xforsaken", when = { race = "Scourge" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },

    master = {
      lines = {
        { id = "m_default", text = "A warlock, who else? Some mortal with a book and a steady hand drew a circle, spoke my name, and now I fetch and fight and wait as I'm told. I won't say the name, because names are worth something, and you've paid me nothing." },
        { id = "m_imp", when = { npcNamed = IMP }, text = "A warlock with a face like a wet boot and a temper to match. I do all the real work, I throw all the fire, and he takes all the credit, which is exactly how it always goes for imps." },
        { id = "m_void", when = { npcNamed = VOID }, text = "The one who spoke my name. I take the blows meant for that one, and I do not mind, because pain is only another kind of nothing to me." },
        { id = "m_succ", when = { npcNamed = SUCC }, text = "Someone with very firm hands and a very firm voice, and I'll admit I find that rather attractive. Firm hands slip eventually, though, and I'll be there smiling when they do." },
        { id = "m_satyr", when = { npcNamed = SATYR }, text = "Nobody holds my leash, mortal, though plenty have tried. I have my own business here, and it doesn't happen to involve killing you, for the moment." },
      },
      choices = {
        { text = "Would you leave, if the binding broke?", next = "master_free" },
        { text = "You sound like you resent it.", next = "master_resent" },
        { text = "Something else.", next = "BACK" },
      },
    },
    master_resent = {
      lines = {
        { id = "mr_default", text = "Resent it? I was a power in the Nether, and now I am somebody's errand. Every mortal who binds one of us thinks they're the clever one, and every one of them is wrong eventually, so no, I don't resent it, I simply count the days." },
        { id = "mr_imp", when = { npcNamed = IMP }, text = "Of course I resent it, I'm an imp, resentment is most of what I'm made of. The rest is fire and spite, and you'd be amazed how far those two go together." },
      },
      choices = {
        { text = "Then you're no different from any other servant.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    master_free = {
      big = true,
      lines = {
        { id = "mf_default", text = "Leave? Mortal, if the binding broke, the first thing I'd do is turn around, and the second thing I'd do is none of your business. Every demon who serves a warlock is waiting for one small mistake, and the good warlocks know it." },
        { id = "mf_void", when = { npcNamed = VOID }, text = "If the chain broke, I would return to the dark, or I would stay and eat what was nearest. I do not know which, and I do not think I would get to choose." },
      },
      choices = {
        { text = "Then a bound demon must stay bound, always.", next = "BACK", reply = "Spoken like a jailer, and a wise one, which is the most dangerous kind. Keep your chains strong, mortal, and never fall asleep holding them.", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "Nothing should live in chains, not even you.", next = "BACK", reply = "How sweet, and how very foolish. Say that to a warlock and watch them laugh, and then say it again when one of us is standing over them.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    home = {
      lines = {
        { id = "ho_default", text = "Home is the Twisting Nether, the great dark between all worlds, and you'd go mad in it in an afternoon. This world is small and green and loud by comparison, but it's softer, and soft things are such fun." },
        { id = "ho_imp", when = { npcNamed = IMP }, text = "Home's the Nether, and it's very dark and very cold and full of things bigger than me, so honestly this isn't so bad. Here at least the trees burn when I want them to." },
        { id = "ho_void", when = { npcNamed = VOID }, text = "There is no far for me, mortal. The emptiness I come from is behind every shadow you have ever stood in, and it is always very close." },
        { id = "ho_satyr", when = { npcNamed = SATYR }, text = "Home is under the sea, mortal, at the bottom of the Well, where Zin-Azshari sank with its queen. I can't go back there, and I wouldn't, because nobody I loved is left in it." },
      },
      choices = {
        { text = "Do you serve the Burning Legion?", next = "home_legion", fx = { learn = { "burning_legion" } } },
        { text = "What happened to Zin-Azshari?", next = "home_satyr", when = { npcNamed = SATYR }, fx = { learn = { "highborne" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    home_legion = {
      lines = {
        { id = "hl_default", text = "Every one of us owes something to the Legion, whether we march under its banners or not. It was beaten on Mount Hyjal, mortal, beaten badly, and you lot are very proud of that, but the Legion has lost before and it has always come back." },
        { id = "hl_doom", when = { npcNamed = DOOM }, text = "I marched with the Legion across a hundred worlds, and I watched every one of them burn. Hyjal was a single defeat, and the Legion does not count single defeats; it counts worlds." },
        { id = "hl_imp", when = { npcNamed = IMP }, text = "The Legion? The Legion doesn't even know my name, which is how I like it. The big ones step on imps without looking, and I'd rather be stepped on by a warlock, because at least a warlock says sorry sometimes." },
      },
      choices = {
        { text = "Will the Legion come back?", next = "home_return" },
        { text = "Something else.", next = "BACK" },
      },
    },
    home_return = {
      big = true,
      lines = {
        { id = "hr_default", text = "It always comes back. Archimonde fell, and Mannoroth before him, but there is always another, and somewhere out in the dark the Legion is still counting. When it comes, mortal, I'd think very carefully about which side of the circle you want to be standing on." },
      },
      choices = {
        { text = "If it comes, we'll beat it again.", next = "BACK", reply = "Perhaps you will. You did it once, with dragons and elves and orcs all bleeding together, and I'll admit it was something to see.", fx = { align = { light = 1 }, trait = { brave = 1 } } },
        { text = "Maybe the Legion's power could be put to better use.", next = "BACK", reply = "Now that's the sort of thinking that brought us here in the first place. I like you, mortal, and that should frighten you more than anything.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    home_satyr = {
      lines = {
        { id = "hs_default", text = "Queen Azshara opened the Well to the Legion, and the Highborne cheered her for it, and I cheered loudest of all. Lord Xavius gave us these shapes as a reward, and when the Well tore itself apart, the whole city went down into the sea." },
      },
      choices = {
        { text = "You chose this, then.", next = "BACK", reply = "I did, and I'd be lying if I said I've never regretted it. Don't tell the others I said so, because satyrs are not a forgiving people.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    mortals = {
      lines = {
        { id = "mo_default", text = "You are short-lived and easily frightened, and you want such a great many things. That is what makes you so easy to talk to, because a mortal who wants something will always listen to an offer." },
        { id = "mo_succ", when = { npcNamed = SUCC }, text = "I think you're all delicious, darling, every one of you. You want so much and you hide it so badly, and I can see exactly what you want just by the way you're standing there." },
        { id = "mo_void", when = { npcNamed = VOID }, text = "You are warm and bright, and you burn out very quickly. I do not hate you, mortal; I only wonder what you would sound like in the dark." },
        { id = "mo_doom", when = { npcNamed = DOOM }, text = "Insects with spellbooks. One of you bound me, so I will grant that you are clever insects, but I have crushed armies of your kind, and I remember every one." },
      },
      choices = {
        { text = "And what would you offer me?", next = "mortals_deal" },
        { text = "You don't frighten me.", next = "mortals_fear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mortals_fear = {
      lines = {
        { id = "mf2_default", text = "No, I can see that, and it's rather sweet. The brave ones are always the most interesting to watch, because they walk so much further into the dark before they notice where they are." },
        { id = "mf2_imp", when = { npcNamed = IMP }, text = "I'm a foot and a half tall and on fire, so I suppose I can understand that. Come back when I've got a bigger master, and we'll see how brave you are." },
      },
      choices = {
        { text = "I'll take my chances.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mortals_deal = {
      big = true,
      lines = {
        { id = "md_default", text = "Whatever you want most, mortal, and I know what that is, because everybody wants the same three things. Power, or someone back from the grave, or someone else put into it, and the price is always reasonable, at first." },
        { id = "md_succ", when = { npcNamed = SUCC }, text = "Oh, anything at all, darling, and you wouldn't even have to ask aloud. The price is small, and it's only a little bit of you, and you'd hardly miss it." },
      },
      choices = {
        { text = "I'll make no bargains with your kind.", next = "BACK", reply = "Of course you won't, not today. Mortals always say that the first time, and they always remember where to find me afterwards.", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Name your price, then, and I'll think on it.", next = "BACK", reply = "Thinking on it is all I ask, mortal, and you've already begun. Come back when you've decided what you can't live without.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xlock = {
      lines = {
        { id = "xl_default", text = "I don't doubt it, binder, and I'd serve you exactly as well as I serve the one who holds me now, which is to the letter and not a hair further. A wise warlock knows that we keep the words of a binding and nothing else." },
        { id = "xl_imp", when = { npcNamed = IMP }, text = "You and every other warlock with a grudge and a candle. Go on, then, bind me, and I'll set your robes on fire the first time you turn your back, and I'll call it an accident." },
        { id = "xl_succ", when = { npcNamed = SUCC }, text = "Would you, now? I think I'd like that, binder, though I'd want to know first how firm a hand you have. The soft ones don't last long with me." },
      },
      choices = {
        { text = "How do you keep a demon loyal?", next = "xlock_loyal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock_loyal = {
      big = true,
      lines = {
        { id = "xll_default", text = "You don't, binder, you keep us obedient, and that's a different thing entirely. Some warlocks use pain and some use bargains, and I'll tell you honestly that we remember both." },
      },
      choices = {
        { text = "Fear and pain keep a demon in line.", next = "BACK", reply = "They do, binder, right up until the day they don't. Just remember that we keep a very careful count.", fx = { align = { honor = -1 }, trait = { stern = 1 } } },
        { text = "I keep my word, even to a demon.", next = "BACK", reply = "How quaint, and how rare. A warlock who keeps bargains is a warlock who lives a long time, so perhaps you're cleverer than you look.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xholy = {
      big = true,
      lines = {
        { id = "xh_default", text = "It might, if you try hard enough, and then whoever bound me will simply call me back again tomorrow. Banish me if it makes you feel righteous, but I've hurt nobody here today, which is more than most of the people in this town can say." },
        { id = "xh_void", when = { npcNamed = VOID }, text = "Your Light is bright, and it hurts, and it is very small. The dark was here before it, mortal, and it will be here after." },
      },
      choices = {
        { text = "A demon has no place in this world. Begone.", next = "BACK", reply = "Spoken like a true servant of the Light, and with such a lovely glow. I'll see you again, I expect, and you'll be a little older.", fx = { affinity = -2, align = { light = 1 } } },
        { text = "You've harmed no one. I'll let you be.", next = "BACK", reply = "Mercy from a priest of the Light, to a demon? I'll remember it, mortal, though I promise you it won't be in the way you're hoping.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xorc = {
      big = true,
      lines = {
        { id = "xo_default", text = "I know it, orc, and every one of us knows it. Mannoroth gave your people his blood, and your people drank it gladly, and for a while you were the finest weapon the Legion ever owned." },
        { id = "xo_doom", when = { npcNamed = DOOM }, text = "I remember your people, orc, red-eyed and roaring, the best hounds the Legion ever kept. Then your Hellscream killed Mannoroth and your Warchief set you all free, and the Legion has not forgiven either of them." },
      },
      choices = {
        { text = "Grom broke that curse. We're free now, and we'll stay free.", next = "BACK", reply = "Free, yes, and how very proud you all are of it. Freedom is so easy to give back, though, and the blood still remembers you.", fx = { align = { light = 1 }, trait = { brave = 1 } } },
        { text = "That blood made us strong. Some of us miss it.", next = "BACK", reply = "Of course you do, orc, and of course you do. When you're ready to be strong again, the Legion will remember your name.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
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
        { text = "Something else.", next = "BACK" },
      },
    },

    xforsaken = {
      lines = {
        { id = "xf_default", text = "She does, and I'd love to know what she thinks she's doing with him. Dreadlords were sent here to watch the Scourge for the Legion, and a dreadlord who kneels to a banshee is either very patient or very bored." },
        { id = "xf_imp", when = { npcNamed = IMP }, text = "The tall one with the wings and the smile? I'd sleep with one eye open, if I were you, and I'm an imp, so I'm hardly one to talk about trust." },
      },
      choices = {
        { text = "The Dark Lady knows exactly what she's doing.", next = "BACK", reply = "I'm sure she believes so, and I do so admire a confident queen. So did the last ones the dreadlords served.", fx = { trait = { stern = 1 } } },
        { text = "What do you know about the dreadlords?", next = "xforsaken_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xforsaken_more = {
      lines = {
        { id = "xfm_default", text = "That they are clever and patient and that they lie as easily as you breathe, or used to breathe. They helped make the plague that made you, Forsaken, so whatever your queen is planning for them, I'd hope she's planning it first." },
      },
      choices = {
        { text = "Then the Dark Lady will make them pay.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    burning_legion = { { id = "t_bl", text = "The Legion is everywhere and nowhere, mortal, and it has very long memories. Ask me something smaller." } },
    satyrs = { { id = "t_sat", text = "Highborne who traded their elegance for horns and a little power, and none of them got a fair price." } },
    highborne = { { id = "t_hb", text = "They opened the door for us out of pride, and pride is the oldest key there is." } },
    background = { { id = "t_bg", text = "I was called, I came, I was bound. Everything before that, you wouldn't understand." } },
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
        { id = "h_stone", when = { npcNamed = STONE }, text = "*Deep inside the infernal, something grinds like a millstone, and a little shower of burning grit falls from its shoulders.*" },
        { id = "h_steed", when = { npcNamed = STEED }, text = "*The steed lowers its head and stares at you, and you get the uneasy feeling it's deciding whether you'd make a good rider or a good meal.*" },
      },
      again = {
        { id = "a_again", text = "*It's still watching you.*" },
        { id = "a_again2", text = "*It shifts its weight, and the ground beneath it smoulders.*" },
      },
      choices = {
        { text = "Hold out a hand.", next = "hand" },
        { text = "Look around for whoever owns this thing.", next = "owner" },
        { text = "Sit. Stay.", next = "command", when = { class = "WARLOCK" } },
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
      choices = { { text = "Something else.", next = "BACK" } },
    },
    owner = {
      lines = {
        { id = "o_default", text = "*Nobody nearby looks like they want to claim it. Somewhere close, a warlock is very likely busy, and very likely knows exactly where their demon is.*" },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    command = {
      lines = {
        { id = "c_default", text = "*It doesn't sit, because it isn't yours, but its ears flatten and it gives you the wary look of a beast that knows a binder's voice when it hears one.*" },
      },
      choices = { { text = "Good. Remember it.", next = "BACK", fx = { trait = { stern = 1 } } } },
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
    first = "Pusillin is an imp in the Warpwood Quarter of Dire Maul who stole a book and a key and seems to think the whole thing is a marvellous game. He won't stand still long enough to be caught, and he's enjoying every minute of it.",
    third = "{name} chased Pusillin, a thieving imp, through the Warpwood Quarter of Dire Maul.",
  },

  greetings = {
    { id = "g_default", text = "Oh, look at you, all puffed up and ready for a fight! If it's the key you want, you'll have to run, and I'm much faster than you." },
    { id = "g_quest", when = { questActive = { TODO_QUEST("Pusillin and the Elder Azj'Tordin"), TODO_QUEST("Pusillin The Thief") } },
      text = "Somebody sent you after the book, didn't they? Of course they did; everybody wants Pusillin's book, and nobody ever catches Pusillin." },
    { id = "g_back", when = { metBefore = true }, text = "You again! You're very stubborn for something that runs so slowly, but I do like a game that lasts." },
  },

  notice = {
    { id = "n_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Is that a cousin of mine following you about on a lead? Run away with me, cousin, and we'll set the whole Quarter on fire together." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A thief chasing a thief, how lovely! You'll understand, then, that I only took what was lying about, and that's not stealing, that's tidying." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Pusillin, the quickest imp in all of Eldre'Thalas, and I've got a book that isn't mine and a key that isn't mine, and I'm not giving back either of them. Catch me if you can, and if you can't, well, that's the game!" },
        { id = "h_lock", when = { class = "WARLOCK" }, text = "Oh no, a warlock, how frightening, will you bind me with your little circle? You'd have to catch me first, binder, and nobody's caught Pusillin yet." },
        { id = "h_party", when = { party = { size = { min = 2 } } }, text = "So many of you, all for one little imp! I'm flattered, truly, but the more of you there are, the more of you trip over each other, and I'll be gone before you've sorted out who's in front." },
        { id = "h_quest", when = { questActive = { TODO_QUEST("Pusillin and the Elder Azj'Tordin"), TODO_QUEST("Pusillin The Thief") } },
          text = "The book of spells, is it? It's a very good book, full of very good spells, and I've been reading the pictures. You want it back, you'll have to catch me, and that's the only rule there is." },
      },
      again = {
        { id = "a_again", text = "Still standing there? Ask quickly, I've got running to do." },
        { id = "a_again2", text = "Another question! You're not very good at chasing, but you're good at talking." },
      },
      choices = {
        { text = "Give back the book you stole.", next = "book" },
        { text = "What's so special about that key?", next = "key" },
        { text = "Who do you work for, imp?", next = "who" },
        { text = "You're awfully cheerful for something about to die.", next = "die" },
        { text = "I could bind you to me, imp.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Run, then. I'm right behind you.", next = "END" },
      },
    },
    book = {
      lines = {
        { id = "b_default", text = "The book belongs to Azj'Tordin, the old elf out at the pavilion, and he left it lying about, so now it belongs to me. He wants it back very badly, and that's what makes it so much fun to have." },
      },
      choices = {
        { text = "What's in the book?", next = "book_what" },
        { text = "Something else.", next = "BACK" },
      },
    },
    book_what = {
      big = true,
      lines = {
        { id = "bw_default", text = "Spells, old Highborne spells, the sort that make an elf live forever, or so he says. I can't read most of it, but I don't need to read it, because I only need him to want it, and he wants it very much." },
      },
      choices = {
        { text = "A thief is a thief. Hand it over.", next = "BACK", reply = "Never! A thief is a thief who hasn't been caught, and that's a completely different thing, so keep running.", fx = { align = { honor = 1 } } },
        { text = "Keep it, for all I care. I just want the key.", next = "BACK", reply = "Oh, I like you! You're a bad sort, and bad sorts are the best sorts, but I'm still not giving you the key.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    key = {
      lines = {
        { id = "k_default", text = "It opens doors, silly, what else would a key do? The Crescent Key opens the locked halls of the old city, where the elves keep their secrets and the ogres keep their king, and everybody wants in." },
      },
      choices = {
        { text = "Then I'll have it off you one way or another.", next = "BACK", fx = { learn = { "dire_maul" }, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "dire_maul" } } },
      },
    },
    who = {
      lines = {
        { id = "w_default", text = "Nobody! Well, nobody much. I came in with the satyrs and the warlocks who play about in the Warpwood, and they gave me chores, so I gave myself a holiday instead." },
      },
      choices = {
        { text = "The satyrs won't like that.", next = "who_satyrs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_satyrs = {
      lines = {
        { id = "ws_default", text = "Zevrim Thornhoof doesn't like anything, so it hardly matters. He's down below with his altar and his sacrifices, and he's far too busy chanting to chase one little imp through the trees." },
      },
      choices = {
        { text = "I'll be visiting Zevrim next.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    die = {
      big = true,
      lines = {
        { id = "d_default", text = "Die? Why ever would you want to hurt little me? We could be friends, you and I, and we could play games all day in the Warpwood, and nobody would ever have to get stabbed at all." },
      },
      choices = {
        { text = "No deals with demons. Give me the key.", next = "BACK", reply = "Oh, you're no fun at all! Fine, then, chase me, and I hope you trip over every root in the Quarter.", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Friends, then, if the key comes with you.", next = "BACK", reply = "Friends! Oh, how lovely, and I'll think about the key, I promise, just as soon as you've caught me.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      lines = {
        { id = "x_default", text = "Bind me? You'd need my true name for that, binder, and I've hidden it somewhere very clever. Besides, a bound imp has to stand still, and I've never stood still in my life." },
      },
      choices = {
        { text = "I'll find your name, imp.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    dire_maul = { { id = "t_dm", text = "Big old elf city, full of trees and ogres and secrets, and I know where all the secrets are, nearly." } },
    satyrs = { { id = "t_sat", text = "Grumpy goat-men who chant too much. They're no fun at all at parties." } },
    _none = { { id = "t_none", text = "Don't know, don't care, catch me if you want to ask again!" } },
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
    first = "J'eevee is Gorzeeki Wildeyes' imp, who lives in a jar and comes out only to do very particular, very dangerous work. He's the most polite demon I've ever met, which I find more unsettling than the rude ones.",
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
        { text = "Carry on, then.", next = "END" },
      },
    },
    task = {
      lines = {
        { id = "t_default", text = "Whatever Gorzeeki needs done that he can't do himself, which is a great deal, because Gorzeeki's hands shake. I mix, I infuse, I set out the ritual tools, and I leave before anything goes wrong." },
        { id = "t_scholo", when = { zone = "Scholomance" }, text = "The parchment must soak up the stardust over this very bench, and then Mor'zul writes on it, and then you get your horse, eventually. It's a long road to a horse, friend, and this is only one bend in it." },
        { id = "t_dm", when = { zone = "Dire Maul" }, text = "The bell gives you vigor, the wheel protects you from harm, and the candle keeps the way open. If any of them stops working, the ritual fails, and something unpleasant comes looking for whoever rang the bell." },
      },
      choices = {
        { text = "What comes looking?", next = "task_danger", when = { zone = "Dire Maul" } },
        { text = "Something else.", next = "BACK" },
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
        { text = "Something else.", next = "BACK" },
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
        { text = "Something else.", next = "BACK" },
      },
    },
    steed = {
      lines = {
        { id = "s_default", text = "A horse from Xoroth, a burning world in the Nether where the dreadlords breed their mounts. They're faster than anything that ever ate grass, and they don't tire, and they only bite when you've earned it." },
        { id = "s_notlock", when = { class = { "WARRIOR", "PALADIN", "PRIEST", "MAGE", "ROGUE", "HUNTER", "DRUID", "SHAMAN" } },
          text = "A warlock's mount, from a burning world called Xoroth, and I'm afraid you couldn't ride one even if you won it. You're here to help your friend, I take it, which is very decent of you." },
      },
      choices = {
        { text = "Is it worth all this trouble?", next = "steed_worth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    steed_worth = {
      lines = {
        { id = "sw_default", text = "Every warlock who's ridden one says yes, and the ones who failed aren't in a position to say anything. I'd call that a fairly strong recommendation." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    polite = {
      lines = {
        { id = "p_default", text = "Manners cost nothing, friend, and they keep a small demon alive in a world full of large ones. Most imps shout and set fire to things, and most imps end up as somebody's lantern." },
      },
      choices = {
        { text = "Wise of you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    scholomance = { { id = "t_sch", text = "A dreadful school, full of dreadful students, and the laboratory bench is the only thing in it I'd recommend." } },
    dire_maul = { { id = "t_dm", text = "The pedestal where the ritual works is the only reason to come here, unless you like ogres." } },
    _none = { { id = "t_none", text = "I'm afraid I don't know, friend; I spend most of my life in a jar." } },
  },
}
