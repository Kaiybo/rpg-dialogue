-- Farholde Keep: the Brotherhood of the Horse, twenty years holding the Riverglades. Voice: bibles/riverglades.md
local P = RPGDialogueAPI:Pack("rpgd.riverglades")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "demar", id = TODO_NPC("Demar Brant"), name = "Demar Brant", title = "Knight Commander",
  bible = "bibles/riverglades.md", role = "soldier", tier = "major",
  communities = { "farholde", "brotherhood_horse" }, temper = { "proud", "steady" }, values = { "loyal", "brave", "stern" },
  notices = { "class", "stormwind", "kit" },

  greetings = {
    { id = "g_default", text = "Farholde stands, for another day at least. Say what you need." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and good to see it. Most who leave the Riverglades never come back." },
    { id = "g_hero", when = { townStanding = { town = "farholde", min = 55 } }, text = "Make room for them, riders; they've bled for this keep." },
    { id = "g_distrust", when = { townStanding = { town = "farholde", max = -20 } }, text = "You. State your business, and keep your hands where my sentries can see them." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin, is it? The last one to walk these halls led the charge that broke the siege, so don't take my noticing as a compliment yet. Earn it first." },
    { id = "n_noble", cat = "stormwind", when = { origin = "human_minor_noble" },
      text = "You've the look of Stormwind money. Don't take it personally when my riders forget to bow." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You came over the passes in that? Get it to Alphonse before you meet anything worse than the road." },
  },

  react = {
    { id = "r_mount", on = "mount", text = "Not inside the keep. Wheatley will see to the horse, and he'll take better care of it than you do." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Knight Commander Demar Brant, of the Brotherhood of the Horse. Few adventurers find their way to Farholde, and fewer stay. We hold this keep with what Stormwind left us, which is nothing." },
        { id = "h_young", when = { band = { "Greenhorn", "Blooded" } },
          text = "You're young for this front. The cultists won't care, and neither will I, so long as you can hold a line." },
        { id = "h_mugg_before", when = { questBefore = TODO_QUEST("Eye of Mugg") },
          text = "My scouts found caves along the northwest ridge, and the ones who went in haven't come out. I need someone who comes back out." },
        { id = "h_mugg_active", when = { questActive = TODO_QUEST("Eye of Mugg") },
          text = "Krol'dok, then. Find whoever leads them in there and bring me proof, and my riders get a quiet month, their first in twenty years." },
        { id = "h_mugg_recent", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Eye of Mugg"), days = 3 } },
          text = "I looked at that eye for an hour last night. It wasn't pleasant, but it was still the best hour I've had since the siege." },
        { id = "h_hero", when = { townStanding = { town = "farholde", min = 55 } },
          text = "The sentries talk about you at the gate, and I let them. It's good for morale, and morale's the one thing Stormwind can't refuse to send." },
        { id = "h_book", when = { bookRead = "A Wartorn Land and The Brotherhood" },
          text = "You've read Farholde's book. Then you know what this keep cost, and I won't have to tell you." },
        { id = "h_fern_resolved", tags = { "news" }, key = true, when = { thread = { id = "farholde_lost", state = "resolved" } },
          text = "Gray came up to the keep, his first time in a year, and we didn't argue about Fern; we drank to her. I'm told that was your doing, so thank you, and don't make me say it twice." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "I walk the walls at night, a habit since the siege. The river's loud after dark, and I'd rather hear it than the quiet." },
      },
      again = {
        { id = "h_again", text = "What else? The day's short and the Riverglades are long." },
        { id = "h_again2", text = "Go on." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Ask, then. I'm not sleeping anyway." },
      },
      choices = {
        { text = "What happened to this land?", next = "history" },
        { text = "You don't think much of Stormwind.", next = "stormwind" },
        { text = "Who's the enemy out here?", next = "enemy" },
        { text = "Tell me about the memorials in the courtyard.", next = "memorials" },
        { text = "The Brotherhood had paladins once.", next = "paladin", when = { class = "PALADIN" } },
        { text = "Stormwind left Westfall to rot too.", next = "westfall", when = { origin = "human_westfall_farmhand" } },
        { text = "My family sits in Stormwind's House of Nobles.", next = "noble", when = { origin = "human_minor_noble" } },
        { text = "There are dwarves in the Brotherhood?", next = "dwarves", when = { race = "Dwarf" } },
        { text = "Mugg is dead. What now?", next = "after_mugg", when = { questDone = TODO_QUEST("Eye of Mugg") } },
        { text = "Let me bless your riders before they ride out.", next = "priest_bless", when = { class = "PRIEST" } },
        { text = "Put me to work, Commander.", next = "BUSINESS", fx = { affinity = 1, standing = { farholde = 1 } } },
        { text = "I'll be on my way.", next = "END" },
      },
    },

    history = {
      big = true,
      lines = {
        { id = "hi_default", text = "The Horde burned Sunnyglade in the First War and marched its people off in chains. Knights got them back, but the road home was cut. So they built Meadowsbrook, then this keep, and Stormwind wrote the land off." },
      },
      choices = {
        { text = "And the Brotherhood? Where do you come in?", next = "history_brotherhood" },
        { text = "Sunnyglade's still in ruins?", next = "sunnyglade" },
        { text = "Something else.", next = "BACK" },
      },
    },
    history_brotherhood = {
      lines = {
        { id = "hb_default", text = "The Second War. We were sent east after the Hammer's ogres and a band of orcs running from something worse, and they beat us back to this coast. Farholde took us in, and we've been paying that debt ever since.",
          fx = { learn = { "brotherhood_horse" } } },
      },
      choices = {
        { text = "Lothar was one of you, wasn't he?", next = "lothar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lothar = {
      lines = {
        { id = "lo_default", text = "He was Armsman to the Brotherhood, before any of this, and every rider here knows it. Half of them think it makes us better than the Stormwind Guard, and they're right." },
      },
      choices = {
        { text = "Lothar gave his life for the Alliance. You could rejoin it.", next = "BACK", fx = { align = { order = 2 }, affinity = -1 } },
        { text = "Then the Brotherhood's in good company.", next = "BACK", fx = { align = { order = -2 }, affinity = 1 } },
      },
    },
    sunnyglade = {
      lines = {
        { id = "su_default", text = "Ruins, with the Twilight's Hammer living in them. The Horde left the mage tower standing when they burned the town, and someone's using it again. Ask Ashe; she'll tell you more than you want to know.",
          fx = { learn = { "sunnyglade", "twilights_hammer" } } },
      },
      choices = {
        { text = "Will you ever take it back?", next = "sunnyglade_back" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sunnyglade_back = {
      lines = {
        { id = "sb_default", text = "Roderick held a bridge there with one arm and bought us a night. I'll take it back, or the next commander will. That's how the Brotherhood counts time." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "siege_of_farholde" } } } },
    },

    stormwind = {
      big = true,
      lines = {
        { id = "s_default", key = true,
          text = "Stormwind decided this land was lost and went home to guard its walls. Twenty years on, the walls are still standing and so are we, and I know which of us did the fighting.",
          fx = { hear = "stormwind_abandoned_riverglades" } },
      },
      choices = {
        { text = "Stormwind had its own war to fight.", next = "stormwind_defend", fx = { align = { order = 2 }, affinity = -1 } },
        { text = "They abandoned you. That's unforgivable.", next = "stormwind_agree", fx = { align = { order = -2 }, affinity = 2, opinion = { stormwind = "abandoned_its_own" } } },
        { text = "Does Ashe feel the same?", next = "stormwind_ashe" },
      },
    },
    stormwind_defend = {
      lines = { { id = "sd_default", text = "It had its own war, they'll tell you, but we were its war once. Say that to the sentries; they'll explain it better than I can, and louder." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stormwind_agree = {
      lines = { { id = "sa_default", text = "Unforgivable's a big word. I use smaller ones, every morning, at the gate." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stormwind_ashe = {
      lines = { { id = "sw_default", text = "Ashe says they made the sensible choice and we made ours. She's kinder than I am. She's also usually right, which I find irritating." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },

    enemy = {
      lines = {
        { id = "e_default", text = "Two of them. The Horde, who still think this land is theirs, and the Twilight's Hammer, who think it belongs to something worse. Pick one; there's work either way." },
      },
      choices = {
        { text = "The Twilight's Hammer.", next = "enemy_hammer" },
        { text = "The Horde.", next = "enemy_horde" },
        { text = "Something else.", next = "BACK" },
      },
    },
    enemy_hammer = {
      lines = {
        { id = "eh_default", text = "Cultists and ogres, in Sunnyglade and up in the hills, and they take prisoners. I stopped asking what for; the answers kept me awake.",
          fx = { learn = { "twilights_hammer" } } },
      },
      choices = {
        { text = "And Krol'dok?", next = "krol_dok" },
        { text = "Something else.", next = "BACK" },
      },
    },
    krol_dok = {
      lines = {
        { id = "k_default", text = "Their hole in the northwest ridge. The Horde ran there when we broke the siege; now the Hammer holds it. Whatever comes out of those caves at night, I want it dead.",
          fx = { learn = { "krol_dok" } } },
      },
      choices = {
        { text = "Then I'll go in.", next = "BUSINESS", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    enemy_horde = {
      lines = {
        { id = "eo_default", text = "They've a fort of their own now, and ogres who've turned their coats to join them. I'll say this for orcs, though: they come at you from the front, mostly." },
      },
      choices = {
        { text = "Will there ever be peace with them here?", next = "enemy_peace" },
        { text = "Something else.", next = "BACK" },
      },
    },
    enemy_peace = {
      lines = { { id = "ep_default", text = "Ask me after they leave Sunnyglade alone for a year. I'll wait." } },
      choices = {
        { text = "Peace has to start somewhere.", next = "BACK", fx = { align = { light = 1 }, opinion = { peace = "for" } } },
        { text = "There won't be. Not here.", next = "BACK", fx = { align = { order = 1 }, opinion = { peace = "against" }, affinity = 1 } },
      },
    },

    memorials = {
      big = true,
      lines = {
        { id = "m_default", text = "Howard, Isolde, Roderick, Brienne, Rosalind and Fern: the ones who broke the siege, and the ones who didn't live to see it broken. Read them if you like. I don't need to." },
      },
      choices = {
        { text = "Tell me about the charge.", next = "charge" },
        { text = "Who was Fern Crimsonleaf?", next = "fern" },
        { text = "You wrote Isolde's yourself.", next = "isolde", when = { bookRead = "Lady Isolde Brightlance" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    charge = {
      lines = {
        { id = "c_default", text = "At dawn, Howard opened the gate with his retinue behind him and rode straight into the Horde's camp. They'd sat outside our walls so long they'd forgotten how to stand, and we hadn't.",
          fx = { learn = { "siege_of_farholde" } } },
      },
      choices = {
        { text = "And where were you?", next = "charge_you" },
        { text = "Something else.", next = "BACK" },
      },
    },
    charge_you = {
      lines = { { id = "cy_default", text = "Commanding, which means I gave the order and watched them go. That's the whole of my part, and it's the part I think about." } },
      choices = {
        { text = "That's the harder job.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fern = {
      lines = {
        { id = "f_default", text = "Fern was our knife in the dark. She went into the Horde's camp the night before the charge, and by morning their captains were dead. We found her dagger, but we never found her.",
          fx = { learn = { "fern_crimsonleaf" } } },
      },
      choices = {
        { text = "Could she have lived?", next = "fern_lived" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fern_lived = {
      lines = {
        { id = "fl_default", key = true, text = "No, and I'll thank you not to say it near the gate. People have hoped long enough." },
      },
      choices = {
        { text = "Gray Dawnbright in the port thinks otherwise.", next = "fern_gray", when = { heardLine = "gray.f_alive" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fern_gray = {
      lines = { { id = "fg_default", text = "Gray thinks a lot of things at the bottom of a mug, so leave him be. He's earned his hope, and I've earned my doubt." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    isolde = {
      lines = { { id = "is_default", text = "I did, upright and with her banner high, because I wanted the words to be as true as she was. Ask me something else." } },
      choices = {
        { text = "She sounds remarkable.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    paladin = {
      lines = {
        { id = "pa_default", text = "We did. Sir Howard the Stout rode out with the Light on him and didn't come back. If you're asking whether there's room for another, there's always room." },
      },
      choices = {
        { text = "I'd be honored.", next = "BACK", fx = { affinity = 2, standing = { farholde = 2 }, align = { light = 1 } },
          journal = { first = "Demar Brant told me the Brotherhood always has room for a paladin. Sir Howard's memorial is in the courtyard.",
                      third = "{name} told Knight Commander Brant they'd stand with the Brotherhood of the Horse." } },
        { text = "I'm not looking to die gloriously.", next = "BACK", fx = { align = { honor = -1 }, trait = { cautious = 1 } } },
      },
    },
    westfall = {
      lines = {
        { id = "wf_default", text = "Westfall too? Then you know the shape of it. Stormwind looks at a map, draws a line, and lives on its side of it." },
      },
      choices = {
        { text = "Someone should make them answer for it.", next = "BACK", fx = { affinity = 2, align = { order = -2 }, opinion = { stormwind = "abandoned_its_own" } } },
        { text = "Stormwind had good reasons for drawing its lines where it did.", next = "BACK", fx = { align = { order = 2 } } },
        { text = "Westfall's my fight. This one's yours.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    noble = {
      lines = {
        { id = "nb_default", text = "Then tell them we're still here, at dinner, between courses. Watch their faces, and come back and describe them to me." },
      },
      choices = {
        { text = "I'll tell them.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } },
          journal = { first = "Promised Demar Brant I'd tell the House of Nobles that Farholde still stands.",
                      third = "{name} promised Knight Commander Brant to carry word of Farholde to the House of Nobles." } },
        { text = "They'd only laugh, so I won't waste my breath.", next = "BACK", fx = { align = { honor = -1 }, affinity = -1 } },
      },
    },
    dwarves = {
      lines = {
        { id = "dw_default", text = "A few. Thaddeus Brillyard rides with us, if what a dwarf does on a horse is riding, and Bertrand Ironbrow keeps the walls up. Don't tell them I said 'a few'." },
      },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1 } } },
    },
    after_mugg = {
      big = true,
      lines = {
        { id = "am_default", text = "Quiet, for now, though the Hammer will find another ogre to follow. But my scouts can sleep tonight, and the ones who never came back have their answer." },
      },
      choices = {
        { text = "And after that?", next = "after_next" },
        { text = "Something else.", next = "BACK" },
      },
    },
    after_next = {
      lines = { { id = "an_default", text = "Sunnyglade, though not this year. But I've started saying 'not this year' instead of 'never', and the riders have noticed." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    priest_bless = {
      lines = { { id = "pb_default", text = "Sister Rowland does, when she can leave the chapel, which is rarely. Yes: at the gate, at dawn. They'll stand straighter for it, and some will come back because they did." } },
      choices = {
        { text = "At dawn, then.", next = "BACK", fx = { affinity = 3, standing = { farholde = 2 }, align = { light = 1 } } },
        { text = "They'd stand straighter for a hot meal than a blessing.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "The Brotherhood is my story, twenty years of it in these glades, and the rest isn't worth the telling." } },
    advice = { { id = "tp_ad", text = "Ride in pairs, sleep in the keep, and never follow a light across the river at night. The Hammer uses lights." } },
    brotherhood_horse = { { id = "tp_brotherhood", text = "Older than the First War, older than Stormwind's patience. We ride, we hold, and we don't wait to be asked." } },
    siege_of_farholde = { { id = "tp_siege", text = "We held the gate until Howard opened it. Read the memorials; they say it better than I do." } },
    sunnyglade = { { id = "tp_sunnyglade", text = "Sunnyglade is ours. It won't be today, but it's ours all the same." } },
    twilights_hammer = { { id = "tp_hammer", text = "Light-forsaken, every one. I don't need to know what they worship to know it should burn." } },
    krol_dok = { { id = "tp_kroldok", text = "Where they ran after the siege, and where they plan the next one." } },
    fern_crimsonleaf = { { id = "tp_fernnext", text = "Our knife in the dark, and the best of us. Ask what you came to ask.", next = "fern" }, { id = "tp_fern", text = "She's dead, and a hero, and dead all the same. Don't let Gray tell you different." } },
    defias = { { id = "tp_defias", text = "Stormwind's own mess, on its own doorstep, and even then they couldn't be bothered. I'm not surprised." } },
    _none = { { id = "tp_none", text = "If it isn't in the Riverglades, it isn't my concern. Ask Ashe; she reads." } },
  },
}

P:NPC {
  key = "ashe", id = TODO_NPC("Ashe Amberhall"), name = "Ashe Amberhall",
  bible = "bibles/riverglades.md", role = "scholar", tier = "major",
  communities = { "farholde", "brotherhood_horse" }, temper = { "sharp", "chatty" }, values = { "curious", "loyal" },
  notices = { "arcane", "curse" },

  greetings = {
    { id = "g_default", text = "Visitors! Sit, if you can find a chair that isn't holding a book." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, because I've had a thought since you left. Several, actually." },
    { id = "g_mage", when = { class = "MAGE" }, text = "Another mage! Please tell me you've read something recently." },
  },

  notice = {
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "You're a mage, thank the Light! Do you know how long it's been since I talked shop with someone who doesn't smell of horse?" },
    { id = "n_skyborne", cat = "arcane", when = { race = "Skyborne" },
      text = "Skyborne, the Kirin Tor's new friends! I've read everything Dalaran sent about your people, all two pages of it, and both pages were vague." },
    { id = "n_curse", cat = "curse", when = { debuffType = "Curse" },
      text = "Hold still, there's a curse hanging off you like wet wool. Hm, I've seen tidier ones on the Hammer's trinkets, and that's not praise." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Ashe Amberhall, advisor to the Knight Commander. I answer visitors' questions about Farholde. We get so few visitors that I'm out of practice, and likely to say too much." },
        { id = "h_satchel", tags = { "news" }, when = { questActive = TODO_QUEST("Lingering Essence") },
          text = "Riftan sent you with those? Put them down, but not on that table, on the stone one, and then step back, please." },
        { id = "h_satchel_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Lingering Essence"), days = 3 } },
          text = "Riftan's trinkets have been humming at night, so I've moved my bed. I haven't moved the trinkets; I'm not a fool." },
        { id = "h_mugg", tags = { "news" }, when = { questRecent = { TODO_QUEST("Eye of Mugg"), days = 3 } },
          text = "Demar smiled at breakfast, actually smiled, and I very nearly sent for Sister Rowland." },
        { id = "h_notes", when = { metBefore = true, timeOfDay = "night" },
          text = "I was reading my father's notes. His handwriting was dreadful. I'm the only one alive who can read it, which I suppose makes them mine now." },
      },
      again = {
        { id = "h_again", text = "What else? Stop me if I wander." },
        { id = "h_again2", text = "Yes? I've lost my place anyway." },
        { id = "h_again3", text = "Go on. I'll try to answer in under a minute, though I won't manage it." },
      },
      choices = {
        { text = "Tell me about Farholde.", next = "farholde" },
        { text = "Who was your father?", next = "father" },
        { text = "What is the Twilight's Hammer doing here?", next = "hammer" },
        { text = "What's in the old mage tower at Sunnyglade?", next = "tower" },
        { text = "Shop talk, then. What are you working on?", next = "shop", when = { class = "MAGE" } },
        { text = "You've read about my people?", next = "skyborne", when = { race = "Skyborne" } },
        { text = "How close is the Hammer's magic to mine?", next = "warlock", when = { class = "WARLOCK" } },
        { text = "Riftan says you're a pain.", next = "riftan", when = { heardLine = "riftan.a_pain" } },
        { text = "Thank you, Ashe.", next = "END" },
      },
    },

    farholde = {
      big = true,
      lines = {
        { id = "fa_default", text = "When the Horde took these lands in the First War, the Alliance moved on; they judged it lost and spent their soldiers at home. Honestly, I'd have done the same." },
      },
      choices = {
        { text = "But you stayed.", next = "farholde_stayed" },
        { text = "Demar calls that cowardice.", next = "farholde_demar", when = { heardLine = "demar.s_default" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    farholde_stayed = {
      lines = {
        { id = "fs_default", text = "It's our home. That isn't strategy; it's stubbornness with a banner. This is a war for what we were born to, and Demar is the man to win it.",
          fx = { learn = { "brotherhood_horse" } } },
      },
      choices = {
        { text = "Do you believe he'll win?", next = "farholde_win" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farholde_win = {
      lines = { { id = "fw_default", text = "Yes, but not soon. I'd rather be right slowly than wrong in a hurry, and so would he, though he'd never put it so politely." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    farholde_demar = {
      lines = { { id = "fd_default", text = "He would. He gave the order and watched his friends ride out through that gate, so he's earned his grudge. I just don't share it." } },
      choices = {
        { text = "Maybe you're both right.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "He's right. Stormwind failed you.", next = "BACK", fx = { align = { order = -1 }, opinion = { stormwind = "abandoned_its_own" } } },
        { text = "You're right. It was the sensible choice.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
      },
    },

    father = {
      big = true,
      lines = {
        { id = "f_default", text = "Alden Amberhall, student of Antonidas, and the only one of the charge who rode back through that gate. Then a black dragon found us on an expedition west, and I rode back alone." },
      },
      choices = {
        { text = "I'm sorry.", next = "father_sorry", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "What were you looking for, out west?", next = "father_west" },
        { text = "A student of Antonidas, with a cavalry order?", next = "father_why" },
      },
    },
    father_sorry = {
      lines = { { id = "fso_default", text = "Thank you. People say that and then look at the memorial instead of at me, but you didn't, and I noticed." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    father_west = {
      lines = { { id = "fwe_default", text = "Something he'd read about. He was always reading about something. I have his notes, and I still can't tell which of the forty things in them he meant." } },
      choices = {
        { text = "Maybe I could help you look, one day.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    father_why = {
      lines = { { id = "fy_default", text = "He said Dalaran had plenty of clever people and Farholde had none. He meant it as a joke. Then he stayed twenty years, which is a long time to keep a joke going." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    hammer = {
      lines = {
        { id = "hm_default", text = "Collecting things: bones, stones, carved figures that hum when you aren't looking. Riftan sends me the ones from their dead. I'd like to know what they're for before they finish doing it.",
          fx = { learn = { "twilights_hammer" } } },
      },
      choices = {
        { text = "What do you think they're for?", next = "hammer_for" },
        { text = "Is it safe, keeping them here?", next = "hammer_safe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hammer_for = {
      lines = { { id = "hf_default", text = "Listening, I think. To what, I don't know, and I'd like to keep not knowing a while longer. That's the first unscholarly thing I've ever said out loud." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    hammer_safe = {
      lines = { { id = "hs_default", text = "No, and I'd rather you asked me something else." } },
      choices = { { text = "Ha. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    tower = {
      lines = {
        { id = "t_default", text = "The Horde spared it to learn how our magic worked; now the Hammer sits in it. I'd give a great deal for an hour in that tower, and rather less to be carried out.",
          fx = { learn = { "sunnyglade" } } },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    shop = {
      lines = { { id = "sh_default", text = "Wards, against whatever's in Riftan's satchels. And a lamp that doesn't need oil, because Farholde's out of oil. What do you work on?" } },
      choices = {
        { text = "Frost. It's honest.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "Fire. It's satisfying.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Portals. I'm tired of walking.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
      },
    },

    skyborne = {
      lines = { { id = "sk_default", text = "Only what Dalaran wrote, which wasn't much. Your people came down out of the sky and went to the Kirin Tor. I'd like the rest from someone who was there." } },
      choices = {
        { text = "Our wind spirits went silent. That's why we left.", next = "skyborne_tell", fx = { affinity = 2 } },
        { text = "Another time.", next = "BACK" },
      },
    },
    skyborne_tell = {
      lines = { { id = "st_default", text = "That's a frightening sentence, said that plainly. Thank you. I'll write it down properly, and I won't add anything to it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    warlock = {
      lines = { { id = "wl_default", text = "Close enough that I'd like you to stand over there; not far, just there." } },
      choices = {
        { text = "It's a tool. Like yours.", next = "warlock_tool" },
        { text = "Fair.", next = "BACK" },
      },
    },
    warlock_tool = {
      lines = { { id = "wt_default", text = "Mine doesn't talk back, but the Hammer's trinkets do, and I suspect yours does too. I'll trust you, for now. Demar won't, so keep your little friend out of his sight." } },
      choices = {
        { text = "My demon answers to me, and I'm not ashamed of it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'd be rid of it, if the power came any other way.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    riftan = {
      lines = { { id = "rf_default", text = "He's right. Did he also say I'm good at my work? He usually forgets that part, and then he sends me another satchel." } },
      choices = {
        { text = "How is he, really?", next = "riftan_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    riftan_how = {
      lines = { { id = "rh_default", key = true, text = "He's tired. He's been out there so long that I worry it's gotten into his head... ah, I'm babbling again, aren't I? He's fine, probably." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was my father's student before I was anything else, then Farholde's advisor, then the expedition west. I came back from that one alone.", next = "father" } },
    advice = { { id = "tp_ad", text = "If something the Hammer carried hums, don't put it in your pack; put it in mine. I mean it." } },
    siege_of_farholde = { { id = "tp_siege", text = "My father rode in that charge and came back, and he never talked about it, though he talked about everything else." } },
    twilights_hammer = { { id = "tp_hammernext", text = "Ah. Sit down; this one takes a while.", next = "hammer" }, { id = "tp_hammer", text = "They collect things that listen, and I collect what they collect, because someone should." } },
    sunnyglade = { { id = "tp_sunnyglade", text = "There's a mage tower in the ruins that the Horde couldn't bring themselves to burn. I think about it more than is healthy." } },
    brotherhood_horse = { { id = "tp_brotherhood", text = "Knights, mostly, and a few of us who can't sit a horse but can read. It works, somehow." } },
    fern_crimsonleaf = { { id = "tp_fern", text = "Presumed dead, the stone says. My father said she could vanish in a lit room. I like to think she's still practising." } },
    _none = { { id = "tp_none", text = "I don't know! I'd love to, though, so write it down for me, would you? I'll look into it." } },
  },
}

P:NPC {
  key = "riftan", id = TODO_NPC("Sergeant Riftan"), name = "Sergeant Riftan",
  bible = "bibles/riverglades.md", role = "soldier", tier = "quest",
  communities = { "brotherhood_horse" }, temper = { "weary", "steady" }, values = { "loyal", "stern" },
  notices = { "kit", "curse" },

  greetings = {
    { id = "g_default", text = "Keep low; they've archers on the ridge." },
    { id = "g_back", when = { metBefore = true }, text = "Still alive, good. I'm running out of room to remember names." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "They had a go at you, I see. Cultists fight dirty and pray while they do it, so patch up before you try again." },
    { id = "n_curse", cat = "curse", when = { debuffType = "Curse" },
      text = "You've been handling their trinkets, or their trinkets have been handling you; you've got the look. Get it off before dark." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Sergeant Riftan, Brotherhood of the Horse. I've been fighting these cultists longer than some of our riders have been alive, and don't ask how long, because I stopped counting." },
        { id = "h_mementos", when = { questActive = TODO_QUEST("Twilight Mementos") },
          text = "Their dead carry little carved things. Bring me some, and don't hold them longer than you have to." },
        { id = "h_satchel", when = { questActive = TODO_QUEST("Lingering Essence") },
          text = "Take those to the keep, now, and find Ashe. She'll talk your ear off, but she'll know what they are." },
        { id = "h_after", tags = { "news" }, when = { questDone = TODO_QUEST("Lingering Essence") },
          text = "Did Ashe say anything about me? She did; I can tell by your face." },
      },
      again = {
        { id = "h_again", text = "What else? Eyes on the ridge while you ask." },
        { id = "h_again2", text = "Go on, quietly." },
      },
      choices = {
        { text = "How long have you been out here?", next = "long" },
        { text = "What are these trinkets?", next = "trinkets" },
        { text = "What's Ashe like?", next = "ashe" },
        { text = "Need another sword on the line?", next = "line", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Ashe worries about you.", next = "worried", when = { heardLine = "ashe.rh_default" } },
        { text = "Stay safe, Sergeant.", next = "END", fx = { affinity = 1 } },
      },
    },
    long = {
      lines = { { id = "l_default", text = "Long enough that the cultists know my face. I take that as a compliment, though they don't mean it as one." } },
      choices = {
        { text = "Do you ever rest?", next = "long_rest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    long_rest = {
      lines = { { id = "lr_default", text = "Rest is for the keep. Out here you count arrows and listen. When the chanting stops, that's when you worry." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    trinkets = {
      lines = {
        { id = "tr_default", text = "Bones, stone, little figures, and they hum at night. Two of my lads started talking in their sleep after carrying them, in words none of us know.",
          fx = { learn = { "twilights_hammer" } } },
      },
      choices = {
        { text = "That's not natural.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Whatever's in them, I'd like a closer look myself.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Did your lads come right?", next = "trinkets_lads" },
      },
    },
    trinkets_lads = {
      lines = { { id = "tl_default", text = "They're at the keep, and they're quiet now. I didn't let them come back out, and they didn't argue." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ashe = {
      lines = {
        { id = "a_pain", key = true, text = "A pain, but brilliant, mind. She'll look at a cultist's trinket and tell you who carved it and what he ate for supper, and then she'll tell you again." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    line = {
      lines = { { id = "ln_default", text = "Always. Stand there, face the ridge, and don't move when they start chanting, because the chanting's the worst part, until it isn't." } },
      choices = { { text = "Understood.", next = "BACK", fx = { affinity = 2, standing = { farholde = 1 } } } },
    },
    worried = {
      lines = { { id = "w_default", text = "She worries. Tell her I'm fine, and tell her I said it twice; she'll believe it more." } },
      choices = { { text = "I'll tell her.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Brotherhood a long time, out here longer. That's all of it." } },
    advice = { { id = "tp_ad", text = "When they start chanting, back up. Whatever they're calling, you don't want to be the first thing it sees." } },
    twilights_hammer = { { id = "tp_hammer", text = "They pray louder than they fight. I'd rather they just fought." } },
    _none = { { id = "tp_none", text = "Nothing I'd know about out here. Ask at the keep." } },
  },
}

P:NPC {
  key = "rowland", id = TODO_NPC("Sister Rowland"), name = "Sister Rowland",
  bible = "bibles/riverglades.md", role = "priest", tier = "quest",
  communities = { "farholde", "brotherhood_horse" }, temper = { "patient" }, values = { "kind", "pious" },
  notices = { "healer", "disease", "form" },

  greetings = {
    { id = "g_default", text = "Quietly, please; some of them are sleeping." },
    { id = "g_back", when = { metBefore = true }, text = "You came back. Would you sit with one of them a moment? Talking helps, though I don't know why." },
  },

  notice = {
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "Not near the sick, please. You'll want to heal them, and you can't, in that shape. Step out of it and help me." },
    { id = "n_healer", cat = "healer", when = { class = { "PRIEST", "PALADIN", "SHAMAN", "DRUID" } },
      text = "You're a healer. Wash your hands at the basin before you touch anyone, and then, Light bless you, touch everyone." },
    { id = "n_disease", cat = "disease", when = { debuffType = "Disease" },
      text = "You're carrying something yourself. Sit down, and I mean it; I have enough beds, but I don't have enough of me." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Sister Rowland, and these are the Brotherhood's sick. They're ill, and I don't yet know with what, so I keep them clean and fed and prayed over, and the rest is the Light's business." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Night's the hard part. Fevers climb after dark, and so do the prayers." },
      },
      again = {
        { id = "h_again", text = "Something else? Softly, please." },
        { id = "h_again2", text = "Yes? I'm listening, though I'm also changing this bandage." },
      },
      choices = {
        { text = "What's wrong with them?", next = "illness" },
        { text = "How do you keep going?", next = "going" },
        { text = "Can I help?", next = "help" },
        { text = "Let me pray with you.", next = "pray", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "I know some field medicine.", next = "aid", when = { profession = "First Aid" } },
        { text = "The Light keep you, Sister.", next = "END", fx = { align = { light = 1 } } },
        { text = "Prayer won't break a fever, Sister, but medicine might.", next = "END", fx = { align = { light = -1 } } },
      },
    },
    illness = {
      lines = { { id = "i_default", text = "I don't know. That's the honest answer, and I've stopped being ashamed of it. It's no plague I've read about, and it isn't a curse I can feel." } },
      choices = {
        { text = "Could it be the Hammer's doing?", next = "illness_hammer" },
        { text = "Something else.", next = "BACK" },
      },
    },
    illness_hammer = {
      lines = { { id = "ih_default", text = "Everyone asks that, and everyone wants it to be. I won't blame anyone until I know, because the moment I do, I'll stop looking." } },
      choices = {
        { text = "That's wise.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'd blame them anyway.", next = "BACK", fx = { align = { order = 1 }, trait = { stern = 1 } } },
      },
    },
    going = {
      lines = { { id = "g2_default", text = "Tea, the Light, and not looking at the whole room at once. One bed at a time; that's the trick." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    help = {
      lines = { { id = "hp_default", text = "Water from the well, linen from the laundry, and stories. They're bored to tears, and a bored patient gives up. Tell them one." } },
      choices = {
        { text = "I'll tell them about my travels.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 }, standing = { farholde = 1 } } },
        { text = "I'm no storyteller.", next = "BACK" },
      },
    },
    pray = {
      lines = { { id = "pr_default", text = "Please. I've prayed alone for weeks, and it's good to hear another voice say the words." } },
      choices = {
        { text = "Amen.", next = "BACK", fx = { affinity = 2, align = { light = 2 }, trait = { pious = 1 } } },
        { text = "I'll say the words, but I've stopped believing anyone hears them.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    aid = {
      lines = { { id = "ad_default", text = "Then roll up your sleeves. Bandages in the chest, boiled water on the fire. Don't let the big one by the window talk you into ale." } },
      choices = { { text = "I won't.", next = "BACK", fx = { affinity = 2, standing = { farholde = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I go where the sick are. Farholde has more than its share, so here I am." } },
    advice = { { id = "tp_ad", text = "Boil your water and wash your wounds. The Light helps those who've already done the dull part." } },
    twilights_hammer = { { id = "tp_hammer", text = "I pray for them too. Someone should, and nobody else will." } },
    _none = { { id = "tp_none", text = "I'm sorry; my world's been this room, lately." } },
  },
}

P:NPC {
  key = "cady", id = TODO_NPC("Cady Lloydriel"), name = "Cady Lloydriel",
  bible = "bibles/riverglades.md", role = "soldier", tier = "quest",
  communities = { "farholde", "brotherhood_horse" }, temper = { "wary", "sharp" }, values = { "loyal", "cautious" },
  notices = { "pets", "elves", "form" },

  greetings = {
    { id = "g_default", text = "Mind the cradle." },
    { id = "g_dog", text = "Aedamas likes you. Don't be flattered; he likes everyone." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. Luna's sitting on the cradle again; don't take it personally." },
  },

  notice = {
    { id = "n_pet", cat = "pets", when = { class = "HUNTER", pet = { type = "Beast" } },
      text = "Your {pet} and Aedamas are sizing each other up, so let them. Dogs settle these things faster than knights." },
    { id = "n_nightelf", cat = "elves", when = { race = "NightElf" },
      text = "A kaldorei, this far east. You'll have questions about me, as most people do, so ask them slowly." },
    { id = "n_skyborne", cat = "elves", when = { race = "Skyborne" },
      text = "Forgive me for staring. You look like the elves I grew up with, until you move. I'm told staring is rude." },
    { id = "n_form", cat = "form", when = { form = { "cat", "bear" } },
      text = "Aedamas, no! That's a druid, not supper, so sit down and stay sat." },
  },

  react = {
    { id = "r_cat", on = "form", when = { form = "cat" }, text = "Luna's hissing at you. Two cats in one room; one of you will have to go, and it won't be her." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Cady Lloydriel. I ride with the Brotherhood and keep an eye on the walls, and on this one." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Quiet, please; it took an hour to get the little one down. Luna helped, and Luna takes all the credit." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Go on, quietly." },
      },
      choices = {
        { text = "Whose child is that?", next = "child" },
        { text = "Tell me about the animals.", next = "animals" },
        { text = "An elf, in a Stormwind order?", next = "elf" },
        { text = "What do you watch for, on the walls?", next = "walls" },
        { text = "Fine dog. Did you train him yourself?", next = "hunter", when = { class = "HUNTER" } },
        { text = "You were staring.", next = "skyborne", when = { race = "Skyborne" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    child = {
      lines = { { id = "c_default", text = "Someone who needs watching. That's all you need to know, and all I'm saying." } },
      choices = {
        { text = "Fair enough.", next = "BACK", fx = { affinity = 1 } },
        { text = "Is the child yours?", next = "child_press", fx = { affinity = -2 } },
      },
    },
    child_press = {
      lines = { { id = "cp_default", text = "Ask me that again and Aedamas walks you to the gate. Ask me something else." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    animals = {
      lines = { { id = "an_default", text = "Aedamas is the dog and Luna's the cat. He guards the cradle and she guards him, and nobody guards me, which is fine; I bite." } },
      choices = {
        { text = "Can I pet him?", next = "animals_pet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    animals_pet = {
      lines = { { id = "ap_default", text = "Ask him yourself: hand flat, and low. There, now you have a friend for life, or until supper." } },
      choices = { { text = "Good boy.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    elf = {
      lines = { { id = "e_default", text = "Rangers go where they're needed, and I was needed here. The Brotherhood didn't ask for my family tree, and I didn't ask for theirs." } },
      choices = {
        { text = "And Quel'Thalas?", next = "elf_quel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elf_quel = {
      lines = { { id = "eq_default", text = "I don't talk about Quel'Thalas with strangers. Ask me again when we aren't." } },
      choices = { { text = "I understand.", next = "BACK", fx = { affinity = 1 } } },
    },
    walls = {
      lines = { { id = "w_default", text = "The river fog, mostly, and the things that come out of it: cultists sometimes, pirates from up the coast sometimes, and once a very confused cow." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Trained him? He trained me, and I just learned to stop arguing." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    skyborne = {
      lines = { { id = "sk_default", text = "I was. You move as though the wind's holding you up; is it?" } },
      choices = {
        { text = "Something like that.", next = "BACK" },
        { text = "Our island was lifted into the sky, long ago.", next = "BACK", fx = { affinity = 2 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "No. That one stays with me." } },
    advice = { { id = "tp_ad", text = "Watch the birds over the river. When they go quiet, something's moving in the fog." } },
    brotherhood_horse = { { id = "tp_brotherhood", text = "Good riders and bad singers, and they keep their word, which is rarer than either." } },
    _none = { { id = "tp_none", text = "Not mine to know." } },
  },
}

P:NPC {
  key = "wheatley", id = TODO_NPC("Wheatley"), name = "Wheatley", title = "Stable Master",
  bible = "bibles/riverglades.md", role = "stablemaster", tier = "service",
  communities = { "farholde" }, temper = { "gentle" }, values = { "patient" },
  notices = { "mount", "class" },

  greetings = {
    { id = "g_default", text = "Mind your step there; it's fresh." },
    { id = "g_mount", text = "Want your mount looked at? I look at all of them anyway." },
  },

  notice = {
    { id = "n_mount", cat = "mount", when = { mounted = true },
      text = "Down you get, and let me see him. Hm, good legs. Who's been feeding him, and can I have a word with them?" },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin's charger, is it? The Brotherhood's had a few, and I'll do right by it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Wheatley, stable master. Every horse in the Brotherhood comes through these stalls, and every one of them is better company than its rider." },
      },
      again = { { id = "h_again", text = "Anything else? Hold this bucket while you ask." } },
      choices = {
        { text = "Let me see the stables.", next = "BUSINESS" },
        { text = "Who kept the stables before you?", next = "brienne" },
        { text = "Best horse you've ever had?", next = "best" },
        { text = "Do you stable druids?", next = "druid", when = { class = "DRUID" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    brienne = {
      lines = { { id = "b_default", text = "Brienne Stormhart, who never met a stallion she couldn't break. She rode out with Sir Howard and didn't come back, and her saddle's still on the third peg where nobody uses it." } },
      choices = {
        { text = "Why not?", next = "brienne_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brienne_why = {
      lines = { { id = "bw_default", text = "Because it's hers." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    best = {
      lines = { { id = "be_default", text = "The grey in the end stall. He won't let anyone ride him, and he's right not to, because nobody here's good enough; I tell him so every morning." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    druid = {
      lines = { { id = "d_default", text = "A cat, no, and a bear, absolutely not, but a stag? Now that's something we can talk about." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I've been around horses since before I could walk. Ask them about me; they're more honest." } },
    advice = { { id = "tp_ad", text = "A horse that won't cross a bridge has a reason. Get off and look." } },
    siege_of_farholde = { { id = "tp_siege", text = "We lost more horses than riders, and I mourned every one. Don't tell the riders." } },
    _none = { { id = "tp_none", text = "Does it eat hay? If not, you'd best ask somebody else." } },
  },
}

P:NPC {
  key = "mayberry", id = TODO_NPC("Gretchen Mayberry"), name = "Gretchen Mayberry", title = "Gryphon Master",
  bible = "bibles/riverglades.md", role = "flightmaster", tier = "service",
  communities = { "farholde" }, temper = { "brisk" }, values = { "proud" },
  notices = { "flight" },

  greetings = {
    { id = "g_default", text = "Need a lift? The birds are fed, and grumpy with it." },
    { id = "g_fog", when = { timeOfDay = "dawn" }, text = "Fog's in. They'll fly, but they'll complain the whole way." },
  },

  notice = {
    { id = "n_skyborne", cat = "flight", when = { race = "Skyborne" },
      text = "You're one of the gliding ones; Walk on Air, isn't it? Lovely, though it only goes downhill, and my birds do uphill." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Gretchen Mayberry, Gryphon Master. If you're headed anywhere the Brotherhood holds, I'll have you there before the fog lifts." },
      },
      again = { { id = "h_again", text = "Anything else? They're getting restless." } },
      choices = {
        { text = "I need a ride.", next = "BUSINESS" },
        { text = "Gryphons, this far from Ironforge?", next = "gryphons" },
        { text = "How's the flying out here?", next = "flying" },
        { text = "Walk on Air beats a gryphon.", next = "glide", when = { race = "Skyborne" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    gryphons = {
      lines = { { id = "gr_default", text = "Paid for, every feather, and flown in over the mountains by a dwarf who sang the whole way. The birds have forgiven him, but I haven't." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    flying = {
      lines = {
        { id = "f_default", text = "River fog in the morning and smoke over Sunnyglade most evenings, and the birds hate both. Fly midday, and stay clear of the old tower; something there makes them shy.",
          fx = { learn = { "sunnyglade" } } },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    glide = {
      lines = { { id = "gl_default", text = "Downhill, maybe. Glide me up a cliff and I'll retire on the spot." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I learned to fly before I learned to swim, and Farholde's surrounded by water, so that's been an education." } },
    advice = { { id = "tp_ad", text = "Visit every roost you pass. The birds don't forget a face that brought them a treat." } },
    _none = { { id = "tp_none", text = "Can't help you there. I only know the sky and the birds in it." } },
  },
}

P:NPC {
  key = "alphonse", id = TODO_NPC("Alphonse Dumas"), name = "Alphonse Dumas",
  bible = "bibles/riverglades.md", role = "blacksmith", tier = "quest",
  communities = { "farholde" }, temper = { "taciturn" }, values = { "patient", "proud" },
  notices = { "kit", "craft" },

  greetings = {
    { id = "g_default", text = "Embers are hot, so don't touch." },
    { id = "g_busy", text = "I'm busy, but talk while I work." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and I'd guess something's broken." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Put it on the bench, and don't tell me what did it. I can see what did it." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A smith? Show me your hands. Hm, good; you can work the bellows." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Alphonse Dumas. I keep the Brotherhood shod and armed, though iron's short and coal's shorter. Patience I have plenty of." },
        { id = "h_mould", tags = { "news" }, when = { questActive = TODO_QUEST("Krol'dok Moulding") },
          text = "A key mould, ogre work, crude as a boot. Let me look at it." },
        { id = "h_key", when = { questActive = TODO_QUEST("Key Ingredients") },
          text = "I need thick leather and iron bars. I've got the fire, so you bring the rest." },
        { id = "h_key_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Key Ingredients"), days = 3 } },
          text = "That key's ugly, but it'll open their door all the same. Ugly works." },
      },
      again = { { id = "h_again", text = "What else?" }, { id = "h_again2", text = "Go on; the hammer's not listening." } },
      choices = {
        { text = "Show me what you've got.", next = "BUSINESS" },
        { text = "Why's iron so short?", next = "iron" },
        { text = "What will that key open?", next = "key",
          when = { any = { { questActive = TODO_QUEST("Key Ingredients") }, { questDone = TODO_QUEST("Key Ingredients") }, { questActive = TODO_QUEST("Krol'dok Moulding") } } } },
        { text = "How long have you worked this forge?", next = "forge" },
        { text = "Any advice for another smith?", next = "teach", when = { profession = "Blacksmithing" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    iron = {
      lines = { { id = "i_default", text = "Ships come rarely and the goblins charge like it's gold. The rest I melt down from what the cultists leave behind." } },
      choices = {
        { text = "Cultist steel? Any good?", next = "iron_twilight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    iron_twilight = {
      lines = { { id = "it_default", text = "Grey, soft, and it smells of something when it's hot. I don't like the smell, but I melt it anyway; their faith's harder than their blades." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    key = {
      lines = {
        { id = "k_default", text = "A door in Krol'dok, if the ogres cut the lock to match the mould, and ogres are lazy, so they usually do.",
          fx = { learn = { "krol_dok" } } },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forge = {
      lines = { { id = "f_default", text = "Long enough to know every sword in this keep by its ring. Ask Bertrand and he'll say I never complain, but he's wrong; I complain to the anvil." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    teach = {
      lines = { { id = "t_default", text = "Don't quench in a hurry. Everything that ever cracked on me cracked because I was in a hurry." } },
      choices = { { text = "Thank you.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A smith, and a smith's son, and that's the whole of it." } },
    advice = { { id = "tp_ad", text = "Oil your blade after the river. The damp here eats steel faster than cultists do." } },
    krol_dok = { { id = "tp_kroldok", text = "Ogre steel's thick and stupid, like ogres." } },
    _none = { { id = "tp_none", text = "Don't know, and don't need to." } },
  },
}
