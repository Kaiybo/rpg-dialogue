-- Sigrun Ironhew: a dwarf smith's apprentice camped south of Hammertoe's Digsite, short of food, scrap and salt since the dig fled Uldaman. Voice: bibles/sigrun.md
local P = RPGDialogueAPI:Pack("rpgd.badlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "sigrun", id = TODO_NPC("Sigrun Ironhew"), name = "Sigrun Ironhew",
  bible = "bibles/sigrun.md", role = "questgiver", tier = "quest",
  communities = { "badlands_camp" }, temper = { "cheerful", "rueful" }, values = { "craft", "practical" },
  notices = { "kit", "drink" },

  impression = {
    first = "Sigrun Ironhew is a smith's apprentice running a dig camp on sand and stubbornness. He jokes about going hungry, though I don't think he finds it as funny as he lets on.",
    third = "{name} met Sigrun Ironhew, a dwarf smith keeping a hungry camp alive south of Hammertoe's Digsite in the Badlands.",
  },

  greetings = {
    { id = "g_op_elements", when = { gossip = { topic = "the_elements", stance = "respect" } }, text = "Lotwil Veriatus, the gnome up in Arathi who binds elementals, writes that you told him to let them go. His letters have been shorter since, so thank you for that." },
    { id = "g_default", text = "Welcome to the finest camp in the Badlands, {g:lad|lass}, which isn't saying much, so mind the anvil and don't ask what's for supper." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and a welcome sight ye are! Pull up a crate, if ye can find one the ogres didn't carry off." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and we've been eating dust and salt pork gone green at the edges. Any word from Ironforge on your travels?" },
    { id = "g_grown", when = { metBefore = true, levelsSince = 6 }, text = "You've hardened up since I saw ye last, like good steel after the quench. I'd know good steel, by my beard, for it's the one thing I do well." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The Prospector says you've been a help to folk out here, and he doesn't hand out compliments, so I'll pass that one along." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your gear's in a sorry state, {g:lad|lass}, and I'd mend it if I had a wee scrap of decent metal to my name. Bring me some from the ogres and I'll see what I can do." },
    { id = "n_drink", cat = "drink", when = { drunk = true },
      text = "You've been at the ale, and you didn't bring any for the rest of us? That's cruel, friend, in a camp this dry." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Sigrun Ironhew, apprentice to Feranor Steeltoe, and the closest thing this camp has to a blacksmith. We left the Uldaman dig in such a hurry that we grabbed whatever wasn't nailed down, and it turns out food was nailed down." },
        { id = "h_mirage_before", when = { questBefore = TODO_QUEST("Mirages") },
          text = "The ogres from Camp Kosh have been picking over our abandoned wagons like vultures, and they took the cart with all our supplies in it. It's a bit embarrassing, but we've not eaten properly in days." },
        { id = "h_mirage_active", tags = { "news" }, when = { questActive = TODO_QUEST("Mirages") },
          text = "The supply crate's somewhere in Camp Kosh, unless the ogres have eaten the crate too, which I'd not put past them. Bring it back and we'll eat like kings tonight." },
        { id = "h_mirage_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Mirages"), days = 3 } },
          text = "We ate! Actual food, and only a little sand in it, which after this week tastes like seasoning. Thank you, friend." },
        { id = "h_scrap", tags = { "news" }, when = { questActive = TODO_QUEST("Scrounging") },
          text = "Scrap metal, seven good pieces from the ogres at Dustbelch Grotto, and I can start putting up some proper defenses. Prospector Ryedol's worried, and a worried Prospector is a loud Prospector." },
        { id = "h_heart", tags = { "news" }, when = { questActive = TODO_QUEST("Fiery Blaze Enchantments") },
          text = "A black drake whelp's heart, still beating when you take it, from Lethlor Ravine. Bring it fresh and I'll show you what Feranor taught me." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf! Tell me you've come from Ironforge with a letter for us, or a ham, or both. No? Well, sit down anyway, cousin, and I'll pretend you brought the ham." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome, and with Gnomeregan gone I'd guess you know what it's like to leave a place in a hurry. We're cousins in that, at least." },
      },
      again = {
        { id = "h_again", text = "What else can I do for ye, short of feeding ye?" },
        { id = "h_again2", text = "Anything else? I've time, aye, for there's not much to hammer without metal." },
      },
      choices = {
        { text = "Why did you leave the dig in such a hurry?", next = "dig" },
        { text = "Who is Feranor Steeltoe?", next = "feranor" },
        { text = "This camp looks short of nearly everything.", next = "needs" },
        { text = "What do you make of the Badlands?", next = "land" },
        { text = "Teach me something about the forge.", next = "xsmith", when = { profession = "Blacksmithing" } },
        { text = "I could hunt you something to eat.", next = "xhunt", when = { class = { "HUNTER", "DRUID" } } },
        { text = "I'll let you get back to work.", next = "END" },
      },
    },

    dig = {
      lines = {
        { id = "dg_default", text = "Uldaman, friend, where the League's been digging for proof of where we dwarves came from, and where the troggs and the Dark Iron decided they liked it better than we did. Hammertoe Grez went in deeper than any of us, and we've not seen him since." },
      },
      choices = {
        { text = "Has anyone gone after Hammertoe?", next = "dig_hammertoe" },
        { text = "Proof of where dwarves came from?", next = "dig_proof" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dig_hammertoe = {
      lines = {
        { id = "dh_default", text = "Prospector Ryedol's been trying, and he'll talk your ear off about it if you let him. I'm a smith, not a soldier, so the best I can do is keep the camp standing for when Hammertoe walks out of there, and I'm still saying 'when'." },
        { id = "dh_hope", when = { questDone = TODO_QUEST("A Sign of Hope") },
          text = "You found his map, didn't you? Then he's alive in there, or was when he dropped it, and that's more hope than we've had in weeks." },
      },
      choices = {
        { text = "Keep saying 'when.' I'll help find him.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dig_proof = {
      lines = {
        { id = "dp_default", text = "The old carvings in there show folk made of stone, built by the titans, and some of the League's scholars think that's us, before we were flesh. I'd rather believe we were made of something, mind, than that we just crawled out of a hole." },
      },
      choices = {
        { text = "Made of stone. That's a proud thing.", next = "dig_stone" },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    dig_stone = {
      lines = {
        { id = "ds_default", text = "Proud, aye, and a little frightening, for if the titans made us once they might come back to look at their work. Feranor used to say a good smith is proud of a blade but still checks it for flaws, and I'd guess the titans are no different." },
      },
      choices = {
        { text = "Whatever we were, we chose what we became.", next = "BACK", reply = "Aye, that's what Feranor would say too, an' I like it better than the alternative. We're dwarves, whoever made us.", fx = { align = { order = -1 } } },
        { text = "If we were made for a purpose, we should honour it.", next = "BACK", reply = "Honour it, aye, but how, when nobody knows what the purpose was? I'll keep tae smithin' till someone tells me.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    feranor = {
      lines = {
        { id = "fe_default", text = "My old master, and the finest hand with a fiery enchantment I ever saw, though he'd never tell you so himself. Last I heard he'd gone north to work a forge for a hunting party in Lordaeron, which is a cold, sad place to take a fire." },
      },
      choices = {
        { text = "What did he teach you?", next = "feranor_fire" },
        { text = "Something else.", next = "BACK" },
      },
    },
    feranor_fire = {
      lines = {
        { id = "ff_default", text = "To put a little flame in a weapon so it burns whatever it bites, and that takes blood from a black drake whelp's heart while it's still beating. I can't tell you all the details, because he made me swear, but I can show you the result." },
        { id = "ff_done", when = { questDone = TODO_QUEST("Fiery Blaze Enchantments") },
          text = "And you've seen the result now, haven't you, on your own blade. Feranor would have grumbled about my stroke, but he'd have been pleased underneath it." },
      },
      choices = {
        { text = "A beating heart? That's grim work.", next = "feranor_grim" },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    feranor_grim = {
      lines = {
        { id = "fg_default", text = "Grim, aye, but black drakes aren't pets, and the whelps in Lethlor Ravine grow into the sort of thing that burns camps like this one. I'd rather their fire went into an honest blade than into our tents." },
      },
      choices = {
        { text = "Better their fire in our steel than our homes.", next = "BACK", reply = "That's how I see it, an' how Feranor would put it too. Black scales make good steel, an' better steel keeps camps safe.", fx = { align = { light = -1 } } },
        { text = "Killing whelps sits poorly with me, whatever they'd become.", next = "BACK", reply = "It sits poorly wi' me too, if I'm honest. But I've seen what they grow into, an' I'd rather fight them small.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    needs = {
      lines = {
        { id = "ne_default", text = "Food first, then metal, then salt, in that order, and a letter from Ironforge if anyone ever thinks to write one. The ogres have the first two, and I've no idea where the third went." },
      },
      choices = {
        { text = "Why do you need salt?", next = "needs_salt" },
        { text = "What would you build, with enough metal?", next = "needs_build" },
        { text = "Something else.", next = "BACK" },
      },
    },
    needs_salt = {
      lines = {
        { id = "ns_default", text = "For my quenching barrel, friend, because brine hardens steel better than plain water, and plain water out here is precious enough without me wasting it. Feranor swore by salt, and I swear by Feranor." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    needs_build = {
      lines = {
        { id = "nb_default", text = "Stakes, a bit of a wall, a gate that shuts, and maybe a spit for roasting if we ever have something to roast. The ogres at Dustbelch Grotto are carrying plenty of scrap metal that would do the job." },
        { id = "nb_done", when = { questDone = TODO_QUEST("Scrounging") },
          text = "Thanks to you there's a wall going up, crooked but standing, which describes most of us here. It'll have to do until we hear from the League." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    land = {
      lines = {
        { id = "la_default", text = "Hot by day, cold by night, and dry all the way through, with ogres to the west and drakes to the east and troggs underneath. I came here to dig up history, and so far I've mostly dug up sand." },
      },
      choices = {
        { text = "Why stay, then?", next = "land_stay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    land_stay = {
      lines = {
        { id = "ls_default", text = "Because the Prospector won't leave while Hammertoe's in that dig, and I won't leave the Prospector, and somebody has to keep the anvil warm. That's what a camp is, I think: folk who won't leave each other." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    xsmith = {
      big = true,
      lines = {
        { id = "xs_default", text = "A fellow smith! Here's one Feranor gave me: listen to the steel when you quench it, because a good blade hisses and a bad one screams. Too many smiths in Ironforge stopped listening years ago, an' ye can hear it in their blades." },
      },
      choices = {
        { text = "The old ways are best. I'll listen.", next = "BACK", reply = "Good, an' Feranor would be proud tae hear it. Listen close the next time ye quench, an' ye'll hear the difference.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'll find my own way to the forge, thanks.", next = "BACK", reply = "Suit yerself, but ye'll hear a blade scream someday, an' ye'll remember me. Every smith finds the old ways eventually.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunt = {
      big = true,
      lines = {
        { id = "xh_default", text = "Would you? There's buzzards and coyotes about, though the coyotes are mostly bone and the buzzards taste like old boots. Still, after this week I'd eat an old boot and thank ye for it." },
      },
      choices = {
        { text = "I'll bring you something, no payment needed.", next = "BACK", reply = "No payment? Bless ye, then, an' I'll take the boots-flavoured buzzard gladly. I'll owe ye a good edge on yer blade.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Hunting's work. I'll expect something for it.", next = "BACK", reply = "Fair enough, for it's work, an' I'll pay ye what I can. That isnae much, mind, but my sharpenin's free.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I'm Ironforge born and Feranor Steeltoe's apprentice, and now I'm the camp smith at a dig nobody's digging. It's been a strange year, and not one I'd drink to." } },
    advice = { { id = "tp_ad", text = "Never leave a dig without your supper, friend, because the ogres won't save you any." } },
    uldaman = { { id = "tp_uldaman", text = "Uldaman's where the real digging was, until the troggs and the Dark Irons ran us out. Here I just sharpen shovels nobody's using." } },
    magni = { { id = "tp_magni", text = "King Magni's a good king, and I'd make him a sword if I ever got the chance. I've got the design all worked out." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons make the best steel in the world, and I'd learn their secrets if they weren't so busy trying to kill us." } },
    _none = { { id = "tp_none", text = "Couldn't tell ye, {g:lad|lass}; I know steel and sand, and lately it's been mostly sand." } },
  },
}
