-- Alterac Valley emissaries in the capitals: the Stormpike Emissary (a Stormpike Guard dwarf in Stormwind,
-- Ironforge and Darnassus) and the Frostwolf Emissary (a Frostwolf orc in Orgrimmar, Undercity and Thunder Bluff).
-- Name-matched in every capital; both take in Alterac Valley Marks of Honor (20560) for their faction.
local P = RPGDialogueAPI:Pack("rpgd.world")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------------------------------
-- Stormpike Emissary
---------------------------------------------------------------------------------------------------
P:NPC {
  key = "emissary_stormpike", id = TODO_NPC("Stormpike Emissary"), name = "Stormpike Emissary",
  role = "soldier", tier = "quest",
  temper = { "gruff", "warm" }, values = { "loyal", "dutiful" },
  notices = { "pvp", "race", "soldier" },

  impression = {
    first = "The Stormpike Emissary is a broad dwarf in the blue of the Stormpike Guard who talks about Alterac Valley as if it were a stubborn seam of ore. There was snow still caught in the beard, or I'd swear there was.",
    third = "{name} met the Stormpike Emissary, a dwarf of Vanndar Stormpike's expedition who stands in the capitals to bring fighters north to Alterac Valley.",
  },

  greetings = {
    { id = "g_default", text = "Well met! If ye've a strong arm and a warm cloak, the Stormpike Guard has work for ye in the mountains." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, {g:lad|lass}? Good, because the valley hasn't gotten any warmer while ye were away." },
    { id = "g_marks", when = { carrying = { 20560, min = 3 } }, text = "I can hear those marks clinking from here! Ye've been earning yer keep up at Dun Baldar, and the Guard won't forget it." },
    { id = "g_mark_one", when = { carrying = 20560 }, text = "That's an Alterac mark in yer pack, or I'm a gnome. Ye've stood in the snow with us, then, and that counts for plenty wi' me." },
    { id = "g_honored", when = { reputation = { faction = "Stormpike Guard", min = "honored" } }, text = "There's a face Vanndar's people know well! Come and stand by the fire a while, friend of the Guard." },
    { id = "g_exalted", when = { reputation = { faction = "Stormpike Guard", min = "exalted" } }, text = "Every dwarf in Dun Baldar drinks to yer name, and I'll thank ye to know I started that custom myself." },
  },

  notice = {
    { id = "n_rank", cat = "pvp", when = { pvpRank = { min = 6 } },
      text = "A {rank}, by the look of yer bearing! Vanndar could use a few more officers who've actually stood on the Field of Strife." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" }, place = "before",
      text = "Ah, a proper Bronzebeard face! It warms the heart to see one of our own folk among all these tall ones." },
    { id = "n_kills", cat = "soldier", when = { honorKills = { min = 500 } },
      text = "Ye've the eyes of someone who's seen a fair few Horde charges come over the hill. Sit down sometime and tell me which ones ye remember." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm here for the Stormpike Guard, and the Guard is here for Alterac Valley. Vanndar Stormpike holds Dun Baldar in the north end, and the Frostwolf orcs mean to throw us out of it, so we need every fighter the Alliance can spare." },
        { id = "h_ironforge", when = { zone = "Ironforge" },
          text = "Home at last, or near enough, with the forges roaring and a proper ale in every hand. Mind, I'd still send every one of ye up to Alterac if I could, because the Guard can't hold Dun Baldar on good wishes." },
        { id = "h_darnassus", when = { zone = "Darnassus" },
          text = "I'm a wee bit stiff here, for there's not a forge in this whole city and the trees keep whispering at me. Still, the Sentinels fight like wildcats, and the Guard would take every Sentinel it can get up in Alterac." },
        { id = "h_stormwind", when = { zone = "Stormwind City" },
          text = "Stormwind's a fine city for recruiting, with soldiers on every corner and half of them bored. I tell them the snow up in Alterac is cleaner than the canals, and some of them even believe me." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "One of our own! Ye'll know the Stormpike name already, so I'll spare ye the speech and say it plain: Vanndar needs dwarven steel in that valley." },
      },
      again = {
        { id = "h_again", text = "What else is on yer mind? I've nowhere to be until the next batch of recruits wanders past." },
        { id = "h_again2", text = "Go on, ask. Talking about the valley is the next best thing to being there." },
        { id = "h_again3", text = "Something else? Out with it, then, before my beard freezes from memory alone." },
      },
      choices = {
        { text = "Why does Ironforge care about a valley in Alterac?", next = "valley" },
        { text = "Who are you fighting up there?", next = "foe" },
        { text = "Why stand here in the city, and not up there?", next = "post" },
        { text = "I've got some of these Alterac marks.", next = "marks", when = { carrying = 20560 } },
        { text = "These marks of honor must mean something to the Guard.", next = "marks", when = { ["not"] = { carrying = 20560 } } },
        { text = "Who leads the Guard up there?", next = "officers" },
        { text = "I'm a Bronzebeard. Why should I bleed for the Stormpike?", next = "k_dwarf", when = { race = "Dwarf" } },
        { text = "Do the Stormpike take gnomes, or just dwarves?", next = "k_gnome", when = { race = "Gnome" } },
        { text = "Alterac was a human kingdom once. Does that trouble you?", next = "k_human", when = { race = "Human" } },
        { text = "Your people dig too deep. Why should my kind help?", next = "k_elf", when = { race = "NightElf" } },
        { text = "Do the Stormpike fight from rams, then?", next = "xhunt", when = { class = "HUNTER" } },
        { text = "I've heard there's a forest spirit in the valley.", next = "xdruid", when = { class = "DRUID" } },
        { text = "Does the Light stand with the Stormpike, do you think?", next = "xpala", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "I'd like to see the Frostwolves charge into a shield wall.", next = "xwar", when = { class = "WARRIOR" } },
        { text = "What use does the Guard have for magic?", next = "xmage", when = { class = { "MAGE", "WARLOCK" } } },
        { text = "Stay warm, Emissary.", next = "END" },
      },
    },

    -- Why the dwarves are in Alterac
    valley = {
      lines = {
        { id = "va_default", text = "Because there's iron in those hills the like of which Khaz Modan hasn't seen in a generation, and older things besides. Vanndar took the expedition up to dig and to study, and we built Dun Baldar so there'd be a roof over our heads while we did it." },
        { id = "va_gnome", when = { race = "Gnome" }, text = "Because there's iron in those hills the like of which Khaz Modan hasn't seen in a generation, and a gnome could build a fair few contraptions out of it. Vanndar took the expedition up to dig and to study, and we built Dun Baldar to keep the snow off while we did." },
      },
      choices = {
        { text = "What sort of older things?", next = "valley_relics" },
        { text = "You must dig somewhere in all that snow.", next = "valley_mine" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    valley_mine = {
      lines = { { id = "vm_default", text = "Irondeep Mine is the best of it, though we've had to fight the troggs for every cart that comes out. The orcs hold Coldtooth on their side, and more often than not the two mines change hands before the week is out." } },
      choices = {
        { text = "Troggs? In Alterac too?", next = "valley_troggs", fx = { learn = { "troggs" } } },
        { text = "There must be relics buried up there too.", next = "valley_relics" },
        { text = "Something else, Emissary.", next = "BACK" },
      },
    },
    valley_troggs = {
      lines = { { id = "vt_default", text = "Wherever a dwarf digs, a trogg seems to crawl out sooner or later, and I've stopped asking why. They're a filthy lot, but at least they've the decency to hate the orcs as much as they hate us." } },
      choices = {
        { text = "Then the troggs are the only neutral party up there.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    valley_relics = {
      big = true,
      lines = { { id = "vr_default", text = "Bits of old stonework, carvings older than anyone can read, and some say a good deal more under the ice. The Frostwolves call it grave-robbing, but if the past of this world is lying in the ground, I'd rather a dwarf dug it up carefully than a kobold dug it up by accident." } },
      choices = {
        { text = "Knowledge belongs to whoever has the patience to recover it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If the orcs live there, it's their ground to dig or leave.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Has the Explorers' League seen any of it?", next = "BACK", fx = { trait = { curious = 1 }, learn = { "explorers_league" } } },
      },
    },

    -- The Frostwolves
    foe = {
      lines = {
        { id = "fo_default", text = "They hold Frostwolf Keep at the south end and they say the whole valley's theirs, every rock and snowdrift. We came to dig in empty hills, and it was their wolf riders who came over the ridge first, not us." },
        { id = "fo_human", when = { race = "Human" }, text = "They hold Frostwolf Keep at the south end and they say the whole valley's theirs, though there's plenty of humans who'd argue that point, since it was Alterac's land before it was anyone's. We came to dig, and it was their wolf riders who came over the ridge first." },
      },
      choices = {
        { text = "Who leads them?", next = "foe_drekthar" },
        { text = "The orcs say you're the invaders.", next = "foe_claim" },
        { text = "Something else.", next = "BACK" },
      },
    },
    foe_drekthar = {
      lines = { { id = "fd_default", text = "An old shaman called Drek'Thar, blind as a stone and sharper than most who can see. Captain Galvangar holds Iceblood for him, and when things go badly for the orcs, the old one calls up Lokholar the Ice Lord out of the snow itself." } },
      choices = {
        { text = "An ice lord sounds like a hard thing to fight.", next = "foe_ivus" },
        { text = "Blind or not, does Drek'Thar have a claim to the valley?", next = "foe_claim", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    foe_ivus = {
      lines = { { id = "fi_default", text = "With an old power of our own, as it happens, for the druids among us can call Ivus the Forest Lord out of the valley's woods. I'll not claim to understand it, but I've watched him walk over the Field of Strife, and I slept well that night." } },
      choices = {
        { text = "Both sides calling on the valley's spirits. Who does it belong to?", next = "foe_claim" },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    foe_claim = {
      big = true,
      lines = {
        { id = "fc_default", text = "They'll tell ye they were exiled there and made it home, and I'll not call them liars about that. But a home doesn't give ye the right to spill blood over every pick that strikes a stone, and the Guard won't be driven off land we've worked with our own hands." },
        { id = "fc_dwarf", when = { race = "Dwarf" }, text = "They'll tell ye they were exiled there and made it home, and that's true enough. But ye know as well as I do, {g:lad|lass}, that a dwarf doesn't give back a mine he's bled for, and the Guard won't be driven off land we've worked with our own hands." },
      },
      choices = {
        { text = "Then the Guard holds what it's built. Dun Baldar stands.", next = "BACK", fx = { opinion = { alterac_valley = "stormpike" }, align = { honor = 1 }, affinity = 1 } },
        { text = "They were there first. Some ground isn't ours to take.", next = "BACK", fx = { opinion = { alterac_valley = "frostwolf" }, align = { honor = -1 } } },
        { text = "I'll judge that for myself once I've seen it.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },

    -- Why the emissary is in the capital
    post = {
      lines = {
        { id = "po_default", text = "Because I took an axe in the knee at Stonehearth and Captain Stonehearth decided I'd do more good talking than limping. So I stand in the capitals and tell good folk where the fight is, and I'm better at it than I'd like to admit." },
        { id = "po_ironforge", when = { zone = "Ironforge" }, text = "Because I took an axe in the knee at Stonehearth and the captain sent me home to recruit. In Ironforge that's an easy job, mind, since every second dwarf in the Commons has a cousin in the Stormpike already." },
        { id = "po_darnassus", when = { zone = "Darnassus" }, text = "Because I took an axe in the knee at Stonehearth and the captain sent me as far from the snow as she could find. I'm not sure she meant it kindly, because I've not had a decent mug of stout since I set foot on this tree." },
      },
      choices = {
        { text = "Captain Stonehearth? Tell me about her.", next = "officers" },
        { text = "Do you miss the valley?", next = "post_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    post_miss = {
      lines = {
        { id = "pm_default", text = "Every morning, I'll confess it, when I wake up warm and dry and there's nobody shouting about wolves on the bridge. A soldier gets used to the cold, and then the comfort feels like a punishment." },
        { id = "pm_darnassus", when = { zone = "Darnassus" }, text = "Every morning, when I wake up to birdsong and these elves gliding about as quiet as cats. I'd trade the lot of it for one cold night on the Dun Baldar wall, with the bridge lit up and a mug in my fist." },
      },
      choices = {
        { text = "Then I'll go up there and hold the bridge for you.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Comfort isn't a punishment. You've earned some rest.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },

    -- Officers
    officers = {
      lines = { { id = "of_default", text = "Captain Balinda Stonehearth holds the outpost that carries her name, and she's a mage who'd sooner freeze an orc than argue with one. Vanndar keeps Dun Baldar himself, and he's never once retreated a step past his own bridge." } },
      choices = {
        { text = "A mage captain among dwarves? That's unusual.", next = "officers_balinda" },
        { text = "Dun Baldar must fall now and then.", next = "officers_fall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    officers_balinda = {
      lines = { { id = "ob_default", text = "Unusual and hard as granite, the both of them, the captain and her temper. She can read a Frostwolf charge before it's half over the hill, and I've followed her into worse than snow." } },
      choices = { { text = "She sounds worth following.", next = "BACK", fx = { affinity = 1 } } },
    },
    officers_fall = {
      lines = { { id = "of2_default", text = "It hasn't, not for long, and it won't while there's a Stormpike left with an axe. When the orcs do get over the bridge, Vanndar meets them himself in the hall, and so far they've always learned to regret it." } },
      choices = {
        { text = "So far. Wars change, Emissary.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Then I'll make sure they never reach the hall.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
      },
    },

    -- Marks
    marks = {
      lines = {
        { id = "mk_default", text = "Every mark is a victory the Guard has paid for, struck at Dun Baldar and given to those who were there when the orcs broke. Bring them to me and ye'll find the Stormpike Guard remembers its friends." },
        { id = "mk_carry", when = { carrying = { 20560, min = 3 } }, text = "Now that's a handful! Every one of those is a day the valley went our way, and I'd be proud to see them laid on this table." },
      },
      choices = {
        { text = "What does the Guard give its friends?", next = "marks_rep" },
        { text = "Marks for blood. That's a soldier's coin, I suppose.", next = "marks_coin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    marks_rep = {
      lines = {
        { id = "mr_default", text = "Its trust, first and foremost, and that's worth more than ye'd think among dwarves. The quartermaster at Dun Baldar opens his stores a little wider for those the Guard knows well." },
        { id = "mr_honored", when = { reputation = { faction = "Stormpike Guard", min = "honored" } }, text = "Ye know the answer already, for ye've the Guard's trust and the quartermaster knows yer face. Keep earning it, because trust is something ye spend as well as save." },
      },
      choices = { { text = "Then I'll keep earning it.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } } },
    },
    marks_coin = {
      big = true,
      lines = { { id = "mc_default", text = "Aye, and I'll not dress it up any prettier than that. There are some who go up to Alterac for the glory and some who go for the Guard, and I take the marks from both, but I know which ones I'd drink with." } },
      choices = {
        { text = "I fight for the Alliance, not for marks.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Glory, coin, the Guard. A win's a win.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Race
    k_dwarf = {
      lines = { { id = "kd_default", text = "Because the Stormpike are Bronzebeards too, cousin, with Ironforge stone in Dun Baldar's walls and Ironforge ale in its cellars. If the orcs push us out of Alterac, the next fight is at the foot of Dun Morogh, an' I'd sooner it stayed in someone else's mountains." } },
      choices = {
        { text = "Then I'll fight for my clan's cousins.", next = "BACK", fx = { affinity = 2 } },
        { text = "Dun Morogh can defend itself.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    k_gnome = {
      lines = { { id = "kg_default", text = "We take anyone who'll stand in the snow, and gnomes have been some of our best at the towers. Ye'd be amazed what a gnome engineer can do with a stack of firebombs and a bad temper, and the orcs have learned to fear that particular combination." } },
      choices = {
        { text = "The bad temper, I can supply.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "I'd rather fight from behind a turret.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    k_human = {
      lines = { { id = "kh_default", text = "Not a bit, because Alterac's kings sold out to the Horde in the Second War and the land's been empty of honest men since. I'd say the Stormpike are the first decent folk to stand in those mountains in a long time, and I'd say it to any lord in Stormwind." } },
      choices = {
        { text = "Perenolde's treachery is old shame. Fair to put it right.", next = "BACK", fx = { affinity = 1, learn = { "alterac" } } },
        { text = "Some in Stormwind might want that land back.", next = "BACK", fx = { trait = { skeptical = 1 }, learn = { "alterac" } } },
      },
    },
    k_elf = {
      big = true,
      lines = { { id = "ke_default", text = "Ye'll not be the first Sentinel to tell me that, and it's true that dwarves don't always know when to stop digging. But the Frostwolves have no love for any of the Alliance, and if the valley falls to them, ye'll be fighting them a good deal closer to Ashenvale." } },
      choices = {
        { text = "The Alliance stands together, even in the snow.", next = "BACK", fx = { opinion = { alliance = "united" }, align = { order = 1 }, affinity = 1 } },
        { text = "I'll fight the orcs. Your digging stays your own affair.", next = "BACK", fx = { opinion = { dwarves = "wary" }, align = { order = -1 } } },
        { text = "Ashenvale has orcs enough already.", next = "BACK", fx = { learn = { "warsong" } } },
      },
    },

    -- Class
    xhunt = {
      lines = { { id = "xh_default", text = "The best of us do, on the big horned rams we tame out of the Alterac hills. The orcs ride their great white wolves, so it's horns against fangs out on the Field of Strife, and the snow gets very red." } },
      choices = {
        { text = "A ram rider. I'd like to see that.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'd rather keep my own beast by my side.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    xdruid = {
      lines = { { id = "xd_default", text = "Ivus the Forest Lord, aye, and the druids among the Guard are the ones who wake him. I'll admit a dwarf feels a bit small standing next to a walking forest, but he's never once turned on us." } },
      choices = {
        { text = "Ivus? How do the druids call him?", next = "foe_ivus" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpala = {
      big = true,
      lines = { { id = "xp_default", text = "I'd like to think so, for the Light's a dwarf's friend as much as anyone's, and our priests bless the walls of Dun Baldar every morning. Still, I've seen orc shamans heal their wounded with the same care, and that sits strangely with me on cold nights." } },
      choices = {
        { text = "The Light is with the Alliance. Doubt helps nobody.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The Light chooses no sides in a quarrel over ore.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwar = {
      lines = { { id = "xw_default", text = "Ha! Then ye'll like the Dun Baldar bridge, where a dozen good shields can hold off a whole wolf charge. The trick is not to step forward when the first one breaks, because there's always a second." } },
      choices = {
        { text = "I'll remember. Hold the line, don't chase.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "I'd step forward anyway.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    xmage = {
      lines = { { id = "xm_default", text = "More than ye'd think, for the towers and bunkers are won and lost with a bit of fire and a lot of patience. Captain Stonehearth is a mage herself, so ye'd find a friendly ear at the outpost if ye came north." } },
      choices = {
        { text = "Tell me more about Captain Stonehearth.", next = "officers_balinda" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the valley from Dun Baldar's bridge down to the Field of Strife, and every mine and tower in between. Ask me about Alterac and I'll talk yer ear off." } },
    advice = { { id = "tp_ad", text = "Wear wool under yer mail, carry more bandages than ye think ye need, and never chase a wolf rider into the trees." } },
    alterac = { { id = "tp_alterac", text = "The old kingdom's gone to ogres and bandits, but the valley in the south of those mountains is ours, and we mean to keep it.", next = "valley" } },
    _none = { { id = "tp_none", text = "That's not a thing they teach in the Stormpike Guard, friend. Ask me about the valley and I'll be more use to ye." } },
  },
}

---------------------------------------------------------------------------------------------------
-- Frostwolf Emissary
---------------------------------------------------------------------------------------------------
P:NPC {
  key = "emissary_frostwolf", id = TODO_NPC("Frostwolf Emissary"), name = "Frostwolf Emissary",
  role = "soldier", tier = "quest",
  temper = { "proud", "calm" }, values = { "loyal", "proud" },
  notices = { "pvp", "race", "soldier" },

  impression = {
    first = "The Frostwolf Emissary is an orc in white furs who speaks of Alterac Valley the way other orcs speak of their ancestors. I had the feeling I was being measured against every Frostwolf who ever lived.",
    third = "{name} met the Frostwolf Emissary, an orc of Drek'Thar's clan who stands in the Horde's cities to call fighters north to defend Frostwolf Keep.",
  },

  greetings = {
    { id = "g_default", text = "Lok'tar. If you have the stomach for the cold, the Frostwolf Clan has need of you." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Good, because the dwarves have not stopped digging since we last spoke." },
    { id = "g_marks", when = { carrying = { 20560, min = 3 } }, text = "You carry the marks of many victories in the valley. The clan will hear of it, and the wolves will know your scent." },
    { id = "g_mark_one", when = { carrying = 20560 }, text = "You have stood in Alterac's snow with us, and I can see the mark of it in your pack. Come and speak with me." },
    { id = "g_honored", when = { reputation = { faction = "Frostwolf Clan", min = "honored" } }, text = "A friend of the clan stands before me, and Drek'Thar knows your name. Speak, and be welcome." },
    { id = "g_exalted", when = { reputation = { faction = "Frostwolf Clan", min = "exalted" } }, text = "The clan sings of you at the fires of Frostwolf Keep, and that is an honor few outside our blood have ever had." },
  },

  notice = {
    { id = "n_rank", cat = "pvp", when = { pvpRank = { min = 6 } },
      text = "You wear the rank of a {rank}, and you wear it like you earned it in blood. Drek'Thar would want to hear what you have seen." },
    { id = "n_orc", cat = "race", when = { race = "Orc" }, place = "before",
      text = "I smell the old blood on you, brother, the blood that came through the Portal with all of us. Whatever clan your parents named, the Frostwolves would call you kin." },
    { id = "n_kills", cat = "soldier", when = { honorKills = { min = 500 } },
      text = "You have killed many of the Alliance, and it shows in how you hold your weapon. Do not let it make you cold inside, because the clan has no use for a warrior without a heart." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I speak for the Frostwolf Clan of Alterac Valley, the clan of Durotan and the people of our Warchief's father. The dwarves of the Stormpike have come to dig up our home, and we need every warrior of the Horde to throw them back into their mountains." },
        { id = "h_orgrimmar", when = { zone = "Orgrimmar" },
          text = "Here in the Warchief's own city, I do not have to explain who the Frostwolves are. Thrall carries our blood, and the dwarves who dig in Alterac are digging in the graves of his family." },
        { id = "h_undercity", when = { zone = "Undercity" },
          text = "It is cold in these tunnels, but it is a dead cold, not the clean cold of the mountains. Still, the Forsaken know what it is to have their homes taken, so I find willing ears here when I speak of the dwarves digging up Alterac." },
        { id = "h_thunderbluff", when = { zone = "Thunder Bluff" },
          text = "The wind on these bluffs reminds me of the high passes above Frostwolf Keep, and the tauren understand what it means to guard the land of your ancestors from strangers. The dwarves dig in ours, and that is why I came here first." },
        { id = "h_orc", when = { race = "Orc" },
          text = "Brother, you know the name Frostwolf, for every orc of the Horde knows it. Come and hear what the Stormpike do to the valley that kept our clan alive." },
      },
      again = {
        { id = "h_again", text = "What else do you wish to know? I have time, and the spirits are patient." },
        { id = "h_again2", text = "Speak. A Frostwolf gives a straight answer or none." },
        { id = "h_again3", text = "Ask what you will. The valley is far, but I carry it with me." },
      },
      choices = {
        { text = "How did the Frostwolves come to Alterac?", next = "clan" },
        { text = "The dwarves must want something in your valley.", next = "foe" },
        { text = "Who leads the clan now?", next = "drek" },
        { text = "I carry marks from the valley.", next = "marks", when = { carrying = 20560 } },
        { text = "What are these marks of honor?", next = "marks", when = { ["not"] = { carrying = 20560 } } },
        { text = "Why are you here, and not in the valley?", next = "post" },
        { text = "I am an orc. What should the Frostwolves mean to me?", next = "k_orc", when = { race = "Orc" } },
        { text = "Why should a Darkspear fight for an orc clan's valley?", next = "k_troll", when = { race = "Troll" } },
        { text = "The Earth Mother does not love war, Frostwolf.", next = "k_tauren", when = { race = "Tauren" } },
        { text = "Do Frostwolves trust the Forsaken?", next = "k_forsaken", when = { race = "Scourge" } },
        { text = "Do the spirits of Alterac speak to you?", next = "xsham", when = { class = "SHAMAN" } },
        { text = "Do the Frostwolves still ride wolves into battle?", next = "xhunt", when = { class = "HUNTER" } },
        { text = "The Frostwolves knew Gul'dan. What do they think of warlocks?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "How do your warriors fight in the snow?", next = "xwar", when = { class = "WARRIOR" } },
        { text = "I've heard the dwarves call a forest giant.", next = "xdruid", when = { class = "DRUID" } },
        { text = "Strength and honor, Frostwolf.", next = "END" },
      },
    },

    -- The clan's history
    clan = {
      lines = { { id = "cl_default", text = "We were sent there in chains of a kind, when Gul'dan cast our chieftain Durotan out of the Horde for speaking against him. Alterac was meant to be our grave, but the mountains took us in, and the white wolves taught us to live where no orc had lived before." } },
      choices = {
        { text = "Why did Durotan speak against Gul'dan?", next = "clan_durotan" },
        { text = "How did your clan win the wolves over?", next = "clan_wolves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    clan_durotan = {
      lines = { { id = "cd_default", text = "Because he saw what Gul'dan's warlocks were doing to our people and to our world, and he would not keep silent about it. He left Alterac to warn the Horde, and he and his mate never came home, but their son did." } },
      choices = {
        { text = "Their son. You mean Thrall.", next = "clan_thrall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    clan_thrall = {
      big = true,
      lines = {
        { id = "ct_default", text = "Raised a slave by humans, and still he found his way back to us through the snow, and Drek'Thar taught him the way of the spirits. Now he leads the Horde from Orgrimmar, and the Frostwolves still hold the valley where he learned who he was." },
        { id = "ct_orgrimmar", when = { zone = "Orgrimmar" }, text = "Raised a slave by humans, and still he found his way back to us through the snow, and Drek'Thar taught him the way of the spirits. You stand in the city he built, and every stone of it was laid by someone who remembers that." },
      },
      choices = {
        { text = "Then Alterac must be held. It's where the Horde was reborn.", next = "BACK", fx = { opinion = { alterac_valley = "frostwolf", warchief = "trust" }, align = { order = 1 }, affinity = 1 } },
        { text = "Thrall made his own way. The valley's only rock and snow.", next = "BACK", fx = { opinion = { warchief = "respect" }, align = { order = -1 } } },
        { text = "I'd like to hear more of the clan's tale someday.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
      },
    },
    clan_wolves = {
      lines = { { id = "cw_default", text = "The great white wolves of Alterac had hunted those hills since long before any orc came there, and they did not have to accept us. Our riders and their wolves have been one pack ever since, and that is where the clan's name comes from." } },
      choices = {
        { text = "A pack, not a mount. I like that.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The Stormpike
    foe = {
      lines = { { id = "fo_default", text = "Ore, they say, and old stones, and they dig both out of our valley without asking. They built their fortress at Dun Baldar and named it as if the land had been waiting for them, and now they march south with their rams and their cannons." } },
      choices = {
        { text = "The dwarves say you attacked first.", next = "foe_claim" },
        { text = "The fighting must be fierce up there.", next = "foe_field" },
        { text = "Something else.", next = "BACK" },
      },
    },
    foe_field = {
      lines = { { id = "ff_default", text = "Everywhere in the valley, but most of all on the Field of Strife between Iceblood and Stonehearth, and around Snowfall where the dead rise to fight again. The dwarves fight for Irondeep and we hold Coldtooth, and the snow does not care whose blood it drinks." } },
      choices = {
        { text = "Who holds Iceblood?", next = "drek_galvangar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    foe_claim = {
      big = true,
      lines = {
        { id = "fc_default", text = "Of course they do, for every thief says the dog bit first. We have lived and buried our dead in Alterac for longer than most of the Horde has had a home, and when strangers come with picks and walls, a Frostwolf does not wait to be asked politely." },
        { id = "fc_tauren", when = { race = "Tauren" }, text = "Of course they do, for every thief says the dog bit first. You of all people know what it is to watch strangers dig into the land your ancestors sleep in, and to be called the savage for defending it." },
      },
      choices = {
        { text = "A home is held by strength. Drive them out.", next = "BACK", fx = { opinion = { alterac_valley = "frostwolf" }, align = { honor = 1 }, affinity = 1 } },
        { text = "If they want ore, let them trade for it. Not every quarrel needs blood.", next = "BACK", fx = { opinion = { peace = "for" }, align = { honor = -1 } } },
        { text = "I'll see the valley before I judge.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },

    -- Drek'Thar
    drek = {
      lines = { { id = "dr_default", text = "Drek'Thar, the eldest of our shamans, who lost his sight long ago and sees more without it than most do with two eyes. He holds Frostwolf Keep and speaks with the spirits of the valley, and the clan obeys him without question." } },
      choices = {
        { text = "What do the spirits tell him?", next = "drek_lokholar" },
        { text = "A blind shaman must have warriors to fight for him.", next = "drek_galvangar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    drek_galvangar = {
      lines = { { id = "dg_default", text = "Captain Galvangar holds Iceblood Garrison, and he has stood in that pass through more winters than I can count. He is not a gentle orc, but there is no one I would rather have between the dwarves and our keep." } },
      choices = {
        { text = "And if Iceblood falls?", next = "drek_fall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    drek_fall = {
      lines = { { id = "df_default", text = "Then the towers burn, the dwarves come up the road to the keep, and Drek'Thar meets them in his own hall with the spirits at his back. It has happened before, and each time the dwarves have learned what it costs to reach him." } },
      choices = {
        { text = "Then I'll make sure they never reach him.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "A wise leader shouldn't have to fight in his own hall.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    drek_lokholar = {
      lines = { { id = "dl_default", text = "When the clan is in greatest need, Drek'Thar calls on Lokholar the Ice Lord, an old spirit of the mountain's winter, and it rises out of the snow to fight beside us. The dwarves call up a forest spirit of their own, but Lokholar was there long before the dwarves had a name for it." } },
      choices = {
        { text = "A forest spirit fighting for the dwarves seems strange.", next = "xdruid" },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Why the emissary is here
    post = {
      lines = {
        { id = "po_default", text = "Because the clan alone cannot hold the valley, and Drek'Thar sent some of us south to call on the whole Horde. I would rather be on the walls of the keep, but a Frostwolf goes where the elders send." },
        { id = "po_undercity", when = { zone = "Undercity" }, text = "Because the clan alone cannot hold the valley, and Drek'Thar sent me here where the Forsaken keep their city. It is not where I would choose to stand, but the Dark Lady's people fight without fear, and the clan needs that." },
      },
      choices = {
        { text = "Do you miss the mountains?", next = "post_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    post_miss = {
      lines = { { id = "pm_default", text = "Every night, when there is no wolf howling outside and no ice in the air. I sleep badly in warm places, and the elders laugh and say it is the mark of a true Frostwolf." } },
      choices = {
        { text = "Then I will go and listen to the wolves for you.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "A warrior should sleep anywhere.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },

    -- Marks
    marks = {
      lines = {
        { id = "mk_default", text = "Each mark is given to those who stood in Alterac on a day the Horde won, and they are not given lightly. Bring them to me, and the Frostwolf Clan will know your name." },
        { id = "mk_carry", when = { carrying = { 20560, min = 3 } }, text = "Many marks, and every one of them a day the dwarves were driven back. The clan will remember you for these." },
      },
      choices = {
        { text = "What does the clan's friendship bring?", next = "marks_rep" },
        { text = "I fight for the Horde, not for tokens.", next = "marks_honor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    marks_rep = {
      lines = {
        { id = "mr_default", text = "The clan's trust, and our quartermaster at Frostwolf Keep opens his stores to those we know. A Frostwolf does not forget a friend, and does not forgive an enemy." },
        { id = "mr_honored", when = { reputation = { faction = "Frostwolf Clan", min = "honored" } }, text = "You know already, for the clan calls you friend and the quartermaster knows your face. Keep walking that path, and one day you will ride with us." },
      },
      choices = { { text = "Then I will keep earning it.", next = "BACK", fx = { affinity = 1 } } },
    },
    marks_honor = {
      big = true,
      lines = { { id = "mh_default", text = "Good, for the marks are only the proof, not the purpose. Still, I have seen warriors come to the valley only to fill their packs, and I wonder sometimes whether they would fight at all if there were nothing to carry home." } },
      choices = {
        { text = "Honor comes from the fight itself. The marks mean nothing.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "A warrior should be paid. Even the clan knows that.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Race
    k_orc = {
      lines = { { id = "ko_default", text = "That some orcs kept the old ways when the rest of us drank the demon's blood, and that is why the shamans could teach the Warchief at all. When you fight in Alterac, you fight for the memory of who we were before Gul'dan." } },
      choices = {
        { text = "Then I'll fight for that memory.", next = "BACK", fx = { affinity = 2 } },
        { text = "Every clan has its own story. Yours isn't mine.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    k_troll = {
      lines = { { id = "kt_default", text = "Because the Warchief gave your people a home when no one else would, and that debt runs through every Frostwolf. Besides, I have heard that Darkspear trolls do not mind the cold so long as there is something to throw a spear at." } },
      choices = {
        { text = "Da cold, I can bear. Da dwarves, I can spear.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "The Darkspear pay their debts. I'll go.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    k_tauren = {
      big = true,
      lines = { { id = "kta_default", text = "No, and neither do the spirits of Alterac, but they did not ask the dwarves to come either. Your people fought the centaur for the land your ancestors walked, so tell me, would you let strangers dig there without raising a spear?" } },
      choices = {
        { text = "No. Land worth living on is worth defending.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "I'd seek peace first, and fight only when it failed.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_forsaken = {
      lines = { { id = "kf_default", text = "The clan trusts the Warchief, and the Warchief has chosen to call your people allies. I do not understand the Forsaken, but I have seen them on the Field of Strife, and none of them ran." } },
      choices = {
        { text = "We have nothing left to fear. That helps.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Trust isn't required. Only results.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },

    -- Class
    xsham = {
      lines = { { id = "xs_default", text = "They do, and they are angry, for the dwarves crack the mountain open and the earth spirits feel every blow of the pick. Drek'Thar says the valley has not been so restless since the clan first came there in exile." } },
      choices = {
        { text = "Then I'll stand with the spirits.", next = "BACK", fx = { affinity = 2 } },
        { text = "Can the spirits drive the dwarves out themselves?", next = "drek_lokholar" },
      },
    },
    xhunt = {
      lines = { { id = "xh_default", text = "We do, on the great white wolves bred in the valley's high pastures, and no ram has ever outrun one. The dwarves ride their rams against us, and the snow fills with fur and horn before the day is done." } },
      choices = {
        { text = "Tell me how you came to ride them.", next = "clan_wolves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xl_default", text = "Gul'dan's warlocks sold our people to the demons and sent my clan into exile for refusing to follow. I will take your help in the valley, warlock, but the Frostwolves have long memories, and I will be watching what you call up." } },
      choices = {
        { text = "That was Gul'dan's sin, not mine. I serve the Horde.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Power is power. I'll use whatever keeps the valley.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwar = {
      lines = { { id = "xw_default", text = "We fight low and fast, for the snow is deep and a heavy warrior who charges too far is a dead one. Learn the paths between the towers, and you will kill more dwarves than any warrior who only knows how to run forward." } },
      choices = {
        { text = "I'll learn the paths.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "I run forward. It works for me.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    xdruid = {
      lines = { { id = "xd_default", text = "Ivus, the dwarves call it, a lord of the forest that their druids wake from the valley's woods. It troubles me that a spirit of our own mountains would answer the call of strangers, and Drek'Thar does not speak of it." } },
      choices = {
        { text = "Perhaps the spirits do not choose sides.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Then we'll cut down whoever wakes it.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the valley from the gates of Frostwolf Keep to the bridge of Dun Baldar, and the names of the clan's dead in between. Ask me of Alterac, and I will answer." } },
    advice = { { id = "tp_ad", text = "Respect the cold, guard the towers, and never fight in the snow alone. The dwarves are slow, but they do not stop." } },
    alterac = { { id = "tp_alterac", text = "The human kings ruled those mountains once, but the southern valley has been Frostwolf land for longer than they bothered to remember.", next = "clan" } },
    _none = { { id = "tp_none", text = "That is not a thing the elders taught me. Ask me of the valley, and I will tell you what I know." } },
  },
}
