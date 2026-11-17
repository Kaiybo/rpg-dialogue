-- Booty Bay's tradesfolk: Brikk Keencraft (blacksmithing trainer), Fargon Mortalak and Hurklor (the Plate-n-Chain armorers),
-- Grarnik and Blixrez Goodstitch (tailoring trainer; leatherworking supplies), Oglethorpe Obnoticus (gnome engineering trainer).
-- Voice: bibles/booty_bay_trades.md
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Brikk Keencraft
---------------------------------------------------------------------------
P:NPC {
  key = "brikk", id = TODO_NPC("Brikk Keencraft"), name = "Brikk Keencraft",
  title = "Blacksmithing Trainer",
  bible = "bibles/booty_bay_trades.md", role = "trainer", tier = "service",
  communities = { "booty_bay" }, temper = { "brisk", "shrewd" }, values = { "craft", "profit" },
  notices = { "craft", "kit", "race", "purse" },

  impression = {
    first = "Brikk Keencraft is a goblin smith with forearms like knotted rope and not a single hair left on either of them. Brikk priced my sword by the sound of it while we talked, and never once stopped working the bellows.",
    third = "{name} met Brikk Keencraft, the goblin who teaches blacksmithing in Booty Bay and claims to hear a flaw in a blade before it's struck.",
  },

  greetings = {
    { id = "g_forge", text = "Step up, step up, but not too close to the coals, pal, because singed eyebrows aren't covered by the lesson fee. Brikk Keencraft, master of the anvil, at your service and on the clock." },
    { id = "g_back", when = { metBefore = true }, text = "Back at the anvil, eh? Either the last lesson took or you've come to complain, and I'll take your money either way, friend." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away} and you come back wearing that? Sparks and sprockets, the jungle's been chewing on you, and I can hear every dent from here." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde steel, Alliance steel, it all rusts the same in this air, chum, and it all pays the same at my anvil." },
  },

  notice = {
    { id = "n_smith", cat = "craft", when = { profession = { "Blacksmithing", "Mining" } },
      text = "A smith, or near enough! I can tell by the burns on your knuckles, and by the way you looked at my anvil like you wanted to carry it off." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Whoa, whoa, your armor's hanging off you like a wet sail! Get it over to Fargon at the Plate-n-Chain before it falls off and somebody sells it back to you." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf at a goblin's forge! Go on, tell me how they do it in Ironforge, because I keep a tally and you'd make forty-one this year." },
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "That purse clanks like a bag of rivets, pal, and I mean it kindly, because in this town rivets are money and money is everything." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Brikk Keencraft, Blacksmithing Trainer, and the only smith in the South Seas who can hear a crack in a blade before it's even struck. I teach by the lesson and I charge by the lesson, so if you want to learn, start asking and start paying." },
        { id = "h_smith", when = { profession = "Blacksmithing" },
          text = "A working smith, good, because I'm tired of teaching sailors who want to make a horseshoe for luck. You've got the arms of somebody who's swung a hammer, so what do you want to learn first, and how much have you got?" },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf, come all the way to Booty Bay to learn smithing from a goblin? Don't answer that, pal, just keep the story quiet in Ironforge and I'll keep my rates reasonable." },
        { id = "h_orc", when = { race = "Orc" },
          text = "An orc! Your people forge like every blow is starting a war, and I respect it, though I could teach you to start the same war with half the iron and twice the margin." },
        { id = "h_warrior", when = { class = "WARRIOR" },
          text = "A warrior, and look at that edge, chipped like a goblin's teeth. You've been fighting rocks or fighting badly, and either way you're going to need a smith." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "A paladin! You lot buy more plate than anybody and polish it till it shines like a lighthouse, which I'm sure the Bloodsail gunners appreciate." },
        { id = "h_again_day", when = { metBefore = true },
          text = "The tide's in and the forge is hot, which means I'm in a good mood and my rates are up. Ask quick, pal, before one of those changes." },
      },
      again = {
        { id = "h_again", text = "What else? Talk fast, because the iron's cooling and cooled iron is wasted coal." },
        { id = "h_again2", text = "Go on, ask. Every question's free until it turns into a lesson." },
        { id = "h_again3", text = "Still here? Good, because I've still got opinions, and opinions are the only thing I give away." },
      },
      choices = {
        { text = "Teach me what you know.", next = "BUSINESS" },
        { text = "How does a goblin become a master smith?", next = "past" },
        { text = "What's the hardest part of smithing here?", next = "rust" },
        { text = "Who else works iron in Booty Bay?", next = "around" },
        { text = "What are you working on right now?", next = "project" },
        { text = "Armorsmith or weaponsmith, Brikk? Which should I choose?", next = "xspec", when = { profession = "Blacksmithing" } },
        { text = "Ironforge's smiths are the finest in the world, goblin.", next = "k_dwarf", when = { race = "Dwarf" } },
        { text = "Do you ever forge parts for engineers?", next = "k_gnome", when = { race = "Gnome" } },
        { text = "What makes a blade last in this jungle?", next = "xwar", when = { class = "WARRIOR" } },
        { text = "Does polished plate really draw Bloodsail fire?", next = "xpala", when = { class = "PALADIN" } },
        { text = "Can you put a better edge on my daggers?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Have you ever forged beside a shaman's fire?", next = "xsham", when = { class = "SHAMAN" } },
        { text = "Do Nesingwary's hunters bring you their rifles?", next = "xhunt", when = { class = "HUNTER" } },
        { text = "I'll leave you to your forge.", next = "END" },
      },
    },

    -- Where Brikk came from
    past = {
      lines = { { id = "pa_default", text = "An Undermine foundry, pal, where I pumped bellows for a Cartel smithy from the age of six for a copper a day and a bowl of fish-head soup. I lost my eyebrows the first week and they never came back, so I figured I might as well stay in the trade that took 'em." } },
      choices = {
        { text = "Six years old? That's a hard start.", next = "past_foundry" },
        { text = "Why leave Undermine for Booty Bay?", next = "past_leave" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    past_foundry = {
      lines = { { id = "paf_default", text = "Hard? It was an education, chum, and the only one I ever got without paying for it, which is why I charge for mine now. The old smith there said a goblin who can't hear the iron should go into banking, and I've been listening to iron ever since." } },
      choices = {
        { text = "What does iron sound like when it's wrong?", next = "past_ear" },
        { text = "And then you came south?", next = "past_leave" },
      },
    },
    past_ear = {
      lines = { { id = "pae_default", text = "A good blade rings like a bell on a calm morning, and a flawed one goes flat, like a cousin who owes you money and hopes you won't bring it up. I can hear it across the room, and that's why the Blackwater captains bring their cutlasses to me before they buy from anybody." } },
      choices = {
        { text = "That's a rare gift, Brikk.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Then I'll bring my blades to you first.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    past_leave = {
      lines = { { id = "pal_default", text = "The Baron offered me the forge contract for the whole cove: every anchor chain, every cannon bracket and every hinge on every door. In Undermine I was one smith in a thousand, and here I'm the one, and a goblin who can't do that sum shouldn't be in business." } },
      choices = {
        { text = "A bigger share of a smaller pond. Smart.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 }, learn = { "steamwheedle" } } },
        { text = "Do you miss Undermine at all?", next = "past_miss" },
      },
    },
    past_miss = {
      lines = { { id = "pam_default", text = "I miss the noise, pal, because Undermine never sleeps and the hammers never stop, and down here it gets so quiet at night I can hear the sharks circling. I'd never go back, mind, because back there I'd be paying rent to somebody." } },
      choices = { { text = "Something else, then.", next = "BACK" } },
    },

    -- Rust
    rust = {
      lines = { { id = "ru_default", text = "The salt, chum, the salt in the air, which eats iron faster than a Bruiser eats a free lunch. Leave a blade on a table overnight in this cove and it's got freckles by breakfast and a beard by the end of the week." } },
      choices = {
        { text = "How do you fight it?", next = "rust_fight" },
        { text = "Doesn't that hurt your business?", next = "rust_biz" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rust_fight = {
      lines = { { id = "ruf_default", text = "Oil, wax, a good quench and a customer who actually wipes the blade, which is the rarest of the four. I've got a sea-iron method that holds up longer than anything north of Grom'gol, and I'll teach it when you've earned it, at the going rate." } },
      choices = {
        { text = "Sea-iron? Where did you learn that?", next = "rust_secret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rust_secret = {
      lines = { { id = "rus_default", text = "That's a trade secret, pal, and trade secrets cost extra, but I'll give you the first ingredient for nothing: patience, which most of my students can't afford. The rest I'll take to my grave or to the highest bidder, whichever turns up first." } },
      choices = {
        { text = "I'll keep my coin ready, then.", next = "BACK", fx = { trait = { patient = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    rust_biz = {
      big = true,
      lines = { { id = "rub_default", text = "Hurt it? Rust is the best friend a goblin smith ever had, because a blade that rusts comes back to the anvil, and a blade that comes back is money twice. Some smiths build to last and some build to come back, and I'll let you guess which sort eats better." } },
      choices = {
        { text = "A smith's name is on every blade. Build it to last.", next = "rust_which", fx = { align = { honor = 1 } } },
        { text = "Build it to come back. That's just good business.", next = "rust_which", fx = { align = { honor = -1 } } },
        { text = "Which sort are you, Brikk?", next = "rust_which" },
      },
    },
    rust_which = {
      lines = { { id = "ruw_default", text = "I build to last, if you must know, and it costs me a fortune in repeat customers, which my cousin calls the worst decision in the family's history. But my mark goes on the tang, pal, and I'll not have my mark on a blade that snaps on a Blackwater sailor halfway through a boarding." } },
      choices = {
        { text = "That's a good mark to carry.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The iron trade (sub-hub)
    around = {
      hub = true,
      lines = { { id = "ar_default", text = "Iron in this cove goes through three pairs of hands: Jansen sells the bars, I teach the smithing, and the armorers at the Plate-n-Chain hammer it into something you can wear. Then there's Kizz with the maces and Zarena with the fancy steel, and everybody's in everybody's ledger." } },
      again = {
        { id = "ar_again", text = "Who else? I've got an opinion on every hammer in the Bay." },
        { id = "ar_again2", text = "Name another, pal, the gossip's on the house." },
      },
      choices = {
        { text = "What about Jansen Underwood?", next = "jansen" },
        { text = "Tell me about the Plate-n-Chain.", next = "plate" },
        { text = "And Zarena Cromwind?", next = "zarena" },
        { text = "Does the Baron ever come down to the forge?", next = "baron" },
        { text = "Enough about the neighbors.", next = "hello" },
      },
    },
    jansen = {
      lines = { { id = "ja_default", text = "Jansen's a human from the north, slow as cold tar and honest as a scale, which is a combination you don't find twice in Booty Bay. I buy his coal and his bars, and I've never once caught him short-weighting me, which frankly makes me nervous." } },
      choices = {
        { text = "Nervous? Of an honest man?", next = "jansen_honest" },
        { text = "Someone else.", next = "BACK" },
      },
    },
    jansen_honest = {
      lines = { { id = "jah_default", text = "Of course, pal, because an honest man in a goblin port is either a saint or the longest swindle I've ever seen, and I can't work out which. I've been watching him for six years, and I'll let you know." } },
      choices = {
        { text = "Maybe he's just honest, Brikk.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Keep watching him. Nobody's that clean.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    plate = {
      lines = { { id = "pl_default", text = "Fargon and Hurklor, just along the boardwalk. Fargon's a human with hands like a surgeon and a face like a funeral, and Hurklor's the biggest, quietest armorer I've ever met, and between them they turn out plate I'd almost pay full price for." } },
      choices = {
        { text = "Almost? What's wrong with it?", next = "plate_fault" },
        { text = "Someone else.", next = "BACK" },
      },
    },
    plate_fault = {
      lines = { { id = "plf_default", text = "Nothing's wrong with it, chum, and that's what bothers me, because Fargon learned the trade in some soldier's column up north and won't tell me a single trick. I've offered him money, I've offered him rum, and once I offered him my cousin's hand, and he turned down all three." } },
      choices = {
        { text = "How did your cousin take that?", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Someone else.", next = "BACK" },
      },
    },
    zarena = {
      lines = { { id = "za_default", text = "Zarena Cromwind sells the finest new weapons in the Bay and charges like it, and she buys her edges from nobody, which is a crying shame for my ledger. She's a fine smith, I'll grant her that, though I'll not say it where she can hear." } },
      choices = {
        { text = "You two sound like rivals.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Someone else.", next = "BACK" },
      },
    },
    baron = {
      big = true,
      lines = { { id = "bn_default", text = "Twice a year, to look over the brackets that hold the shark's jaws above the gate, because I forged every one of 'em and he likes to know they're still holding. He also had me forge leg irons for the Bloodsail prisoners, and I did, and I charged him double for the smell." } },
      choices = {
        { text = "Chaining men for coin is ugly work, Brikk.", next = "baron_jaws", fx = { align = { light = 1 } } },
        { text = "They're pirates. Sell the Baron all the irons he wants.", next = "baron_jaws", fx = { align = { light = -1 }, learn = { "bloodsail" } } },
        { text = "You forged the brackets over the gate?", next = "baron_jaws" },
      },
    },
    baron_jaws = {
      lines = { { id = "bj_default", text = "That shark was longer than a longboat, pal, and the jaws alone weigh more than the Baron's pride, which is saying something. If my brackets ever fail they'll come down on whoever's walking in, so I check 'em myself every month and I never stand under 'em longer than I have to." } },
      choices = {
        { text = "I'll walk faster through that gate from now on.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The anchor
    project = {
      lines = { { id = "pj_default", text = "An anchor for one of the Blackwater captains, the biggest I've ever forged, and I'm charging by the pound, which he's going to regret when he sees it. The last one I made went straight through a hull on the trial drop, and nobody even lost a toe." } },
      choices = {
        { text = "Through the hull? How?", next = "project_hull" },
        { text = "Something else.", next = "BACK" },
      },
    },
    project_hull = {
      lines = { { id = "pjh_default", text = "Too much anchor and not enough rope, pal, and a deckhand who wanted to show off by tossing it over himself. The ship settled in the shallows, the captain sued, and the Baron ruled that the anchor had worked perfectly, which is the finest decision I ever paid a court fee for." } },
      choices = {
        { text = "A court fee? You paid the Baron to win?", next = "project_fee" },
        { text = "That's the most goblin story I've heard.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    project_fee = {
      big = true,
      lines = { { id = "pjf_default", text = "I paid a court fee, a reasonable one, and the court happened to be the Baron, and so did the fee. That's how justice works in this town, chum, and it's a sight quicker than anywhere else I've been." } },
      choices = {
        { text = "Quick justice keeps the peace. The Baron's way works.", next = "BACK", fx = { align = { order = 1 }, learn = { "steamwheedle" } } },
        { text = "Justice that's bought isn't justice at all.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Who the player is
    xspec = {
      lines = { { id = "xs_default", text = "Armor or weapons, that's the old question, and the answer's whichever one your customers are buying. In this cove it's weapons, pal, because pirates replace their cutlasses every month and their breastplates never, on account of how they don't wear any." } },
      choices = {
        { text = "Then I'll follow the coin.", next = "BACK", fx = { trait = { greedy = 1 } } },
        { text = "I'll follow what I love, not what sells.", next = "BACK", fx = { affinity = 1, trait = { proud = 1 } } },
      },
    },
    k_dwarf = {
      big = true,
      lines = { { id = "kd_default", text = "The finest? Maybe, pal, but also the slowest, because a dwarf will spend a week on a blade I'd finish by lunch and sell by supper. Tell me which of us has more blades out in the world, and then tell me who's the better smith." } },
      choices = {
        { text = "Slow work is honest work. Ironforge has it right.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Speed sells. Ironforge could learn something from you.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else, Brikk.", next = "BACK" },
      },
    },
    k_gnome = {
      lines = { { id = "kg_default", text = "Every week, because the engineers need casings and brackets and bolts, and Oglethorpe up the way orders his parts in measurements so small I need a jeweler's glass to read them. He pays on time, though, which makes him my favorite gnome by a long way." } },
      choices = {
        { text = "I'll go and meet this Oglethorpe.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwar = {
      big = true,
      lines = { { id = "xw_default", text = "A good quench, a thick spine and a warrior who doesn't use it to pry open crates, which is how most of 'em end up at my anvil. You'd be amazed how many fine blades in this town died opening a box of rum." } },
      choices = {
        { text = "A blade is for fighting. I treat mine with respect.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If it can't open a crate, it's not much of a blade.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpala = {
      big = true,
      lines = { { id = "xp_default", text = "From a mile out, pal, the Bloodsail gunners can see a polished breastplate glinting on the docks, and they aim for the shine first. I've told a dozen paladins to dull it down with lampblack, and every one of 'em looked at me like I'd asked them to spit in a chapel." } },
      choices = {
        { text = "The Light's servants don't hide. Let them aim.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Lampblack it is. Pride won't help a dead paladin.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xr_default", text = "Let's have a look, then. Somebody's been sharpening these on a river stone, pal, and I can tell because they're sharp on one side and a disgrace on the other." } },
      choices = {
        { text = "Then teach me to sharpen them properly.", next = "BUSINESS" },
        { text = "A river stone beats no edge at all.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    xsham = {
      lines = { { id = "xsh_default", text = "Once, and only once, a Darkspear shaman stood beside my forge and asked the fire to burn hotter, and it did, and it also burned down my awning and half of Kizz's stall. Kizz sent me the bill, I sent it to the shaman, and the shaman sent back a very polite letter saying the fire had its own opinions." } },
      choices = {
        { text = "Fire has a will of its own. Ask it politely.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunt = {
      lines = { { id = "xh_default", text = "When the jungle rot gets into the barrels, aye, and they pay in pelts, which I then have to sell to Blixrez Goodstitch at a loss. Never take payment in hides from a hunter, pal, because the hunter always knows what they're worth and you never do." } },
      choices = {
        { text = "Hunters drive a hard bargain. It's true.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know iron, I know who's selling it, and I know which smith in this town is lying about their quench. Ask away, pal." } },
    background = { { id = "tp_bg", text = "Undermine foundry brat, bellows boy, journeyman, master, and now the Baron's own smith, and I paid for every step myself.", next = "past" } },
    advice = { { id = "tp_ad", text = "Wipe your blade every night, chum, every single night, or the salt will do my job for me and I'll be glad of it." } },
    bloodsail = { { id = "tp_bloodsail", text = "I won't sell the red sashes so much as a nail, though I'll happily forge the irons they end up wearing." } },
    steamwheedle = { { id = "tp_steam", text = "The Cartel pays its smiths on time and charges them on time, and I've never once been late on either." } },
    _none = { { id = "tp_none", text = "Can't hammer it, can't quench it, can't sell it, so I don't know a thing about it, pal." } },
  },
}

---------------------------------------------------------------------------
-- Fargon Mortalak
---------------------------------------------------------------------------
P:NPC {
  key = "fargon", id = TODO_NPC("Fargon Mortalak"), name = "Fargon Mortalak",
  title = "Superior Armorer",
  bible = "bibles/booty_bay_trades.md", role = "blacksmith", tier = "service",
  communities = { "booty_bay" }, temper = { "dry", "stern" }, values = { "craft", "honest" },
  notices = { "kit", "race", "class" },

  impression = {
    first = "Fargon Mortalak is a grey, weathered human armorer who looks at a customer the way a quartermaster looks at a recruit. He measured my shoulders with his eyes before I'd said a word, and he didn't seem to like what he found.",
    third = "{name} met Fargon Mortalak, a human armorer at the Plate-n-Chain in Booty Bay who once fitted soldiers for Colonel Kurzen's column.",
  },

  greetings = {
    { id = "g_shop", text = "Welcome to the Plate-n-Chain, and yes, I know what the sign says, because the landlord's a goblin and he chose it. I'm Fargon Mortalak, the armorer, so stand still and let me look at the fit of you." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and still breathing, which I'll take as a compliment to whoever made your armor. Come in out of the sun, soldier." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the jungle has been at your straps the whole time, by the look of them. Come in and let me see the damage." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde, is it? Come in, then, because the Baron's peace holds in this shop the same as anywhere on the boardwalk, and I fit every customer the same way." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your armor is held together by habit and not much else, soldier. Another fight in that and you'll be fighting in your shirt." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "A human face in this shop is a rare thing, and I'll admit it does me good to hear an accent from the north." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren! I'll need more strap leather than I've got on the bench for you, and Hurklor will be pleased, because he likes customers who make him feel small." },
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "Where on earth is your armor? If the Bloodsail took it off you, they owe me a commission, because half of what they wear came off my customers." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Fargon Mortalak, armorer, and partner to Hurklor, who does the lifting while I do the fretting. Everything on the walls is plate or mail, fitted to the body that wears it, and nothing leaves this shop until it sits right." },
        { id = "h_warrior", when = { class = "WARRIOR" },
          text = "A warrior, and you're wearing your breastplate a full finger too low, which tells me whoever fitted it was in a hurry or drunk. Come into the light, soldier, and I'll show you what I mean." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "A paladin, and polished to a shine, as always. I fitted a good many of your order in the old days, and not one of them ever stood still long enough for the buckles." },
        { id = "h_human", when = { race = "Human" },
          text = "Stormwind, or Lordaeron before that, by your voice. Come in, friend, and forgive me for staring, because I don't hear the north much down here." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Come in, and mind the doorframe, because Hurklor rebuilt it taller and I still haven't got used to it. I fit Horde and Alliance alike in this shop, and I fit them all properly." },
        { id = "h_caster", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
          text = "A spellcaster in an armor shop. I'll warn you now, friend, there's nothing on these walls that weighs less than a sack of flour." },
      },
      again = {
        { id = "h_again", text = "What else, soldier? I've a fitting at sundown, so there's time." },
        { id = "h_again2", text = "Go on. Hurklor's hammering, so you'll have to speak up." },
      },
      choices = {
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "How did a northern man end up here?", next = "past" },
        { text = "What's the secret to good armor here?", next = "fit" },
        { text = "Tell me about Hurklor.", next = "hurklor" },
        { text = "Why call the shop Plate-n-Chain?", next = "sign" },
        { text = "You sell plate to the Horde, human?", next = "k_horde", when = { faction = "Horde" } },
        { text = "Do you ever miss the north, Fargon?", next = "k_human", when = { race = "Human" } },
        { text = "Who taught you to set a rivet like that?", next = "k_dwarf", when = { race = "Dwarf" } },
        { text = "How should a warrior wear plate in this heat?", next = "xwar", when = { class = "WARRIOR" } },
        { text = "Fit my plate as you would a knight's.", next = "xpala", when = { class = "PALADIN" } },
        { text = "Is mail worth wearing in this jungle?", next = "xmail", when = { class = { "HUNTER", "SHAMAN" } } },
        { text = "I don't wear plate. Anything here for me?", next = "xleather", when = { class = { "ROGUE", "DRUID" } } },
        { text = "Why did you sigh when I came in?", next = "xcloth", when = { class = { "MAGE", "PRIEST", "WARLOCK" } } },
        { text = "Good day, Fargon.", next = "END" },
      },
    },

    -- His past: Kurzen's column
    past = {
      lines = { { id = "pa_default", text = "I was armorer to Colonel Kurzen's column when it marched into this jungle, fitting soldiers who came to fight trolls and stayed to fight each other. When the Colonel stopped making sense, I packed my tools and walked south along the coast until I smelled goblin cooking." } },
      choices = {
        { text = "What became of Kurzen's men?", next = "past_kurzen" },
        { text = "So you deserted?", next = "past_desert" },
        { text = "Something else.", next = "BACK" },
      },
    },
    past_kurzen = {
      lines = { { id = "pak_default", text = "Some followed him into that compound and some went with Lieutenant Doren to the rebel camp, and both lots still wear the plate I fitted them, I'd wager. I see it sometimes on the bodies the hunters drag out of the hills, and I know my own rivets." } },
      choices = {
        { text = "That must be a hard thing to see.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 }, learn = { "kurzen" } } },
        { text = "And you're the only one who walked away?", next = "past_desert", fx = { learn = { "kurzen" } } },
      },
    },
    past_desert = {
      big = true,
      lines = { { id = "pad_default", text = "I walked away, and you can call it deserting if you like, soldier, because I've called it worse on bad nights. I swore to fit the King's soldiers, not to arm a madman, and I've never found a better answer than the one my feet gave me." } },
      choices = {
        { text = "An oath to a madman binds nobody. You chose right.", next = "past_looking", fx = { align = { order = -1 } } },
        { text = "A soldier stays with his column, mad colonel or not.", next = "past_looking", fx = { align = { order = 1 } } },
        { text = "Did anyone ever come looking for you?", next = "past_looking" },
      },
    },
    past_looking = {
      lines = { { id = "pal_default", text = "Not once, which tells you how well Stormwind remembers the men it sends into this jungle. The Baron asked my name the day I arrived and what I could make, and the second question interested him a great deal more than the first." } },
      choices = {
        { text = "Stormwind's loss, then.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Fit
    fit = {
      lines = { { id = "fi_default", text = "Fit, fit and fit again, because armor that doesn't fit is just a heavy way to get killed. In this heat a loose plate rubs a man raw inside a week and a tight one cooks him, so I fit every piece to the body that walks in, and I won't sell off the rack to anyone in a hurry." } },
      choices = {
        { text = "How do you keep a man from cooking in plate?", next = "fit_heat" },
        { text = "That sounds slow for a goblin town.", next = "fit_slow" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fit_heat = {
      lines = { { id = "fh_default", text = "Linen padding, never wool, and soaked in seawater before a march so it cools as it dries, which is a trick I learned from a troll scout in Kurzen's column. He laughed at our wool for a month before he told us, and I've never quite forgiven him for the month." } },
      choices = {
        { text = "Seawater in the padding. I'll try it.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fit_slow = {
      big = true,
      lines = { { id = "fs_default", text = "It is slow, and the goblins hate it, because every customer I keep waiting might walk to Zarena or Kizz instead. But a man who buys his armor in a hurry gets buried in a hurry, and I'd rather lose the sale." } },
      choices = {
        { text = "Your standard matters more than any sale. Keep it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A lost sale is a lost sale. Work faster.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Hurklor
    hurklor = {
      lines = { { id = "hu_default", text = "Hurklor holds the plates while I rivet, and holds them steadier than any vise I've ever owned, which is a fine thing in a partner and a rare one. He doesn't say much, but he can hear a bad rivet the way Brikk hears a bad blade, and that's how I knew to keep him." } },
      choices = {
        { text = "How did you two meet?", next = "hurklor_met" },
        { text = "Does he ever talk?", next = "hurklor_talk" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hurklor_met = {
      lines = { { id = "hum_default", text = "On the docks, the week I arrived, when a crane chain snapped and Hurklor caught a crate of cannonballs before it landed on my head. I bought him a rum to thank him, he asked whether I needed a pair of hands, and he's been holding my plates for nine years since." } },
      choices = {
        { text = "So he saved your life.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hurklor_talk = {
      lines = { { id = "hut_default", text = "When there's something worth saying, which is more than I can say for most of this town. Ask him about his crab if you want to see him smile, but don't bring up the Bruisers, because that's a sore spot." } },
      choices = {
        { text = "Why are the Bruisers a sore spot?", next = "hurklor_bruisers" },
        { text = "I'll ask him about the crab.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    hurklor_bruisers = {
      lines = { { id = "hub_default", text = "They turned him down for the Baron's guard, and the reason they gave was that he's too gentle, which in a Bruiser is apparently a flaw. He laughed about it, but he's never walked past their post since without looking at the ground." } },
      choices = {
        { text = "Their loss was your gain, Fargon.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The sign
    sign = {
      lines = { { id = "si_default", text = "Our landlord is a goblin who owns half this boardwalk, and he said 'Mortalak and Hurklor' sounded like an undertaker's, which I suppose it does. Plate-n-Chain was his idea, he painted it himself, and he charges us a sign fee every month for the privilege." } },
      choices = {
        { text = "A fee for a sign you didn't want?", next = "sign_fee" },
        { text = "I rather like the name.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    sign_fee = {
      lines = { { id = "sf_default", text = "Welcome to Booty Bay, soldier, where you pay for the roof, the sign, the shade under the sign and the right to complain about all three. I've stopped arguing, because the arguing is billed as well." } },
      choices = {
        { text = "That's very goblin.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Who the player is
    k_horde = {
      big = true,
      lines = { { id = "kh_default", text = "I do, and I fit an orc as carefully as I'd fit a knight of Stormwind, because a rivet doesn't know whose side it's on. I fought your people in the last war, and the plate I sell you may one day stand against men I trained beside, and I've made my peace with that, mostly." } },
      choices = {
        { text = "The peace here is worth keeping. I'll honor it.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Peace or not, I remember who fought whom.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, human.", next = "BACK" },
      },
    },
    k_human = {
      lines = { { id = "khu_default", text = "Whenever a merchantman comes in from the north and the sailors talk about the canals, I miss it. But Stormwind sent me to this jungle and forgot me, so I'll miss it from here, with a rum, and that's the end of it." } },
      choices = {
        { text = "Stormwind still remembers its soldiers, Fargon.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_dwarf = {
      lines = { { id = "kdw_default", text = "A dwarf of Ironforge taught me, in the barracks of Lordaeron during the Second War, and he cuffed me every time I set a rivet crooked. I've still got the lump on my head to prove it, and I'd buy him a drink if I knew where he'd got to." } },
      choices = {
        { text = "He taught you well.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwar = {
      big = true,
      lines = { { id = "xw_default", text = "Loose at the joints, padded in linen, and the helm off whenever you're not fighting, which most warriors hate because they think they look smaller without it. Vanity killed more of Kurzen's men than trolls ever did, soldier, and I'd say the same to any warrior who'd listen." } },
      choices = {
        { text = "Discipline over vanity. I'll do as you say.", next = "BACK", fx = { align = { order = 1 }, learn = { "kurzen" } } },
        { text = "I'll wear my helm however I please.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpala = {
      lines = { { id = "xpa_default", text = "A paladin's plate is half armor and half sermon, and I've fitted enough of your order to know you care more for how it shines than how it sits. You're carrying that pauldron like a penance, so let me look at your shoulders before you go." } },
      choices = {
        { text = "Fit it properly, then.", next = "BUSINESS", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmail = {
      lines = { { id = "xm_default", text = "Mail breathes better than plate, which counts for a great deal in this jungle, but it rusts like a guilty conscience and the links pinch where you'd least want them to. Oil it every night and wear a good gambeson under it, and it'll serve you to the end of the season." } },
      choices = {
        { text = "I'll oil it every night.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xleather = {
      lines = { { id = "xl_default", text = "Then you're in the wrong shop, friend, and the right one is Blixrez Goodstitch's tannery, if you can stand the smell. Tell the goblin I sent you, and don't let anyone sell you crocolisk hide at tiger prices." } },
      choices = {
        { text = "Thank you for the warning.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcloth = {
      lines = { { id = "xc_default", text = "Because casters come in, look at the plate, ask how much it weighs and walk straight out again. I sigh in advance to save us both the trouble, though you're welcome to look around." } },
      choices = {
        { text = "I was only curious, Fargon.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know plate and mail, I know the jungle, and I know what Kurzen's column looked like before it went bad. Ask me about any of it." } },
    background = { { id = "tp_bg", text = "I was armorer to Kurzen's column, and I walked away from it, and I've been fitting armor in Booty Bay ever since.", next = "past" } },
    advice = { { id = "tp_ad", text = "Linen under your plate, never wool, and have it fitted by somebody who isn't in a hurry." } },
    kurzen = { { id = "tp_kurzen", text = "I fitted half the men in that compound, and I'd rather not think about who's wearing my work up there now." } },
    _none = { { id = "tp_none", text = "That's not armor and it's not the jungle, soldier, so I've nothing useful to tell you." } },
  },
}

---------------------------------------------------------------------------
-- Hurklor
---------------------------------------------------------------------------
P:NPC {
  key = "hurklor", id = TODO_NPC("Hurklor"), name = "Hurklor",
  title = "Plate-n-Chain",
  bible = "bibles/booty_bay_trades.md", role = "blacksmith", tier = "service",
  communities = { "booty_bay" }, temper = { "calm", "plain" }, values = { "loyal", "patient" },
  notices = { "pet", "kit" },

  impression = {
    first = "Hurklor is the biggest armorer I've ever met and very nearly the gentlest person in Booty Bay. He talks slowly, as if every word had to be lifted, and he keeps a hermit crab in an old helm on the end of his bench.",
    third = "{name} met Hurklor, the quiet armorer who holds the plates for Fargon Mortalak at the Plate-n-Chain and keeps a crab named Rivet.",
  },

  greetings = {
    { id = "g_default", text = "Hello. Fargon is fitting somebody in the back, so you will have to talk to me, and I hope that is all right." },
    { id = "g_back", when = { metBefore = true }, text = "You came back. Rivet will be glad, because he likes the people who come back." },
    { id = "g_away", when = { away = 14 }, text = "You were gone {away}. I wondered about you sometimes, when I was hammering, and I am glad you are not one of the ones who stays in the jungle." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde or Alliance, it makes no difference at this bench, because everybody's armor dents the same way." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your {pet} has a good face. Rivet does not like big animals, though, so please keep it away from the helm at the end of the bench." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your armor is full of dents, and I can hear them when you walk. I would like to fix them, if Fargon says I can." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Hurklor, and I work here with Fargon. I hold the plates and he sets the rivets, and between us we make armor that keeps people alive, which is a good kind of work." },
        { id = "h_warrior", when = { class = "WARRIOR" },
          text = "You have a dent in your breastplate right over the heart. Somebody tried very hard to kill you and the armor said no, so you should thank whoever made it." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "Oh, good, somebody who has to duck under the door like me. Fargon made the frame taller for me, so you will fit too, and you do not need to stoop in here." },
        { id = "h_rivet", when = { metBefore = true },
          text = "Rivet changed helms last night and moved into the old dented one at the end. Fargon says that is a bad omen, but I think Rivet just likes the room." },
      },
      again = {
        { id = "h_again", text = "Is there more? I am in no hurry." },
        { id = "h_again2", text = "Ask me something else. The hammering can wait a little while." },
      },
      choices = {
        { text = "What can I buy here?", next = "BUSINESS" },
        { text = "What's living in that helm on the bench?", next = "rivet" },
        { text = "How long have you worked with Fargon?", next = "fargon" },
        { text = "You look strong enough to be a Bruiser.", next = "bruisers" },
        { text = "What do you do with all the dents?", next = "dents" },
        { text = "Who would win a fight, you or me?", next = "xwar", when = { class = "WARRIOR" } },
        { text = "Have you ever wanted to take up a hammer to fight?", next = "xpala", when = { class = "PALADIN" } },
        { text = "Do you ever pray while you work?", next = "xpriest", when = { class = "PRIEST" } },
        { text = "Would Rivet like to meet my pet?", next = "xhunt", when = { class = "HUNTER" } },
        { text = "Doesn't all that hammering hide anyone sneaking about?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "You must be stronger than ten gnomes.", next = "k_gnome", when = { race = "Gnome" } },
        { text = "Goodbye, Hurklor.", next = "END" },
      },
    },

    -- Rivet the crab
    rivet = {
      lines = { { id = "ri_default", text = "That is Rivet. He is a hermit crab, and he lives in an old helmet, because he grew too big for his shell and I had a helmet nobody wanted." } },
      choices = {
        { text = "Where did you find him?", next = "rivet_found" },
        { text = "Doesn't Fargon mind a crab in the shop?", next = "rivet_fargon" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rivet_found = {
      lines = { { id = "rif_default", text = "Under the pier, two years ago, when the tide went out and left him on the stones without a shell. A gull wanted him, so I picked him up first, and now he sleeps in a helm that cost more than most sailors' boots." } },
      choices = {
        { text = "You saved him from the gull. That was kind.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "A crab in a helm. He's living well.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    rivet_fargon = {
      lines = { { id = "rifa_default", text = "Fargon says a crab in an armor shop is bad for business. But he feeds Rivet bits of fish when he thinks I am not looking, so I do not believe him." } },
      choices = {
        { text = "Ha! Fargon's softer than he looks.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Fargon
    fargon = {
      lines = { { id = "fa_default", text = "Nine years. I caught a crate that was falling on him at the docks, and he bought me a rum, and then he gave me a job, and I have never had a better trade than that one." } },
      choices = {
        { text = "What's he like to work for?", next = "fargon_like" },
        { text = "Did you know anything about armor then?", next = "fargon_learn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fargon_like = {
      lines = { { id = "fal_default", text = "Strict about rivets and soft about everything else, though he would not want you to know the second part. Some nights he talks about the jungle and the soldiers he left up there, and I just listen, because I think that is what he needs." } },
      choices = {
        { text = "You're a good friend to him, Hurklor.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 }, learn = { "kurzen" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fargon_learn = {
      lines = { { id = "fale_default", text = "Nothing at all. I knew how to lift things and how to keep quiet, and Fargon said that was half of armoring already, but the other half took me four years and I am still learning the finishing." } },
      choices = {
        { text = "Four years is a long apprenticeship.", next = "BACK", fx = { trait = { patient = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The Bruisers
    bruisers = {
      big = true,
      lines = { { id = "bru_default", text = "I asked them once, and the captain laughed and said I was too gentle to be a Bruiser, because I told him I would rather walk a drunk sailor home than throw him off the pier. Maybe he was right, but I still think talking is better than throwing, most of the time." } },
      choices = {
        { text = "You were right. Gentleness is a strength, not a flaw.", next = "bruisers_still", fx = { align = { light = 1 } } },
        { text = "A guard has to hit hard. The captain was right.", next = "bruisers_still", fx = { align = { light = -1 } } },
        { text = "Do you still want to join them?", next = "bruisers_still" },
      },
    },
    bruisers_still = {
      lines = { { id = "brs_default", text = "Not any more, I think. The Bruisers keep the town safe, and the armor we make keeps the Bruisers safe, so in a way I am still guarding the Bay, only from behind a bench." } },
      choices = {
        { text = "That's a good way to see it.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Dents
    dents = {
      lines = { { id = "de_default", text = "I hammer them out from the inside, slowly, with a round hammer and a sandbag, because if you go fast the metal gets angry and cracks. Every dent tells me what happened to the person, and I like to think about them while I work." } },
      choices = {
        { text = "What do the dents tell you?", next = "dents_tell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dents_tell = {
      lines = { { id = "det_default", text = "A dent at the front is a brave person, and a dent at the back is a person who ran, and a dent on the side is somebody who was surprised. Most dents in Booty Bay are on the side, because pirates do not fight fair." } },
      choices = {
        { text = "Mine are all at the front, I hope.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "I'd rather be surprised than dead.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },

    -- Who the player is
    xwar = {
      lines = { { id = "xw_default", text = "You would win, I think, because you know how to fight and I only know how to lift. But I could carry you home afterwards, and that is a skill too." } },
      choices = {
        { text = "That's a skill every warrior needs a friend for.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpala = {
      lines = { { id = "xp_default", text = "Fargon asked me that once, and I said I would rather fix the armor than make the dents. Paladins do both, I think, and I do not know how you decide which one to do on a given day." } },
      choices = {
        { text = "The Light shows me which, Hurklor.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "Some days I don't know either.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xpriest = {
      lines = { { id = "xpr_default", text = "I do not know any prayers, but I say the customer's name over every rivet, if I know it. Fargon thinks it is silly, but nobody wearing our armor has come back dead yet, so I keep doing it." } },
      choices = {
        { text = "That's a kind of prayer, Hurklor.", next = "BACK", fx = { affinity = 2, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunt = {
      lines = { { id = "xh_default", text = "No, I think he would hide in the helm and not come out until supper, which is what he did when the Baron's parrot landed on the bench. Your animal is welcome to look at him, though, from over there." } },
      choices = {
        { text = "We'll keep our distance.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xr_default", text = "Fargon says a thief could walk right through the shop while I am hammering and I would never hear. So I keep Rivet on the bench, because he clicks his claws when somebody strange comes close." } },
      choices = {
        { text = "A crab for a watchdog. Clever.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_gnome = {
      lines = { { id = "kg_default", text = "I have never tried to lift ten gnomes, but I lifted Oglethorpe once, when one of his machines chased him down the boardwalk. He was very cross with me, and he said the machine was only being friendly." } },
      choices = {
        { text = "That sounds like a gnome engineer.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know dents, and rivets, and Fargon, and Rivet. That is not very much, but I know them well." } },
    background = { { id = "tp_bg", text = "I worked on the docks lifting crates, and then I caught one, and then I worked for Fargon.", next = "fargon" } },
    advice = { { id = "tp_ad", text = "Do not let anybody fix your dents in a hurry. The metal remembers being rushed." } },
    _none = { { id = "tp_none", text = "I do not know about that. Fargon might, or Rivet, but Rivet will not tell you." } },
  },
}

---------------------------------------------------------------------------
-- Grarnik Goodstitch
---------------------------------------------------------------------------
P:NPC {
  key = "grarnik", id = TODO_NPC("Grarnik Goodstitch"), name = "Grarnik Goodstitch",
  title = "Tailoring Trainer",
  bible = "bibles/booty_bay_trades.md", role = "trainer", tier = "service",
  communities = { "booty_bay" }, temper = { "smooth", "proud" }, values = { "proud", "profit" },
  notices = { "craft", "kit", "class" },

  impression = {
    first = "Grarnik Goodstitch is the eldest of Booty Bay's Goodstitch clan and dresses like it, in a waistcoat with more buttons than it needs. Every compliment Grarnik paid me came with a price attached, and I think every one of them was sincere.",
    third = "{name} met Grarnik Goodstitch, head of the Goodstitch family, who teaches tailoring at A Tailor to Cities and dresses the Baron himself.",
  },

  greetings = {
    { id = "g_shop", text = "Welcome to A Tailor to Cities, the finest establishment of its kind between Undermine and anywhere, and yes, sweetheart, the name is on purpose. Grarnik Goodstitch, master tailor, head of the family and very expensive." },
    { id = "g_back", when = { metBefore = true }, text = "My favorite returning customer, or one of the top forty, anyway! Come in, come in, and don't drip on the silk." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and look at the state of those sleeves! I'd weep if weeping didn't ruin the velvet." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde colors! Bold choice, sweetheart, very bold, and I can make them bolder for a modest fee." },
  },

  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor, I can see it in the cuffs, though whoever taught you to set a sleeve ought to be fined, and I'd be happy to fine them on your behalf." },
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "Oh my, oh my, somebody's been robbed or somebody's been foolish, and either way you need a tailor more than anybody I've seen this week." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear beadwork! I could stare at that all day, and I have, at three different customers, and I've copied two patterns already." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Grarnik Goodstitch, Tailoring Trainer and head of the Goodstitch family, which in this cove is a bit like being head of the weather. I teach the needle to anybody who can pay for it, and I dress the Baron, the captains and anybody else with coin and a little taste." },
        { id = "h_tailor", when = { profession = "Tailoring" },
          text = "Ah, a fellow needle! Come in, sweetheart, and let's see what you've learned and what I can charge you to unlearn it." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "A mage, and your hem's been singed, which means you've been casting fire in a robe that wasn't made for it. Sit down, sweetheart, and let a professional talk to you." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest in heavy robes in this heat? You're sweating through your vestments like a sailor through a Sunday shirt, and I can fix that." },
        { id = "h_warlock", when = { class = "WARLOCK" },
          text = "A warlock! Lovely, dark, dramatic, and all of it wool, which is a tragedy I'm prepared to correct for a reasonable sum." },
        { id = "h_human", when = { race = "Human" },
          text = "From Stormwind, I'd wager, by the cut of that doublet, and I'd also wager it's the warmest thing you've ever regretted wearing." },
      },
      again = {
        { id = "h_again", text = "What else, sweetheart? My time's billed by the quarter-hour, but for you I'll round down." },
        { id = "h_again2", text = "Go on, ask. I've an answer for everything and a pattern for most of it." },
      },
      choices = {
        { text = "Teach me tailoring.", next = "BUSINESS" },
        { text = "Why call the shop 'A Tailor to Cities'?", next = "name" },
        { text = "Tell me about the Goodstitch family.", next = "family" },
        { text = "Who are your best customers?", next = "customers" },
        { text = "What makes a good tailor?", next = "craft" },
        { text = "What should I master next with the needle?", next = "xlearn", when = { profession = "Tailoring" } },
        { text = "Is there any cloth that won't burn?", next = "xmage", when = { class = "MAGE" } },
        { text = "What should a priest wear in this heat?", next = "xpriest", when = { class = "PRIEST" } },
        { text = "Will you stitch felcloth for me?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Those patterns you copied belong to my people.", next = "k_troll", when = { race = "Troll" } },
        { text = "What do you think of Stormwind fashion?", next = "k_human", when = { race = "Human" } },
        { text = "Good day, Grarnik.", next = "END" },
      },
    },

    -- The shop's name
    name = {
      lines = { { id = "nm_default", text = "Because one day, sweetheart, every city in the world will wear Goodstitch, from Stormwind to Orgrimmar to Undermine itself, and they'll all have to come here for the fitting. The sailors read it as a spelling mistake, which costs me nothing, because they come in to point it out and leave with a hat." } },
      choices = {
        { text = "Every city? That's quite an ambition.", next = "name_ambition" },
        { text = "Has anyone from a city come yet?", next = "name_city" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name_city = {
      lines = { { id = "nmc_default", text = "A lady from Stormwind came in last spring off a merchantman and bought three silk scarves and a sun hat, so I've told everybody since that Stormwind's nobility shops at Goodstitch. My grandmother used to say it's not a lie if you say it with enough confidence, and she died rich." } },
      choices = {
        { text = "That's stretching the truth a long way, Grarnik.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Your grandmother sounds like a wise goblin.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    name_ambition = {
      lines = { { id = "nma_default", text = "Ambition is the only thread that never runs out, sweetheart, and I've been spinning it since before my teeth came in. My cousins think a tailor should stick to hems, but hems never bought anybody a balcony overlooking the harbor." } },
      choices = {
        { text = "Do your cousins agree with you on anything?", next = "family" },
        { text = "I hope you get your balcony.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },

    -- The family (sub-hub)
    family = {
      hub = true,
      lines = { { id = "fm_default", text = "Oh, the Goodstitches are everywhere in this cove, like sand in your boots, only more expensive. I'm the eldest, so I'm the one who settles the quarrels, collects the family dues and gets blamed when the cloth goes damp, so ask me about any of them." } },
      again = {
        { id = "fm_again", text = "Who else? There's always another Goodstitch." },
        { id = "fm_again2", text = "Go on, sweetheart, there's a cousin for every bolt of cloth in the Bay." },
      },
      choices = {
        { text = "What about Xizk?", next = "xizk" },
        { text = "And Qixdi?", next = "qixdi" },
        { text = "Isn't Blixrez a Goodstitch too?", next = "blixrez" },
        { text = "Enough about the family.", next = "hello" },
      },
    },
    xizk = {
      lines = { { id = "xz_default", text = "Xizk sells the thread and cloth along the boardwalk and fusses over every bolt like it's a newborn, which is exactly what you want in a supplier. Every tailor I train buys from Xizk, and every one of them gets the lecture about mold for nothing." } },
      choices = {
        { text = "I think I've heard that lecture.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Someone else.", next = "BACK" },
      },
    },
    qixdi = {
      lines = { { id = "qx_default", text = "Qixdi sells finished robes, which means Qixdi sells what I teach other people to make, and prices them so low it makes my teeth ache. We've had words about it, sweetheart, a great many words, some of them in front of customers." } },
      choices = {
        { text = "Why do Qixdi's prices matter so much to you?", next = "feud" },
        { text = "Someone else.", next = "BACK" },
      },
    },
    feud = {
      big = true,
      lines = { { id = "fd_default", text = "Because if Qixdi sells a robe for less than the lessons it takes to make one, nobody learns to make it, and then where's the family in twenty years? I say we hold the line and charge what it's worth, Qixdi says a sale today beats a lesson tomorrow, and the whole cove takes sides at supper." } },
      choices = {
        { text = "Hold the line. The family's trade depends on it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Qixdi's right. Customers come before family rules.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Whose side does Xizk take?", next = "feud_xizk" },
      },
    },
    feud_xizk = {
      lines = { { id = "fdx_default", text = "Xizk sells cloth to both of us, so Xizk takes the side of whoever's buying that week, which I'd call disloyal if it weren't so admirably goblin. I've taught that child everything, and that's the thanks I get." } },
      choices = {
        { text = "Sounds like you taught Xizk very well.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Someone else.", next = "BACK" },
      },
    },
    blixrez = {
      lines = { { id = "bx_default", text = "Blixrez is a Goodstitch by blood and a tanner by bad judgment, and the family is still not over it. Leather, sweetheart, in a family that's stitched silk for four generations, and the smell follows Blixrez into every family supper." } },
      choices = {
        { text = "Leather's a fine trade too.", next = "blixrez_fine" },
        { text = "Someone else.", next = "BACK" },
      },
    },
    blixrez_fine = {
      lines = { { id = "bxf_default", text = "Oh, it pays, I'll grant that, and some years it pays better than silk, which is the part that really hurts. But you can't wear a tannery to a wedding, and I'll die on that hill wearing a very nice coat." } },
      choices = {
        { text = "Ha! I'll remember that one.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Someone else.", next = "BACK" },
      },
    },

    -- Customers
    customers = {
      lines = { { id = "cu_default", text = "The Baron, first and always, because Revilgaz wears a new coat for every ship that docks and every one of them comes out of my back room. After the Baron come the captains, and after the captains, whoever's got coin and no taste, which is most of the town." } },
      choices = {
        { text = "You dress Baron Revilgaz himself?", next = "baron" },
        { text = "Do pirates buy from you?", next = "pirates" },
        { text = "Something else.", next = "BACK" },
      },
    },
    baron = {
      lines = { { id = "ba_default", text = "Every coat since he took the cove, and he argues every coin of every one, which I respect. He likes his gold buttons big enough to see from the water, so the ships know exactly who they're paying their docking fees to." } },
      choices = {
        { text = "He sounds like a demanding customer.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pirates = {
      big = true,
      lines = { { id = "pi_default", text = "The Blackwater, gladly, and the Bloodsail never through the front door, though I'll admit a red sash or two has gone out the back at a premium. A Goodstitch is neutral, sweetheart, and neutral means the coin's the same color whoever's holding it." } },
      choices = {
        { text = "Selling to the Bloodsail behind the Baron's back is shameful.", next = "pirates_baron", fx = { align = { honor = 1 }, learn = { "bloodsail" } } },
        { text = "Coin is coin. The back door is good business.", next = "pirates_baron", fx = { align = { honor = -1 }, learn = { "bloodsail" } } },
        { text = "Does the Baron know about the back door?", next = "pirates_baron" },
      },
    },
    pirates_baron = {
      lines = { { id = "pib_default", text = "The Baron knows everything, sweetheart, and charges a fee for not knowing it, which is how this whole town works. Now please lower your voice, because Qixdi's shop is close by and Qixdi has ears like a bat." } },
      choices = {
        { text = "My lips are sealed.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 }, learn = { "steamwheedle" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The craft
    craft = {
      lines = { { id = "cr_default", text = "Patience, a straight eye and a thick skin, because your customers will tell you everything that's wrong with your work and nothing that's right. And a bit of flair, sweetheart, because anybody can stitch a seam, but only a Goodstitch can make a seam look expensive." } },
      choices = {
        { text = "How do you make a seam look expensive?", next = "craft_flair" },
        { text = "Something else.", next = "BACK" },
      },
    },
    craft_flair = {
      lines = { { id = "crf_default", text = "Gold thread on the inside, where only the wearer knows it's there, and they walk taller for knowing. That's the whole secret of fashion, and I've just given it away for nothing, so you'd better buy a lesson." } },
      choices = {
        { text = "Then I'll take a lesson.", next = "BUSINESS", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Who the player is
    xlearn = {
      lines = { { id = "xle_default", text = "Mageweave, if you're ready for it, and if you're not, silk until your fingers bleed and then a little more. Anybody can make a shirt, but a tailor who can make a bag that holds a dozen things and never splits is a tailor who never goes hungry." } },
      choices = {
        { text = "Then teach me.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xm_default", text = "Nothing that won't burn, sweetheart, but silk burns slower than wool and smells less of sheep while it does. I've dressed a great many mages, and the clever ones buy two robes, one to wear and one for when the first one catches." } },
      choices = {
        { text = "Two robes it is, then.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriest = {
      big = true,
      lines = { { id = "xp_default", text = "White linen and a loose cut, sweetheart, because the Light may keep you holy but it won't keep you cool. Your temple robes are lovely, but a priest who faints on the docks isn't converting anybody." } },
      choices = {
        { text = "Vestments are sacred. I'll wear mine as they are.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Comfort first. The Light won't mind a little linen.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      lines = { { id = "xl_default", text = "Felcloth? Not in my shop, sweetheart, because it smells like a burnt cousin and it stains everything it touches. I'll make you a fine black robe out of honest silk, and you can do whatever terrible things you like in it." } },
      choices = {
        { text = "Honest silk will do nicely.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_troll = {
      lines = { { id = "kt_default", text = "Copied, sweetheart, not stolen, and I'd call it a compliment, because your people wear colors that would make a parrot jealous. Still, I'll put a Darkspear knot on every sash I sell this month, and I'll tell anyone who asks where it came from." } },
      choices = {
        { text = "See that you do, goblin.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Beadwork is meant to be seen. Copy away.", next = "BACK", fx = { affinity = 1, trait = { generous = 1 } } },
      },
    },
    k_human = {
      lines = { { id = "kh_default", text = "Velvet in summer, sweetheart, and sleeves so puffed you could hide a gnome in each one. I adore it, because every Stormwind sailor who comes south ends up in my shop by the third day, sweating and desperate." } },
      choices = {
        { text = "I'll admit the velvet was a mistake.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know cloth, I know fashion, and I know every Goodstitch in this cove, which is most of the cloth and all of the gossip." } },
    background = { { id = "tp_bg", text = "Fourth generation of Goodstitch tailors, eldest of the lot, and the only one with a shop name you'll remember.", next = "name" } },
    advice = { { id = "tp_ad", text = "Gold thread on the inside, sweetheart, and never let a customer see you measure twice." } },
    bloodsail = { { id = "tp_bloodsail", text = "Red is a difficult color, sweetheart, and the Bloodsail wear it very badly." } },
    steamwheedle = { { id = "tp_steam", text = "The Cartel's men wear the dullest coats in the world, and I tell them so every time they come to check the Baron's books." } },
    _none = { { id = "tp_none", text = "If I can't stitch it or sell it, sweetheart, I've never heard of it, and I'm not about to start now." } },
  },
}

---------------------------------------------------------------------------
-- Blixrez Goodstitch
---------------------------------------------------------------------------
P:NPC {
  key = "blixrez", id = TODO_NPC("Blixrez Goodstitch"), name = "Blixrez Goodstitch",
  title = "Leatherworking Supplies",
  bible = "bibles/booty_bay_trades.md", role = "vendor", tier = "service",
  communities = { "booty_bay" }, temper = { "cheerful", "blunt" }, values = { "practical", "profit" },
  notices = { "craft", "pet", "race" },

  impression = {
    first = "Blixrez Goodstitch runs a tannery that I could smell from the pier, and is cheerfully proud of every whiff. Blixrez is the Goodstitch the rest of the family seats by the window, and doesn't seem to mind in the least.",
    third = "{name} met Blixrez Goodstitch, the leather-selling black sheep of the Goodstitch family, at Tan-Your-Hide Leatherworks in Booty Bay.",
  },

  greetings = {
    { id = "g_shop", text = "Welcome to Tan-Your-Hide Leatherworks, pal, and don't make that face, because the smell's free and everything else costs money. Blixrez Goodstitch, the Goodstitch who isn't ashamed of a little stink." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Either you've got the nose of a crocolisk or you just can't stay away, and either way I'm glad of the custom, chum." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away} and back with all your own hide still on you, I see. Good, because I'd hate to have to buy it off a hunter." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde, Alliance, it's all the same to the vats, pal, and the vats are the only thing in here with any opinions." },
  },

  notice = {
    { id = "n_lw", cat = "craft", when = { profession = { "Leatherworking", "Skinning" } },
      text = "A skinner! I can tell by the knife on your belt, and by the smell, which makes you the first customer this week who walked in smelling worse than the shop." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Keep your {pet} away from the drying racks, pal, because the last hunter's cat ate half a tiger hide and I billed the hunter for it, plus damages to my feelings." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Oh, sparks and sprockets, a tauren. Listen, listen, before you say anything, there's no kodo in this shop, none, not a scrap, I swear on my mother's ledger." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Blixrez Goodstitch, leatherworking supplies: salt, dye, thread, hides and the best tanned leather south of the Barrens. The rest of the family sells silk, but somebody in this cove has to sell things that actually stop a raptor's teeth, and it might as well be me." },
        { id = "h_lw", when = { profession = "Leatherworking" },
          text = "A leatherworker! Finally, somebody who doesn't hold their nose when they walk in, or at least not for long. I've got thread, I've got dye, and I've got crocolisk hide fresh out of the vats, so what'll it be, pal?" },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, and I'll wager you've come down from Nesingwary's camp with a pack full of pelts and a head full of prices. Let's see 'em, chum, and let's see how close we can get to agreeing." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid, in a tannery. I'll be honest with you, pal, this is the part of my week I worry about most." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "One of Strom's lot, by the walk. You'll want soft leather that doesn't creak, and I've got the only oil in town that makes it so, at a price that'll make you wince quietly." },
      },
      again = {
        { id = "h_again", text = "What else, pal? Talk quick, the vats need stirring." },
        { id = "h_again2", text = "Still here? You're tougher than most, chum. Ask away." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Why call it Tan-Your-Hide?", next = "name" },
        { text = "Why leather, in a family of tailors?", next = "family" },
        { text = "Where do your hides come from?", next = "hides" },
        { text = "Isn't Rikqiz selling the same things?", next = "rikqiz" },
        { text = "What's the trick to a good tan in this heat?", next = "xtan", when = { profession = "Leatherworking" } },
        { text = "I hunt for Nesingwary. Want my hides?", next = "xhunt", when = { class = "HUNTER" } },
        { text = "Doesn't it trouble you, selling the jungle's creatures?", next = "xdruid", when = { class = "DRUID" } },
        { text = "What keeps leather quiet?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Relax, Blixrez. I'm not here about kodo.", next = "k_tauren", when = { race = "Tauren" } },
        { text = "I'll leave you to your vats.", next = "END" },
      },
    },

    -- The name
    name = {
      lines = { { id = "nm_default", text = "It's a joke, pal, see, because I tan hides, and also because if you short me on a bill I'll tan yours, and I've never once had to, which proves it works. Grarnik made me promise to change it at three family suppers in a row, and I painted it bigger after every one." } },
      choices = {
        { text = "Ha! That's a good name.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Grarnik must hate it.", next = "family" },
      },
    },

    -- The family
    family = {
      lines = { { id = "fa_default", text = "Four generations of silk and satin, and then me, the one who liked the feel of a good raptor hide better than a bolt of mageweave. Grarnik calls it a phase, and I've been in the phase for twenty years and turned a profit every one of 'em." } },
      choices = {
        { text = "Does the family still welcome you?", next = "family_supper" },
        { text = "What's so good about leather?", next = "family_leather" },
        { text = "Something else.", next = "BACK" },
      },
    },
    family_supper = {
      lines = { { id = "fas_default", text = "Oh, they welcome me, all right, they just seat me by the window. Qixdi's the only one who sits next to me on purpose, and that's mostly to annoy Grarnik, but I'll take a friend wherever I can get one, at whatever the going rate is." } },
      choices = {
        { text = "Qixdi sounds like a good cousin to have.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    family_leather = {
      big = true,
      lines = { { id = "fal_default", text = "Leather keeps you alive, pal, and silk only keeps you pretty, and you can't stop a raptor's teeth with pretty. Every hunter, rogue and Bruiser in this cove wears something that went through my vats, and not one of 'em ever thanked a tailor for it." } },
      choices = {
        { text = "Useful work beats pretty work. You chose well.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Still, you might have kept the family trade.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Hides
    hides = {
      lines = { { id = "hi_default", text = "Nesingwary's hunters up the coast, mostly, who shoot the tigers and panthers for sport and then remember they need money for powder. I buy the pelts, I tan the pelts, I sell the leather to you, and everybody's happy except the tigers." } },
      choices = {
        { text = "Are they emptying the jungle?", next = "hides_jungle" },
        { text = "Who else sells you hides?", next = "hides_other" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides_jungle = {
      big = true,
      lines = { { id = "hij_default", text = "Emptying it? Pal, there's a tiger behind every second tree up there and a raptor behind the rest. Though I'll admit the big cats come down rarer than they used to, and the hunters walk farther for 'em every season." } },
      choices = {
        { text = "The jungle needs its tigers. The hunting should slow.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The jungle's endless. Let them hunt, and you profit.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides_other = {
      lines = { { id = "hio_default", text = "Brikk, of all people, who takes pelts as payment from hunters and then sells 'em to me at a loss, which is the only time I've ever beaten a smith in a bargain. And the Bruisers bring me the odd crocolisk that crawls up the pier, though they never say how it died." } },
      choices = {
        { text = "I'd rather not know how it died.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The rival
    rikqiz = {
      lines = { { id = "rq_default", text = "Rikqiz sells salt and dye and thread from a stall and buys hides by squinting at 'em, which is no way to judge a hide, pal. I've got vats, I've got racks and I've got twenty years of stink in my clothes, and Rikqiz has got a squint." } },
      choices = {
        { text = "Competition keeps your prices honest, at least.", next = "rikqiz_comp" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rikqiz_comp = {
      lines = { { id = "rqc_default", text = "Honest? Pal, it keeps 'em low, which isn't the same thing at all, and some weeks we undercut each other so hard we're both selling at a loss. Then we go to the Salty Sailor, share a bottle, complain about the hunters and start it all over again in the morning." } },
      choices = {
        { text = "So you're friends, really.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Who the player is
    xtan = {
      lines = { { id = "xt_default", text = "Salt first and plenty of it, because the damp will rot a hide before it's half tanned, and then a bark tan with mangrove bark off the coast, which smells like a swamp and works like magic. Hang it in the shade, never the sun, or you'll get leather that cracks like an old goblin's knees." } },
      choices = {
        { text = "Mangrove bark. I'll remember that.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunt = {
      lines = { { id = "xh_default", text = "Your hides? I'd love 'em, pal, but let me see your skinning first, because half the hunters who come down from Nesingwary's camp hack at a pelt like it owes them money. A clean cut's worth double, and a hole in the middle's worth nothing but a sad face." } },
      choices = {
        { text = "My cuts are clean. You'll see.", next = "BACK", fx = { affinity = 1, trait = { proud = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      lines = { { id = "xd_default", text = "Trouble me? Pal, they're already dead by the time they get to me, and I'd rather make something useful of 'em than leave the profit to the flies. I'll grant it's an odd thing to say to somebody who turns into a cat." } },
      choices = {
        { text = "It's odd, but at least it's honest.", next = "BACK", fx = { affinity = 1 } },
        { text = "Please don't talk about cats right now.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    xrogue = {
      lines = { { id = "xr_default", text = "Oil, pal, oil and patience, because new leather creaks like a ship in a storm and a rogue in creaky boots is a rogue in a cell. I keep a little pot of mink oil under the counter for just that, and nobody in Strom's lot leaves without one." } },
      choices = {
        { text = "Let me see what you've got.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_tauren = {
      lines = { { id = "kt_default", text = "Oh, thank my mother's ledger, because the last tauren who walked in here looked at a belt for a full minute and then asked me where it came from, and I've never talked so fast in my life. It was crocolisk, pal, I promise, and I've got the receipts." } },
      choices = {
        { text = "I believe you, Blixrez.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "That belt did look a little suspicious.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know hides, salt, tanning and which hunter's lying about where a pelt came from, pal." } },
    background = { { id = "tp_bg", text = "Born a Goodstitch, raised on silk, and ran off to the tanning vats the first chance I got.", next = "family" } },
    advice = { { id = "tp_ad", text = "Salt your hides the same day you skin 'em, chum, or don't bother bringing 'em to me." } },
    _none = { { id = "tp_none", text = "Never heard of it, pal, and if it doesn't have a hide, I don't much care." } },
  },
}

---------------------------------------------------------------------------
-- Oglethorpe Obnoticus
---------------------------------------------------------------------------
P:NPC {
  key = "oglethorpe", id = TODO_NPC("Oglethorpe Obnoticus"), name = "Oglethorpe Obnoticus",
  title = "Gnome Engineering Trainer",
  bible = "bibles/booty_bay_trades.md", role = "trainer", tier = "quest",
  communities = { "booty_bay" }, temper = { "dramatic", "eccentric" }, values = { "proud", "clever" },
  notices = { "craft", "race" },

  impression = {
    first = "Oglethorpe Obnoticus is a gnome engineer surrounded by live wires and half-built robots, and he talks about his banishment from Tinker Town the way other people talk about the weather. He insists he was framed, and he insists it at length.",
    third = "{name} met Oglethorpe Obnoticus, the exiled gnome engineer in Booty Bay who builds the OOX homing robots and swears he never let the Crowd Pummeler loose.",
  },

  greetings = {
    { id = "g_bench", text = "Oglethorpe Obnoticus, master of gnomish engineering and the only sane engineer in this entire cove. Mind the wires, please, because they're live, and so, thank goodness, am I." },
    { id = "g_back", when = { metBefore = true }, text = "My friend, back again! Nothing has exploded since your last visit, which I'm told is a record for this boardwalk." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and I've built and lost three prototypes in the meantime. Come and admire the pieces." },
    { id = "g_horde", when = { faction = "Horde" }, text = "The Horde! Splendid, because unlike certain councils I could name, I don't care who you are as long as you can hold a wrench the right way up." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! I can tell by the scorch marks, and by the way you just looked at my workbench as if you'd like to take it apart, which I absolutely forbid." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A fellow gnome, and a long way from the Tinkmaster's shadow! Tell me quickly, before anybody else hears, does Overspark still say my name like it's a curse?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Ah, a visitor! Oglethorpe Obnoticus, Gnome Engineering Trainer, exiled genius and builder of the finest homing robots ever to crash in a desert. Ask me anything you like, but if you mention the Crowd Pummeler, I'll know who sent you." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome, here, among the goblins! Sit down, my friend, sit down, and let's talk like civilized engineers for once, without anybody trying to sell us the chair." },
        { id = "h_eng", when = { profession = "Engineering" },
          text = "An engineer, and by the look of your eyebrows a goblin-trained one, which we can fix. Gnomish engineering, my friend, is precision, and precision is everything that goblin engineering is not." },
        { id = "h_rescue", tags = { "news" }, when = { questActive = TODO_QUEST("Rescue OOX-17/TN!") },
          text = "You've found OOX-17/TN? Wonderful, splendid, now go and switch it on and walk it home through Tanaris, and do try to keep the sand out of its joints." },
        { id = "h_chicken", when = { questDone = TODO_QUEST("An OOX of Your Own") },
          text = "My friend, the great robot rescuer, back again! How is the chicken? Still laying bolts, I hope, because that means the gears are healthy." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Welcome, welcome! I teach gnomish engineering to anyone with steady hands and good sense, and I find the Horde has as many of both as Ironforge, which I'll thank you not to repeat in Ironforge." },
      },
      again = {
        { id = "h_again", text = "What else? Quickly, please, I've a capacitor warming up and it doesn't like to wait." },
        { id = "h_again2", text = "Go on, my friend. Ask me about anything but the council." },
        { id = "h_again3", text = "Another question! Excellent, questions are the lubricant of genius." },
      },
      choices = {
        { text = "Teach me gnomish engineering.", next = "BUSINESS" },
        { text = "Why is a gnome engineer in Booty Bay?", next = "exile" },
        { text = "What are these homing robots of yours?", next = "oox" },
        { text = "How do you like working among goblins?", next = "goblins" },
        { text = "What are you building now?", next = "project" },
        { text = "Overspark says you set the Pummeler loose.", next = "k_gnome", when = { race = "Gnome" } },
        { text = "Which is better, gnomish or goblin engineering?", next = "xeng", when = { profession = "Engineering" } },
        { text = "Dwarves have tinkers too, you know.", next = "k_dwarf", when = { race = "Dwarf" } },
        { text = "Why build a transporter when mages can teleport?", next = "xmage", when = { class = "MAGE" } },
        { text = "Could you build me a mechanical pet?", next = "xhunt", when = { class = "HUNTER" } },
        { text = "My mechanical chicken keeps running off.", next = "xchicken", when = { questDone = TODO_QUEST("An OOX of Your Own") } },
        { text = "I'll leave you to your wires.", next = "END" },
      },
    },

    -- The exile
    exile = {
      lines = { { id = "ex_default", text = "Exiled, my friend, banished from Tinker Town by Tinkmaster Overspark and the council over an incident that was not, I repeat not, my fault. Somebody let the Crowd Pummeler 9-60 out of its cage, and because the cage was mine and the key was mine and the Pummeler was mine, they decided it must have been me." } },
      choices = {
        { text = "Wasn't it your machine, though?", next = "exile_mine" },
        { text = "Who do you think let it loose?", next = "exile_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    exile_mine = {
      lines = { { id = "exm_default", text = "My machine, my design, my cage and my key, yes, yes, all of that is in the council's report, in very large letters. But a machine is not its builder, my friend, and if it were, half of Tinker Town would be in prison for what their inventions have done to the eyebrows of Ironforge." } },
      choices = {
        { text = "Then who let it loose?", next = "exile_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    exile_who = {
      big = true,
      lines = { { id = "exw_default", text = "I have theories, my friend, several of them, and three involve Overspark, who never liked my plans for the Pummeler and liked them even less once they worked. I can't prove a thing, of course, which is exactly what a clever saboteur would arrange." } },
      choices = {
        { text = "Without proof, the council's ruling should stand.", next = "exile_pummeler", fx = { align = { order = 1 } } },
        { text = "Councils protect their own. I think you were framed.", next = "exile_pummeler", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Is the Crowd Pummeler still out there?", next = "exile_pummeler" },
      },
    },
    exile_pummeler = {
      lines = { { id = "exp_default", text = "It's in Gnomeregan, walking the halls among the troggs and the poor irradiated wretches, smashing anything that moves, which, I'll point out, is precisely what it was built to do. Dreadful business, my friend, and very good workmanship." } },
      choices = {
        { text = "You sound almost proud of it.", next = "BACK", fx = { trait = { skeptical = 1 }, learn = { "gnomeregan" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "gnomeregan" } } },
      },
    },

    -- The OOX robots
    oox = {
      lines = { { id = "ox_default", text = "The OOX series, my masterpieces! Robots that fly out across the world, survey the land and home back to my workbench on a beacon of my own design, or at least they would, if they didn't keep crashing in the most inconvenient places imaginable." } },
      choices = {
        { text = "Where have they crashed?", next = "oox_where" },
        { text = "How would anyone find one?", next = "oox_find" },
        { text = "Something else.", next = "BACK" },
      },
    },
    oox_where = {
      lines = { { id = "oxw_default", text = "OOX-17/TN came down in the Tanaris desert, OOX-09/HL in the Hinterlands among the trolls, and OOX-22/FE somewhere in the forests of Feralas. Each of them carries a distress beacon, so if you ever find one, bring it to me and I'll explain everything at great length." } },
      choices = {
        { text = "Why do they all crash?", next = "oox_crash" },
        { text = "I'll keep my eyes open for them.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
      },
    },
    oox_find = {
      lines = { { id = "oxf_default", text = "You won't, unless you're lucky, because the beacons only switch on once the robot's down and sulking. Adventurers stumble over them in the strangest places, and when they bring the beacon here, I send them back out to walk the robot home." } },
      choices = {
        { text = "Where have they crashed so far?", next = "oox_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    oox_crash = {
      lines = { { id = "oxc_default", text = "The navigation matrix is perfect and the propulsion is perfect, but the fuel was bought on this very boardwalk, which explains a great deal. Gnaz Blunderflame swears it was the best grade in the shop, and I'm inclined to believe it, because Gnaz lost both eyebrows proving the point." } },
      choices = {
        { text = "Perhaps buy your fuel somewhere else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The goblins
    goblins = {
      lines = { { id = "go_default", text = "Wonderfully, my friend, because a goblin will let you test a rocket on the open boardwalk as long as you pay the damage fee in advance, whereas the council made me fill out four forms to light a candle. The goblins think I'm mad, of course, but they think anyone's mad who doesn't charge interest." } },
      choices = {
        { text = "Do you miss Tinker Town?", next = "goblins_miss" },
        { text = "Who's your favorite neighbor here?", next = "goblins_fav" },
        { text = "Something else.", next = "BACK" },
      },
    },
    goblins_miss = {
      lines = { { id = "gom_default", text = "I miss the hum of it, and the smell of oil on cold stone, and having someone to talk to who understands a differential gearbox. I don't miss being watched, though, and nobody in Booty Bay watches anybody unless there's money in it." } },
      choices = {
        { text = "Then perhaps exile suits you.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "I'm sorry you can't go home.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 }, learn = { "gnomeregan" } } },
      },
    },
    goblins_fav = {
      lines = { { id = "gof_default", text = "Brikk Keencraft, without question, because Brikk forges my casings to a hair's breadth and never once asks what they're for. And the big armorer, Hurklor, who carried me down the boardwalk the day a prototype became a little too affectionate, which I'll never forget, however much I'd like to." } },
      choices = {
        { text = "Affectionate? Hurklor said it was chasing you.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The transporter
    project = {
      lines = { { id = "pr_default", text = "A transporter, my friend, a device to send a gnome across the world in the blink of an eye, from here to the gates of Gadgetzan. It works perfectly four times in five, and the fifth time it's still very educational." } },
      choices = {
        { text = "What happens the fifth time?", next = "project_fifth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    project_fifth = {
      big = true,
      lines = { { id = "prf_default", text = "Sometimes you arrive somewhere else, and sometimes you arrive as a chicken, and once, memorably, I arrived on time but my trousers arrived in Ratchet. Nobody's been permanently harmed, which is more than Overspark can say for his Techbot." } },
      choices = {
        { text = "Somebody has to test it. I'd step inside.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Nobody should step inside until it's safe.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Who the player is
    k_gnome = {
      lines = { { id = "kg_default", text = "Overspark says that, does he? Of course he does, because if it wasn't me then it was somebody on his own council, and Overspark would rather lose an arm than admit his council can make a mistake. Did he look well, at least?" } },
      choices = {
        { text = "He looked tired. Gnomeregan weighs on him.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 }, learn = { "gnomeregan" } } },
        { text = "He looked rather smug, honestly.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
      },
    },
    xeng = {
      big = true,
      lines = { { id = "xe_default", text = "Gnomish, obviously, because a gnomish device does precisely what it was designed to do, while a goblin device does what it was designed to do and then explodes. Mind you, the goblin version is cheaper and gets there faster, and I've never once seen a goblin cry over a failed prototype." } },
      choices = {
        { text = "Precision first. Gnomish engineering is the true craft.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Cheap and fast wins. The goblins have it right.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_dwarf = {
      lines = { { id = "kd_default", text = "They do, and they make wonderful rifles and dreadful conversation about rifles. I've no quarrel with Ironforge, my friend, only with one small corner of it full of gnomes who signed my banishment." } },
      choices = {
        { text = "Tinker Town's not so small.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xm_default", text = "Because a mage spends twenty years studying to do what my transporter will do for anybody with the price of a ticket. Of course, my transporter occasionally turns people into chickens, so the mages may keep their jobs a little longer." } },
      choices = {
        { text = "We prefer sheep, actually.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunt = {
      lines = { { id = "xh_default", text = "Funny you should ask, because I've built one already, a mechanical chicken, and it's the finest pet ever constructed, provided you don't mind it laying the occasional bolt. I give them to the people who help me bring the OOX robots home, as a token of thanks." } },
      choices = {
        { text = "Then I'd like to earn one.", next = "oox", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xchicken = {
      lines = { { id = "xc_default", text = "Of course it does, because it's a homing chicken and it's homing to me, which only proves the engineering is superb. Chase it back to your pack and give it a pat on the gearbox, because they respond to affection, or at least to being caught." } },
      choices = {
        { text = "It's a fine chicken, Oglethorpe.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know gnomish engineering better than anyone alive, whatever Tinker Town says, and I know where three of my robots crashed." } },
    background = { { id = "tp_bg", text = "Tinker Town engineer, inventor of the Crowd Pummeler, wrongly banished, now teaching in Booty Bay among the goblins.", next = "exile" } },
    advice = { { id = "tp_ad", text = "Never buy fuel from a goblin with no eyebrows, my friend, because that's a goblin who knows exactly how good it is." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "My Pummeler walks those halls still, and I'd rather not think about who's in there with it." } },
    steamwheedle = { { id = "tp_steam", text = "The Cartel lets me work, which is more than my own council ever did, and they only take a modest share of everything." } },
    _none = { { id = "tp_none", text = "Not my field, my friend, and if it isn't engineering, I'm not convinced it's anybody's." } },
  },
}
