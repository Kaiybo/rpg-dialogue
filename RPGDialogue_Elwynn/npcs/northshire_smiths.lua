-- Northshire Abbey's armorer, clothier, weaponsmith, and Brother Paxton who walks the grounds.
-- Voice: bibles/northshire_smiths.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC = P.TODO_NPC

-- Godric Rothgar: armorer and shieldsmith to the Abbey's recruits.
P:NPC {
  key = "godric", id = TODO_NPC("Godric Rothgar"), name = "Godric Rothgar", title = "Armorer & Shieldsmith",
  bible = "bibles/northshire_smiths.md", role = "vendor", tier = "service",
  communities = { "northshire" }, temper = { "proud" }, values = { "craft", "duty" },
  impression = {
    first = "He takes every dent in a recruit's shield as a personal insult.",
    third = "{name} met Godric Rothgar, Northshire's armorer, who takes dents personally.",
  },
  greetings = {
    { id = "g_default", text = "Mail, shields and a few good helms. Nothing fancy, but it'll stop a kobold's pick." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still in one piece, I see. That's the armor doing its job." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They all do, and every dent's an insult. A shaman might be kinder to metal, spirits or not, but I'll believe it when your shield comes back." } },
      choices = {
        { text = "I'll treat your work with respect, Godric.", next = "BACK", reply = "Then you'll be the first through that door who means it, and I'll believe it when your shield comes back with only honest dents.", fx = { align = { honor = 1 } } },
        { text = "Armour's meant to be dented. That's its job.", next = "BACK", reply = "It's meant to take a blow, aye, not to be dropped in the mud and walked on. There's a difference, and you'll learn it when you're paying for the repairs.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not much, because my armor's meant to be heard and seen, and yours is meant to be neither. Jorik Kerridan sends his students to me for a buckler now and then, and I tell them a shield is no shame, even for a sneak." } },
      choices = {
        { text = "A shield is no shame. I'll carry one.", next = "BACK", reply = "Good, and you'll thank me the first time a kobold spots you before you spot him. Pride's a poor thing to bleed for.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A shield's for those who get caught.", next = "BACK", reply = "Everybody gets caught once, friend, and the ones with a buckler get caught twice. The ones without don't get a second go.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Never, because bark peels away when the spell runs out, and my mail is still there in the morning. I'll grant it's lighter, mind, and the recruits do complain about the weight." } },
      choices = {
        { text = "Your mail lasts and spells fade. I'll give you that.", next = "BACK", reply = "Generous of you, and I'll take it, because druids don't often admit iron has its uses. Come back when your bark's peeled and we'll talk again.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Spells fade but come again. Iron only rusts.", next = "BACK", reply = "Rust I can scour, and a spell I can't, so I'll stick to what I know. You keep your bark and I'll keep my rings, and we'll both stay alive.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because a sword only matters if you're still standing to swing it, and the shield is what keeps you standing. Every recruit who comes back from the kobold camps with a split shield and no split skull agrees with me." } },
      choices = {
        { text = "Shield first, then. I'll learn to trust it.", next = "BACK", reply = "That's the most sense a recruit's spoken in this yard all month. Keep it high and keep it close, and it'll repay you.", fx = { align = { order = 1 } } },
        { text = "A good sword ends the fight before I need a shield.", next = "BACK", reply = "Every lad says that until the first kobold gets inside his swing. Come back after Echo Ridge and tell me if you still believe it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I can, and I do, with the rings set loose under the arm. It costs a little more and protects a little less there, but a hunter who can't draw is just a target wearing my work." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "I can, and I do, with the rings set loose under the arm, because a hunter who can't draw is just a target wearing my work. That {pet} of yours takes the knocks in your place, I see, so bring it round, and I'll check it for thorns." },
      },
      choices = {
        { text = "I'll trade a little protection for a clean draw.", next = "BACK", reply = "That's a hunter who's thought about it, and I'll set the rings for you myself. Keep the arm moving and the rest of you behind the shot.", fx = { align = { order = 1 } } },
        { text = "Make it heavy. I'll learn to draw around it.", next = "BACK", reply = "Stubborn, and you'll be sore for it, but I'll not argue with a customer who wants more iron. Practise the draw till your shoulder stops complaining.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I think everyone in Northshire owes something to the lads who stand at the front, and mages most of all, because you're the ones who can't take a hit. I don't ask for thanks, but I notice who gives it." } },
      choices = {
        { text = "I owe them my life, and I'll say so, Godric.", next = "BACK", reply = "They'd go red if you said it to their faces, but they'd remember it. Say it anyway, because a soldier rarely hears it.", fx = { align = { honor = 1 } } },
        { text = "They're paid to take hits. Gratitude isn't required.", next = "BACK", reply = "They're paid, aye, and paid poorly, and they bleed for you just the same. Think on that the next time you're standing behind one.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "No, but I've been asked, and I said no, because I'll not have my iron used to hold something that ought to be dead. The Brothers say every craft has its limits, and that's where mine is." } },
      choices = {
        { text = "Your iron should stay clean, Godric. You're right to refuse.", next = "BACK", reply = "I'm glad somebody agrees, and gladder it's one of your sort. Bring me a lock to mend any day you like, but never a cage.", fx = { align = { light = 1 } } },
        { text = "A good cage keeps everyone safer. You should reconsider.", next = "BACK", reply = "Safer for whom, I'd ask, and I'll not lose sleep over the answer. Find yourself another smith, because my iron stays honest.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Over every shield, before it leaves the forge, because each one goes on the arm of some lad who's never been hit. Brother Paxton says the Light doesn't care about iron, but I've seen what comes back, and I'll keep praying." } },
      choices = {
        { text = "Then your prayers are in every shield. Keep at it.", next = "BACK", reply = "I will, every one, and it's good to hear somebody believes it does some good. Paxton can laugh if he likes.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Good iron matters more than prayers, Godric.", next = "BACK", reply = "Maybe so, but I'd sooner have both on a lad's arm than either one alone. I'll keep praying and keep hammering, and you can keep your opinion.", fx = { align = { light = -1 } } },
        { text = "Something else, Godric.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "That it's heavy for a reason, and the reason's the lad behind you who isn't wearing any. Brother Sammuel's students always want it polished, and I tell them polish is for parades, and parades are for kings." } },
      choices = {
        { text = "I'll wear it for the lad behind me, not for show.", next = "BACK", reply = "That's the whole lesson, and you've learned it faster than most of Sammuel's lot. Keep that in mind when the plate gets heavy.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A paladin should look the part. Polish matters.", next = "BACK", reply = "Then you'll look very fine while the Defias take aim at the shine. Polish it if you must, but keep the straps oiled first.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. You'll be in robes, I suppose, but come back when you've learned that robes don't stop a kobold's pick." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Now that's a sight, because I made half the plate Brother Sammuel's students wear, and I like to see it come back with honest dents." },
        { id = "h_default", text = "Godric Rothgar, armorer to the Abbey. Every recruit who walks out of Northshire walks out in something I've hammered, so mind you bring it back unbroken." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "A warrior, and a fresh one by the look of you. Llane Beshere will teach you to swing, but I'll teach you to love a shield, because a kobold's pick goes through a sword arm far easier than oak." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, and you'll not be wanting my plate, I expect, though you'll be glad of whoever's wearing it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "You've graveyard mud on your boots and a look I've seen on La Salle's students. You'll have nothing to do with my forge, then, unless you need a cage." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll want mail that bends at the shoulder, so the bow doesn't fight you." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A night elf, and not a link of mail on you, which offends me as an armorer and impresses me as a man. I suppose that bark-skin trick serves you well enough." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue. You'll want leather, not my mail, I expect, but you'll be glad of whoever's wearing it when you're caught." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Recruits come in, I fit them with mail and they dent it, so don't you dent my work." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've rivets cooling." },
        { id = "h_again2", text = "Go on, then. I can talk and file at once." },
      },
      choices = {
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "Something around here wrecks a lot of shields.", next = "dents" },
        { text = "I doubt the recruits listen to you much.", next = "recruits" },
        { text = "Do you think mages owe your plate-wearers something?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Has anyone ever asked you to forge a cage for something living, Godric?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Why would I want a shield over a better sword, Godric?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Can you make mail that lets me draw a bow?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you ever pray over your work, Godric?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What should a paladin know about plate, Godric?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would you ever trust barkskin over your own mail?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "I doubt you make much for a rogue, Godric.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Recruits seem to treat their armour badly, Godric.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    dents = {
      lines = { { id = "d_default", text = "Kobolds at the Echo Ridge Mine, mostly, since they swing those picks like they're digging through you. The wolves only chew the straps, which is worse, because straps I have to sew." } },
      choices = {
        { text = "Is anything worse for your armour than kobolds?", next = "rain" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rain = {
      lines = { { id = "r_default", text = "The rain's the real enemy, friend. A recruit leaves his shield out in the yard overnight and it's rusting by morning, and then he comes crying to me." } },
      choices = {
        { text = "A soldier should care for his own gear.", next = "BACK", reply = "Exactly my view, and I tell them so every morning. A man who won't oil his own shield shouldn't expect me to do it for him.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Recruits have enough to worry about. Go easy.", next = "BACK", reply = "Go easy, says you, and then it's me answering to the Brothers when a lad's shield cracks in the field. I'll be kind, but I'll be kind with a whetstone and a lecture.", fx = { align = { order = -1 }, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    recruits = {
      lines = { { id = "rc_default", text = "The sensible ones do, and the rest learn the first time a kobold catches them without a helm, and then they listen very well, usually with a lump the size of an egg." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've hammered armor for the Abbey longer than most of these recruits have been alive." } },
    kobolds = { { id = "tp_kob", text = "They dent everything they touch. I'd almost admire it if I didn't have to fix it." } },
    _none = { { id = "tp_none", text = "If it can't be riveted, I couldn't tell you a thing about it." } },
    echo_ridge = { { id = "tp_echo_ridge", text = "Every recruit back from Echo Ridge brings me a breastplate full of kobold scratches and a story to go with it. I mend the plate and leave the story where it is." } },
    magni = { { id = "tp_magni", text = "Janos Hammerknuckle, the dwarf smith here, says Ironforge plate is the finest made, and I'll admit it to you but never to him. King Magni can keep his mountain; I've got the Abbey's anvil." } },
    second_war = { { id = "tp_second_war", text = "I hammered armor for the Alliance in the Second War, when a smith slept beside his forge or didn't sleep at all. Northshire's quiet by comparison, kobolds and all." } },
  },
}

-- Dermot Johns: cloth and leather armor; mends novices' robes.
P:NPC {
  key = "dermot", id = TODO_NPC("Dermot Johns"), name = "Dermot Johns", title = "Cloth & Leather Armor Merchant",
  bible = "bibles/northshire_smiths.md", role = "vendor", tier = "service",
  communities = { "northshire" }, temper = { "gentle" }, values = { "craft", "faith" },
  impression = {
    first = "He mends the robes the novices tear, which is most of them.",
    third = "{name} met Dermot Johns, who clothes and mends for Northshire's novices.",
  },
  greetings = {
    { id = "g_default", text = "Cloth and leather, friend, sewn here at the Abbey. Mind the hems; they're new." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. No tears in that sleeve yet, I hope?" },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Most of them do, I'm afraid, and I mend them quietly. A shaman might be more careful, being calmer than a novice." } },
      choices = {
        { text = "Careful hands save good cloth, Dermot. I'll mind mine.", next = "BACK", reply = "That's kind of you, and the cloth will thank you for it. If you do tear something, bring it to me before it's past saving.", fx = { align = { order = 1 } } },
        { text = "Robes are cheap. Let them tear.", next = "BACK", reply = "Cheap for you, perhaps, but every stitch is mine, and the Abbey's purse isn't deep. I'd ask you to be a little gentler all the same.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Often, because the kobolds have been stealing them from the Abbey stores and the Brothers ration what's left. I've taken to mending by the window at dusk, which is kinder on the eyes anyway." } },
      choices = {
        { text = "Then the kobolds should be driven out and the candles returned.", next = "BACK", reply = "That would be lovely, and the Brothers would light a candle for whoever did it, if they had any left. Mind yourself in those mines, though.", fx = { align = { order = 1 } } },
        { text = "Leave the kobolds their candles. Mend by moonlight, as we do.", next = "BACK", reply = "By moonlight? My eyes aren't what yours are, I'm afraid. I'll stick to the window at dusk and leave the moon to you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A quilted jack to go under the mail, and a good cloak for the nights on watch. They never think of either until they're cold and chafed, and then they come to me looking sheepish." } },
      choices = {
        { text = "I'll buy the padding before I need it.", next = "BACK", reply = "A sensible recruit, and I'll remember the face, because I see so few of them. You'll be glad of it the first frosty night on watch.", fx = { align = { order = 1 } } },
        { text = "I'll make do with the mail and nothing else.", next = "BACK", reply = "You'll be back, and you'll be sheepish, and I'll have the padding waiting. I don't say it to be cruel, only because I've seen it a hundred times.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Something soft and dark, oiled so the dew runs off. The wolves on the hillside see movement before colour, so stand still and you'll be invisible in anything, but a dry hunter is a happier one." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Something soft and dark, oiled so the dew runs off. And do keep your {pet} off my folded stock, because fur on a priest's robe is the one complaint I hear more than any." },
      },
      choices = {
        { text = "I'll take the soft leather and move quietly.", next = "BACK", reply = "Good choice, and I'll oil it myself before you go. A dry hunter is a patient hunter, and a patient hunter comes home.", fx = { align = { order = 1 } } },
        { text = "I'll take whatever's cheapest. They'll see me anyway.", next = "BACK", reply = "They'll see you sooner in the cheap stuff, I'm afraid, because it squeaks. Still, it's your coin and your hide, so I'll not argue.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because you all leave Northshire for Goldshire and Stormwind and wherever else, and you forget the fellow who stitched your first jerkin by candlelight. I don't mind, really, but a word of thanks now and then would warm the evenings." } },
      choices = {
        { text = "I'll come back and thank you, Dermot. You have my word.", next = "BACK", reply = "Oh, you needn't, really, though I'll admit it would be nice. I'll be here by the window, mending the next lot of sleeves.", fx = { align = { honor = 1 } } },
        { text = "Thanks don't pay for candles. Your coin's enough.", next = "BACK", reply = "It is, and I'll not pretend otherwise, but coin doesn't keep a body warm in the evenings. Off you go, then, and mind the brambles.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "They come back with mud from the graves and soot from whatever they've been burning, and I spend more time mending their robes than the priests' and the mages' together. The Brothers say it's penance for selling to them, but I think it's just mud." } },
      choices = {
        { text = "I'll take better care of your work, Dermot.", next = "BACK", reply = "That's very good of you, though I'll believe it when I see clean hems. A little less grave mud would do us both good.", fx = { align = { light = 1 } } },
        { text = "Robes are for wearing out. That's the trade.", next = "BACK", reply = "I suppose it is, though most trades don't wear out quite so fast as yours. I'll keep my needle busy either way.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Faster than I can sew them, because Priestess Anetta sends the novices into the vineyards after wounded recruits, and the brambles take the hems. I don't mind the work, though I've pricked my thumb so often the Brothers think I'm doing penance." } },
      choices = {
        { text = "A torn hem is a mark of service, Dermot.", next = "BACK", reply = "I'd like to think so, and I'll think it the next time I prick my thumb. It's nice to hear somebody calls it service and not clumsiness.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They should be more careful. Robes cost coin.", next = "BACK", reply = "They should, but they're running through brambles after bleeding boys, and I can't fault them for that. I'll mend them and keep my grumbling small.", fx = { align = { light = -1 } } },
        { text = "Something else, Dermot.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Most of Brother Sammuel's students do for the first year, and then they stop, once they learn that a bright tabard is the first thing a Defias archer aims at. I sell more plain grey than white these days, which says something about the road." } },
      choices = {
        { text = "I'll wear the colors. Folk should see who stands for them.", next = "BACK", reply = "Brave of you, and I'll sell you the white if you want it. Just promise me you'll keep your head down on the Westfall road.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Plain grey, then. Pride gets paladins killed.", next = "BACK", reply = "Grey's a sensible colour, and I've plenty of it. It's a sad thing to say about a paladin, but it'll keep you breathing.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! I've a bolt of white wool just up from Stormwind, and it's made for exactly your sort, if you keep it out of the brambles." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You'll want a tabard over that plate, and I've a few in the Abbey's colors, if you're the sort who likes to be noticed." },
        { id = "h_default", text = "I'm Dermot Johns. I sell robes to the priests and jerkins to the rest, and I spend my evenings mending both by candlelight." },
        { id = "h_caster", when = { any = { { class = "PRIEST" }, { class = "MAGE" } } }, text = "A robe-wearer, I see! Do keep it out of the brambles by the vineyards, will you? Silk doesn't forgive thorns." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Dark leather, I suppose, and nothing that squeaks. I've sold to your sort before, though they never come back to say how it went." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Soot on your sleeves and grave mud on your hem, so I can guess whose student you are. I'll sell you a robe, but keep this one out of the graveyard." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior in my shop! Padding, then, for under your mail, and I've some that's barely been sat on." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll want leather that doesn't snag on the brambles by the vineyards, and I've just the thing." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A night elf in Northshire, and that's finer stitching on your sleeve than any of mine. I'd ask who made it if I thought you'd tell me." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I mend the robes the novices tear, which is most of them, so I hope your spirits are gentler with cloth." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a hem half pinned." },
        { id = "h_again2", text = "Go on, I'm listening, though my needle isn't." },
      },
      choices = {
        { text = "Show me what you've sewn.", next = "BUSINESS" },
        { text = "Who tears the most robes?", next = "torn" },
        { text = "Where do you get your leather?", next = "leather" },
        { text = "Why don't rogues ever come back to thank you?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do La Salle's students ruin your robes often?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Warriors can't need much from a cloth merchant.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Which leather is best for walking the Northshire woods?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "The Abbey's novices must wear their robes out quickly, Dermot.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should a paladin wear the Abbey's colors, Dermot?", next = "xapala", when = { class = "PALADIN" } },
        { text = "You must run short of candles, mending at night.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "The novices seem to tear a great many robes, Dermot.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day.", next = "END" },
      },
    },
    torn = {
      lines = { { id = "t_default", text = "The novices who chase the wolves into the woods, the whole lot. Brother Paxton tends their bruises and sends them straight to me for their sleeves." } },
      choices = {
        { text = "You should charge them double for carelessness.", next = "BACK", reply = "I could, I suppose, but they've nothing much to pay with, and their mothers would never forgive me. I'll scold them instead, which is cheaper.", fx = { align = { light = -1 }, trait = { greedy = 1 } } },
        { text = "Mending for the young is good work.", next = "BACK", reply = "I like to think so, and it keeps my hands busy of an evening. Every sleeve I mend is one more lad sent out a little warmer.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    leather = {
      lines = { { id = "l_default", text = "From the wolves the recruits bring down, if you can believe it. They break their sleeves on the wolf, and then the wolf becomes new sleeves, which seems only fair." } },
      choices = {
        { text = "That's tidy work.", next = "leather_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leather_more = {
      lines = { { id = "lm_default", text = "Eagan Peltskinner down in Goldshire tans better than I ever could, I'll admit. When I've coin to spare I buy from him instead." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I came to the Abbey to pray and stayed to sew. The Light needs both, I think." } },
    _none = { { id = "tp_none", text = "I'm afraid that's beyond my needle, friend." } },
    holy_light = { { id = "tp_holy_light", text = "I came here to serve the Light, and it turned out the Light wanted robes. I sew a small prayer into every seam, and some days the robes hold up better than I do." } },
    brotherhood_northshire = { { id = "tp_brotherhood_northshire", text = "The Brotherhood took me in when I came with nothing but a needle and good intentions. They gave me a room and a stack of torn robes, and I've never been happier." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire's costumes have stitches I'd love to study, so bright and so fine. Brother Paxton calls it vanity and I call it craft, and we both pray on it." } },
  },
}

-- Janos Hammerknuckle: dwarf weaponsmith at the Abbey.
P:NPC {
  key = "janos", id = TODO_NPC("Janos Hammerknuckle"), name = "Janos Hammerknuckle", title = "Weaponsmith",
  bible = "bibles/northshire_smiths.md", role = "vendor", tier = "service",
  communities = { "northshire" }, temper = { "gruff" }, values = { "craft" },
  impression = {
    first = "He grumbles about how human recruits hold the blades he sells them.",
    third = "{name} met Janos Hammerknuckle, a dwarf weaponsmith at Northshire Abbey.",
  },
  greetings = {
    { id = "g_default", text = "Swords, maces an' axes, every one forged honest. Pick one an' hold it the right way round, if ye please." },
    { id = "g_back", when = { metBefore = true }, text = "Ye came back with all yer fingers. Good, that means ye listened." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I miss it every day, the halls and the ale and stone with some backbone. Some of the old clans might grumble about a shaman, but I'd not, not this far from home." } },
      choices = {
        { text = "Folk far from home should stand together, Janos.", next = "BACK", reply = "Aye, that's the spirit, an' it warms an old smith's heart tae hear it this far from the mountain. Come back an' share a drink when ye've a spare evening.", fx = { align = { honor = 1 } } },
        { text = "The old clans are right. Shamans are strange to us.", next = "BACK", reply = "Maybe they are, maybe they aren't, but I'll no' turn away a dwarf for talkin' tae the wind. Ye're stranger to yerself than ye are tae me, {g:lad|lass}.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "A plain dagger, {g:lad|lass}, for the times when the spell fails an' the wolf doesn't. Drusilla La Salle's students always want somethin' curved an' wicked-lookin', an' I tell them a straight blade cuts just as deep an' doesn't make the guards nervous." } },
      choices = {
        { text = "Plain it is. I've no need to frighten anyone.", next = "BACK", reply = "Sensible, an' the guards'll thank ye for it. A plain blade does its work an' nobody stares at ye on the road.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll take the wicked-looking one. Fear has its uses.", next = "BACK", reply = "Fear's a fine tool till it makes the guards draw on ye. I'll sell it ye, but dinnae come cryin' when ye're stopped at every gate.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "We love what's under it, mostly, the ore an' the stone, though I'll admit Dun Morogh's pines smell better than any forge. Ye keep the trees an' I'll keep the iron, an' we'll get on fine." } },
      choices = {
        { text = "The earth gives you ore. A little thanks wouldn't hurt.", next = "BACK", reply = "Thanks, is it? I suppose I could raise a mug tae the mountain now an' then. Ye've a strange way o' seein' things, but it's no' a wicked one.", fx = { align = { honor = 1 } } },
        { text = "Ore's there for whoever digs. The earth won't miss it.", next = "BACK", reply = "That's the dwarven view, near enough, an' ye'd get on fine in Ironforge. Mind ye, dinnae say it too loud near the druids.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Firm in the hand, loose in the wrist, an' never like a soup ladle, which is how the recruits do it. Grip it too tight an' the first kobold that hits it will numb ye to the elbow." } },
      choices = {
        { text = "Firm and loose, then. I'll practise till it's right.", next = "BACK", reply = "Good, an' dinnae let the soreness put ye off. The wrist learns slower than the head, but it learns.", fx = { align = { order = 1 } } },
        { text = "I'll grip it how I like, so long as it cuts.", next = "BACK", reply = "Then ye'll grip it wrong an' it'll still cut, right up till it doesnae. Dinnae come back with a numb arm an' complain about my steel.", fx = { align = { order = -1 } } },
        { text = "Something else, Janos.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Every day o' the week, an' twice on feast days. A bow's a bent stick, but a gun's a feat o' craft, an' it makes a noise that'll scatter wolves from here to the abbey gate." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Every day o' the week, an' twice on feast days, for a gun's a feat o' craft an' a bow's a bent stick. That {pet} o' yours has a proper look about it, too, wi' shoulders like a mountain beast." },
      },
      choices = {
        { text = "Whatever the weapon, I'll aim for a clean kill.", next = "BACK", reply = "Spoken like a proper hunter, an' I'll respect ye for it even if ye choose the bent stick. The wolf won't care what dropped it, so long as it's quick.", fx = { align = { honor = 1 } } },
        { text = "A gun, for the noise alone.", next = "BACK", reply = "Ha! Now there's a hunter after my own heart! Come back when ye've the silver an' I'll show ye a rifle that'll make the wolves weep.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Point away from ye, edge down, an' loose enough that it doesn't twist in yer hand, an' most recruits cannae manage even that. I'd sooner sell a dagger tae a rogue than a sword tae a farmhand, because at least I know ye'll use it." } },
      choices = {
        { text = "I'll use it well and honorably, Janos.", next = "BACK", reply = "Honorably, aye, an' I'll take ye at yer word. A good blade deserves a decent hand on the hilt.", fx = { align = { honor = 1 } } },
        { text = "I'll use it however the moment calls for.", next = "BACK", reply = "That's an honest answer, an' I'd rather that than a lie. Just keep it pointed at kobolds an' no' at my customers.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The smart ones carry one for when the spell fizzles an' the kobold's still comin', because kobolds don't wait for ye tae finish castin'. I've sold a few tae Khelden Bremen's students, an' every one o' them held it like a quill." } },
      choices = {
        { text = "A sensible precaution. I'll carry one and learn to use it.", next = "BACK", reply = "Now there's a mage with sense, which isnae as common as ye'd think. Hold it by the grip, mind, an' no' like a quill.", fx = { align = { order = 1 } } },
        { text = "If my spell fizzles, a dagger won't save me anyway.", next = "BACK", reply = "Maybe no', but it'll buy ye a breath, an' a breath's enough tae run. I've seen a dagger save more lives than ye'd credit.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "We pray before everythin', {g:lad|lass}, battle an' supper an' a long walk alike, though some of us pray tae the stone an' some tae the Light an' some tae the ale. I'll say a word before I hand a recruit a sword, an' I'll thank ye no' to tell the humans." } },
      choices = {
        { text = "A word before battle never hurt anyone. Good, Janos.", next = "BACK", reply = "Aye, an' it's never hurt me neither. Keep it quiet, though, or Paxton'll have me in the chapel every mornin'.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Steel wins battles, Janos, not words.", next = "BACK", reply = "Steel helps, aye, an' I'll grant ye that, since I make it. But I've seen good steel lose tae bad luck, an' a wee word costs nothin'.", fx = { align = { light = -1 } } },
        { text = "Something else, Janos.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Aye, gladly, an' I'd forge it the Ironforge way, heavy in the head an' honest in the haft. But I'll ask ye first what ye mean to hit wi' it, because a hammer's a promise, an' I'll no' make one for a bully." } },
      choices = {
        { text = "Only those who prey on the weak. You have my word.", next = "BACK", reply = "Then ye'll have yer hammer, an' it'll ring true. I'll hold ye tae that word, mind, every time I hear yer name.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Whoever stands in my way. That's my business, smith.", next = "BACK", reply = "Is it now? Then ye'll have tae find yer hammer somewhere else, because I'll no' forge for a bully, no' for all the silver in Stormwind.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! I've a mace that'd suit ye, if ye've the arm for it, though most o' yer lot prefer the staff." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Now there's a weapon worth makin', because yer lot actually look after what I sell ye." },
        { id = "h_default", text = "I'm Janos Hammerknuckle, an' I sell steel tae the Abbey's recruits, an' I've given up countin' how many o' them grip a sword like a soup ladle." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "Well now, a proper dwarf! Ye've no idea how good it is to hear a sensible voice up here among all these tall folk." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue, is it? Ye'll be wantin' a dagger, I suppose, an' at least ye'll hold it the right way round." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, eh? Ye'll no' be wantin' steel, I suppose, unless it's a wee dagger tae open yer letters with." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Now there's someone who'll hold a blade like it means somethin', or I'll know why." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Do ye carry a gun, or one o' those bows? I'll forgive the bow, if ye're a good shot." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A night elf! I've no' seen one o' yer folk since Ironforge, an' never one who walked intae a smithy on purpose." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Ye've a cold look about ye, an' I can guess who taught ye. I sell daggers an' staves, an' I'll sell one tae ye, though I'd wager my beard ye mean tae do yer killin' some other way." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, by the look o' ye! Well, if the stone talks tae ye, ye'll know how tae hold a blade better than these humans." },
      },
      again = {
        { id = "h_again", text = "What else is on yer mind, then? Out with it afore the forge cools." },
        { id = "h_again2", text = "Still here? Ask away, {g:lad|lass}, for I've a blade tae quench." },
      },
      choices = {
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Why leave Ironforge for an abbey?", next = "why" },
        { text = "How should I hold a sword, then?", next = "grip" },
        { text = "What's the right way to hold a dagger, Janos?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I've rarely seen a mage carry a dagger.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "How should a warrior hold a sword, Janos?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "I'd guess you think a gun beats a bow, Janos.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I'd guess dwarves pray before battle, Janos.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "You'd forge a fine hammer for a paladin, I'd wager.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do dwarves have any love for the forest, Janos?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Which blade would you sell someone whose spells sometimes fail, Janos?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "You must miss Ironforge, Janos.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because the humans pay in good silver, an' the forges back home have more smiths than anvils, an' nobody here argues wi' me about Bronzebeard politics over breakfast." } },
      choices = {
        { text = "Coin's a fine reason to travel.", next = "BACK", reply = "It is, an' I'll no' pretend otherwise, because a dwarf likes his purse heavy. But I'll no' deny the quiet breakfasts are worth somethin' too.", fx = { align = { honor = -1 }, trait = { greedy = 1 } } },
        { text = "Arming the young is the better reason.", next = "BACK", reply = "Aye, maybe, an' I'll admit it when I watch them walk off tae the kobold camps. I'd like tae think my steel brings a few of them back.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grip = {
      lines = { { id = "g_line", text = "Firm, but no' like ye're stranglin' a chicken. Let the wrist move an' the weight do the work, an' ye'll still have an arm by supper." } },
      choices = {
        { text = "And if I'm fighting kobolds?", next = "grip_kobold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grip_kobold = {
      lines = { { id = "gk_default", text = "Then aim low, for they're short, an' keep clear o' their candles, for they've a way o' settin' folk alight wi' those daft wax hats." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was born in Dun Morogh, under the snow an' the stone, an' I came tae Northshire by choice. Mostly by choice, mind." } },
    _none = { { id = "tp_none", text = "Bah, ask me about steel or don't ask me at all, for I'm a smith an' no' some scholar from the Explorers' League." } },
    magni = { { id = "tp_magni", text = "King Magni's the best king a dwarf could ask for, an' he's never once asked me to come home, which I take as a compliment. Ironforge'll keep." } },
    wildhammer = { { id = "tp_wildhammer", text = "Wildhammer? Wild, aye, an' loud, an' they'd rather ride a bird than hold a hammer properly. They're kin, so I'll say no more than that." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons are a curse on the whole dwarven race, an' I'll not have their name said over my anvil twice. Ask me about steel instead." } },
    echo_ridge = { { id = "tp_echo_ridge", text = "Every kobold pick that comes back from Echo Ridge is poorer steel than the last. Whatever they're diggin' for down there, they're not findin' good ore." } },
  },
}

-- Brother Paxton: priest who walks the Abbey grounds healing novices; buys Rethban ore for ink.
P:NPC {
  key = "paxton", id = TODO_NPC("Brother Paxton"), name = "Brother Paxton", title = nil,
  bible = "bibles/northshire_smiths.md", role = "priest", tier = "service",
  communities = { "northshire" }, temper = { "gentle" }, values = { "faith", "mercy" },
  prejudice = { class = "WARLOCK", amount = 10, why = "Heals novices burned and chilled when Drusilla's students' summonings go wrong." },
  impression = {
    first = "He seems to know every bruised recruit by name.",
    third = "{name} met Brother Paxton, who walks Northshire's grounds healing the recruits.",
  },
  greetings = {
    { id = "g_prejlock1", when = { prejudiced = true }, text = "I've spent too many nights healing novices your fellows burned by mistake. Keep your creature away from the wounded, or I'll call the guard." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "I'll heal any soul who comes to me hurt, but I won't pretend I'm glad to see you. Say what you need." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "You've never brought me a burned novice yet, which is more than I can say for your teachers. Go on, then, but carefully." },
    { id = "g_default", text = "Light be with you. If you're hurt, say so; that's what I'm walking about for." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again, and standing upright, praise the Light." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It heals everyone who's hurt, I believe. I know every recruit's bruises by name, and I'll learn yours too if you stay." } },
      choices = {
        { text = "The Light's mercy is for all. I believe that, Brother.", next = "BACK", reply = "I'm glad to hear it, and gladder to hear it from someone who walks with the spirits. Come and see me if you're hurt, whatever you believe.", fx = { align = { light = 1 } } },
        { text = "The Light should save its mercy for the faithful.", next = "BACK", reply = "I can't believe that, I'm afraid, and I'll not pretend to. A wound is a wound, and I've never once asked a bleeding man what he prays to.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I do, because the Light doesn't ask what you were doing when you got hurt, and neither do I. Jorik Kerridan's students come to me with the strangest wounds, and I mend them without a word, though I do pray a little longer over some of them." } },
      choices = {
        { text = "Thank you, Brother. I'll try to deserve it.", next = "BACK", reply = "You've nothing to deserve, friend, because the Light gives freely. Only try not to need me too often.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Save your prayers, Brother. The bandages are enough.", next = "BACK", reply = "They'll do the work, I suppose, but I'll pray all the same, because I can't help it. You needn't listen.", fx = { align = { light = -1 } } },
        { text = "Something else, Brother.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I've done it once, for a cub caught in a snare by the vineyard, and the Brothers scolded me for a week. The Light doesn't ask whether you've got fur, as far as I can tell, though I keep that opinion out of the chapel." } },
      choices = {
        { text = "Mercy for every creature. The Light and the land agree.", next = "BACK", reply = "They do, I think, though I'll not say so in the chapel. Brother Sammuel already thinks I'm half a druid.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "The Brothers were right. Recruits come first, wolves last.", next = "BACK", reply = "Perhaps, and the Brothers would agree with you. Still, I don't think the Light ever had to choose between them, and I'd rather not either.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More than anyone else in Northshire, because you're always the first one in. I don't mind it; the Light gives me something to give, and you give the kobolds something to hit besides the priests." } },
      choices = {
        { text = "I'll stand in front, so others don't have to.", next = "BACK", reply = "That's a good heart, and I'll pray it keeps you standing. I'll be right behind you with my hands ready.", fx = { align = { light = 1 } } },
        { text = "I'll take the hits because I like the fight.", next = "BACK", reply = "Then you'll keep me busy, and I'll not complain, though I wish you'd like it a little less. Come and see me when the fight's done.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "It mends what lives, and your companion lives, so I don't see why not. I've laid hands on a hunter's wolf that took a kobold's pick in the flank, and it licked my hand after, which I took as thanks." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "It mends what lives, and your companion lives, so I don't see why not. Your {pet} looks healthy, but if it's ever hurt, bring it to me; I don't charge, and it doesn't need to pray." },
      },
      choices = {
        { text = "My beast deserves the same care as any of us.", next = "BACK", reply = "I agree, and I'll mend your companion as gladly as I'd mend you. Bring it to me if it's hurt.", fx = { align = { light = 1 } } },
        { text = "It's an animal, Brother. Save your prayers for people.", next = "BACK", reply = "I can't see the harm in it, myself, and I've never run short of prayers yet. If your companion's hurt, I'll still lay hands on it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "All of them, at least once, and usually the week they learn their first fireball and try it on a wolf by the vineyards. The Light mends burns well enough, but I wish the Light could mend impatience." } },
      choices = {
        { text = "I'll be careful with my fire, Brother. Patience first.", next = "BACK", reply = "Then you'll be the first of Khelden's students to manage it, and I'll be very glad. The wolves will be glad too.", fx = { align = { order = 1 } } },
        { text = "Burns are how you learn. A few scars never hurt.", next = "BACK", reply = "They may be, but I've stitched up a few who learned the lesson too well. Do me a kindness and burn the wolves, not yourself.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I don't think the Light rejects anyone, but it doesn't always reach them, and I worry that your path takes you further from it every day. I'll still mend you if you come to me hurt, because that's what I'm here for." } },
      choices = {
        { text = "I'm grateful for your mercy, Brother. I'll remember it.", next = "BACK", reply = "I hope you will, and I hope you'll come to me before you need to. I walk past the graveyard gate every evening, whatever you've been doing.", fx = { align = { light = 1 } } },
        { text = "I don't need the Light. My power answers to me.", next = "BACK", reply = "Then I'll pray for you all the same, and you needn't thank me for it. Come back if your power ever fails you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "A recruit who'd been bitten by a kobold and wouldn't stop apologizing, because he thought he'd failed the Marshal. The bite healed by supper, but the shame took a month of walks, and I'm still not sure I mended all of it." } },
      choices = {
        { text = "The heart heals slowest. Walk with him as long as he needs.", next = "BACK", reply = "I will, as long as he'll let me. It's good to hear you see it too, because so many think a bruise is the only wound.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Recruits need to toughen up. Shame makes them careful.", next = "BACK", reply = "I don't think so, I'm afraid, because shame makes them hide, and hiding gets them killed. I'd sooner they learned courage than fear.", fx = { align = { light = -1 } } },
        { text = "Something else, Brother.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "More often lately, because the kobolds in the Echo Ridge Mine have started coming out at dusk, and they don't care whose robe they're cutting. I'd never ask, mind, but I'd not refuse a shield walking beside me." } },
      choices = {
        { text = "Then I'll walk your rounds with you, Brother.", next = "BACK", reply = "That's very kind of you, and I'll not pretend I'm not relieved. We'll go at dusk, when they come out.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A healer should learn to defend himself, Brother.", next = "BACK", reply = "I've been told that before, and I've tried, but my hands are better at mending than hurting. Perhaps you're right, all the same.", fx = { align = { light = -1 } } },
        { text = "Something else, Brother Paxton.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! One of Brother Sammuel's, I'd guess, and either way you'll be the one standing over me while I mend somebody." },
        { id = "h_default", text = "I'm Brother Paxton. I walk the grounds from the vineyards to the gate, and I mend whatever the wolves and kobolds leave of our recruits." },
        { id = "h_priest", when = { class = "PRIEST" }, text = "A fellow servant of the Light! Walk with me a while, if you've the time, and you'll learn more healing on this path than in any book." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! Khelden Bremen's students always come to me with burns on their fingers, and I mend them and tell them to be more careful, though they never are." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "Another of Drusilla La Salle's students, walking the Abbey grounds as if you belonged here. I mend the hurts your kind leaves behind, and I'm tired of it." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "Ah, you. You're the one who's never once left a novice for me to mend. Come in, and keep your friend at the gate." },
          text = "You've come from Drusilla La Salle's graveyard. I can feel it on you, and I'll admit it makes me uneasy." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll be the reason I walk the long way round to the barracks, I expect, with linen in both hands." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. I mend your beasts too, you know, if they'll let me close enough." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, here at the Abbey! If you can mend a wolf bite, I'll gladly share the work, because the recruits bring me more than I can carry." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue. I mend whatever the kobolds leave of the recruits, and I'll mend you too, whatever you were doing when they caught you." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I'm Brother Paxton, and if you're bruised, I'll heal you, spirits or no. The Light doesn't ask what you believe." },
      },
      again = {
        { id = "h_again", text = "Something else on your mind, child?" },
        { id = "h_again2", text = "Ask what you like; my feet are tired but my ears are not." },
      },
      choices = {
        { text = "Why walk, instead of staying in the Abbey?", next = "walk" },
        { text = "What do the Abbey's scribes use for ink, Brother?", next = "ink" },
        { text = "Khelden's students seem to burn themselves often.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Is there anything the Light turns away, Brother?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "You must mend a great many warriors, Brother Paxton.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Will the Light mend a hunter's beast, Brother?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What's the hardest wound you've mended on these grounds, Brother?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "You could use a paladin beside you on your rounds, Brother.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you ever heal the wolves too, if they're wounded?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you heal rogues the same as anyone else, Brother?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Does the Light heal everyone who needs it, Brother?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day, Brother.", next = "END" },
      },
    },
    walk = {
      lines = { { id = "w_default", text = "Because the hurt ones don't always come inside. A recruit with a wolf bite will limp on rather than admit it, so I go and find him first." } },
      choices = {
        { text = "Pride gets soldiers killed.", next = "walk_pride" },
        { text = "Something else.", next = "BACK" },
      },
    },
    walk_pride = {
      lines = { { id = "wp_default", text = "It does, and so does shame, which is pride's quieter sister. I'd sooner heal a boy who's embarrassed than bury one who was brave." } },
      choices = {
        { text = "The weak should learn to ask for help.", next = "BACK", reply = "I'd rather they learned it gently than the hard way, and I'll keep teaching them. Not every boy knows how to ask.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Then you're doing the Light's work.", next = "BACK", reply = "I hope so, though I'm never quite sure. It's a quiet sort of work, but I wouldn't trade it.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ink = {
      lines = { { id = "i_default", text = "Rethban ore from Lakeshire, ground fine, which I buy from Foreman Oslow. It makes a lovely ink, though he's been too busy with his bridge to send any lately." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I took my vows here and I expect I'll die here, hopefully of old age." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know, child, but I'll pray you find out." } },
    holy_light = { { id = "tp_holy_light", text = "The Light asks very little of us, child, only everything, and it's patient while we work our way up to it. I've been working my way up for thirty years." } },
    brotherhood_northshire = { { id = "tp_brotherhood_northshire", text = "Archbishop Faol founded the Brotherhood to keep the Abbey and its books and to train the Light's servants. I'd add that it now exists to keep my assistant Daniel from losing those books, but that's a newer duty." } },
    scourge = { { id = "tp_scourge", text = "We pray for Lordaeron every evening, child, for the dead and for those who aren't allowed to rest. I've found the second prayer much harder to say." } },
    scholomance = { { id = "tp_scholomance", text = "There are books in our sealed wing that the Scholomance would kill for, and I mean that plainly. That's why I keep the key, and why I don't lend it to Daniel." } },
  },
}
