-- The wastes: Kum'isha the Collector near the Rise of the Defiler, the bloodmages Drazial and Lynnore by the northern pass, and Daio the Decrepit in the Tainted Scar. Voice: bibles/blastedlands.md
local P = RPGDialogueAPI:Pack("rpgd.blastedlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "kumisha", id = TODO_NPC("Kum'isha the Collector"), name = "Kum'isha the Collector",
  bible = "bibles/blastedlands.md", role = "questgiver", tier = "major",
  communities = { "blasted_lands" }, temper = { "sharp", "proud" }, values = { "proud", "greedy" },
  private = { "dark_portal" },
  notices = { "race", "money" },

  impression = {
    first = "Under his contempt is a homesickness so old it has gone hard.",
    third = "{name} met Kum'isha the Collector, a Lost One who searches the Blasted Lands for draenethyst to carry him home.",
  },

  greetings = {
    { id = "g_default", text = "Another one, come to stare at the broken draenei. Stare, then, and be quick about it." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and you still smell of it. They always do." },
    { id = "g_sphere", when = { questDone = TODO_QUEST("To Serve Kum'isha") }, text = "You. The one who brought Kum'isha the sphere. I have not decided yet whether to despise you less." },
  },

  notice = {
    { id = "n_rich", cat = "money", when = { money = { min = 1000000 } },
      text = "Your purse is heavy, and you carry it the way they all do, as if it were part of your body. I could smell it before I could see you." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc. Your people's axes knew mine long before either of us set foot on this world, and I have not forgotten, whatever your warchief tells you now." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome, all gears and greed in a very small parcel. Do not touch anything." },
  },

  start = "hello",
  nodes = {
    op_orcs = {
      lines = {
        { id = "opo_default", text = "Hate is a coin Kum'isha spent long ago and never got back. Your world lets the orcs walk free and build cities and call themselves a Horde again, so tell Kum'isha, {race}, what you think of them." },
      },
      choices = {
        { text = "They've changed under Thrall. They deserve a second chance.", next = "op_orcs_trust", fx = { align = { light = 1 }, opinion = { orcs = "redeemed" } } },
        { text = "Killers then, killers now. Nothing's changed.", next = "op_orcs_hate", fx = { align = { light = -1 }, opinion = { orcs = "hate" } } },
        { text = "I'm sorry for what my people did to yours.", next = "op_orcs_sorry", fx = { affinity = 2, opinion = { orcs = "ashamed" } }, when = { race = "Orc" } },
        { text = "I didn't come to talk about orcs.", next = "BACK" },
      },
    },
    op_orcs_trust = {
      lines = {
        { id = "opot_default", text = "A second chance! Kum'isha's people gave them a first one, and a second, and the third came with axes. Perhaps your world will be luckier, {race}, but Kum'isha would not wager crystals on it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_orcs_hate = {
      lines = {
        { id = "opoh_default", text = "So says the one who came through no door and lost no world. Kum'isha has more cause to say it than you, and still Kum'isha does not, because hate buys nothing." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_orcs_sorry = {
      lines = {
        { id = "opos_default", text = "Sorry. Kum'isha has waited a long time to hear an orc say it, and finds it is smaller than expected, and heavier. Bring crystals, orc, and we will speak no more of it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Because I knew the orcs when they were only shamans and hunters, before the fel. The elements of Draenor answered them too, and they could not stop what came after, so do not expect me to be impressed." } },
      choices = {
        { text = "I'll never take a darker teacher, Kum'isha.", next = "BACK", reply = "Then hold to that, shaman, harder than they did. Kum'isha has heard such promises before, and the fel was very patient.", fx = { align = { light = 1 } } },
        { text = "If a darker teacher served me better, I might listen.", next = "BACK", reply = "Then you are already halfway down their road, and Kum'isha will watch you walk it. Most do not notice the first step.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I have watched orcs come through that gate with axes, and humans meet them with swords, and each was certain he fought for something noble. The fragments you bring me do not care which of you held the blade, and neither, I find, do I." } },
      choices = {
        { text = "I fight for those behind me, not for plunder.", next = "BACK", reply = "That is a rarer thing than you know, and Kum'isha will remember your face for it. Most who say it are lying, but you may not be.", fx = { align = { honor = 1 } } },
        { text = "Every war has spoils. Better they end up in my pack.", next = "BACK", reply = "Spoils, yes, always spoils. Kum'isha watched the orcs carry the spoils of the draenei cities away in carts, and every one of those carts is rust now.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "We did, though not as you do, and I will not speak of the land we hunted. Here I hunt nothing but fragments in the dust, and the beasts of this place keep their distance from me, which is wise of them." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "We did, though not as you do, and I will not speak of it. {pet} watches me with more honesty than you do, hunter; a beast wants its supper and makes no speeches about it, and I find I prefer that." },
      },
      choices = {
        { text = "I hunt to eat and nothing more. There's no greed in that.", next = "BACK", reply = "Hm. No greed in hunger, that is true, and Kum'isha will allow it. Bring fragments, then, and eat well.", fx = { align = { honor = 1 } } },
        { text = "I hunt for pelts and coin. Call it greed if you like.", next = "BACK", reply = "Kum'isha calls it greed, and you call it coin, and the gate calls it the same thing. Bring fragments anyway.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "Because someone must remember what was here before. Every root and stone tells me something. Bring me what you find, and I will tell you what it once was, before the Portal took it." } },
      choices = {
        { text = "Thank you. Let me ask something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Draenethyst holds light the way water holds the shape of a cup, and your kind would burn it for a spell and forget it by morning. To me each one is a memory of home, and I would not trade one for all your learning." } },
      choices = {
        { text = "Then they should stay with you, not in a spellbook.", next = "BACK", reply = "With Kum'isha, yes, where they are kept and not burned. You understand more than most of your kind.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Memories won't help you. Power might.", next = "BACK", reply = "Power. That is what the warlocks said too, before they came through the gate, and before they drank what Kil'jaeden offered them.", fx = { align = { honor = -1 } } },
        { text = "Never mind that for now.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because a thief at least knows what a thing is worth, and does not throw it away. Bring me fragments, rogue, and we will both pretend that neither of us would steal from the other." } },
      choices = {
        { text = "I'd never steal from you, Kum'isha.", next = "BACK", reply = "Hm. You say so, rogue, and Kum'isha will count the fragments twice. But perhaps you mean it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "We'll both pretend, then. That's an honest deal.", next = "BACK", reply = "An honest deal between liars, that is the only kind left in this place. Bring them, and we will both pretend.", fx = { align = { honor = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I knew the orcs when they were only shamans and hunters, before their warlocks taught them fel and before they turned it on us. You tell me the earth and wind answer you, but I remember when the elements of Draenor answered too, and they could not stop what came after." } },
      choices = {
        { text = "The Horde has turned from the fel. We remember our path.", next = "BACK", reply = "Some remember, and Kum'isha has met one or two. But the fel was in their blood, shaman, and blood remembers longer than minds.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "What was done is done, Kum'isha. I owe you nothing.", next = "BACK", reply = "No, you owe nothing, and Kum'isha asks nothing. But the stones of this place remember, and so does Kum'isha.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_kazzak", when = { killed = { name = "Kazzak" } },
          text = "So, the great demon in the Scar has been thrown down, and you were there. Kum'isha remembers when such things walked her world by the hundred, so do not expect Kum'isha to dance, but Kum'isha is glad." },
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" }, text = "A shaman. The orc shamans spoke to the elements on my world once, before they found darker teachers, and my people paid for that lesson." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior, and you smell of iron and greed together, as all your kind do. You would cut down anything that stood between you and a prize." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. You've the stink of greed on you like the rest, though a hunter's greed is at least the honest kind, and ends when the belly is full." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A thief, yes. You smell of greed more strongly than any of them, though at least you do not pretend otherwise." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. You smell of borrowed power, and of greed for more of it, like all the rest." },
        { id = "h_druidx", when = { class = "DRUID" },
          text = "A druid. You smell of earth that still lives. That is rare here, and precious to me." },
        { id = "h_default", key = true,
          text = "I have heard orcs call the stench of humans sickening, and humans call the stench of orcs wretched, yet to me every race of these lands gives off the same odour: the foul, dizzying scent of greed. I am Kum'isha, and I collect." },
        { id = "h_fragments", when = { questActive = TODO_QUEST("Everything Counts In Large Amounts") },
          text = "Fragments, flawed and cloudy, will not take Kum'isha home, but they may yet serve my people in other ways. Bring what you find, and spare me the drooling." },
        { id = "h_sphere_wait", when = { questActive = TODO_QUEST("To Serve Kum'isha") },
          text = "You want the flawless sphere, {race}? Draenei have spent whole lives searching for just one, and you think you will stumble on it on an afternoon's walk. We shall see." },
        { id = "h_sphere_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("To Serve Kum'isha"), days = 7 } },
          text = "I hold it still, the sphere you brought, and I have not slept. Perhaps a rift can be opened now; perhaps my people will go home after all this." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "At night the Portal is only a shadow against the stars, and I can almost pretend it leads somewhere I would want to go." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf who calls on the elements. Your people had no shamans when the orcs came through the Portal, and now you borrow their ways; I wonder which darker teachers you'll borrow next." },
      },
      again = {
        { id = "h_again", text = "More? Ask, then. I have walked these wastes long enough to have patience, if not manners." },
        { id = "h_again2", text = "You are still here. Speak, {race}, or go and dig." },
      },
      choices = {
        { text = "Why do you collect things from this blasted place?", next = "druid_talk", when = { class = "DRUID" } },
        { text = "Who are you, really?", next = "who" },
        { text = "What do you collect?", next = "draenethyst" },
        { text = "You seem to think everyone smells of greed.", next = "greed" },
        { text = "What do you give in trade?", next = "junk" },
        { text = "The Light could mend what was done to you.", next = "priest", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Orcs came through that Portal too, draenei.", next = "orc", when = { race = "Orc" } },
        { text = "I deal in fel, collector. Does it smell of greed?", next = "k_lock", when = { class = "WARLOCK" } },
        { text = "My people dig crystals too, Kum'isha.", next = "k_dwarf", when = { race = "Dwarf" } },
        { text = "My people hoard nothing, Kum'isha.", next = "k_tauren", when = { race = "Tauren" } },
        { text = "What do your crystals have to do with magic?", next = "xmage", when = { class = "MAGE" } },
        { text = "If I'm greedy, why trust me with your crystals?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Not every warrior fights for greed, Kum'isha.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Did your people hunt, before you came here?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Did you know shamans on your world, Kum'isha?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "Why do you distrust shamans, Kum'isha?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll keep my eyes open for crystals.", next = "END", fx = { affinity = 1 } },
      },
    },

    who = {
      lines = {
        { id = "w_default", text = "A draenei, once, as you would know if you had ever seen one whole. Now one of the broken ones, the lost, stranded on the wrong side of a door that will not open, with nothing but red dust and greedy strangers for company." },
      },
      choices = {
        { text = "Where is home?", next = "who_home" },
        { text = "You must have come a long way to get here.", next = "who_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_home = {
      big = true,
      lines = { { id = "wh_default", fx = { learn = { "dark_portal" } },
        text = "Beyond that door, on the world the orcs called Draenor, if any of it still stands. It was greed that took me from my home, {race}, and it will be greed that takes me back." } },
      choices = {
        { text = "Whose greed took you from home?", tag = "Persuade", next = "greed_own",
          check = { pass = { any = { { disposition = { min = 65 } }, { questDone = TODO_QUEST("To Serve Kum'isha") }, { trait = "kind" } } } },
          fail = { next = "who_sneer", fx = { affinity = -1 } } },
        { text = "I hope you find your way back.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Some doors are better left shut.", next = "BACK", fx = { affinity = -1, trait = { cautious = 1 } } },
      },
    },
    who_how = {
      lines = { { id = "wo_default", text = "That is not a tale I tell to strangers in the dust. Kum'isha is here, Kum'isha cannot leave, and Kum'isha does not care to remember the road between." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    greed_own = {
      big = true,
      lines = {
        { id = "go_default", text = "It was my own greed, {race}. Before I smelled greed on every race of this world, I smelled it on myself every morning, and I followed it further than I should have, and it left me here. Now you know why I hate the smell so." },
      },
      choices = {
        { text = "Then you know it can be overcome.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "You're still collecting. Has anything changed?", next = "greed_still" },
      },
    },
    greed_still = {
      lines = { { id = "gs_default", text = "Everything and nothing. I collect so I can leave, which is the one greed I permit myself; whether that makes me better or only more honest, I leave for wiser heads." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    who_sneer = {
      lines = { { id = "ws_default", text = "You would like that, would you not, a sad story to carry home with the loot. Kum'isha gives you crystals to find, not his life." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    draenethyst = {
      lines = {
        { id = "d_default", fx = { learn = { "draenethyst" } },
          text = "Draenethyst, the crystal of my people, scattered across these lands in shards. The flawed fragments are common enough, but a flawless sphere is among the rarest things on this world, and with enough of them a rift might be opened." },
      },
      choices = {
        { text = "Where would I find a sphere?", next = "draenethyst_where" },
        { text = "A rift? To where?", next = "who_home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    draenethyst_where = {
      lines = { { id = "dw_default", text = "Anywhere and nowhere: in the belly of a beast, in an ogre's pouch, in the hoard of the black drake that circles the Portal. Draenei have searched lifetimes for a single sphere and met horrible ends with their purpose unfulfilled." } },
      choices = {
        { text = "Then I'll be careful.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "I'll find one.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },

    greed = {
      big = true,
      lines = { { id = "gr_default", text = "Do you doubt it? Look at what runs your life, {race}: the gold you count, the land you fight over, the trinkets you strip from the dead. All of it is runoff from the greed that decides your every step." } },
      choices = {
        { text = "Then nobody is free of it.", next = "greed_others" },
        { text = "Not everyone. Some fight for others.", next = "BACK", reply = "Some, perhaps, and they are rare as fragments. Kum'isha has met few, but you may be one.", fx = { align = { honor = 1 } } },
        { text = "You're right. Coin decides everything.", next = "BACK", reply = "Then you understand the gate, and you understand your world. Kum'isha does not say it to be cruel.", fx = { align = { honor = -1 }, trait = { greedy = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    greed_others = {
      lines = { { id = "go2_default", text = "Perhaps, somewhere, and yet you came to the broken draenei because you heard he pays. Bring me a sphere for nothing, then, and I will believe you." } },
      choices = {
        { text = "Fair point.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    junk = {
      lines = { { id = "j_default", text = "Clothes, mostly, and odds and ends I have gathered from the dead out here, and you will snatch them up like a starving dog. Bring a fragment, take your junk, and do not thank me." } },
      choices = {
        { text = "That's fair trade.", next = "BACK", fx = { trait = { greedy = 1 } } },
        { text = "I don't need a reward.", next = "BACK", fx = { affinity = 1, trait = { generous = 1 } } },
      },
    },

    priest = {
      lines = { { id = "pr_default", text = "Mend? You think a prayer will make me whole, little priest, when nothing short of home could. Keep your Light for those who still have a shape worth saving." } },
      choices = {
        { text = "Every shape is worth saving.", next = "BACK", reply = "Every shape? Then you have not seen what Kum'isha has seen, little priest. Still, it is not unpleasant to hear someone young say it.", fx = { align = { light = 2 }, affinity = 1 } },
        { text = "Perhaps you're right. Some things stay broken.", next = "BACK", reply = "Yes. Some things stay broken, and Kum'isha is one of them. Thank you for not lying.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orc = {
      lines = { { id = "or_default", text = "They did, and before that they came to my people with axes, and before that they were something else entirely. You have changed, I am told; so have I, and neither of us for the better." } },
      choices = {
        { text = "Do you hate the orcs, Collector?", next = "op_orcs" },
        { text = "My people are free now. We've changed.", next = "BACK", reply = "Perhaps you have, and perhaps it will last. Kum'isha has seen orcs change before, and not for the better.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "What's done is done. I won't apologise.", next = "BACK", reply = "Then we understand each other, orc. Kum'isha does not ask for apologies, only fragments.", fx = { align = { honor = -1 }, affinity = -2 } },
      },
    },
    k_lock = {
      big = true,
      lines = {
        { id = "xlk_default", text = "It smells of worse. Kum'isha knows that stink, warlock, from a long time ago, and the ones who carried it then wanted the same thing as you: more. Take your fragments and keep your little servant downwind of me." },
      },
      choices = {
        { text = "I wanted power. I'm not ashamed of it.", next = "BACK", reply = "Honest, at least, and Kum'isha respects that more than shame. But the ones who carried that stink were not ashamed either.", fx = { align = { light = -1 }, affinity = -1 } },
        { text = "I carry it so others don't have to.", next = "BACK", reply = "A noble thought, warlock, and Kum'isha has heard it from better liars. Carry it carefully, if you mean it.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Who carried it before?", next = "who_how" },
      },
    },
    k_dwarf = {
      lines = {
        { id = "xdw_default", text = "Dwarf. Yes, your people dig, and they dig for the same reason as everyone in these lands: to hold the shiny thing and say it is theirs. Kum'isha's crystals are not shiny things to Kum'isha, so do not compare." },
      },
      choices = {
        { text = "Then tell me what they are to you.", next = "draenethyst" },
        { text = "Fair enough. I won't compare.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    k_tauren = {
      lines = {
        { id = "xta_default", text = "Hm. You smell less of it than most, tauren, I will grant you that, and more of grass and smoke. But you came to this dust for something, and Kum'isha wonders what." },
      },
      choices = {
        { text = "For the fragments. I'll not lie to you about that.", next = "BACK", reply = "Honest, tauren, and Kum'isha likes honest. Bring them, and we will trade fairly.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Nothing. I was only passing through.", next = "BACK", reply = "Hm. Nobody passes through the Blasted Lands, tauren; they stay or they die. Go, then, and do not drink from the red pools.", fx = { align = { honor = -1 } } },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "You speak kindly to the broken one, and you do not ask for anything in the same breath. That is rare enough that Kum'isha will remember it." },
        { id = "s2", text = "It has been a very long time since anyone looked at me and found something to praise. I do not trust it, but I find that I do not mind it." },
      },
      fail = {
        { id = "f1", text = "Sweet words, and behind them the same hunger as all the rest. You want my treasures, and you think that a compliment is cheaper than crystal." },
        { id = "f2", text = "They all flatter Kum'isha once they have seen what he keeps in his chests. Save it, for your greed is showing through." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "You mock the broken draenei to his face, instead of staring and whispering as the others do. That is almost honest, and I have missed honesty." },
        { id = "s2", text = "So you have a tongue, and some courage behind it. Good; the wastes are dull, and it is long since anyone gave me a reason to laugh in them." },
      },
      fail = {
        { id = "f1", text = "Laugh, then. I have been laughed at by orcs, by ogres and by the soldiers of Nethergarde, and I have outlasted a great many of them." },
        { id = "f2", text = "You sneer at what you do not understand, as your kind always does. I was old before your grandsires were born, and I will not be mocked by a child." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "Enough. I have been broken once already, and I have no wish to learn whether you could do it again, so ask, and be done." },
        { id = "s2", text = "There is something in you that is harder than greed, and I did not expect to find it. I will step carefully around it." },
      },
      fail = {
        { id = "f1", text = "You cannot frighten one who has already lost a world. Everything you could take from Kum'isha was taken long ago, by things far worse than you." },
        { id = "f2", text = "Threats, now. First they stare, then they bargain, then they threaten, and still none of them brings the crystals any faster." },
      },
    },
  },
  topics = {
    knows = { { id = "tp_knows", text = "Kum'isha has walked these wastes for a long time and listened to every fool who passed. Choose, then, and I will tell you what I have heard." } },
    background = {
      { id = "tp_bg", text = "Kum'isha the Collector, broken, lost, and very far from home. That is all a stranger needs to know, and more than most of them ask.", next = "who" },
      { id = "tp_bg2", text = "I was something once. Now I collect, and wait." },
    },
    advice = { { id = "tp_ad", text = "Count your coins less and watch the sky more, {race}. The drake over the Portal does not care how rich you are." } },
    draenethyst = { { id = "tp_draenethyst", text = "The crystal of my people. Find it, bring it, and take your junk.", next = "draenethyst" } },
    dark_portal = { { id = "tp_portal", text = "A door, and on the far side of it, everything I have lost. I look at it every day." } },
    burning_legion = { { id = "tp_legion", text = "Older than greed, and hungrier. Even I do not walk into the Scar." } },
    thrall = { { id = "tp_thrall", text = "The young orc chieftain who freed his people is no friend of mine, but he did not raise the axe that broke my people. I will not curse him for what his fathers did." } },
    khadgar = { { id = "tp_khadgar", text = "Khadgar was a human mage who went through the Portal and never came back. He at least understood what lay on the other side, and few of your kind have bothered to." } },
    nethergarde = { { id = "tp_nethergarde", text = "Your mages at Nethergarde watch the Portal as though it might bite them. It might, but they are watching the wrong side of it." } },
    dreadmaul = { { id = "tp_dreadmaul", text = "The ogres of the Dreadmaul are as greedy as all the others, and less clever. They take the crystals for shiny stones and throw them away." } },
    second_war = { { id = "tp_second_war", text = "Your Second War was fought over a world you never saw. Mine was lost before your war began." } },
    _none = { { id = "tp_none", text = "Kum'isha does not care, {race}, so bring crystals or leave." } },
    _gated = {
      { id = "gt1", text = "That is not for strangers, and you are still a stranger to Kum'isha. Bring me what I seek, and then perhaps I will speak of it." },
      { id = "gt2", text = "I will not tell you that. You have done nothing yet to show me that you are different from all the others." },
    },
  },
}

P:NPC {
  key = "drazial", id = TODO_NPC("Bloodmage Drazial"), name = "Bloodmage Drazial",
  bible = "bibles/blastedlands.md", role = "questgiver", tier = "quest",
  communities = { "blasted_lands" }, temper = { "eager" }, values = { "curious", "ambitious" },
  prejudice = { { race = "Troll", amount = 12, why = "Quel'Thalas fought the Amani for millennia; he sees all trolls as specimens." }, { race = "Orc", amount = 6, why = "The Horde burned Eversong's borders in the Second War." } },
  notices = { "class", "pet", "lock_taint" },

  impression = {
    first = "He called me a test subject and meant it as a compliment.",
    third = "{name} met Bloodmage Drazial, an elven bloodmage studying the strength of the Blasted Lands' beasts.",
  },

  greetings = {
    { id = "g_prej1", when = { prejudiced = true }, text = "A troll! Fascinating regeneration, of course, though I'll keep the table between us. My people have been fighting yours since before your grandmother's grandmother, and I'm not sure the Darkspear have been told it's over." },
    { id = "g_prej2", when = { prejudiced = true }, text = "An orc, in the Blasted Lands, near the Portal your people came through. I'll mind my notes, if you don't mind, because the last orcs who visited Quel'Thalas burned the forest down." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "Ah, you again! I've been revising my notes on your kind, and you'll be pleased to know the revision is substantial." },
    { id = "g_default", text = "Ah, a fresh specimen! Forgive me; I mean a fresh visitor, of course." },
    { id = "g_back", when = { metBefore = true }, text = "My favourite test subject returns. How is the constitution?" },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior! Look at the shoulders on you; my sister may keep her basilisk brains, I'd sooner study you." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "beast" } },
      text = "Your beast hasn't been changed by the Portal yet, which makes it a perfect control for my study. Don't let it eat anything out here." },
    { id = "n_lock_taint", cat = "lock_taint", when = { taint = { min = 30 } },
      text = "Oh, look at the green under your fingernails! You've soaked up more fel than any boar in the wastes, I'd wager, and I would dearly love a drop of your blood for the measurements, purely for science." },
  },

  start = "hello",
  nodes = {
    prej = {
      lines = { { id = "prej_default", text = "Do I? Well, I speak of everyone as specimens, it's a professional habit. But with your people, I confess, it's also easier than remembering the Amani raids on Quel'Thalas, and the scars my father took fighting them." } },
      choices = {
        { text = "I'm not Amani, and I'm not your specimen.", next = "BACK", reply = "Fair, fair, and I'll grant the distinction, though old habits are hard to break. You're a very interesting not-specimen, then.", fx = { align = { honor = 1 } } },
        { text = "Our peoples were enemies. Pretending otherwise helps no one.", next = "BACK", reply = "Honest, and refreshing, and quite right, I'm afraid. Our peoples were enemies long before either of us was born.", fx = { align = { honor = -1 } } },
        { text = "Revise your notes. I'll give you plenty of evidence.", next = "prej_ok", fx = { affinity = 1 } },
        { text = "What happened to your father?", next = "prej_why" },
        { text = "Something else, Bloodmage.", next = "BACK" },
      },
    },
    prej_why = {
      lines = { { id = "prejwhy_default", text = "A spear in the shoulder from an Amani raiding party on the edge of Eversong, which healed badly and ached every winter. He told me trolls feel no pain, and I believed him until I read the anatomy texts, which say otherwise rather firmly." } },
      choices = {
        { text = "Then trust the texts over the old stories.", next = "BACK", reply = "I try to, and mostly I succeed, which is more than my shoulder can say. Texts don't ache in the rain.", fx = { align = { order = 1 } } },
        { text = "Old wounds teach lessons books can't.", next = "BACK", reply = "They do, and my shoulder teaches them every winter. I'll grant the old wounds their lessons, then.", fx = { align = { order = -1 } } },
        { text = "Something else, Bloodmage.", next = "BACK" },
      },
    },
    prej_ok = {
      lines = { { id = "prejok_default", text = "Excellent, a cooperative subject! Er, a cooperative friend, I mean. Come back often; the data will be wonderful." } },
      choices = {
        { text = "Something else, Bloodmage.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Everything is, if you understand it well enough, though your sort have been very poor at explaining it, I must say. The boars here heal from wounds that would kill an ogre, and I can't help wondering whether some trace of the Light touched them too." } },
      choices = {
        { text = "The Light isn't a reagent. It can't be bottled.", next = "BACK", reply = "No, perhaps not, but everything else can, and I'm patient. I'll leave the Light to your sort, for now.", fx = { align = { light = 1 } } },
        { text = "Perhaps it can. Study it, and share what you learn.", next = "BACK", reply = "Splendid! A priest with an open mind is rarer than a basilisk with good manners. I'll write to you when I've cracked it.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because the blood is where the secrets are, of course, the strength and speed of these beasts written in it like ink on a page. My sister reads the mind and I read the body, and between us we'll have the whole book before long, if nobody gets eaten." } },
      choices = {
        { text = "Some secrets should stay in the blood.", next = "BACK", reply = "Perhaps some should, and my sister would agree with you. But I'm not very good at leaving things alone.", fx = { align = { light = 1 } } },
        { text = "Read every page. Knowledge has no forbidden chapters.", next = "BACK", reply = "Exactly, exactly! You have the makings of a bloodmage, friend, if you ever tire of whatever you're doing now.", fx = { align = { light = -1 } } },
        { text = "On to other things.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I'm nearly certain of it, because the beasts here drink water that's run past the Portal and eat grass that's grown in its shadow. If the fel can do that to a boar, imagine what it might do in a properly measured dose, which is exactly what I intend to find out." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I'm nearly certain of it, because the beasts here drink water that's run past the Portal and eat grass grown in its shadow. Your servant is a purer sample than any boar, of course, and I don't suppose it would part with a little blood for a properly measured dose?" },
      },
      choices = {
        { text = "Fel in a bottle? That's madness, Drazial.", next = "BACK", reply = "Madness, yes, but very carefully measured madness. I'll take the risk, and the notes.", fx = { align = { light = 1 } } },
        { text = "Measure carefully, and the fel will serve.", next = "BACK", reply = "Precisely! I've had three bottles crack this year, and every one of them was a measuring error, not a fel error.", fx = { align = { light = -1 } } },
        { text = "Something else, Drazial.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "That something in this land makes them grow larger, faster and angrier than any creature ought to be, and that their blood carries it. A druid would call it corruption, I imagine, but I call it a gift no one has had the courage to unwrap." } },
      choices = {
        { text = "It's corruption, Drazial, and bottling it will only spread it.", next = "BACK", reply = "Corruption, perhaps, but corruption with rules, and rules can be learned. I'll take the chance.", fx = { align = { light = 1 } } },
        { text = "If it can be studied, it can be understood. Carry on.", next = "BACK", reply = "Thank you, I will. The Kirin Tor will want my notes one day, and I shall make them ask very nicely.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Because my sister thinks the strength of these beasts lives in their spirits and I think it lives in their blood, and you're the first person I've met who might settle it. If the spirits are sick here, then she's wrong, and I would dearly love to tell her so." } },
      choices = {
        { text = "The spirits here are in pain. That's not for sport.", next = "BACK", reply = "In pain, perhaps, but pain teaches as well as anything. Still, I'll try to be gentle about it.", fx = { align = { honor = 1 } } },
        { text = "I'll help you win the argument, Drazial.", next = "BACK", reply = "Wonderful! My sister will be insufferable when she loses, and I'll enjoy every moment.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_lynnore", when = { questDone = TODO_QUEST("The Basilisk's Bite") },
          text = "My sister says you brought her basilisk parts, and she said it with something very like a smile. I'd be jealous, if I weren't fascinated." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = { "Snickerfang", "Ashmane", "Scorpok" }, min = 30 } }, text = "You've been busy out there, by the smell of you, which is boar and hyena in roughly equal measure. Do bring me the interesting parts, won't you?" },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Do the spirits of the beasts out here still speak to you, or has the fel drowned them out? Either answer would be fascinating, and I'll want notes." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Be frank with me: do you think the fel in this soil is what makes the boars so strong? I've a theory, and you're the first person I've met who might confirm it." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A fellow student of the arcane! My sister calls my work alchemy with pretensions, but you'll appreciate the subtler parts, I'm sure." },
        { id = "h_default", key = true,
          text = "Bloodmage Drazial, at your service. The beasts of these lands show preternatural strength, speed and endurance, quite unlike anything in nature, and I mean to bottle every bit of it." },
        { id = "h_boar", when = { questActive = TODO_QUEST("A Boar's Vitality") },
          text = "Three boar lungs, two scorpok pincers and a basilisk brain, and you'll be my first test subject for the elixir. Try not to be eaten before then; it would spoil the data." },
        { id = "h_jowls", when = { questActive = TODO_QUEST("Snickerfang Jowls") },
          text = "The snickerfang hyenas have jaws that could crack an ogre's skull, and I want to know why. Bring me their jowls, please, and as fresh as you can." },
        { id = "h_drank", tags = { "news" }, when = { questRecent = { TODO_QUEST("A Boar's Vitality"), days = 3 } },
          text = "Tell me true, do you feel invulnerable yet? The boars do, and nothing out here has managed to prove them wrong." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Now there's a subject I'd love to study, if you'd allow it, because I'm told the Light lets your kind mend flesh that should have stayed broken." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! How delightful, you turn into beasts, and I study beasts, so we are practically colleagues, though I suspect you won't see it that way." },
      },
      again = {
        { id = "h_again", text = "Another question? Splendid; curiosity is the first sign of a healthy subject." },
        { id = "h_again2", text = "Go on. My sister says I talk too much, so let's prove her right." },
      },
      choices = {
        { text = "What happened to the beasts here?", next = "beasts" },
        { text = "What do your elixirs do?", next = "elixirs" },
        { text = "There's another bloodmage at this camp, I see.", next = "sister" },
        { text = "Strength in a bottle? I'm listening.", next = "warrior", when = { class = { "WARRIOR", "ROGUE", "PALADIN" } } },
        { text = "Your elixirs might work on my beast.", next = "k_hunter", when = { class = "HUNTER", pet = { type = "Beast" } } },
        { text = "Why call yourselves bloodmages, Drazial?", next = "xmage", when = { class = "MAGE" } },
        { text = "I'd guess the fel makes the beasts strong.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Is the Light just another strength to bottle, Drazial?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What have you learned from the beasts out here, Drazial?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Why do you care what the spirits say, Drazial?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Tell me about the scorpoks.", next = "scorpok" },
        { text = "Who were your other test subjects?", next = "subjects" },
        { text = "What does Nethergarde make of you two?", next = "keep" },
        { text = "Who else lives out in these wastes?", next = "neighbours" },
        { text = "Why leave Quel'Thalas for a place like this?", next = "home" },
        { text = "You speak of my people as specimens, Drazial.", next = "prej", when = { prejudiced = true } },
        { text = "Good luck with your studies.", next = "END" },
      },
    },
    beasts = {
      lines = {
        { id = "b_default", fx = { learn = { "dark_portal" } },
          text = "Our theory is that the energy released when the Dark Portal opened soaked into them, and forced them to change into what you see. The boars are so tough that nothing else bothers hunting them, and the scorpoks strike faster than the eye can follow." },
      },
      choices = {
        { text = "That energy sounds dangerous to us as well.", next = "beasts_danger" },
        { text = "Fascinating.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    beasts_danger = {
      lines = { { id = "bd_default", text = "Probably, in time, and in large doses. That's why we distil it from the beasts first, rather than licking the rocks like some of the ogres seem to." } },
      choices = {
        { text = "Fel is fel. Bottling it doesn't make it clean.", next = "BACK", reply = "No, it doesn't, and I've never claimed otherwise. But bottled fel is a great deal safer than wild fel.", fx = { align = { light = 1 }, affinity = -1 } },
        { text = "Power is power. Use it while you can.", next = "BACK", reply = "While I can, yes, because my people need every edge they can get. Quel'Thalas is ash, and ash doesn't care how clean your methods were.", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    elixirs = {
      lines = { { id = "e_default", text = "Each takes one gift from these beasts and lends it to you for an hour or so: the boar's endurance, the hyena's strength, the scorpok's quickness. The first is free, for science, and the rest you'll pay for in organs." } },
      choices = {
        { text = "Any side effects?", next = "elixirs_side" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elixirs_side = {
      lines = { { id = "es_default", text = "None that have lasted, so far, and the subjects have stopped complaining about the taste. Do keep a record of anything unusual, though; it all goes in the notes." } },
      choices = {
        { text = "I'll keep notes.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sister = {
      lines = { { id = "s_default", text = "Lynnore, my sister. She studies the mind and spirit of the beasts and leaves me the body, which she considers the lesser half of the work; I consider it the half that bites." } },
      choices = {
        { text = "Do you two get along?", next = "sister_along" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sister_along = {
      lines = { { id = "sa_default", text = "We've shared a camp in the Blasted Lands without killing each other, which in this place counts as devotion. Don't tell her I said that." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    warrior = {
      lines = { { id = "w_default", text = "I thought you might be. The snickerfang's strength in a single draught; you'll swing that weapon like you were born to it, at least until it wears off." } },
      choices = {
        { text = "Sign me up.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "I'd rather earn my strength.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    k_hunter = {
      lines = {
        { id = "xhu_default", text = "Oh, almost certainly, and what a fascinating trial that would be! I'd want it observed for a week, mind, because the basilisks here grew a second row of plates on the stuff and I'd hate to miss that." },
      },
      choices = {
        { text = "My beast is not your experiment.", next = "BACK", reply = "Of course not, I quite understand, and I'll not ask again. Mostly.", fx = { align = { light = 1 }, affinity = -1, trait = { kind = 1 } } },
        { text = "If it makes it stronger, I'll consider it.", next = "BACK", reply = "Wonderful! Bring it by, and we'll start with a very small dose. Very small.", fx = { align = { light = -1 }, affinity = 1 } },
      },
    },
    scorpok = {
      lines = {
        { id = "sc_default", text = "The scorpoks strike faster than any creature their size has a right to, and I've watched one sting a hyena twice before the poor thing knew it was in a fight. I want that quickness, and it lives in the pincers, so naturally I want the pincers." },
        { id = "sc_active", when = { questActive = TODO_QUEST("The Decisive Striker") },
          text = "How goes the pincer hunt? Strike first and strike hard, because a scorpok that sees you coming is a scorpok you'll be wearing." },
        { id = "sc_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Decisive Striker"), days = 3 } },
          text = "You've had the scorpok's quickness in you now, and I hope you noticed how slow everyone else looked. That's the feeling I've spent two years chasing." },
      },
      choices = {
        { text = "What does quickness feel like from the inside?", next = "scorpok_feel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scorpok_feel = {
      big = true,
      lines = { { id = "sf_default", text = "Like the world has been dipped in honey and you alone were left out of the jar. I've tried it myself, of course, because a bloodmage who won't drink his own elixirs isn't worth listening to, though I did knock over three flasks in the first minute." } },
      choices = {
        { text = "Good. You test on yourself first, as you should.", next = "BACK", reply = "I always do, it's the only honest way to work. And a little honey never hurt anyone.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Test on volunteers. Your mind is too valuable to risk.", next = "BACK", reply = "Volunteers are so unreliable, though, they describe everything as tingly. I'll keep testing on myself.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    subjects = {
      lines = { { id = "su_default", text = "Mostly soldiers from Nethergarde who wander out on patrol and can be talked into anything for a warm drink, which mine isn't. One of them drank the boar elixir and ran the whole road to the keep and back without stopping, and he still hasn't forgiven me for the cramp." } },
      choices = {
        { text = "Do they know what they're drinking?", next = "subjects_know" },
        { text = "Something else.", next = "BACK" },
      },
    },
    subjects_know = {
      big = true,
      lines = { { id = "sk_default", text = "They know it's boar and hyena and something that used to be a basilisk, and they know I'm smiling, and most of them drink it anyway. I tell them everything I know, which admittedly isn't everything there is to know; that's rather the point of a study." } },
      choices = {
        { text = "Then every drink is a gamble with someone's life.", next = "BACK", reply = "It is, and they know it, and they drink anyway. I only offer, and they choose.", fx = { align = { light = 1 }, affinity = -1 } },
        { text = "They chose to drink. That's on them, not you.", next = "BACK", reply = "Exactly, and I'm glad you see it. I label every flask in two languages, which is more than the Dalaran alchemists ever did.", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    keep = {
      lines = {
        { id = "kp_default", fx = { learn = { "nethergarde" } },
          text = "Nethergarde tolerates us, which is more than I expected from a keep full of Kirin Tor mages and dwarves who think elves are made of glass. The soldiers buy my elixirs quietly, and the mages pretend not to have noticed." },
        { id = "kp_horde", when = { faction = "Horde" },
          text = "Nethergarde puts up with two elves in its wastes, and it would never put up with you. The soldiers buy my elixirs when no officer is watching, and the mages pretend we don't exist." },
      },
      choices = {
        { text = "There's another elf at the keep. An ambassador.", next = "keep_ardalan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    keep_ardalan = {
      lines = { { id = "ka_default", text = "Ardalan, yes, who wants the Alliance and the Horde to put down their swords and face the Legion together. It's a lovely idea, and he'll be making speeches about it long after the ogres have eaten the both of us, but I do admire a man who can talk that long without notes." } },
      choices = {
        { text = "He's right, though. The Legion is the real enemy.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    neighbours = {
      lines = { { id = "nb_default", fx = { learn = { "draenethyst" } },
        text = "There's a bent, broken creature by the Rise of the Defiler who collects draenethyst crystals and looks at me as if I smelled of something rotten. Further south there's an old man at a demon altar, and he keeps worse company than either of us." } },
      choices = {
        { text = "Have you studied the crystal collector?", next = "neighbours_kumisha" },
        { text = "Something else.", next = "BACK" },
      },
    },
    neighbours_kumisha = {
      lines = { { id = "nk_default", text = "I asked him once whether I might take a little of his blood, purely for comparison, and he told me I reeked of greed and turned his back on me. I suppose that's a no, though I've written it down as 'pending.'" } },
      choices = {
        { text = "You might ask more politely next time.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    home = {
      lines = { { id = "ho_default", text = "Quel'Thalas is ash and grief since the Scourge came through it, and there's very little left at home to study except what was lost. Here, at least, everything is alive and furious, and a bloodmage can do some good work with furious." } },
      choices = {
        { text = "Do you think the study will help your people?", next = "home_people" },
        { text = "Something else.", next = "BACK" },
      },
    },
    home_people = {
      big = true,
      lines = { { id = "hp_default", text = "I think my people need strength more than they need comfort just now, and strength is what I can bottle. My sister would say they need their minds kept whole, and so she studies what she does, and perhaps we're both right, though I'd never tell her so." } },
      choices = {
        { text = "Comfort heals a people. Strength alone only hardens them.", next = "BACK", reply = "Perhaps, and Lynnore would agree with you. But my people need strength first, and comfort after.", fx = { align = { order = -1 } } },
        { text = "Strength first. Grief can wait until they're safe.", next = "BACK", reply = "Exactly, and that's what I keep telling my sister. Grief will keep, and the trolls will not.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A bloodmage, which means I study what's in the blood and the bone. The rest is footnotes.", next = "beasts" } },
    advice = { { id = "tp_ad", text = "Never fight a Blasted Lands boar fairly; they don't tire, and you will." } },
    nethergarde = { { id = "tp_ng", text = "A fortress full of people who'd rather watch the Portal than learn from it. Good customers, though.", next = "keep" } },
    draenethyst = { { id = "tp_dr", text = "Crystals the collector by the Rise prizes above his own skin. I'd love to know what's in them, and he'd sooner die than let me look." } },
    dark_portal = { { id = "tp_portal", text = "The source of everything interesting in these lands. Also everything dangerous, but that's usually the same list." } },
    dreadmaul = { { id = "tp_dreadmaul", text = "The Dreadmaul ogres are fascinating specimens, and their blood is thick as tar. I'd love to study one alive, if Lynnore would help me hold it." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran's mages always thought bloodmages were crude, and now their city is in ruins and I'm still working. I'll leave the conclusions to you." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor would never have funded our work, so we came out here where nobody would ask. The Blasted Lands are a wonderful laboratory." } },
    scourge = { { id = "tp_scourge", text = "The Scourge raise the dead with necromancy, which is a crude and wasteful use of good blood. I'd study one, but they bite." } },
    _none = { { id = "tp_none", text = "Not my field, I'm afraid. Ask my sister; she's better at abstractions." } },
  },
}

P:NPC {
  key = "lynnore", id = TODO_NPC("Bloodmage Lynnore"), name = "Bloodmage Lynnore",
  bible = "bibles/blastedlands.md", role = "questgiver", tier = "quest",
  communities = { "blasted_lands" }, temper = { "steady" }, values = { "curious", "wise" },
  notices = { "class", "lock_soulstone" },

  impression = {
    first = "She is fonder of her brother than she would ever admit.",
    third = "{name} met Bloodmage Lynnore, Drazial's sister, who studies how the basilisks and vultures of the Blasted Lands think and heal.",
  },

  greetings = {
    { id = "g_op_orcs", when = { gossip = { topic = "orcs", stance = "redeemed" } }, text = "Kum'isha, the crystal collector, tells me you believe the orcs have changed. He spat after he said it, which for him is a kind of respect for your nerve." },
    { id = "g_default", text = "Quietly, please. I'm observing, and the basilisk has only just stopped looking at me." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Your mind's still in one piece, I trust?" },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. You'll understand my work better than my brother does; you also believe there's more to a creature than its meat." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, and a thinking one, I hope. My compounds sharpen the mind as well as any study, and far more quickly." },
    { id = "n_lock_soulstone", cat = "lock_soulstone", when = { carrying = { 5232, 16892, 16893, 16895, 16896 } },
      text = "There's an unspent soulstone in your pack, I'd swear to it, because the basilisk turned its gaze on your bag and not on you. They know what holds a soul, it seems, and I find that very interesting." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The same thing that keeps a wounded basilisk crawling toward its den: a spirit that refuses the body's verdict. You would call it rage, I suspect, or discipline, but I have watched the beasts here endure far worse than you, and they never needed a name for it." } },
      choices = {
        { text = "Discipline. Rage burns out, but training holds.", next = "BACK", reply = "Discipline, then, and I'll write it down. Rage burns out, you say, and I've seen that in the basilisks too.", fx = { align = { order = 1 } } },
        { text = "Rage. Discipline breaks long before fury does.", next = "BACK", reply = "Rage, then, and I'll note it. Though I've seen many beasts burn themselves out on fury.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I could, and I would learn more from it than from a hundred basilisk brains, though I suspect you would not care for my methods. A beast that trusts its master endures pain that would kill a wild one, and I want to know why." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "I could, and {pet} would be a fine subject; look how it watches me, weighing whether I'm prey or threat. Its mind is quicker than you give it credit for, and I'd wager it has already decided I'm neither." },
      },
      choices = {
        { text = "Our bond isn't something for your vials, Bloodmage.", next = "BACK", reply = "No, I suspect it isn't, and I'll respect that. Some bonds should stay unmeasured.", fx = { align = { light = 1 } } },
        { text = "Study away. Whatever makes us stronger is worth knowing.", next = "BACK", reply = "Splendid! You and your beast would teach me more in a week than a hundred basilisks. I'll be gentle.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Perhaps not, but you can't tell me how it works either, only that it does, and I find that a very poor argument from people who call my work blasphemy. I'll keep my brains in jars and you keep your prayers, and we'll see which of us learns more." } },
      choices = {
        { text = "The Light asks for faith, not proof. That's its strength.", next = "BACK", reply = "Faith, yes, and I'll grant it works, somehow. I'd just like to know how, and so would you, I think.", fx = { align = { light = 1 } } },
        { text = "Keep your jars, then. Results will settle it.", next = "BACK", reply = "Results, yes, and I'm patient. My jars and your Light, and we'll see which helps more people.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Patience, chiefly, because a basilisk can sit still for days and lose none of its sharpness, and I'd like to know how. If I can bottle that, a mage could study through the night without a single wandering thought." } },
      choices = {
        { text = "A mind should earn its sharpness, not drink it.", next = "BACK", reply = "A fair point, and my brother would scoff at it. But I've earned my sharpness the hard way, and I'd like a little help now.", fx = { align = { order = 1 } } },
        { text = "Any shortcut to a sharper mind is worth taking.", next = "BACK", reply = "Exactly, and that's why I'm out here rather than in a library. The books in Dalaran never once offered to make me cleverer; they only asked me to be patient.", fx = { align = { order = -1 } } },
        { text = "Let's leave that there.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "That is the question, and the answer is in their gizzards, I'm almost certain. They've learned to digest corruption the way a goat digests thorns, and if I can learn the trick, perhaps I can teach it to people who must live beside it, like you." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "That is the question, and the answer is in their gizzards, I'm almost certain. Your demon seems to agree, since it's been staring at my sample jars since you arrived, so keep it away from them, and perhaps I'll learn a trick worth teaching to people like you." },
      },
      choices = {
        { text = "A cure for corruption would save many lives.", next = "BACK", reply = "It would, and that's what I keep telling Drazial. A cure would be worth more than all his bottles.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Corruption is power. I don't want it cured.", next = "BACK", reply = "Then you're a strange sort of warlock, and a dangerous one. I'll keep my cure for those who want it.", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Everything worth knowing, because a basilisk lies so still on the rocks that you step on it before you see it, and then you stop moving altogether. My brother bottles their strength, but I would rather understand their patience, which no elixir has ever captured." } },
      choices = {
        { text = "Patience is a discipline. I'll study it, Lynnore.", next = "BACK", reply = "Then you'll be a fine rogue, and a patient one. Watch the basilisks, and learn.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd sooner bottle the strength and be done with it.", next = "BACK", reply = "My brother would say the same, and he has the scorch marks on his sleeves to show for it. Watch the basilisks first.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Its instinct and its will to live, the thing that makes a basilisk freeze and a vulture wait, and it can be drawn out and studied if one is careful. You would call it sacred and I would call it data, but we both agree it is real, which already puts us ahead of my brother." } },
      choices = {
        { text = "A spirit isn't data, Lynnore. It deserves respect.", next = "BACK", reply = "It does, and I try to give it, in my way. But my people need what it knows.", fx = { align = { honor = 1 } } },
        { text = "Study it as you like. Knowledge is knowledge.", next = "BACK", reply = "I'm glad someone understands. Drazial thinks I'm too soft with them, and the priests at Nethergarde think I'm too hard, so I must be doing something right.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_drazial", when = { questDone = TODO_QUEST("A Boar's Vitality") },
          text = "My brother tells me you've been bringing him boar parts. He was insufferable about it at supper, so do me a kindness and bring me something next time, so I have something to be insufferable about back." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Redstone", min = 30 } }, text = "The Redstone basilisks are thinning out around the pass, and I know whose doing it is, so I hope you at least watched how they froze before you killed them." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You claim to hear the spirits of beasts and I study them, so we may be the only two people in this wasteland who believe they exist." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. You move like a basilisk, slow until it matters, and I'd find that admirable if I thought you'd learned it from watching basilisks." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. My brother would want to bottle your strength, but I would rather know what keeps you standing after the strength has run out." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. You would make a better study than my brother's vials, because you and your animals learn each other's minds, and that interests me far more than muscle." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. You'll have noticed the taint in the vultures, then, and how they feed on it rather than die of it." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. Perhaps you'll understand my work better than my brother does, since you spend your life training the mind to hold more than it should." },
        { id = "h_default", key = true,
          text = "Bloodmage Lynnore. My brother Drazial studies the strength of the beasts here, and I study what he overlooks: their minds, and the spirit that lets them heal and endure beyond anything their bodies should allow." },
        { id = "h_brains", when = { questActive = TODO_QUEST("The Basilisk's Bite") },
          text = "Ten basilisk brains and two vulture gizzards, as fresh as you can manage. The brains are the point; the gizzards are only there to hold the solution together." },
        { id = "h_vulture", when = { questActive = TODO_QUEST("Vulture's Vigor") },
          text = "The vultures here should have died of the taint years ago, and instead they thrive on it. Their gizzards hold the secret, and I'd like ten of them." },
        { id = "h_tasted", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Basilisk's Bite"), days = 3 } },
          text = "You've had a taste of the redstone basilisk's mind now. Did you notice how much quicker your thoughts ran?" },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin. Your order claims the Light heals what the body cannot, and I've watched basilisks here do the same with nothing but their own will, so perhaps we're studying the same thing." },
      },
      again = {
        { id = "h_again", text = "Something else? Ask precisely, please; I find vague questions tiring." },
        { id = "h_again2", text = "Go on, then; the basilisks will keep for a little while." },
      },
      choices = {
        { text = "What's special about the basilisks?", next = "basilisks" },
        { text = "What do you mean by the spirit of a beast?", next = "spirit" },
        { text = "Do you and your brother see eye to eye?", next = "brother" },
        { text = "A beast's spirit is the Light's work, not yours.", next = "priest", when = { class = "PRIEST" } },
        { text = "A druid feels a beast's spirit, Lynnore. Not in bottles.", next = "k_druid", when = { class = "DRUID" } },
        { text = "What do basilisk minds teach you, Lynnore?", next = "xmage", when = { class = "MAGE" } },
        { text = "The vultures don't seem to die of the taint.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "The Light isn't a beast's instinct, Lynnore.", next = "xapala", when = { class = "PALADIN" } },
        { text = "What keeps a warrior standing, then, Lynnore?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Could you study the bond between a hunter and a beast?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What do basilisks know about moving quietly, Lynnore?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What do you think a beast's spirit is, Lynnore?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Why do the vultures thrive on the taint?", next = "vultures" },
        { text = "You mentioned a price. What price?", next = "price" },
        { text = "What do you make of the mages at Nethergarde?", next = "keep" },
        { text = "Do you miss Quel'Thalas?", next = "home" },
        { text = "Have you met the crystal collector by the Rise?", next = "kumisha" },
        { text = "I'll leave you to observe.", next = "END" },
      },
    },
    basilisks = {
      lines = { { id = "b_default", text = "The redstone basilisks have flourished here more than any other creature, and I've watched them hunt: they plan, they wait, they lay traps. Their thinking is more complex than that of some humanoids I could name." } },
      choices = {
        { text = "Some humanoids like ogres?", next = "basilisks_ogres" },
        { text = "And you want their brains.", next = "basilisks_brains" },
        { text = "Something else.", next = "BACK" },
      },
    },
    basilisks_ogres = {
      lines = { { id = "bo_default", text = "Ogres, yes, and a good many adventurers. I didn't say which; you may draw your own conclusions." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    basilisks_brains = {
      lines = { { id = "bb_default", text = "I must study them, and I can't study them while they're attached to a basilisk that wants to eat me. The compound I make from them is my thanks; more of it can always be made, for a price." } },
      choices = {
        { text = "Science is a bloody business.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirit = {
      lines = { { id = "s_default", text = "Some of these creatures recover from wounds faster than flesh should allow, as if something untied to their bodies were mending them. Call it spirit, call it will; the vultures have more of it than anything I've ever seen." } },
      choices = {
        { text = "Can it be bottled for us?", next = "spirit_bottle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirit_bottle = {
      lines = { { id = "sb_default", text = "For a while, yes; that's what the vulture's gizzard compound does. It won't make you a better person, only a quicker-mending one, which in the Blasted Lands is the more useful of the two." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brother = {
      lines = { { id = "br_default", text = "Drazial says a great many things, most of them loudly. I don't look down on his work; I only think it's the easy half, which is a different thing entirely." } },
      choices = {
        { text = "He's fond of you, you know.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest = {
      lines = { { id = "pr_default", text = "Perhaps. If it is, the Light has been very generous to vultures and very stingy with the people out here. I only measure what I find, priest; the theology I leave to you." } },
      choices = {
        { text = "Then measure carefully. Some things shouldn't be tampered with.", next = "BACK", reply = "I will, and I always do. The Light may be generous to vultures, but it's my job to share it around.", fx = { align = { light = 1 } } },
        { text = "Measure away. The Light can take care of itself.", next = "BACK", reply = "It can, and I'm glad you think so. I'll measure, and let the Light worry about itself.", fx = { align = { light = -1 }, affinity = 1 } },
      },
    },
    k_druid = {
      lines = {
        { id = "xdr_default", text = "Then tell me what you feel in them, because I have only my notes and my brother's bottles, and neither of them can tell me why a starving boar here heals faster than a fed one in Elwynn. Is it pain, or is it something else?" },
      },
      choices = {
        { text = "It's rage. They heal because they can't stop.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "It's sickness. Your study should end.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
    vultures = {
      lines = {
        { id = "vu_default", text = "Their gizzards have learned to break down what ought to poison them, and the vultures grow stronger on carrion that would kill a ghoul. If I can understand how, I can lend that vigour to you, and perhaps one day to someone who needs it more." },
        { id = "vu_active", when = { questActive = TODO_QUEST("Vulture's Vigor") },
          text = "Ten gizzards, please, and from the older vultures if you can tell them apart. The young ones haven't eaten enough of this land to be interesting." },
        { id = "vu_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Vulture's Vigor"), days = 3 } },
          text = "You've drunk the vulture's vigour now. Did your wounds close quicker, or did you only feel braver about getting them?" },
      },
      choices = {
        { text = "Who needs it more than me?", next = "vultures_need" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vultures_need = {
      big = true,
      lines = { { id = "vn_default", text = "My people, who drank of something wonderful for thousands of years and now have nothing, and feel the lack every hour. I won't say more than that, but a creature that turns poison into strength is not an idle curiosity to an elf of Quel'Thalas." } },
      choices = {
        { text = "Then heal them, whatever the source of the cure.", next = "BACK", reply = "I will, whatever the source, and I'll answer for it later. My people can't wait for a clean cure.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Be careful. A cure from tainted beasts may carry the taint.", next = "BACK", reply = "I've thought of that, and I measure every drop. But my people need something, and soon.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    price = {
      lines = { { id = "pr2_default", text = "Not gold, which is no use to me out here. Brains and gizzards, fresh, and as many as you can stomach to cut, because every compound I make costs me a basilisk, and the basilisks of these lands are not infinite, however it may look from the road." } },
      choices = {
        { text = "Does killing them for study ever trouble you?", next = "price_trouble" },
        { text = "Something else.", next = "BACK" },
      },
    },
    price_trouble = {
      big = true,
      lines = { { id = "pt_default", text = "More than my brother would believe, because I've spent long enough watching them to know they're thinking when they die. I tell myself the knowledge outlives the beast, and most days I believe it." } },
      choices = {
        { text = "Then take only what you need, and no more.", next = "BACK", reply = "I try to, and it's harder than Drazial thinks. They're not just beasts to me anymore.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They're beasts. Knowledge is worth any number of them.", next = "BACK", reply = "My brother would agree with you, and maybe he's right. But I'm not sure I can think that way.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    keep = {
      lines = {
        { id = "kp_default", fx = { learn = { "nethergarde" } },
          text = "Most of them watch the Portal as if staring hard enough would teach them something, and the rest read old books about it. There's a dwarf in their tower, though, Grimshade, who is the only one I'd call a real student of anything." },
      },
      choices = {
        { text = "Why Thadius Grimshade?", next = "keep_thadius" },
        { text = "Something else.", next = "BACK" },
      },
    },
    keep_thadius = {
      lines = { { id = "kt_default", text = "Because he wants things he isn't supposed to want and admits it, which makes him honest in a way the others aren't. He asked me once how the basilisks heal, and I think he was asking for himself, though he laughed before I could say so." } },
      choices = {
        { text = "Perhaps he fears growing old.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    home = {
      lines = { { id = "ho_default", text = "I miss what it was, which is not the same as missing what it is now. Quel'Thalas has been ash and mourning since the Scourge came, and I find the basilisks better company than grief." } },
      choices = {
        { text = "Grief isn't something to run from.", next = "home_grief" },
        { text = "Something else.", next = "BACK" },
      },
    },
    home_grief = {
      big = true,
      lines = { { id = "hg_default", text = "I didn't run from it; I brought it here and put it to work, which is the only thing I know how to do with anything. You may call that cold if you like, but my brother pours his grief into bottles too, only louder." } },
      choices = {
        { text = "That's not cold. That's how you endure.", next = "BACK", reply = "Thank you, that's kinder than I expected. Enduring is what my people do best now.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Work can't hold grief forever. It'll spill out.", next = "BACK", reply = "Perhaps it will, and perhaps I'll let it, someday. But not here, and not yet.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kumisha = {
      lines = { { id = "ku_default", fx = { learn = { "draenethyst" } },
        text = "Kum'isha, he calls himself, and he's the most interesting mind in these wastes, basilisks included. He has thought about one thing, his draenethyst crystals and the way home, for longer than either of us has been alive, and it has worn him down to a single purpose." } },
      choices = {
        { text = "That sounds more sad than interesting.", next = "kumisha_sad" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kumisha_sad = {
      lines = { { id = "ks_default", text = "It can be both, and usually is. He told me I stank of greed, and I suppose he's right, since what I want from him is the inside of his head, which he will never give me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "An elf of Quel'Thalas who would rather watch a basilisk think than listen to most people talk. You may take that personally.", next = "basilisks" } },
    advice = { { id = "tp_ad", text = "Don't meet a basilisk's eyes, and don't assume it's stupid because it's scaly." } },
    nethergarde = { { id = "tp_ng", text = "A keep full of watchers, with one honest student in the tower. I'll leave you to guess which.", next = "keep" } },
    draenethyst = { { id = "tp_dr", text = "Kum'isha's crystals. I'd pay in mana and blood to know what they mean to him, and he'd give nothing to tell me.", next = "kumisha" } },
    dark_portal = { { id = "tp_portal", text = "Whatever came out of it changed everything living here. I'd like to know what it would do to a thinking creature, and I'm afraid I already do." } },
    sylvanas = { { id = "tp_sylvanas", text = "Lady Sylvanas was the Ranger-General of Silvermoon, and now she rules the dead of Lordaeron. I find I do not want to discuss it." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran taught me what it could, and I left before the Scourge came. That was luck, not wisdom." } },
    scourge = { { id = "tp_scourge", text = "The Scourge took Quel'Thalas, and I have not been home since. I study basilisks now, because basilisks do not remind me of anything." } },
    dreadmaul = { { id = "tp_dreadmaul", text = "The ogres are stupid and loud and they frighten the basilisks. I have no other opinion of them." } },
    _none = { { id = "tp_none", text = "That's outside my study. My brother will happily guess, if you want a guess." } },
  },
}

P:NPC {
  key = "daio", id = TODO_NPC("Daio the Decrepit"), name = "Daio the Decrepit",
  bible = "bibles/blastedlands.md", role = "questgiver", tier = "quest",
  communities = { "tainted_scar" }, temper = { "steady" }, values = { "patient", "cunning" },
  notices = { "class", "race" },

  impression = {
    first = "I believe he has paid the price of power he speaks of.",
    third = "{name} met Daio the Decrepit, an old warlock who teaches the binding of demons from an altar in the Tainted Scar.",
  },

  greetings = {
    { id = "g_default", text = "You are certainly a long way from home, {race}. Come closer; the demons won't bite while I'm watching." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still alive. The Scar hasn't had you yet, then." },
  },

  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "Ah, one of us. I can see what you've already paid for your power in your eyes, and it isn't nearly enough yet." },
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "The Light, here? You must be very brave or very lost. The demons in the Scar can smell it on you, so mind yourself." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The same as any of us, only paid slower: your knees, your sleep, and the friends who stood beside you and didn't get up. My students pay with their souls, all at once, and I sometimes think yours is the crueller bargain." } },
      choices = {
        { text = "What I pay is mine to give. No demon takes it.", next = "BACK", reply = "Then you're wiser than I was at your age, child. Keep it that way, and keep your knees.", fx = { align = { light = 1 } } },
        { text = "Any price is worth it, if the strength is real.", next = "BACK", reply = "Any price? Child, you don't know what any price means yet. You will, and I'll be watching.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Only in that both of them would turn on you if they could, though your beast has the decency to forget the urge. A demon remembers every command it ever resented, and it waits, which is the first thing I teach and the last thing anyone believes." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "{pet} won't come near my altar, and that's wisdom, not cowardice. Animals know the smell of the Twisting Nether long before men do." },
      },
      choices = {
        { text = "My beast follows me by trust. That's nothing like your chains.", next = "BACK", reply = "Trust, is it? Then may your beast never learn otherwise, child. Mine did, and so will yours.", fx = { align = { light = 1 } } },
        { text = "Fear or love, obedience is obedience, old man.", next = "BACK", reply = "So it is, child, and you've learned it faster than most. Mind you remember the second half: it always ends, and it never ends kindly.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "You call a bear out of yourself and command it, and I call a demon out of the Nether and command it, and the price of losing control is about the same. I have paid my price, and you can see it on me, and I wonder sometimes what yours will look like." } },
      choices = {
        { text = "A druid's bond is with nature, given freely. Yours is theft.", next = "BACK", reply = "Theft, is it? Perhaps, child, but nature takes its price too, only slower. We all pay in the end.", fx = { align = { light = 1 } } },
        { text = "Perhaps you're right, Daio. All power has a price.", next = "BACK", reply = "It does, child, and I've paid more than most. Remember that, when your bear asks for its due.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because a demon always knows what it gave you, child, and it comes back for payment at a time of its choosing, usually the worst one. I have lived beside this altar long enough to watch many clever thieves try, and you can see by my face how the cleverest bargain went." } },
      choices = {
        { text = "A bargain should be honoured, even with a demon.", next = "BACK", reply = "Honored, aye, and paid in full. That's the only way to walk away from a demon, child.", fx = { align = { honor = 1 } } },
        { text = "Then I'd best not get caught, old man.", next = "BACK", reply = "Then be very quick, and very lucky. They always come back, child; I've woken to the smell of brimstone in my tent forty years running.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I know better than anyone, since I helped in my small way. Every bargain struck at this altar leaves a little rot in the soil, and the Scar has been taking bargains since the first orcs came through the Portal, so weep for it if you like, but don't expect it to weep back." } },
      choices = {
        { text = "Then I'll stand against those who bargain here, Daio.", next = "BACK", reply = "Good, child, someone should. I'll not stop you, and I'll not help them.", fx = { align = { honor = 1 } } },
        { text = "Rot or not, power is power. Teach me, Daio.", next = "BACK", reply = "Power is power, child, and rot is rot. Teach you I will, but you'll pay, as I did.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dd_kazzak = {
      lines = {
        { id = "dd_kazzak_1",
          text = "I like it very much, and I fear it very much, both at once. The lesser demons I bind out here knew their place while a doomlord walked among them, because they feared him more than they feared me." },
        { id = "dd_kazzak_2",
          text = "Now they look at me and wonder. Power is a ladder, and when you knock out a rung near the top, everything beneath it shifts, so I'll be sleeping lightly for a while." },
      },
      choices = {
        { text = "Then perhaps stop binding demons, old man.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Then bind them tighter. Fear is a fine leash.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Daio.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_kazzak", when = { killed = { name = "Kazzak" } },
          text = "The Scar feels lighter since Kazzak was thrown back, and I hear you had a hand in it. I've lived in that one's shadow for a long time, friend, and I'm not sure I like the quiet." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, at my altar? The elements will not follow you here, I'm afraid, because the Tainted Scar has fed on demons so long that the earth itself has gone sour." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. You take what you want and leave before anyone can name the price, which is a fine way to live, though it never works with demons." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior comes to Daio's altar. You've no use for demons, I know, but I'd guess you know a thing or two about the price of power." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter, come to an old man's altar. My students keep their creatures by chains and fear, and I'd be curious to know whether yours obey you from love." },
        { id = "h_default", key = true,
          text = "Daio, they call me, and the Decrepit, which I've earned. I teach suppression and control to those who would master demons rather than serve them, and I teach them sacrifice, which is the lesson nobody wants." },
        { id = "h_bindings", when = { questActive = TODO_QUEST("The Prison's Bindings") },
          text = "The blood of the Wildspawn satyr, from Dire Maul's Warpwood Quarter, fifteen measures of it. Once it clots, it will bind the shards and power the prison." },
        { id = "h_suppression", when = { questActive = TODO_QUEST("Suppression") },
          text = "The prison is ready, and now comes the ugly bit: find a Doomguard Commander in the Scar and take it. Bring friends who can keep you alive, because it will want nobody dead but you." },
        { id = "h_bound", tags = { "news" }, when = { questRecent = { TODO_QUEST("Suppression"), days = 7 } },
          text = "You've a Doomguard in your keeping now, and the knowledge to call it. Remember what it costs every time you do, and never assume it has forgiven you." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, at my altar. Your kind and mine both bind something wild to our will, friend, though you'd never admit the likeness, and I'd never ask you to." },
      },
      again = {
        { id = "h_again", text = "More questions? Good; the ones who stop asking are the ones the demons keep." },
        { id = "h_again2", text = "Speak. I've nowhere to be, and the Scar is very quiet company." },
      },
      choices = {
        { text = "You don't like that Kazzak is gone?", next = "dd_kazzak", when = { killed = { name = "Kazzak" } } },
        { text = "What would I have to sacrifice?", next = "sacrifice" },
        { text = "How do you conjure a demon?", next = "conjure" },
        { text = "Why live here, of all places?", next = "scar" },
        { text = "I have come to learn, Daio.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "You trade in damnation, old man.", next = "priest", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Mages bind things too, old man.", next = "k_mage", when = { class = "MAGE" } },
        { text = "What price does a warrior pay for strength, Daio?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "A demon can't be so different from a hunter's beast.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "How is a druid anything like a demon-binder, Daio?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Why doesn't stealing work with demons, Daio?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "The fel has ruined this earth, Daio.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What becomes of your students?", next = "students" },
        { text = "What is a Doomguard, exactly?", next = "doomguard" },
        { text = "Does Nethergarde know you're here?", next = "keep" },
        { text = "There's a crystal collector up by the Rise.", next = "kumisha" },
        { text = "I'll leave you to your altar.", next = "END" },
      },
    },
    sacrifice = {
      big = true,
      lines = { { id = "s_default", text = "That is for the demon you wish to conjure and enslave to decide, not me. We wield dark powers and we pay grossly for them, and the only warlocks who last are the ones who know the price before they open the book." } },
      choices = {
        { text = "What did you pay?", tag = "Intimidate", next = "daio_price",
          check = { pass = { any = { { class = "WARLOCK" }, { disposition = { min = 65 } }, { questDone = TODO_QUEST("Suppression") } } } },
          fail = { next = "daio_grin", fx = { affinity = -1 } } },
        { text = "No power is worth that.", next = "BACK", reply = "That's what the wise ones say, child, and they're right. But the foolish ones keep coming to me.", fx = { align = { light = 1 }, affinity = -1 } },
        { text = "Any price is worth paying for real power.", next = "BACK", reply = "Then you're a fool, child, and the demons love fools. I'll teach you, but I'll not weep for you.", fx = { align = { light = -1 }, affinity = 1, taint = 2 } },
      },
    },
    daio_price = {
      big = true,
      lines = { { id = "dp_default", text = "My name, among decent people, and every friend who knew it. I live at a demon's altar in a scar in the earth because nowhere else would have me, and I'd tell you it was worth it, but I've stopped lying to students." } },
      choices = {
        { text = "Then why teach it?", next = "daio_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    daio_why = {
      lines = { { id = "dw_default", text = "Because you'll learn it anyway, from a book or a cultist or a voice in the dark, so learn it from someone who'll tell you the price." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    daio_grin = {
      lines = { { id = "dg_default", text = "Ask me that again when you've paid something of your own, and perhaps I'll answer. Until then, mind your tongue in my Scar." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    conjure = {
      lines = { { id = "c_default", text = "First you build a prison to confine the beast, because a demon called without one is a demon loose. The bindings, the casing, the crystal; only when all three are ready do you go looking for what you mean to put inside." } },
      choices = {
        { text = "And then?", next = "conjure_then" },
        { text = "Something else.", next = "BACK" },
      },
    },
    conjure_then = {
      lines = { { id = "ct_default", fx = { learn = { "burning_legion" } },
        text = "Then you go into the Scar and find a Doomguard, one of the Legion's commanders, and you hold the prison steady while it tries to tear you in half. Most fail at that part, and most of those don't come back to complain." } },
      choices = {
        { text = "I'll bring friends.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scar = {
      lines = { { id = "sc_default", fx = { learn = { "tainted_scar" } },
        text = "Because the demons are here, and the lessons are here, and nobody from Nethergarde will come this far to tell me to stop. The Scar has a lord, and the lord leaves an old man alone as long as he's no trouble." } },
      choices = {
        { text = "Who is its lord?", next = "scar_lord" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scar_lord = {
      lines = { { id = "sl_default", text = "Kazzak, a great doomlord of the Legion, who walks the Scar as if he owned the world, and perhaps one day he will. I don't stand in his way, and I'd advise you to follow my example." } },
      choices = {
        { text = "Someone should stand in his way.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Wise advice.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    warlock = {
      lines = { { id = "w_default", text = "So you have found me, and you've come to learn suppression and control. I will teach you much more than that, and you'll curse me for some of it, which is how you'll know it was worth learning." } },
      choices = {
        { text = "Teach me, then.", next = "conjure", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest = {
      lines = { { id = "pr_default", text = "I trade in honesty, which looks like damnation to people who'd rather not know the price of things. Go back to your temple, if you like; the demons won't be any fewer for your disapproval." } },
      choices = {
        { text = "The Light will see them banished, and you with them.", next = "BACK", reply = "Perhaps it will, child, and I'll not argue. But until then, I'll keep teaching the price.", fx = { align = { light = 2 }, affinity = -2 } },
        { text = "Perhaps knowing the enemy is no sin.", next = "BACK", reply = "No sin at all, child, and wiser than most priests know. Go in peace, and remember what you saw.", fx = { align = { light = -1 }, affinity = 1 } },
      },
    },
    k_mage = {
      lines = {
        { id = "xmg_default", text = "Bind? You conjure water and call it mastery, child. I bind what would eat you, and I pay for every hold I keep on it, and so would you, if you ever reached for anything that could reach back." },
      },
      choices = {
        { text = "Some of us know where to stop.", next = "BACK", reply = "Then you're wiser than most, child, and I respect that. Stop where you must, and live.", fx = { align = { light = 1 } } },
        { text = "Then teach me to reach further.", next = "BACK", reply = "Reach further, and you'll pay further, child. Are you sure you want that?", fx = { align = { light = -1 }, affinity = 1 } },
      },
    },
    students = {
      lines = {
        { id = "st_default", text = "Some come back with a Doomguard in a crystal and a new crease in their faces, and I'm proud of those. Most never come back at all, and I keep no list of them, because a list like that would be longer than my beard." },
        { id = "st_lock", when = { class = "WARLOCK" }, text = "Some come back as you will, I hope, with a Doomguard in a crystal and a new crease in your face. Most never come back at all, and I keep no list of them, because it would be longer than my beard." },
      },
      choices = {
        { text = "Was there one who stayed with you?", next = "students_one" },
        { text = "Something else.", next = "BACK" },
      },
    },
    students_one = {
      big = true,
      lines = { { id = "so_default", text = "There was a clever young man once who decided my rules were for duller students, and he called something without a prison ready to hold it. I buried what was left by that rock, and I tell his story to every student who thinks the rules are for others." } },
      choices = {
        { text = "Then the rules are everything. Without them, you die.", next = "BACK", reply = "Everything, child, and he learned that too late. Keep them, and live.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Rules didn't kill him. Weakness did.", next = "BACK", reply = "Weakness, aye, and pride, and a very hungry demon. Rules would have kept him alive.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    doomguard = {
      lines = { { id = "dg2_default", fx = { learn = { "burning_legion" } },
        text = "A soldier of the Legion, tall as a tower, with wings it hardly needs and a sword it needs very much. They serve the great lords like Kazzak, and they hate serving anyone, which is exactly why a warlock who can hold one has proved something." },
        { id = "dg2_active", when = { questActive = TODO_QUEST("Suppression") }, text = "You'll find one soon enough, in the Scar, and you'll understand everything I've said and wish you didn't. Hold the prison steady and let your friends do the rest." },
      },
      choices = {
        { text = "What does it want, once it's bound?", next = "doomguard_want" },
        { text = "Something else.", next = "BACK" },
      },
    },
    doomguard_want = {
      lines = { { id = "dw2_default", text = "Its freedom, first, and your death, second, and it will be patient about both. Every time you call it, it is looking for the crack in your will, and one day, if you're careless, it will find one." } },
      choices = {
        { text = "Then I won't be careless.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    keep = {
      lines = { { id = "kp_default", fx = { learn = { "nethergarde" } },
        text = "Nethergarde knows, the way a man knows about the rot under his floorboards: they'd rather not look. Their mages have bigger demons to watch, and an old warlock teaching manners to young ones is not worth a patrol into the Scar." } },
      choices = {
        { text = "Someone should come and burn this altar down.", next = "keep_burn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    keep_burn = {
      big = true,
      lines = { { id = "kb_default", text = "Perhaps someone should, and then the young fools would learn from books and cultists instead of from me, and fewer of them would come back. So tell me, which do you think the world needs: no teacher, or an honest one?" } },
      choices = {
        { text = "An honest teacher. Better they learn the price from you.", next = "BACK", reply = "An honest teacher, aye, and a tired one. Better they learn from me than from what's out there.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "No teacher. This knowledge should die with you.", next = "BACK", reply = "Perhaps it should, child, and perhaps I'll let it. But the young keep coming, and the cultists keep teaching.", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kumisha = {
      lines = { { id = "ku_default", fx = { learn = { "draenethyst" } },
        text = "Kum'isha, the one who sniffs at everyone and calls it greed. He wants to go home, and he'll pay any price to get there, which makes him a warlock in everything but the books, though he'd spit if I told him so." } },
      choices = {
        { text = "Do you still want to go home, Daio?", next = "kumisha_home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kumisha_home = {
      lines = { { id = "kh_default", text = "I stopped wanting that a long time ago, which is one of the kinder things the Scar did for me. He hasn't stopped, and I envy him a little, and pity him far more." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "An old man with older habits. What I was before the Scar doesn't matter now, and it wouldn't help you." } },
    advice = { { id = "tp_ad", text = "Never call anything you can't send back. Write that inside your eyelids." } },
    burning_legion = { { id = "tp_legion", text = "Masters to some, enemies to most, and teachers to a few of us. They don't care which, which is the first thing to understand about them." } },
    nethergarde = { { id = "tp_ng", text = "A keep that watches the Portal and pretends it can't see me. It's a fair arrangement.", next = "keep" } },
    draenethyst = { { id = "tp_dr", text = "The collector's crystals. Everyone out here wants something they can't have, and his happen to glitter.", next = "kumisha" } },
    dreadmaul = { { id = "tp_dm", text = "Ogres who came through the Portal and serve whoever shouts loudest, which these days is Kazzak. They leave my altar alone, because they're stupid but not that stupid." } },
    tainted_scar = { { id = "tp_scar", text = "My home, my classroom, and very probably my grave. It suits me better than any comfortable study ever did.", next = "scar" } },
    dalaran = { { id = "tp_dalaran", text = "The mages of Dalaran used to call what I do forbidden, and now their city's in ruins. Forbidden knowledge has a way of outliving the people who forbid it." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor and I parted ways a long time ago, and neither of us regrets it. They would call me a cautionary tale, I'm sure." } },
    dark_portal = { { id = "tp_dark_portal", text = "The Portal is a door, and doors open both ways. The mages at Nethergarde forget that, and I hope they never have to remember." } },
    dreadmaul = { { id = "tp_dreadmaul", text = "The ogres leave me alone, and I leave them alone. They have some instinct for what they shouldn't touch." } },
    _none = { { id = "tp_none", text = "Ask the demons, child. They know everything, and they lie about all of it, and the trick is knowing which lie you can use." } },
  },
}
