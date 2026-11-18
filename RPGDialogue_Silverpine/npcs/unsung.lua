-- The Sepulcher's shopkeepers with no quests of their own: the mushroom merchant, the
-- clothier and the general supplier. Voices: bibles/unsung.md
local P = RPGDialogueAPI:Pack("rpgd.silverpine")
local TODO_NPC = P.TODO_NPC

-- Gwyn Farrow: sells mushrooms in the Sepulcher's crypts.
P:NPC {
  key = "gwyn", id = TODO_NPC("Gwyn Farrow"), name = "Gwyn Farrow", title = "Mushroom Merchant",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "sepulcher" }, temper = { "cheerful" }, values = { "practical", "curious" },
  notices = { "hunger", "race" },
  impression = {
    first = "She knows which mushrooms will kill a living customer.",
    third = "{name} met Gwyn Farrow, the Sepulcher's mushroom merchant.",
  },
  greetings = {
    { id = "g_shop", text = "Mushrooms, fresh from the damp! Well, as fresh as anything in a crypt, anyway." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more caps? I knew you'd develop a taste for them." },
  },
  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "Oh, you're one of the living ones! Then let me steer you toward the caps that won't make you see colours, because some of my stock is meant for stronger stomachs." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Curiosity, mostly, and a little bit of hope, because if a crypt mushroom can survive the Light, then perhaps the rest of us down here can too. And if it shrivels up, well, I'll know not to sell that one to you." } },
      choices = {
        { text = "Everything in Lordaeron can survive the Light, given time.", next = "BACK", reply = "What a lovely thought, dear, and from a paladin of all people. I'll put a cap aside and see if it proves you right.", fx = { align = { light = 1 } } },
        { text = "Some things grow better in the dark, Gwyn.", next = "BACK", reply = "They do, don't they? I'm rather proof of that myself, and so are my best mushrooms.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "A few, dear, for the living and the dead both, though never the same ones! The pale caps from under the Sepulcher settle a Forsaken's joints, and the little brown ones by the Dead Fields ease a living fever if you boil them twice. I'd never sell a healer the wrong kind." } },
      choices = {
        { text = "Then I'll take the healing ones and leave the rest.", next = "BACK", reply = "Sensible of you, dear. The rest are for customers with stronger stomachs, or none at all.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'd rather try the ones you won't sell a healer.", next = "BACK", reply = "Useful, yes, if you're dead, and rather final if you're not. I'll keep them under the counter for you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Some of them are safe for anyone, some are safe only for the dead, and the rest I keep under the counter for the apothecaries. Eat a few of the safe ones before you go out into the forest, and you'll have something in your stomach besides worry." } },
      choices = {
        { text = "I'll stick to the ones you say are safe, Gwyn.", next = "BACK", reply = "Wise, dear, very wise. I've had warriors come back green, and it's a terrible thing to clean up.", fx = { align = { order = 1 } } },
        { text = "I'll try the ones under the counter. I'm not afraid.", next = "BACK", reply = "Brave, or foolish, which is the same thing in my shop. On your own head be it, dear.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Under the fallen pines, where the worgen won't bother digging, and in the damp caves where the spiders spin. Bring me any you're not sure of, and I'll tell you whether they'll feed you or finish you." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Under the fallen pines and in the damp caves, and {pet} will sniff them out quicker than I ever could. Just don't let it eat any, because I couldn't tell you which ones would agree with it." },
      },
      choices = {
        { text = "I'll bring them to you, Gwyn, and leave guessing to experts.", next = "BACK", reply = "That's the spirit, dear. Bring them in a basket and I'll tell you which ones would have killed you.", fx = { align = { order = 1 } } },
        { text = "I'll taste them myself. That's the best part.", next = "BACK", reply = "Half the fun and all of the risk, dear. Do come back and tell me how it went, if you can.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They do, because they eat like the rest of us, and some of them are still living, which makes it a little tricky. I warn the living ones off the grey caps and sell them the brown, and I've not lost a customer yet, as far as I know." },
      },
      choices = {
        { text = "I'll trust your word, Gwyn.", next = "BACK", reply = "Thank you, dear. My word's all I have left, but I keep it well.", fx = { align = { honor = 1 } } },
        { text = "I'd want to see you eat one first.", next = "BACK", reply = "I'd love to, dear, but I'm dead, so it wouldn't prove a thing. You'll have to trust me.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Gwyn Farrow, and I sell mushrooms to the Sepulcher. They grow well in the dark and the damp, which is the only thing this forest has more of than worgen." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! You'll know which mushrooms the spirits like, I expect, and I'd love to know, because I've three here I can't put a name to." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, come to see my mushrooms! I keep them in the dark under the stairs, and they grow better here than anything I tried to grow in life." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! You'll be hungry after the worgen, I'd wager, and I've a few mushrooms that won't hurt you even if you're still breathing." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter! You'll walk past more mushrooms in a day than I find in a week, so look down now and then, would you?" },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, how lovely! Mind the purple caps at the end of the table, dear, because they'd have you seeing visions you never prayed for." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage! Can you tell what a mushroom is just by looking at it? No? Then you'll have to trust me." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin! Oh, how lovely, and would you mind holding your hand over these caps, because I've always wondered whether a mushroom that grows in a crypt can stand a bit of the Light." },
      },
      choices = {
        { text = "Do any of your mushrooms help with healing, Gwyn?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Shall I tell you which caps are safe for the living, Gwyn?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Some of these mushrooms look like they grew from the plague.", next = "druid_q", when = { class = "DRUID" } },
        { text = "Show me your mushrooms.", next = "BUSINESS" },
        { text = "Those mushrooms must grow somewhere damp.", next = "where" },
        { text = "Why mushrooms, of all things?", next = "why" },
        { text = "Which of your mushrooms would a rogue want, Gwyn?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do mushrooms grow where demons have walked, Gwyn?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Are your mushrooms safe for a warrior to eat, Gwyn?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Where do the best mushrooms grow in Silverpine, Gwyn?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "I'd guess mages buy your mushrooms too, Gwyn.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Why would you want the Light on your mushrooms, Gwyn?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Not today.", next = "END" },
      },
      again = { { id = "h_again", text = "Anything else, dear? I've got all night, and so do the mushrooms; neither of us minds the dark." } },
    },
    where = {
      lines = { { id = "w_default", text = "Some grow right here in the crypts, under the stairs where it's wettest, and the best ones grow on the old logs near Lordamere Lake. I don't go out myself anymore, because the worgen near Pyrewood don't care that I'm already dead." } },
      choices = { { text = "What are the worgen, exactly?", next = "worgen" } },
    },
    worgen = {
      lines = { { id = "wg_default", text = "Wolf-men that the wizard Arugal let loose, and they've taken Shadowfang Keep and most of the southern woods with it. The Deathstalkers hunt them, but there always seem to be more of them in the morning." } },
      choices = {
        { text = "Then they must be hunted down, every one.", next = "BACK", reply = "Every one, yes, and I'll not weep for them. They've eaten three of my best foragers.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Some of them might have been people once.", next = "BACK", reply = "Some of them, perhaps, poor things, and that's the saddest part. Still, they'd eat me just the same.", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "y_default", text = "Because they grow without sunlight, they keep for weeks, and the dead can eat them without trouble. Before I died I grew turnips, and frankly, mushrooms are much better company." } },
      choices = { { text = "Ha! Turnips never did talk back. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Oh, please do, dear, since I can't taste the difference anymore and I'd hate to poison a guest. The grey ones from Lordamere Lake are fine for the dead, but I had an orc go a shade greener after eating one, which I didn't think was possible." } },
      choices = {
        { text = "Mark the dangerous ones, Gwyn. Your customers deserve it.", next = "BACK", reply = "That's very sweet, dear, and I'll start with little flags. The living will thank you, I'm sure.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let the living learn for themselves, Gwyn.", next = "BACK", reply = "Learn for themselves? Oh, dear, that's how I lost my last living customer. I'll mark them anyway.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Some of them, I think, because the ones off the crypt walls are a funny colour, and those I sell only to the apothecaries. The ones from the old logs by the lake are clean as you like, so buy those, dear, and don't ask about the others." } },
      choices = {
        { text = "Then sell only the clean ones, Gwyn, and mark the rest.", next = "BACK", reply = "That's what I've been doing, dear, mostly. You're kinder than the apothecaries, I'll say that.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Sell them all. The buyer can take care.", next = "BACK", reply = "Caveat emptor, as my mother used to say. Still, I'd rather not lose any more customers.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "The pale caps that grow along the lake shore, because they'll put a living man to sleep for a day and leave a dead one feeling nothing at all. I sell them for cooking, mind, and I don't ask what my customers cook." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "You've a cutpurse's way of looking at my stall, counting what's on it and what's under it. Everything under it is poisonous, dear, so I'd stick to what's on top." },
      },
      choices = {
        { text = "A sleeping guard is better than a dead one.", next = "BACK", reply = "Much better, dear, and much less mess. I'll wrap them up for you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A dead guard never wakes up, Gwyn.", next = "BACK", reply = "No, dear, he doesn't, and that's rather the trouble with him. Mushrooms are gentler.", fx = { align = { honor = -1 } } },
        { text = "Where do you find them all?", next = "where" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They do, as it happens, and they come up black and smelling of brimstone, so I leave them for the bats. Do keep your little friend off my stall; one trod on a whole tray of caps the last time a warlock stopped by." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "They do, and they come up black and stinking of brimstone, and still they're better eating than the caps that grow on the dead. Keep your little friend off my stall, though, because one trod on a whole tray last week." },
      },
      choices = {
        { text = "I'll keep it off your stall, Gwyn.", next = "BACK", reply = "Thank you, dear. The bats are very particular about their brimstone.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My imp goes where it likes, Gwyn.", next = "BACK", reply = "Then I'll charge it for whatever it eats, dear, and the imp can explain it to you.", fx = { align = { order = -1 } } },
        { text = "Why mushrooms, of all things?", next = "why" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "The Forsaken can eat anything I sell, which is very good for business. The living have to be a bit more careful, and I make sure to tell them." } },
    shadowfang = { { id = "tp_shadowfang", text = "There are mushrooms growing on the walls of Shadowfang Keep that I'd love to sample. The worgen won't let me near, which is very rude of them." } },
    thrall = { { id = "tp_thrall", text = "Orcs and trolls come through sometimes and buy my mushrooms without asking which ones are safe. I always tell them, and they always look a bit green afterward." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, dear. Ask the High Executor; he knows everything that moves in this forest, and most of what's stopped moving." } },
  },
}

-- Andrea Boynton: the Sepulcher's clothier.
P:NPC {
  key = "boynton", id = TODO_NPC("Andrea Boynton"), name = "Andrea Boynton", title = "Clothier",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "sepulcher" }, temper = { "fussy" }, values = { "proud", "craft" },
  notices = { "kit", "craft" },
  impression = {
    first = "Death did nothing to lower her standards.",
    third = "{name} met Andrea Boynton, the clothier of the Sepulcher.",
  },
  greetings = {
    { id = "g_shop", text = "Robes, gloves and boots, and none of them moth-eaten, which is rare in a crypt. Come and look." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and your clothes are worse than last time. Come in before I faint." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor! Then you'll understand my pain when I see the stitching on the Deathguards' tabards." },
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "Good grief, you're barely wearing anything at all! I know we're dead, but have some dignity, please." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Only if you mean them, dear, and only if you've the nerve, because every Scarlet in Tirisfal will take it as an insult. I'd rather see something new, in the Dark Lady's colours with a little gold at the hem, though that's only a seamstress dreaming." } },
      choices = {
        { text = "I'll wear the old colours and mean them.", next = "BACK", reply = "Then I'll stitch them with my best thread, dear, and pray you don't meet a Scarlet on the road.", fx = { align = { honor = 1 } } },
        { text = "New colours, Andrea. The old order is dead.", next = "BACK", reply = "Dead, yes, and so are we all, dear. New colours it is, and I'll make them handsome.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "For the chapel in my village, every spring, white and gold with the Light's sun stitched on the breast. I can't bring myself to stitch that sun now, though my hands still remember every thread of it. Whatever you pray to, I'll make sure you look as though you meant it." } },
      choices = {
        { text = "The Light's sun still deserves stitching, Andrea.", next = "BACK", reply = "It does, doesn't it? I'll stitch one for you, small, inside the collar where nobody sees.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Leave the sun behind. It never stitched anyone back.", next = "BACK", reply = "No, it never did, did it? I'll stitch something else, then, something that doesn't remember.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A proper shirt under the mail, so it doesn't chafe, and a cloak that isn't held together with worgen hair. I can't make you plate, but I can make you look as though you meant to come out of the house today." } },
      choices = {
        { text = "Sew me something decent, then, Andrea.", next = "BACK", reply = "Decent is all I make, dear. Come back in two days and you'll have the finest shirt in Silverpine.", fx = { align = { order = 1 } } },
        { text = "Mail and blood are all a warrior needs to wear.", next = "BACK", reply = "Then you'll chafe and bleed and come back to me in a week. I'll keep a shirt ready.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Nothing you'd wear, since you're all leather and mail, and you've tracked mud across my floor besides. A good cloak keeps the rain off and the forest smell out, though. Silverpine's damp gets into everything, and I mean everything, so wrap up before you go back out." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Nothing for you, I'm afraid, and certainly nothing for {pet}, who has tracked mud in and shed on my best bolt of linen. A good cloak keeps the rain off, though, and Silverpine's damp gets into everything." },
      },
      choices = {
        { text = "I'll wipe my boots next time, Andrea.", next = "BACK", reply = "Bless you, dear, my floor thanks you. Not many think of it.", fx = { align = { order = 1 } } },
        { text = "Mud's part of the hunt, Andrea. Get used to it.", next = "BACK", reply = "I've been getting used to it for years, dear, and it never gets easier. Mind the rug.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "The buckles, for a start, because they rattle, and a rogue who rattles is a rogue who dies in a Silverpine ditch. I sell cloth, not leather, but I'll tell you what any good seamstress would: tie it tight and pad whatever clinks." },
      },
      choices = {
        { text = "Thank you. I'll fix the buckles right away.", next = "BACK", reply = "Good, dear, quiet buckles mean a long life. Well, a long whatever-this-is.", fx = { align = { order = 1 } } },
        { text = "My gear's fine as it is, Andrea.", next = "BACK", reply = "Then rattle on, dear, and I'll sew your shroud when the worgen hear you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Andrea Boynton, clothier, and I sell robes and cloth armor to the Sepulcher's mages and priests. Most of them come to me looking like they dressed in the dark, which I suppose they did." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, in mail and furs with totems knocking about your belt? Come here and let me at least fix how all that's tied on." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! You change shape, I'm told, so tell me, what happens to the robe?" },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. I don't sell anything you'd wear, {class}, but I'll say this much: that tabard needs mending, and badly." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, tracking mud across my floor. Your lot are always the worst, because you've been crawling through the undergrowth for days." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, and in robes that have seen far too many roads. Come here and let me look at that hem before it drags you into a bog." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue! Dark leather, I suppose, and all of it buckled wrong. Stand still and let me look at you." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin, in plate over dead shoulders! Come here and let me see how that tabard sits, because the Silver Hand always wore theirs crooked and I'll not have you carrying on the tradition." },
      },
      choices = {
        { text = "Did you make vestments in life, Andrea?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What's wrong with how I dress, Andrea?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "My robe simply comes back when I change, Andrea.", next = "druid_q", when = { class = "DRUID" } },
        { text = "Show me your clothes.", next = "BUSINESS" },
        { text = "You sew like someone who did it in life.", next = "past" },
        { text = "Cloth must be hard to come by out here.", next = "cloth" },
        { text = "These robes should hold an enchantment well, Andrea.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "My demon keeps scorching my robes, Andrea.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "A warrior has little need of a clothier, Andrea.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Is there anything here for a hunter, Andrea?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What would you change about my gear, Andrea?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Should a Forsaken paladin wear the Silver Hand's colours, Andrea?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Goodbye.", next = "END" },
      },
      again = { { id = "h_again", text = "Anything else? Make it quick; I have hems to finish, and the Deathguard keep coming back with bits of themselves caught in them." } },
    },
    past = {
      lines = { { id = "p_default", text = "A seamstress in Lordaeron, and a good one, though nobody from those days is left to say so. I made dresses for weddings once, and now I make robes for corpses who don't care how they look." } },
      choices = { { text = "You must miss making dresses.", next = "past_miss" } },
    },
    past_miss = {
      lines = { { id = "pm_default", text = "I miss the people who wore them, but they're dead or they're Scourge, and neither one needs a dress. So I sew for the Forsaken, and I try to make them look like they still matter." } },
      choices = {
        { text = "That's a kindness, in its way.", next = "BACK", reply = "I like to think so, dear. It keeps my hands busy and my heart, or what's left of it, warm.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The dead don't need to look nice.", next = "BACK", reply = "Perhaps not, dear, but they like to, and so do I. Vanity outlives the heartbeat.", fx = { affinity = -2, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cloth = {
      lines = { { id = "c_default", text = "Wool comes from the farms in Pyrewood and Ambermill, when the Deathstalkers can get it, and the rest is linen from whatever the worgen leave behind. Dalaran's mages up at Ambermill wear lovely silk, and I try not to think about how to get it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Nothing a little thought couldn't fix, dear, and everything that matters to me. You've a totem knocking against your hip with every step, and in Silverpine you'll want to walk quietly, so let me sew you a loop, and you'll thank me when the worgen don't hear you coming." } },
      choices = {
        { text = "Sew it, then. Good work deserves respect.", next = "BACK", reply = "Then I'll sew you a proper loop for it, dear, and you'll thank me in the first fight.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My gear suits me fine. Leave it be.", next = "BACK", reply = "Suit yourself, dear, but that totem will knock you silly one day. I'll be here when it does.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "I'd not have believed it, because nothing in my trade simply comes back, and I've spent a lifetime mending what didn't. But I watched one of your sort turn into a bear by the Sepulcher gate and come back without a stitch out of place, so I suppose I must, and I find it very upsetting." } },
      choices = {
        { text = "There's no trick to it. It's honest magic.", next = "BACK", reply = "Honest magic, is it? I'd like to see that, dear, I really would. Mending never felt like magic to me.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Every craft has its secrets. I'll keep mine.", next = "BACK", reply = "Keep them, then, dear, and I'll keep mine. A needle has its secrets too.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They'll hold one well enough, provided you don't cast through the sleeves and singe the cuffs, which every mage does sooner or later. I sewed for more Dalaran folk than I care to remember, and not one of them kept a clean cuff." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "You wore the violet once, I'd wager, and you stood straighter in it than you're standing now. A robe that fits will make you look like a mage again rather than a corpse in borrowed cloth." },
      },
      choices = {
        { text = "I'll take your advice and stand straighter.", next = "BACK", reply = "There you are, dear, much better already. Robes look grander when you stand up in them.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Looks don't win fights, Andrea.", next = "BACK", reply = "No, but they make the losing look much better. Do mind the cuffs, dear.", fx = { align = { order = -1 } } },
        { text = "You sew like someone who did it in life.", next = "past" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Then wear black, since it hides scorch marks far better than grey, and stop letting the thing stand so close. Your demon has terrible manners, and I'd say so to its face if it had a proper one." },
        { id = "xwarlock_orc", when = { race = "Orc" }, text = "An orc in cloth robes, scorched by his own demon, is a sight I didn't expect in the Sepulcher. Wear black, which hides the marks, and keep the creature a few paces off." },
      },
      choices = {
        { text = "I'll teach the demon some manners, Andrea.", next = "BACK", reply = "Good, dear, and I'll sew you something black in the meantime. Manners and scorch marks, both handled.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Its manners suit me well enough, Andrea.", next = "BACK", reply = "Then wear black, dear, and stand far from my good cloth. I'll not have it singed.", fx = { align = { order = -1 } } },
        { text = "Cloth must be hard to come by out here.", next = "cloth" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "The Forsaken have no excuse for wearing their robes badly, death or no death. A seam is a seam, and a hem is a hem, and I won't hear otherwise." } },
    lordaeron = { { id = "tp_lordaeron", text = "I sewed gowns for ladies in Lordaeron, and I remember each of them by her measurements. Most of them are dead now, and I'd wager some of them are badly dressed." } },
    dalaran = { { id = "tp_dalaran", text = "The mages of Dalaran wore the finest robes in the world, violet silk with silver thread. I've seen their apprentices in Ambermill, and they've let their standards slip." } },
    _none = { { id = "tp_none", text = "Hems and seams are all I know, so take your question to High Executor Hadrec." } },
  },
}

-- Edwin Harly: sells general supplies in the Sepulcher.
P:NPC {
  key = "harly", id = TODO_NPC("Edwin Harly"), name = "Edwin Harly", title = "General Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "sepulcher" }, temper = { "dry" }, values = { "practical" },
  notices = { "purse", "weary" },
  impression = {
    first = "He calls Silverpine a forest that eats travelers.",
    third = "{name} met Edwin Harly, who sells general supplies in the Sepulcher.",
  },
  greetings = {
    { id = "g_shop", text = "Food, water and bags, enough to get you through the forest if you're careful. What do you need?" },
    { id = "g_back", when = { metBefore = true }, text = "Still alive, or whatever we call it? Then the forest hasn't eaten you yet, which is good for business." },
  },
  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "You've been in the forest, I see, and the forest won that round. Stock up before you go back out." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "The forest doesn't care about anything, which is what makes it dangerous. The worgen might, though, because anything that glows is easy to follow, so I'd keep your prayers short between here and Pyrewood." } },
      choices = {
        { text = "I'll pray as long as I need. Let them follow.", next = "BACK", reply = "Pray away, then, and I'll sell you a lantern for the walk. The worgen like a lit target.", fx = { align = { light = 1 } } },
        { text = "Short prayers, then. I'll trust my blade on the road.", next = "BACK", reply = "Sensible, and quicker on the road. I'll pack you something for the trip.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "More than the Sepulcher likes to count. The worgen take the ones who stray south, the gnolls take the careless ones in the Dead Fields, and the bogs take whoever's left. If you're the praying kind, pray for the ones who set out tomorrow, because the ones who set out last week are past it." } },
      choices = {
        { text = "Then I'll pray for tomorrow's travellers, and walk with some.", next = "BACK", reply = "Good. They'll be glad of the company, and I'll stop counting heads every morning.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fools who wander off the road deserve the bogs.", next = "BACK", reply = "Maybe they do, but they're still my customers, and I'd rather they kept walking, living or not.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Food, water and someone watching your back, in that order, because the worgen fight dirty and the forest makes you tired before they do. I sell the first two, and the third you'll have to find yourself." } },
      choices = {
        { text = "I'll find a shieldmate before I go in.", next = "BACK", reply = "Smart. Shieldmates are the one thing I can't sell you.", fx = { align = { order = 1 } } },
        { text = "I go alone, Harly. Fewer mouths to feed.", next = "BACK", reply = "Fewer mouths, aye, and fewer eyes. Buy extra bandages, at least.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Some of it, if you cook it long, and none of it if it's been near the Dead Fields, where the gnolls leave their sick. Buy my bread for the road and save your kills for your beast, because it won't mind the taste." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Some of it, if you cook it long, and {pet} won't mind the taste either way. Stay clear of anything from the Dead Fields, where the gnolls leave their sick, and buy my bread for yourself." },
      },
      choices = {
        { text = "I'll buy your bread, Harly. No point taking chances.", next = "BACK", reply = "Good choice, and safer. The bread's from the Undercity and nothing's touched it but the baker.", fx = { align = { order = 1 } } },
        { text = "I'll eat what I catch. I've a strong stomach.", next = "BACK", reply = "Strong stomachs are the first thing the Dead Fields take. Suit yourself.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "For anyone, because the worgen in the south don't care what you carry, and they come in packs. A demon's a fine thing to put between you and a worgen, but buy food and water anyway, because the demon won't share." },
      },
      choices = {
        { text = "I'll pack well and watch for worgen.", next = "BACK", reply = "Good. Pack light, but pack enough. The worgen don't wait for you to eat.", fx = { align = { order = 1 } } },
        { text = "Let the worgen come. My demon's hungry.", next = "BACK", reply = "Hungry demons are fine until the worgen outnumber them. Buy some rations anyway.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Edwin Harly, and I keep the supplies for the Sepulcher. Silverpine is a forest that eats travelers, so everything I sell is meant to help you get out of it alive, or as alive as you were when you came in." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You'll want water and food like any of the living, and I've both, though the water tastes of the crypt." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. You'll be going into the forest, I expect, so buy what you need now, because the forest won't sell you anything." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. You'll need more than a sword to get through Silverpine, {class}, so buy rations and water before you start swinging." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll eat off the land, I expect, and I'd advise against it, because half the land in Silverpine is trying to eat you." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Good, you can pray over the bandages I sell, because Silverpine goes through them faster than I can stock them." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. Your demon won't need food, but you will, and this forest eats travelers who forget." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin. Silverpine eats travellers, holy or not, so buy your supplies and don't count on the Light to find the road for you in the fog." },
      },
      choices = {
        { text = "How many travellers does Silverpine take, Edwin?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Could the spirits clean your water, Harly?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Is anything in Silverpine still worth saving, Harly?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "This forest feels dangerous.", next = "forest" },
        { text = "Where should I go from here?", next = "roads" },
        { text = "What does Dalaran owe this forest, Harly?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Which way through Silverpine keeps me out of sight?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "What does a warrior need most out here, Harly?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "I doubt the game in Silverpine is safe to eat, Harly.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Silverpine must be dangerous for a warlock, Harly.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Does Silverpine care what a paladin carries, Harly?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Goodbye.", next = "END" },
      },
      again = { { id = "h_again", text = "Anything else, or can I get back to counting what the last cart brought in?" } },
    },
    forest = {
      lines = { { id = "f_default", text = "The worgen first, then the gnolls in the hills, then the Dalaran mages at Ambermill, who don't want anyone near their walls. And the spiders, of course, because no forest in Lordaeron is complete without giant spiders." } },
      choices = { { text = "Dalaran's mages seem far from home here.", next = "forest_dalaran" } },
    },
    forest_dalaran = {
      lines = { { id = "fd_default", text = "They're building a magical barrier around their ruined city to the east, and they guard it like a dragon guards gold. Dalar Dawnweaver watches them for us, so ask him if you want the details." } },
      choices = {
        { text = "The Forsaken should break that barrier.", next = "BACK", reply = "They should, and maybe one day they will. Until then, I'll sell rope to whoever's trying.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Let the mages keep to themselves.", next = "BACK", reply = "They'd like that too, I'm sure. But they're squatting on our lake, and that I don't forgive.", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    roads = {
      lines = { { id = "r_default", text = "North takes you back to Tirisfal and the Undercity, and south leads to Pyrewood and Shadowfang Keep, where you don't want to go yet. The road east past Lordamere Lake takes you to the Hillsbrad Foothills, where the Deathguard hold Tarren Mill." } },
      choices = { { text = "Thanks. Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They could try, and I'd charge you the same either way. The Sepulcher's water comes from a well the dead have used for a year, and I've had no complaints, though most of my customers can't taste anything." } },
      choices = {
        { text = "I'll clean it for nothing. The living need it too.", next = "BACK", reply = "Kind of you, and the living will drink it gladly. I'll still charge them, of course; a merchant has to eat, or at least pretend to.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then the living can fetch their own water.", next = "BACK", reply = "They'd have to walk a long way for it. I'll keep selling it to them, clean or not.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "The trees, maybe, if you can get the worgen out of them, and Lordamere Lake, if you can get the Dalaran mages off its shore. As for the rest, I count crates for a living, friend, so I'll leave the saving to someone with better odds." } },
      choices = {
        { text = "Then I'll save what I can, odds or no odds.", next = "BACK", reply = "Odds or no, that's a fine attitude. Come back and tell me what you saved.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You're right. Save what's useful and let the rest burn.", next = "BACK", reply = "That's the Sepulcher's view, mostly. The lake, though, I'd keep.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Plenty, since it was a Dalaran archmage who brought the worgen here, and Dalaran mages still squat at Ambermill as if nothing happened. If you've got their kind of magic, use it to clean up their kind of mess." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "If you were Kirin Tor before you died, you'll know Arugal's name, and you'll know the Council never sent anyone to answer for him, only more mages to dig at Ambermill. That should tell you all you need to know about Dalaran's gratitude." },
      },
      choices = {
        { text = "I'll help clean up their mess, for the Sepulcher.", next = "BACK", reply = "Good. Somebody has to, and the mages certainly won't.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll look after myself first, Harly.", next = "BACK", reply = "Wise, in Silverpine. Buy supplies first, then look after yourself.", fx = { align = { order = -1 } } },
        { text = "This forest feels dangerous.", next = "forest" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Not the roads, because the worgen watch roads the way you'd watch a door. Go through the trees and keep the lake in sight, and you'll see more than you're seen, mostly." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "Not the roads, and not upwind of anything with a nose, because the worgen can smell a Forsaken a long way off. Go through the trees with the lake in sight, and walk soft." },
      },
      choices = {
        { text = "I'll take the trees and stay hidden.", next = "BACK", reply = "Good. You'll live longer, and you'll see more worgen before they see you.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll take the road and face what comes.", next = "BACK", reply = "Brave, and probably the last brave thing you'll do. I'll sell you extra bandages.", fx = { align = { honor = 1 } } },
        { text = "Where should I go from here?", next = "roads" },
      },
    },
  },
  topics = {
    shadowfang = { { id = "tp_shadowfang", text = "Shadowfang Keep is on the hill, and you'd do best to stay off it. The worgen there have eaten better men than you." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken don't need food or sleep, but they still need rope and torches and a good bag. I keep all three, and I don't do discounts." } },
    gilneas = { { id = "tp_gilneas", text = "The Gilneans walled themselves in, and the forest walled itself around them. Nobody comes out, and nobody goes in." } },
    scourge = { { id = "tp_scourge", text = "The Scourge isn't the worst thing in Silverpine, if you can believe it. The worgen are worse, and the forest itself is worse still." } },
    _none = { { id = "tp_none", text = "I count crates for a living, so I wouldn't know. Ask the High Executor." } },
  },
}
