-- Forever-only NPCs at the stair down to the Hall of Thanes, Old Ironforge. Voice: bibles/old_ironforge_forever.md
-- Afadra Dunwall, Lorekeeper of Ironforge (The Restless Dead), and Thom Filch, a Gadgetzan gnome
-- who was "patrolling" the vaults when the Dark Irons came up (Important Heirlooms).
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Afadra Dunwall: Lorekeeper of Ironforge. Brisk, dry, a scholar with a job to do and no patience for ghost stories.
P:NPC {
  key = "if_afadra", id = TODO_NPC("Afadra Dunwall"), name = "Afadra Dunwall", title = "Lorekeeper of Ironforge",
  bible = "bibles/old_ironforge_forever.md", role = "scholar", tier = "quest",
  communities = { "ironforge" }, temper = { "brisk", "sharp" }, values = { "duty", "practical", "lawful" },
  notices = { "spirits", "kin", "lore" },

  impression = {
    first = "Afadra Dunwall keeps the tombs of the Hall of Thanes, and she is far more annoyed than frightened that the dead down there have stopped sleeping. Her keepers won't go below, so she sends whoever will.",
    third = "{name} met Afadra Dunwall, the Lorekeeper who keeps the tombs of the Hall of Thanes beneath Old Ironforge.",
  },

  greetings = {
    { id = "g_default", text = "If ye've come tae gawp at the old stair, gawp quickly, for I've ledgers tae finish." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good; at least you came up the stair, which is more than I can say for my keepers." },
    { id = "g_quest", when = { questActive = TODO_QUEST("The Restless Dead") }, text = "I don't have time for ghouls and ghosts, so I'm hopin' you've made some for me. Well?" },
    { id = "g_after", when = { questDone = TODO_QUEST("The Restless Dead") }, text = "There's the one who put my dead back tae bed. The keepers are goin' below again, grumblin', but goin'." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and the hall stayed quiet, which I'll take as a compliment tae your work." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The guards say you've been useful about the city. I'll judge that from my own ledgers, but it's a fair start." },
  },

  notice = {
    { id = "n_priest", cat = "spirits", when = { class = { "PRIEST", "PALADIN" } },
      text = "Light-bearer, are ye? Good, for the dead below are restless and I'd sooner they were laid down gently than hacked at by some mercenary." },
    { id = "n_dwarf", cat = "kin", when = { race = "Dwarf" },
      text = "Your grandsires might well be lyin' in those vaults, so mind your manners down there more than most." },
    { id = "n_league", cat = "lore", when = { origin = "dwarf_explorers_league" },
      text = "League, are ye? Then you'll know better than tae pocket anything below, and I'll hold you tae that." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Afadra Dunwall, Lorekeeper of Ironforge. I keep the records of the Hall of Thanes below us, the tombs and the names in them, and right now I keep them from a safe distance, which I dislike." },
        { id = "h_before", when = { questBefore = TODO_QUEST("The Restless Dead"), minLevel = 10 },
          text = "Something's disturbed the tombs in the Hall of Thanes, and the keepers swear they hear the dead walkin' in the vaults. I need someone with a strong arm and a short memory tae go down and settle things." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("The Restless Dead") },
          text = "Apparitions, tormented souls, and somethin' wearin' the Anvilmar name that ought tae be dust. Put them all back down, and mind the carvings while you do it." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Restless Dead"), days = 3 } },
          text = "It's done, then, and the keepers can stop refusin' tae do their duty on account of angry dead. I've already had two of them back at work this mornin', and only one of them fainted." },
        { id = "h_done", when = { questDone = TODO_QUEST("The Restless Dead") },
          text = "The vaults are quiet and the keepers are below again with their brushes and their lamps. I've written your part into the ledger, in small letters, but it's there." },
        { id = "h_incursion", tags = { "news" }, when = { questDone = TODO_QUEST("Old Ironforge Incursion") },
          text = "The King's had the breaches sealed, and there are guards on every landing now. I'd have liked the Dark Irons tae ask before they dug through four thousand years of my records." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome. I've already one of your folk loiterin' by my stair, and I'll thank you not tae encourage him." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick, I've ink drying." },
        { id = "h_again2", text = "Go on, then. I can listen and write at once." },
        { id = "h_again3", text = "Something more? Ask it plainly." },
      },
      choices = {
        { text = "What is the Hall of Thanes?", next = "hall" },
        { text = "What woke the dead?", next = "woke" },
        { text = "Why won't your keepers go below?", next = "keepers" },
        { text = "What do you make of the gnome by the stair?", next = "thom" },
        { text = "My kin might lie in those vaults. Who rests there?", next = "xkin", when = { race = "Dwarf" } },
        { text = "I can lay restless spirits to rest properly.", next = "xpriest", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "The spirits trouble me. Shall I speak with them?", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "I'll go down for you.", next = "BUSINESS" },
        { text = "Good day, Lorekeeper.", next = "END" },
      },
    },

    hall = {
      lines = {
        { id = "ha_default", text = "The oldest chambers under the mountain, older than the Great Forge, older than the High Seat above our heads. Thanes and kings are laid there, and the old families with them, and every name is in my books." },
      },
      choices = {
        { text = "Which families?", next = "hall_families" },
        { text = "Have you been to the bottom yourself?", next = "hall_bottom" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hall_families = {
      lines = {
        { id = "hf_default", text = "Bronzebeards, of course, and the Anvilmars, who sat the high throne before the clans split and still have their seat in the Senate. There's a whole rest of Anvilmar dead down there, and the eldest of them was never a quiet sleeper." },
      },
      choices = {
        { text = "The clans split? Tell me about it.", next = "hall_war" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hall_war = {
      lines = {
        { id = "hw_default", text = "The War of the Three Hammers: Bronzebeard, Wildhammer and Dark Iron all wantin' the one throne. The Dark Irons lost and ran tae their mountain in the south, and they've never once stopped thinkin' this hall belongs tae them." },
      },
      choices = {
        { text = "Old grudges should stay buried with the dead.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "The Dark Irons chose their side. Let them live with it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hall_bottom = {
      lines = {
        { id = "hb_default", text = "To the lowest vault, once, with a lamp and a younger set of knees. It's cold and it's dark and it smells of old stone, and I never once heard a ghost, so you'll understand why I find all this talk tryin'." },
      },
      choices = {
        { text = "And now?", next = "woke" },
        { text = "Something else.", next = "BACK" },
      },
    },

    woke = {
      lines = {
        { id = "wo_default", text = "Noise, I'd say, and a great deal of it. The spirits are light sleepers, and somethin' down in the deep vaults has been diggin' and bangin' where nobody's dug in centuries." },
        { id = "wo_map", when = { questDone = TODO_QUEST("Underground Map") },
          text = "You've seen that Wildhammer's map, haven't you? Dark Iron tunnels, right under my vaults, and the dead woke up cross because of it, which is exactly how I'd feel." },
      },
      choices = {
        { text = "Dark Irons, under Ironforge?", next = "woke_dark" },
        { text = "Do you believe in ghosts, Lorekeeper?", next = "woke_ghosts" },
        { text = "Something else.", next = "BACK" },
      },
    },
    woke_dark = {
      lines = {
        { id = "wd_default", text = "Mole machines, the gnome says, and for once I believe him. If Thaurissan's lot can dig under the High Seat, they can dig anywhere, and nobody up here wants tae think about that.",
          fx = { learn = { "dark_iron" } } },
      },
      choices = {
        { text = "Someone should tell the King.", next = "woke_king" },
        { text = "Something else.", next = "BACK" },
      },
    },
    woke_king = {
      lines = {
        { id = "wk_default", text = "Someone has, I'm told, and he's not pleased. There's a commander down there by the sound of it, and if you're the sort who goes lookin' for commanders, the King will want his head more than I want my quiet." },
        { id = "wk_done", when = { questDone = TODO_QUEST("Old Ironforge Incursion") },
          text = "And you brought it tae him, I hear, the Dirgehammer fellow's head in a sack. The King sent me a note sayin' the lower vaults are tae be sealed and walled, and I've never been so glad tae lose access tae my own records." },
      },
      choices = {
        { text = "I'll see to it.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    woke_ghosts = {
      lines = {
        { id = "wg_default", text = "I believe in what's written down, and what's written down says the dead stay put. If they've stopped stayin' put, then somebody's tae blame, and it isn't the dead." },
      },
      choices = {
        { text = "The dead deserve their rest, whatever stirred them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Dead is dead. Smash them and be done.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    keepers = {
      lines = {
        { id = "ke_default", text = "Because they're grown dwarves who can face a trogg with a shovel but go white as milk over a cold draught and a moan in the dark. I can't have keepers refusin' tae enter the hall on account of ghosts, and yet here we are." },
      },
      choices = {
        { text = "Maybe they're right to be afraid.", next = "keepers_afraid" },
        { text = "I'd not blame them. Ghosts are no trifle.", next = "keepers_afraid", fx = { affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    keepers_afraid = {
      lines = {
        { id = "kaf_default", text = "Right tae be afraid, perhaps, but not right tae leave the work undone. The names down there need dustin' and the seals need checkin', and if nobody does it, the dead are forgotten twice." },
      },
      choices = {
        { text = "Duty comes first, ghost or no ghost.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Nobody should be ordered into a haunted tomb.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },

    thom = {
      lines = {
        { id = "th_default", text = "Thom Filch says he's a 'volunteer' from Gadgetzan, here tae help with the vaults, and he's been sayin' it every day since he turned up. Nobody in Ironforge sent for him, and nobody can tell me who did." },
        { id = "th_done", when = { questDone = TODO_QUEST("Important Heirlooms") },
          text = "You fetched him heirlooms, I hear. I'll be wantin' a list of every piece, and I'll be checkin' it against my ledgers, because some of those names are my responsibility." },
      },
      choices = {
        { text = "You think he's a thief?", next = "thom_thief" },
        { text = "He seems harmless enough.", next = "thom_harmless" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thom_thief = {
      lines = {
        { id = "tt_default", text = "I think he says 'catalogue' the way a raven says 'shiny'. Still, he saw the Dark Irons come up, and he came straight here tae say so, and a true thief would have kept quiet." },
      },
      choices = {
        { text = "Then watch him, but let him help.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Have him turned out before something goes missing.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    thom_harmless = {
      lines = {
        { id = "tha_default", text = "Harmless, aye, the way a draught under a door is harmless until your candle goes out. Count your coin after you've talked with him; I'll say no more than that." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    xkin = {
      lines = {
        { id = "xk_default", text = "Thanes and their households, miners who died in the deep seams, a few soldiers from the old wars who were brought home on shields. Tell me your clan's name and I'll look it up, though I can't promise you'll like what the book says." },
      },
      choices = {
        { text = "I'd be honoured to know where they lie.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The dead are dead. I care for the living.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    xpriest = {
      lines = {
        { id = "xp_default", text = "Properly, is it? Then do it properly, with whatever words your order teaches, and I'll write down that it was done. I'm not much for prayers, but I'm a great deal for things bein' done right." },
      },
      choices = {
        { text = "The Light will grant them peace. I'll see it done.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Peace or not, they'll stay down.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    xshaman = {
      lines = {
        { id = "xs_default", text = "Speak with them? You'll have tae speak loudly, then, for the Anvilmar dead were deaf tae good sense when they were livin'. Ask them who woke them, if they'll answer you, and write it down for me." },
      },
      choices = {
        { text = "I'll listen first and strike only if I must.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Some spirits only listen to steel.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Thirty years of ledgers and lamp oil, and not one ghost until this season. That's the whole of my story, and I'd like the next thirty years tae be as dull." } },
    advice = { { id = "tp_ad", text = "Write things down, and write them the same day. Memory's a liar and ink isn't." } },
    _none = { { id = "tp_none", text = "That's not in any book of mine, so I couldn't say." } },
  },
}

-- Thom Filch: Gadgetzan gnome, "patrolling" the vaults when the Dark Irons came up in mole machines.
-- Keeps correcting himself: loot -> heirlooms, appraising -> cataloguing.
P:NPC {
  key = "if_thom_filch", id = TODO_NPC("Thom Filch"), name = "Thom Filch",
  bible = "bibles/old_ironforge_forever.md", role = "citizen", tier = "quest",
  communities = { "ironforge" }, temper = { "anxious", "chatty" }, values = { "greedy", "clever" },
  notices = { "rogue", "goblin", "kin" },

  impression = {
    first = "Thom Filch is a gnome from Gadgetzan who says he was patrolling the Hall of Thanes when the Dark Irons came up through the floor. He trips over every second word, and every word he trips over is 'loot'.",
    third = "{name} met Thom Filch, a Gadgetzan gnome hanging about the stair to the Hall of Thanes with an eye on its heirlooms.",
  },

  greetings = {
    { id = "g_default", text = "You there, adventurer! Yes, you, with the very capable-looking hands." },
    { id = "g_back", when = { metBefore = true }, text = "My favourite adventurer! Well, my favourite this week, which is no small thing." },
    { id = "g_quest", when = { questActive = TODO_QUEST("Important Heirlooms") }, text = "Any heirlooms yet? Shiny ones? Er, I mean, culturally significant ones?" },
    { id = "g_after", when = { questDone = TODO_QUEST("Important Heirlooms") }, text = "Ah, the brave and enterprising hero! The cataloguing is going beautifully, thank you for asking." },
    { id = "g_lorekeeper", when = { heardLine = "if_afadra.h_default" }, text = "Has the Lorekeeper been talking about me? She has, hasn't she? It's all lies, unless it's nice." },
  },

  notice = {
    { id = "n_rogue", cat = "rogue", when = { class = "ROGUE" },
      text = "Oh, you've got the walk, haven't you? Soft boots, quiet hands. We should talk, professionally, about patrolling." },
    { id = "n_gnome", cat = "kin", when = { race = "Gnome" },
      text = "A fellow gnome! You'll understand, then, how hard it is to make an honest living when your city's full of radiation and troggs." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Thom Filch, at your service, recently of Gadgetzan and currently of, well, this stair. I'm helping with the vaults, in a strictly voluntary and entirely above-board capacity." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Important Heirlooms"), minLevel = 10 },
          text = "I was sneaking, uh, patrolling in the vaults when a force of Dark Iron dwarves came up out of the floor in mole machines! There's priceless loot down there, or rather important cultural heirlooms, and I could really use your aid." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Important Heirlooms") },
          text = "Eight heirlooms, that's all I ask, the older the better and the heavier the better. Not for any reason! Old and heavy things are simply more important, culturally." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Important Heirlooms"), days = 3 } },
          text = "I've been up all night appraising, I mean cataloguing, the pieces you brought. There's a goblet in there that's worth, well, a great deal of cultural respect." },
        { id = "h_done", when = { questDone = TODO_QUEST("Important Heirlooms") },
          text = "Everything you brought is safe with me, and every piece will go back to its proper place of honour just as soon as I decide where that is." },
      },
      again = {
        { id = "h_again", text = "What else can Thom do for you? Within reason, and within the law, mostly." },
        { id = "h_again2", text = "Ask away! I've nothing to hide, and nothing in my pockets." },
        { id = "h_again3", text = "Anything more? Talking's free, which is a shame." },
      },
      choices = {
        { text = "What were you really doing in the vaults?", next = "patrol" },
        { text = "Tell me about the Dark Irons you saw.", next = "dark" },
        { text = "What happens to the heirlooms?", next = "heirlooms" },
        { text = "Why would Gadgetzan care about Ironforge's tombs?", next = "gadgetzan" },
        { text = "I know a fellow rogue when I see one, Thom.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "You're a gnome. Were you from Gnomeregan?", next = "xgnome", when = { race = "Gnome" } },
        { text = "I'll find your heirlooms.", next = "BUSINESS" },
        { text = "Goodbye, Thom.", next = "END" },
      },
    },

    patrol = {
      lines = {
        { id = "pa_default", text = "Patrolling! Walking about, looking at things, making sure they were still there, which is the very definition of patrolling. Some of the things were very much still there, and I was making sure of it closely." },
      },
      choices = {
        { text = "With your hands?", next = "patrol_hands" },
        { text = "Nobody asked you to patrol, did they?", next = "patrol_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    patrol_hands = {
      lines = {
        { id = "ph_default", text = "Hands are a perfectly respectable way of looking at things! You can't tell real gold from gilt by staring, not unless you're a goblin, and I am very much not a goblin, whatever anyone in Gadgetzan says." },
      },
      choices = {
        { text = "A thief is a thief, Thom.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Dead kings don't need gold. I don't blame you.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    patrol_who = {
      lines = {
        { id = "pw_default", text = "Asked is such a narrow word. I volunteered, and then I went down before anyone could say no, which is the most efficient sort of volunteering there is." },
      },
      choices = {
        { text = "The Lorekeeper doesn't trust you.", next = "patrol_afadra" },
        { text = "Something else.", next = "BACK" },
      },
    },
    patrol_afadra = {
      lines = {
        { id = "pf_default", text = "Afadra? She doesn't trust ink unless it's her own. I like her, mind you, she's the only one up here who looks at me long enough to be suspicious." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    dark = {
      lines = {
        { id = "da_default", text = "They came up through the floor of the deep vaults in great drilling machines, all smoke and teeth, and out climbed dwarves the colour of a cold stove. I've never run so fast in my life, and I've run from a great many people.",
          fx = { learn = { "dark_iron" } } },
      },
      choices = {
        { text = "What were they after?", next = "dark_after" },
        { text = "You left the vaults to them?", next = "dark_left" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dark_after = {
      lines = {
        { id = "dfa_default", text = "Not the heirlooms, which worried me more than anything, because who digs into a tomb and walks past the gold? They were heading down, deeper, as if they'd come for something under all of it." },
      },
      choices = {
        { text = "That's worth telling the guards.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dark_left = {
      lines = {
        { id = "dl_default", text = "I left the vaults to the Dark Irons and came straight up to tell everyone, which is what a responsible patroller does. Also there were about forty of them and one of me, and I'm a very small one." },
      },
      choices = {
        { text = "That was the sensible thing to do.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    heirlooms = {
      lines = {
        { id = "he_default", text = "Catalogued, every one, and returned to its proper place of honour. I give you my word as a gnome, and my word is worth a great deal, more than most gnomes' and nearly as much as a goblin's." },
      },
      choices = {
        { text = "And if you sold a few?", next = "heirlooms_sold" },
        { text = "I'll be checking with the Lorekeeper.", next = "heirlooms_check" },
        { text = "Something else.", next = "BACK" },
      },
    },
    heirlooms_sold = {
      lines = {
        { id = "hs_default", text = "Sold? Sold! I'd never, not to just anybody. There are collectors in Gadgetzan who'd pay a fortune for a dwarven goblet, I'm told, by people, not that I'd know any of them." },
      },
      choices = {
        { text = "The dead's goods belong to the dead.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If they're paying that much, I want a share.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    heirlooms_check = {
      lines = {
        { id = "hc_default", text = "Wonderful, please do, she'll be delighted to see you, and I'll be delighted to stay right here. There's no need to mention the goblet, she has so much on her mind already." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    gadgetzan = {
      lines = {
        { id = "ga_default", text = "Gadgetzan cares about everything that's old, rare and portable, which is most things in a tomb. I'm here in an advisory role, you understand, on behalf of some very respectable people in the desert who like to know what's out there." },
      },
      choices = {
        { text = "The Steamwheedle Cartel sent you?", next = "gadgetzan_cartel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gadgetzan_cartel = {
      lines = {
        { id = "gc_default", text = "Sent is a strong word, and Cartel's a stronger one. Let's say I know which way the desert wind blows, and I go where it blows, and sometimes it blows all the way to Ironforge.",
          fx = { learn = { "steamwheedle" } } },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    xrogue = {
      lines = {
        { id = "xr_default", text = "Shh! Not so loud, there are dwarves everywhere. Between professionals, then, the third vault from the bottom has a loose stone in its west wall, and I'm only telling you so you can patrol it." },
      },
      choices = {
        { text = "Then I'll patrol it with you, partner.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
        { text = "I don't rob the dead, Thom.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
      },
    },
    xgnome = {
      lines = {
        { id = "xg_default", text = "For a while, until the troggs came up and the radiation came down and Mekkatorque decided we'd all live in Ironforge with the dwarves. I went south instead, because there's no room to grow in somebody else's house, and Gadgetzan pays." },
      },
      choices = {
        { text = "You should have stayed with your people.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Somebody has to make a living. Good for you.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Born under Gnomeregan, made my living in Gadgetzan, currently in Ironforge on business, and the business is my business. That's three cities, and none of them have ever pressed charges." } },
    advice = { { id = "tp_ad", text = "Always carry a good reason for being where you are. It doesn't have to be true, it only has to be quick." } },
    _none = { { id = "tp_none", text = "No idea, friend, and I'd tell you if there was money in it." } },
  },
}
