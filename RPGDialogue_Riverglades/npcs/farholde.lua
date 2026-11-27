-- Farholde Keep: the Brotherhood of the Horse, twenty years holding the Riverglades. Voice: bibles/riverglades.md
local P = RPGDialogueAPI:Pack("rpgd.riverglades")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "demar", id = TODO_NPC("Demar Brant"), name = "Demar Brant", title = "Knight Commander",
  bible = "bibles/riverglades.md", role = "soldier", tier = "major",
  communities = { "farholde", "brotherhood_horse" }, temper = { "proud", "steady" }, values = { "loyal", "brave", "stern" },
  likesTone = "blunt",
  prejudice = { class = "WARLOCK", amount = 12, why = "Twenty years holding Farholde against the Twilight's Hammer and its summoners; he names his dead." },
  notices = { "class", "stormwind", "kit" },

  impression = {
    first = "He speaks of his dead by name.",
    third = "{name} met Knight Commander Demar Brant, who has held Farholde for the Brotherhood of the Horse through twenty hard years.",
  },

  greetings = {
    { id = "g_prejlock1", when = { prejudiced = true }, text = "The Hammer's summoners have killed more of my riders than the ogres have. You keep the same company, warlock, so you'll keep your distance in my keep." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "I buried twelve riders last winter, and every one of them died to something a summoner called up. Say what you need, and then get out of my sight." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "You've ridden for Farholde and come back with Hammer blood on you, not ours. I'll not call you a friend, but I'll stop calling you a warlock in front of the men." },
    { id = "g_default", text = "Farholde stands, for another day at least. Say what you need." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and good to see it. Most who leave the Riverglades never come back." },
    { id = "g_hero", when = { townStanding = { town = "farholde", min = 55 } }, text = "Make room for them, riders; they've bled for this keep." },
    { id = "g_distrust", when = { townStanding = { town = "farholde", max = -20 } }, text = "You. State your business, and keep your hands where my sentries can see them." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and Farholde still stands, though I've had names to add to my reports since you left." },
    { id = "g_away_long", when = { away = 60 }, text = "You've been away {away}, and I'd counted you among those the Riverglades kept, so it's good to be wrong for once." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown a good deal harder since you last stood on this wall, and I can see it in how you carry yourself. I'll count you as two swords now, which is more than Stormwind ever sent me." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Word on the wall is that you've done right by Farholde, and my riders don't praise anyone lightly, so you've earned it." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I hear you were caught in a lie in the keep, and I can't hold a wall with people I can't trust, so mend it, and quickly." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin, is it? The last one to walk these halls, Sir Howard, led the charge that broke the siege, so you've a great deal to live up to." },
    { id = "n_noble", cat = "stormwind", when = { origin = "human_minor_noble" },
      text = "You've the look of Stormwind money. Don't take it personally when my riders forget to bow." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You came over the passes in that? Get it to Alphonse, our smith, before you meet anything worse than the road." },
  },

  react = {
    { id = "r_mount", on = "mount", text = "Not inside the keep. Wheatley at the stables will see to the horse, and he'll take better care of it than you do." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "The Brotherhood has a use for anyone who stands on the wall. The cultists call on things in the river fog, and if your spirits can tell me what they are, I'll name you in my reports with the best of them." } },
      choices = {
        { text = "I'll stand on the wall, Commander, fog or no fog.", next = "BACK", reply = "Good. The fog does its worst at night, and I'd rather have a steady hand on the wall than a brave one.", fx = { align = { order = 1 } } },
        { text = "I'll hunt the fog on my own terms.", next = "BACK", reply = "Your own terms, then, but come back and tell me what you find. I'll not send riders after you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Knight Commander Demar Brant, of the Brotherhood of the Horse. Few adventurers find their way to Farholde, and fewer stay. We hold this keep with what Stormwind left us, which is nothing." },
        { id = "h_young", when = { band = { "Greenhorn", "Blooded" } },
          text = "You're young for this front. The cultists won't care, and neither will I, so long as you can hold a line." },
        { id = "h_mugg_before", when = { questBefore = TODO_QUEST("Eye of Mugg") },
          text = "My scouts found caves along the northwest ridge, and the ones who went in haven't come out. I need someone who comes back out." },
        { id = "h_mugg_active", when = { questActive = TODO_QUEST("Eye of Mugg") },
          text = "Krol'dok, then. Find whoever leads the ogres in those caves and bring me proof, and my riders get a quiet month, their first in twenty years." },
        { id = "h_mugg_recent", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Eye of Mugg"), days = 3 } },
          text = "I looked at that eye for an hour last night. It wasn't pleasant, but it was still the best hour I've had since the siege." },
        { id = "h_ryan_log", when = { questActive = TODO_QUEST("Field Marshal's Log") },
          text = "That's Marshal Ryan's hand on those pages, I'd know it anywhere. Give it here, and tell me where you found it." },
        { id = "h_ryan_search", when = { questActive = TODO_QUEST("Saving Marshal Ryan") },
          text = "Ryan's last reports point to a Twilight fortress in the west. Take his log with you and find him, because he's the best eyes this keep has." },
        { id = "h_ryan_dead", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Dying Wish"), days = 3 } },
          text = "Ryan kept his duty to the last breath, as I knew he would. I've hung his crest in the hall, and I'll write his memorial myself." },
        { id = "h_ryan_closure", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Delivering Closure"), days = 3 } },
          text = "You saw Abigail, then. Don't tell me what she said about me; I can guess, and she's earned the right to say it." },
        { id = "h_hero", when = { townStanding = { town = "farholde", min = 55 } },
          text = "The sentries talk about you at the gate, and I let them. It's good for morale, and morale's the one thing Stormwind can't refuse to send." },
        { id = "h_book", when = { bookRead = "A Wartorn Land and The Brotherhood" },
          text = "You've read Farholde's book. Then you know what this keep cost, and I won't have to tell you." },
        { id = "h_warm", when = { disposition = { min = 75 } },
          text = "There you are. The riders ask after you when you're gone a while, and I've stopped pretending I don't." },
        { id = "h_fern_resolved", tags = { "news" }, key = true, when = { thread = { id = "farholde_lost", state = "resolved" } },
          text = "Gray Dawnbright came up from the port, his first time in a year, and we didn't argue about Fern; we drank to her. I'm told that was your doing, so thank you, and don't make me say it twice." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "I walk the walls at night, a habit since the siege. The river's loud after dark, and I'll take that noise over silence, because silence was what the siege sounded like before they came." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. Ashe will want you for an hour of shop talk, and I'll want you after that for something more useful, like fire on the ridge." },
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "I know what you are, and the Hammer's summoners would know it too, because they deal in the same filth. Give me one reason, warlock, why I shouldn't put you out the gate." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "You again. My riders still mutter when you come in, but I've stopped telling them they're right. Speak your piece." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "I know what you are, warlock; the smell gives it away. The Hammer deals in the same dark, so you'll have to prove you're not halfway to joining them." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, this far from your own forests. The glades round Sunnyglade are sick with the Hammer's filth, and I'm told your kind takes that personally." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Twilight", min = 40 } }, text = "The patrols say the Twilight camps on the ridge are thinner this month, and the bodies they find have your work on them. Keep at it, and my riders might see the Sunnyglade road again before I'm grey." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman. Stormwind left us nothing, and now Ironforge sends me a shaman, so I'll not argue with what comes." },
        -- Opinion pass: word of what the player said to someone else at Farholde.
        { id = "h_o_patience", once = true, when = { gossip = { topic = "stormwind", stance = { "patience", "trust_crown" } } },
          text = "Word in the keep is you think Stormwind had its reasons for leaving us. You and Ashe can share a bench, then, and the dead in the courtyard can decide which of us is right." },
        { id = "h_o_common", once = true, when = { gossip = { topic = "horde", stance = { "common_cause", "useful" } } },
          text = "I hear you've been telling my riders the orcs across the river are some kind of ally. They burned Sunnyglade, and I'll thank you not to say it again inside these walls." },
        { id = "h_o_never", once = true, when = { gossip = { topic = "horde", stance = { "never", "hate" } } },
          text = "Sergeant Riftan says you've no more love for the Horde than he has. Good; the Riverglades could use a few more who remember." },
      },
      again = {
        { id = "h_again", text = "What else? The day's short and the Riverglades are long." },
        { id = "h_again2", text = "Go on." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Ask, then. I'm not sleeping anyway." },
      },
      choices = {
        { text = "This land looks like it's seen hard fighting.", next = "history" },
        { text = "You don't think much of Stormwind.", next = "stormwind" },
        { text = "You must have enemies on every side out here.", next = "enemy" },
        { text = "Tell me about the memorials in the courtyard.", next = "memorials" },
        { text = "The Brotherhood had paladins once.", next = "paladin", when = { class = "PALADIN" } },
        { text = "Stormwind left Westfall to rot too.", next = "westfall", when = { origin = "human_westfall_farmhand" } },
        { text = "My family sits in Stormwind's House of Nobles.", next = "noble", when = { origin = "human_minor_noble" } },
        { text = "There are dwarves in the Brotherhood?", next = "dwarves", when = { race = "Dwarf" } },
        { text = "Mugg is dead. What now?", next = "after_mugg", when = { questDone = TODO_QUEST("Eye of Mugg") } },
        { text = "Let me bless your riders before they ride out.", next = "priest_bless", when = { class = "PRIEST" } },
        { text = "Put me to work, Commander.", next = "BUSINESS", fx = { affinity = 1, standing = { farholde = 1 } } },
        { text = "A warrior's sword, Commander, if the Brotherhood will have it.", next = "xwarrior", when = { class = "WARRIOR" } },
        { text = "One of your memorials names a Ravenholdt agent, Fern.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "I scout. Where do you need eyes?", next = "xhunter", when = { class = "HUNTER" } },
        { text = "A mage can't be much use to a cavalry order.", next = "xmage", when = { class = "MAGE" } },
        { text = "Will the Brotherhood take help it might rather not ask about, Commander?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "The Hammer seems to have spoiled these glades.", next = "xdruid", when = { class = "DRUID" } },
        { text = "Does the Brotherhood have a use for a shaman, Commander?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
        { text = "Lothar gave his life for the Alliance. You could rejoin it.", next = "BACK", reply = "Rejoin it? Stormwind left us here and drew a line on its maps. When it remembers us, I'll remember it.", fx = { align = { order = 2 }, affinity = -1 } },
        { text = "Then the Brotherhood's in good company.", next = "BACK", reply = "We are, and every rider here knows it. His name is the one thing Stormwind can't take from us.", fx = { align = { order = -2 }, affinity = 1 } },
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
        { id = "sb_default", text = "I'll take it back, or the next commander will. Roderick held a bridge there with one arm to buy us a night, and the Brotherhood doesn't forget a debt like that." },
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
        { text = "Does everyone in Farholde feel the same?", next = "stormwind_ashe" },
      },
    },
    stormwind_defend = {
      lines = { { id = "sd_default", text = "It had its own war, they'll tell you, but we were its war once. Say that to the sentries; they'll explain it better than I can, and louder." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stormwind_agree = {
      lines = { { id = "sa_default", text = "Unforgivable's a big word. I use smaller ones, and I mutter them every morning on the wall." } },
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
        { id = "eh_default", text = "Cultists and ogres, in Sunnyglade and the hills and the caves of Krol'dok, and they take prisoners. I stopped asking what for; the answers kept me awake.",
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
      lines = { { id = "ep_default", text = "Ask me after they've left my riders alone for a year. I'll wait." } },
      choices = {
        { text = "Peace has to start somewhere.", next = "BACK", reply = "It does, and when they stop burning our fields, I'll be the first one at the table. Until then, I'll keep the gate shut.", fx = { align = { light = 1 }, opinion = { peace = "for" } } },
        { text = "There won't be peace out here, Commander.", next = "BACK", reply = "You've been here long enough, then. I'm sorry to hear it, but I'm not surprised.", fx = { align = { order = 1 }, opinion = { peace = "against" }, affinity = 1 } },
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
        { text = "She might have lived, with a little luck.", next = "fern_lived" },
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
      lines = { { id = "is_default", text = "I did, and I wrote her upright with her banner high, because I wanted the words to be as true as she was. Ask me something else." } },
      choices = {
        { text = "She sounds remarkable.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Tell me about Isolde herself, Commander, not the banner.", tag = "Persuade", next = "isolde_true",
          check = { pass = { any = { { disposition = { min = 65 } }, { trait = "brave" }, { questDone = TODO_QUEST("Eye of Mugg") } } } },
          fail = { next = "isolde_no", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    paladin = {
      lines = {
        { id = "pa_default", text = "We did. Sir Howard the Stout rode out with the Light on him and didn't come back. If you're asking whether there's room for another, there's always room." },
      },
      choices = {
        { text = "I'd be honored.", next = "BACK", reply = "The honor's ours, and I mean that. Sir Howard would have liked you, I think, though I'd rather you came back from the field than end up a name we say at supper.", fx = { affinity = 2, standing = { farholde = 2 }, align = { light = 1 } },
          journal = { first = "Demar Brant told me the Brotherhood always has room for a paladin. Sir Howard's memorial is in the courtyard.",
                      third = "{name} told Knight Commander Brant they'd stand with the Brotherhood of the Horse." } },
        { text = "I'm not looking to die gloriously.", next = "BACK", reply = "Good. We've enough glorious dead on the wall already, and I'd rather have you alive on it.", fx = { align = { honor = -1 }, trait = { cautious = 1 } } },
      },
    },
    westfall = {
      lines = {
        { id = "wf_default", text = "Westfall too? Then you know the shape of it. Stormwind looks at a map, draws a line, and lives on its side of it." },
      },
      choices = {
        { text = "Someone should make them answer for it.", next = "BACK", reply = "They should, and nobody will. Write it down anyway, so somebody remembers.", fx = { affinity = 2, align = { order = -2 }, opinion = { stormwind = "abandoned_its_own" } } },
        { text = "Stormwind had good reasons for drawing its lines where it did.", next = "BACK", reply = "Perhaps they did, and perhaps one day they'll tell me what they were. I'm still waiting.", fx = { align = { order = 2 } } },
        { text = "Westfall's my fight. This one's yours.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    noble = {
      lines = {
        { id = "nb_default", text = "Then tell them we're still here, at dinner, between courses. Watch their faces, and come back and describe them to me." },
      },
      choices = {
        { text = "I'll tell them.", next = "BACK", reply = "Good. Watch their faces when you say it, and tell me what you see.", fx = { affinity = 2, align = { honor = 1 } },
          journal = { first = "Promised Demar Brant I'd tell the House of Nobles that Farholde still stands.",
                      third = "{name} promised Knight Commander Brant to carry word of Farholde to the House of Nobles." } },
        { text = "They'd only laugh, so I won't waste my breath.", next = "BACK", reply = "They might, and I'd not blame you. But it would do me good to hear they'd been made to listen.", fx = { align = { honor = -1 }, affinity = -1 } },
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
      lines = { { id = "pb_default", text = "Sister Rowland blesses them when she can leave the chapel, which is rarely, so yes. Come to the gate at dawn; they'll stand straighter for it, and some will come back because of it." } },
      choices = {
        { text = "At dawn, then.", next = "BACK", reply = "At dawn, then, and I'll make sure the gate watch is awake for it. Sister Rowland will be glad to hear she's not the only one carrying that burden.", fx = { affinity = 3, standing = { farholde = 2 }, align = { light = 1 } } },
        { text = "They'd stand straighter for a hot meal than a blessing.", next = "BACK", reply = "Sister Rowland would agree with you, and so would they. Do both, if you can.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    isolde_true = {
      lines = {
        { id = "it_default", text = "She rode at Howard's left and argued with me in every council we ever held, and she was right more often than I ever told her. I wrote the tribute myself because nobody else would have got her right, and I haven't read it since the day they set the stone." },
        { id = "it_paladin", when = { class = "PALADIN" },
          text = "She'd have liked you, paladin; she always said the Light rode better with a lance behind it. She argued with me in every council and was right more often than I told her, and I wrote her tribute myself because no one else would have got her right." },
      },
      choices = {
        { text = "Thank you for telling me.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    isolde_no = {
      lines = {
        { id = "in_default", text = "I said ask me something else, and I meant it. The stone says everything that needs saying." },
        { id = "in_rogue", when = { class = "ROGUE" },
          text = "Isolde's not a story for a stranger who walks that quietly. Ask me something else, and mind the gate on your way past it." },
      },
      choices = {
        { text = "As you wish, Commander.", next = "BACK" },
      },
    },
    xwarrior = {
      big = true,
      lines = { { id = "xwa_default", text = "The Brotherhood will have it and put it on the wall by nightfall. Lothar was our Armsman once, and he'd have told you what I'll tell you: a sword is worth what the soldier beside you can trust it to do." } },
      choices = {
        { text = "Then trust it. I don't break ranks.", next = "BACK", reply = "Good. The wall holds because nobody breaks ranks, and Lothar would say the same.", fx = { affinity = 2, align = { order = 1 }, standing = { farholde = 1 } } },
        { text = "I fight best on my own, Commander.", next = "BACK", reply = "Then fight on your own, but within sight of the wall. I'll not lose another to the fog.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Lothar was one of yours?", next = "lothar" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xro_default", fx = { learn = { "fern_crimsonleaf" } },
        text = "Fern Crimsonleaf, our lead agent, who went into the Horde camp the night before Howard's charge and killed their leaders in the dark. We never saw her again. I've never cared much for your trade, but I've never once said a word against it since that night." } },
      choices = {
        { text = "What happened to her?", next = "fern" },
        { text = "Some work only gets done in the dark.", next = "BACK", reply = "It does, and Fern did it for us. I'll not forget it, and I'll not say a word against your trade.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd rather win it Howard's way, in the open.", next = "BACK", reply = "Howard's way, then, and I hope it ends better for you than it did for him. Ride carefully.", fx = { affinity = 1, align = { honor = 1 } } },
      },
    },
    xhunter = {
      lines = {
        { id = "xhu_default", text = "Everywhere, and nowhere I can spare a rider. Rosalind Ashwood was our lead scout, with eyes as keen as an elf's, and I haven't had one like her since. Walk the Bristle Hills for me and tell me what the gnolls are doing." },
        { id = "xhu_human", when = { race = "Human" },
          text = "A Stormwind hunter with a beast at heel. Rosalind Ashwood, our old lead scout, would have liked you; she always said the kingdom wasted its woodsmen. Walk the Bristle Hills for me and tell me what the gnolls are doing." },
      },
      choices = {
        { text = "Who was Rosalind?", next = "memorials" },
        { text = "I'll walk the hills.", next = "BACK", fx = { affinity = 1, standing = { farholde = 1 } } },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmg_default", text = "Plenty of use, as it happens. Alden Amberhall rode in Howard's charge with fire in both hands, and the Horde prisoners were still talking about it a year later. Put that fire on Krol'dok's ridge, and I'll stop grumbling about Dalaran for a week." },
      },
      choices = {
        { text = "I'll burn whatever you point me at, Commander.", next = "BACK", reply = "Good. Alden would like you, I think, and the cultists won't.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll choose my own targets, thank you.", next = "BACK", reply = "Choose well, then, and choose the Hammer if you can. They've earned it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlk_default", text = "Take it? I'd take a gnoll with a crossbow if it shot at the Hammer. But Sister Rowland has enough on her hands, so whatever answers to you stays outside my walls, and if I hear it's been whispering to my riders, you'll go out after it." },
      },
      choices = {
        { text = "Fair terms. It stays outside the walls.", next = "BACK", reply = "Good. Sister Rowland will thank you, and so will her patients.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "What follows me goes where I go, Commander.", next = "BACK", reply = "Then it goes where you go, but it stays out of the chapel. Those are my terms.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = {
        { id = "xdr_default", text = "Nothing grows right around Sunnyglade any more, and Gretchen's gryphons won't fly near the old mage tower there. Heal it if you can, druid, though I'd rather you helped me cut out the rot first." },
      },
      choices = {
        { text = "I'll mend what they've spoiled. The land comes first.", next = "BACK", reply = "Then you'll have my thanks, and Gretchen's too, if her birds fly again.", fx = { align = { light = 1 } } },
        { text = "Burn the rot out. The land will forgive us.", next = "BACK", reply = "Fire might do it, and I'd not stop you. Just mind the farms.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "The Brotherhood doesn't hear much of that from outside these walls, and I'll pass it on to the riders, who earned it. You've better eyes than most of Stormwind's court." },
        { id = "s2", text = "Twenty years I've held this keep, and I can count on one hand the visitors who've said as much. I thank you for it, and I don't thank people lightly." },
      },
      fail = {
        { id = "f1", text = "Stormwind sends me fine words every season in place of steel, so I've had my fill of them. If you think well of Farholde, show it on the wall." },
        { id = "f2", text = "I'm too old a soldier to be flattered into anything, and it irritates me to watch someone try. Say your business." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Hah! My riders used to talk to me that way, before twenty years of funerals made them careful. I can use someone who isn't afraid to speak up in my hall." },
        { id = "s2", text = "You've gall, I'll grant you, and gall holds a gate better than good manners ever did. Very well, you have my attention." },
      },
      fail = {
        { id = "f1", text = "There are better men and women than you under the stones in that hall, and you'll not make sport of what they died holding. Guard your tongue in my keep." },
        { id = "f2", text = "That's the sort of talk I'd expect from a Stormwind courtier who's never smelled a battlefield. I had thought better of you, and I'll not make that mistake twice." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "Stand down; you've made your point. I can see you'd follow through, and I haven't the riders to spare on a brawl in my own hall, so speak." },
        { id = "s2", text = "There's something in your eye I last saw across a battlefield, and I've learned to take it seriously. I'll hear you, though I'll remember how you asked." },
      },
      fail = {
        { id = "f1", text = "The Horde came to this gate with an army and the Hammer came with worse, and Farholde is still standing. You're one {class} in my hall with my sentries at your back, so think again." },
        { id = "f2", text = "I don't frighten, and I don't bargain with those who try it. One more word in that tone and you'll finish this talk from outside the gate." },
      },
    },
  },
  blurts = {
    { id = "bl1", text = "The Hammer uses lights across the river to draw my sentries out at night. Half the riders on our memorial followed one." },
    { id = "bl2", text = "There are fewer riders in Farholde than the rolls in Stormwind say, and I've stopped correcting the rolls. If the Hammer knew how thin we are, they'd already be at the gate." },
    { id = "bl3", text = "Whoever leads in Krol'dok wants the mage tower at Sunnyglade, and I don't know why. That worries me more than all the ogres in the caves." },
  },
  confides = {
    { id = "cnf_1", text = "The Twilight's Hammer move through the northwest caves in the dark and come out near the river after midnight. If you want to catch them in the open, wait by the water." },
    { id = "cnf_2", text = "Alphonse at the smithy can cast a key from a Krol'dok moulding if you bring him thick leather and iron bars. He'll grumble, but he's never yet turned down a puzzle." },
    { id = "cnf_3", text = "Gray Dawnbright drinks at the port because he can't face Fern's stone here. Leave him his story about her, because it's all that's holding him together." },
  },
  topics = {
    grievance = {
      { id = "gv1", text = "I've buried better soldiers than you and liked them more. You haven't given me a reason to change my mind." },
      { id = "gv_prej", when = { grudge = "prejudice" }, text = "Every summoner the Hammer ever sent against this keep cost me riders, and I name them all. Yours is the same craft, and I'll not forget it." },
      { id = "gv_wronged", when = { grudge = "wronged" }, text = "You spoke to me in my own keep as if the Brotherhood were a band of farmers on borrowed horses. Twenty years of graves say otherwise." },
      { id = "gv_values", when = { grudge = "values" }, text = "The Brotherhood rides for each other first and glory last. You've shown me you have that the wrong way round." },
    },
    amends = {
      { id = "am1", text = "Ride for Farholde, bleed for it, and come back. Do that enough times and I'll stop looking at you sideways." },
      { id = "am_prej", when = { grudge = "prejudice" }, text = "Kill Hammer summoners, and bring me proof of it. That's the only argument for your craft I'll ever accept." },
    },
    spite = {
      { id = "sp1", text = "I think you'd have opened the gate for Howard and called it good sense. I've no use for anyone who'd do that." },
      { id = "sp_prej", when = { grudge = { worst = "prejudice" } }, text = "I think one day your own summonings will turn on you the way the Hammer's turned on my riders. I'll not ride out to save you." },
    },
    knows = {
      { id = "tp_knows", text = "Every report from the glades crosses my table before it reaches anyone else. Ask, and I'll tell you what's worth knowing." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } },
        text = "Ask, then, and make it quick; I've riders to see to, and I haven't decided about you yet." },
    },
    background = { { id = "tp_bg", text = "The Brotherhood is my story, twenty years of it in these glades, and the rest isn't worth the telling." } },
    advice = { { id = "tp_ad", text = "Ride in pairs, sleep in the keep, and never follow a light across the river at night. The Hammer uses lights." } },
    brotherhood_horse = { { id = "tp_brotherhood", text = "Older than the First War, older than Stormwind's patience. We ride, we hold, and we don't wait to be asked." } },
    siege_of_farholde = { { id = "tp_siege", text = "We held the gate until Howard opened it. Read the memorials; they say it better than I do." } },
    sunnyglade = { { id = "tp_sunnyglade", text = "Sunnyglade is ours. It won't be today, but it's ours all the same." } },
    twilights_hammer = { { id = "tp_hammer", text = "Light-forsaken, every one. I don't need to know what they worship to know it should burn." } },
    krol_dok = { { id = "tp_kroldok", text = "Where they ran after the siege, and where they plan the next one." } },
    fern_crimsonleaf = { { id = "tp_fernnext", text = "Our knife in the dark, and the best of us. Ask what you came to ask.", next = "fern" }, { id = "tp_fern", text = "She's dead, and a hero, and dead all the same. Don't let Gray tell you different." } },
    defias = { { id = "tp_defias", text = "Stormwind's own mess, on its own doorstep, and even then they couldn't be bothered. I'm not surprised." } },
    bolvar = { { id = "tp_bolvar", text = "Lord Bolvar holds Stormwind for a boy king, and he holds it tight; he hasn't spared a single rider for the Riverglades. I'll respect him the day he sends us more than letters." } },
    varian = { { id = "tp_varian", text = "King Varian went missing, and Stormwind's been run by nobles and committees ever since. If he were here, I'd tell him to his face what his kingdom has done to mine." } },
    prestor = { { id = "tp_prestor", text = "Lord Prestor has the court's ear and the Regent's patience, and he's never once looked east of Stormwind's walls. A noble who's never smelled a battlefield shouldn't decide who gets steel." } },
    second_war = {
      { id = "tp_second_war", text = "The Horde came to Farholde's gate in the old war and found the Brotherhood waiting for them. We broke them then, and we'll break whoever comes next, Horde or cult or anything else." },
      { id = "tp_second_war2", when = { faction = "Horde" }, text = "Your people came to Farholde's gate once, and we sent them back down the road in pieces. I'll remember that, so you'd better give me reason to forget it." },
    },
    thrall = { { id = "tp_thrall", text = "The orcs have a new warchief who's said to be honorable, and I'll believe that when his warriors stop raiding my loggers. Until then, they're invaders in my glades, whatever their chief says." } },
    blackrock = { { id = "tp_blackrock", text = "The Blackrock clan led the Horde against us in the old war, and their remnants still crawl about the mountains to the west. I'd wager some of the cult's muscle comes from that stock." } },
    holy_light = {
      { id = "tp_holy_light", text = "The Light didn't hold Farholde's walls, my riders did, and I'll thank the Light when it starts carrying a lance. Sister Rowland would scold me for saying that, and she'd be right to." },
      { id = "tp_holy_light2", when = { class = "PALADIN" }, text = "A paladin in the Riverglades is worth ten soldiers who stayed home in Stormwind. Stand with my riders, and the Light will have more to do here than it's ever had." },
    },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons hold the mountain to the west, and they've no love for anyone. I keep a watch on that side, though they haven't troubled us yet." } },
    _gated = {
      { id = "gt1", text = "That's Brotherhood business, and you've not yet stood a watch on my wall. Ask me again when you have." },
      { id = "gt2", text = "I don't discuss that with those I haven't taken the measure of, and I'm still taking yours." },
    },
    _none = { { id = "tp_none", text = "If it isn't in the Riverglades, it isn't my concern. Ask Ashe; she reads." } },
    regard = {
      { id = "rg_1", text = "I think you're the kind of rider the Brotherhood used to have plenty of and doesn't anymore. I'd put you on the wall tonight without a second thought." },
      { id = "rg_2", text = "You came to the Riverglades when Stormwind wouldn't, and you stayed when it got ugly. That's the only measure I've ever trusted." },
      { id = "rg_order", when = { alignment = { axis = "order", min = 30 } }, text = "You keep your word and hold your post without anyone standing over you. Give me ten like you and I'd have our banner over Sunnyglade by autumn." },
      { id = "rg_pal", when = { class = "PALADIN" }, text = "A paladin who'll ride east of Stormwind's walls is worth a company of them that won't. I told Rowland so, and she agreed with me, which is rare enough to mention." },
    },
    confide = {
      { id = "cf_1", text = "There are nights I sit with the rolls and count who's left, and the number gets smaller even when nobody's died. Men slip away to Stormwind, and I can't say I blame them." },
      { id = "cf_2", text = "Ashe thinks I don't know she reads her father's notes all night. I know, and I leave lamp oil by her door, and neither of us has ever said a word about it." },
    },
    trust = {
      { id = "tr_1", text = "Ashe, before anyone, even when she's wrong about Stormwind. Riftan, because he's held the front longer than some of my riders have been alive, and Cady, because she sees what's coming before the rest of us hear it." },
      { id = "tr_2", text = "Sister Rowland, with your life and anything else you've got. Don't trust anyone who rides in from Stormwind promising help, because I've had twenty years of those." },
    },
    watchout = {
      { id = "wo_1", text = "Watch the ridge to the north, because the orcs at Rog'mar count our riders from it. I let them count, but I never let them see the stables." },
      { id = "wo_2", text = "Stay out of the caves along the northwest mountains unless you've friends at your back. I've lost scouts in there who were better than either of us." },
    },
    worries = {
      { id = "wy_1", text = "That I'll be the last Knight Commander of Farholde, and that I'll be remembered as the one who lost it. Twenty years, and that's what keeps me up at night." },
      { id = "wy_2", text = "Whatever the Hammer wants in Sunnyglade's tower. A cult doesn't dig that hard for nothing, and I've no mage but Ashe to tell me what it is." },
    },
    hopes = {
      { id = "hp_1", text = "To ride into Sunnyglade at the head of the Brotherhood and raise our banner over it again. After that they can bury me with the others, and I'll go content." },
      { id = "hp_2", text = "That Stormwind remembers us one day and sends riders instead of letters. I've stopped expecting it, but I haven't stopped hoping, damn it all." },
    },
    favor = {
      { id = "fv_1", text = "Next time you're in Stormwind, tell anyone who'll listen that Farholde still stands. Tell them who's holding it, and what it's cost." },
      { id = "fv_2", text = "Read the memorials in the hall, every name, and remember one or two of them. That's all the dead ask of the living." },
    },
    friendship = {
      { id = "fr_1", text = "You're Brotherhood in all but the oath, {name}, and I count you a friend. I don't say that to many, because I've buried most of the ones I said it to." },
      { id = "fr_2", text = "I do, and there's a place at my table whenever you ride back through the gate. That's not something I offer lightly." },
      { id = "fr_values", when = { fondness = "values" }, text = "You're brave and you're loyal, and that's all the Brotherhood ever asked of anyone. Friend, then, and I'll stand by it." },
    },
    never_told = {
      { id = "nt_1", text = "I wanted to ride in the King's own guard once, and Stormwind turned me down for a lord's son. I came east angry, and I've been angry ever since." },
      { id = "nt_2", text = "I stopped writing to Stormwind for help two winters ago, though I tell my riders the letters still go out every month. Better they think the city's deaf than know I've stopped asking." },
    },
  },
}

P:NPC {
  key = "ashe", id = TODO_NPC("Ashe Amberhall"), name = "Ashe Amberhall",
  bible = "bibles/riverglades.md", role = "scholar", tier = "major",
  communities = { "farholde", "brotherhood_horse" }, temper = { "sharp", "chatty" }, values = { "curious", "loyal" },
  likesTone = "polite",
  notices = { "arcane", "curse" },

  impression = {
    first = "Underneath all the books she is grieving, and hiding it well.",
    third = "{name} met Ashe Amberhall, the Knight Commander's advisor at Farholde, a quick-tongued mage who keeps her father's notes.",
  },

  greetings = {
    { id = "g_default", text = "Visitors! Sit, if you can find a chair that isn't holding a book." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, because I've had a thought since you left. Several, actually." },
    { id = "g_mage", when = { class = "MAGE" }, text = "Another mage! Please tell me you've read something recently." },
    { id = "g_away", when = { away = 14 }, text = "You're back, after {away}! I've had thoughts since you left, dozens of them, and I'm afraid you're going to hear most of them." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown so much since you last sat in that chair, and I've only grown more books, which seems an unfair trade. Sorry, that sounded bitter, and I meant it kindly." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I hear you talked someone round in the keep, which I've never managed with anyone here, because I talk too fast and they stop listening, so will you tell me how you did it?" },
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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They say the orcs gave it up for warlock magic and Thrall brought it back, and they say nothing at all about dwarves. If you'll tell me what the earth sounds like here, I promise not to write it all down." } },
      choices = {
        { text = "Write it all down, Ashe. Somebody in Stormwind should have to read it.", next = "BACK", reply = "I will, though half the keep already thinks I write too much. I'll send a copy south and see if anyone opens it.", fx = { align = { honor = 1 } } },
        { text = "Keep it to yourself, Ashe. The keep's jumpy enough already.", next = "BACK", reply = "You might be right, and the Brotherhood keeps enough secrets already. I'll keep this one closer.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Ashe Amberhall, advisor to the Knight Commander. I answer visitors' questions about Farholde. We get so few visitors that I'm out of practice, and likely to say too much, as my father always warned me." },
        { id = "h_satchel", tags = { "news" }, when = { questActive = TODO_QUEST("Lingering Essence") },
          text = "Sergeant Riftan sent you with those trinkets? Put them down, but not on that table, on the stone one, and then step back, please." },
        { id = "h_satchel_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Lingering Essence"), days = 3 } },
          text = "The trinkets Riftan sent have been humming at night, so I've moved my bed. I haven't moved the trinkets; I'm not a fool." },
        { id = "h_mugg", tags = { "news" }, when = { questRecent = { TODO_QUEST("Eye of Mugg"), days = 3 } },
          text = "Since you killed Mugg, Demar smiled at breakfast, actually smiled, and I very nearly sent for Sister Rowland." },
        { id = "h_notes", when = { metBefore = true, timeOfDay = "night" },
          text = "I was reading my father's notes. His handwriting was dreadful. I'm the only one alive who can read it, which I suppose makes them mine now." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior! Demar will be delighted, and you'll find me far less useful than he is, unless you'd like to know who carved the thing that's trying to kill you, which you really should." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! I have a hundred questions about how the Light actually works, and you probably can't answer any of them, can you? Nobody ever can; they just say 'faith' and look at me kindly." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter, with a companion! Please don't let it near the stone table; the cult's trinkets on it upset animals, which is a sentence I only learned to say this year." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You came in very quietly, which is either good manners or professional habit, and I'm going to assume manners." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Sister Rowland will be so relieved, and so will I, because there's a thing on my stone table I'd like someone holy to look at, from a sensible distance." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! I've read about the Cenarion Circle, though only what the kaldorei let humans write down, which I suspect was the boring half." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Oh, a dwarf shaman! I've read about the orcs' shamans and the tauren's, but never a dwarf's, and I'm sorry, I'm already writing notes." },
      },
      again = {
        { id = "h_again", text = "What else? Stop me if I wander." },
        { id = "h_again2", text = "Yes? I've lost my place anyway." },
        { id = "h_again3", text = "Go on. I'll try to answer in under a minute, though I won't manage it." },
      },
      choices = {
        { text = "Tell me about Farholde.", next = "farholde" },
        { text = "Who was your father?", next = "father" },
        { text = "The Twilight's Hammer seems busy around here.", next = "hammer" },
        { text = "Is there anything at Sunnyglade worth a scholar's eye?", next = "tower" },
        { text = "Shop talk, then. What are you working on?", next = "shop", when = { class = "MAGE" } },
        { text = "You've read about my people?", next = "skyborne", when = { race = "Skyborne" } },
        { text = "The Hammer's magic must feel close to mine, Ashe.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "Riftan says you're a pain.", next = "riftan", when = { heardLine = "riftan.a_pain" } },
        { text = "Gnomeregan had libraries too, once.", next = "xgnome", when = { race = "Gnome" } },
        { text = "Can your magic help a soldier, or only a scholar?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Does the Light do anything to the Hammer's curios?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Animals seem to shy away from those trinkets.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Nobody would notice if one of those curios went missing.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What's on the stone table that needs a priest?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What would you like to know about the Circle?", next = "xdruid", when = { class = "DRUID" } },
        { text = "What have your books said about shamans, Ashe?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Thank you, Ashe.", next = "END" },
      },
    },

    farholde = {
      big = true,
      lines = {
        { id = "fa_default", text = "When the Horde took these lands in the First War, Stormwind judged them lost and spent its soldiers at home. I'd have done the same, and I hate that I would." },
      },
      choices = {
        { text = "But you stayed.", next = "farholde_stayed" },
        { text = "Demar calls that cowardice.", next = "farholde_demar", when = { heardLine = "demar.s_default" } },
        { text = "So what should Farholde do now?", next = "fa_ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farholde_stayed = {
      lines = {
        { id = "fs_default", text = "It's our home. That isn't strategy, it's stubbornness with a banner on it, and Demar is the man to win a war like that.",
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
        { text = "He's right. Stormwind failed you.", next = "BACK", reply = "He is, and he'd never say so, which is why I do. Thank you for agreeing.", fx = { align = { order = -1 }, opinion = { stormwind = "abandoned_its_own" } } },
        { text = "Stormwind made the sensible choice, and you know it.", next = "BACK", reply = "Sensible, perhaps, but sensible men don't watch their friends ride out. I'd still hold it against them.", fx = { align = { order = 1 }, affinity = 1 } },
      },
    },
    -- Opinion pass: Ashe asks what the player would have Farholde do about the crown.
    fa_ask = {
      big = true,
      lines = {
        { id = "fq_default", text = "That's the question, isn't it, and I've been asking it of everyone who comes through the gate. You've walked Stormwind's streets more recently than I have, so tell me plainly: do we keep writing to the crown, or stop waiting for it?" },
        { id = "fq_mage", when = { class = "MAGE" }, text = "That's the question, and I've been asking it of everyone. You'll know how Dalaran thinks, so give me your view: do we keep writing to the crown, or try someone who still reads letters?" },
      },
      choices = {
        { text = "Keep writing. Lord Bolvar would help if the nobles let him.", next = "fa_ask_bolvar", fx = { opinion = { bolvar = "trust", stormwind = "patience" }, align = { order = 1 }, affinity = 1 } },
        { text = "Stop waiting. Stormwind forgot you twenty years ago.", next = "fa_ask_forgot", fx = { opinion = { stormwind = "abandoned_its_own" }, align = { order = -1 } } },
        { text = "Write to the Kirin Tor instead. They answer their letters.", next = "fa_ask_kt", when = { class = "MAGE" }, fx = { opinion = { kirin_tor = "trust" }, trait = { curious = 1 } } },
        { text = "The Riverglades are yours. Hold them yourselves.", next = "fa_ask_hold", fx = { opinion = { rg_farholde = "self_reliant" }, trait = { brave = 1 } } },
        { text = "I'd rather not stand between you and Demar.", next = "BACK" },
      },
    },
    fa_ask_bolvar = {
      lines = { { id = "fqb_default", text = "That's what I tell Demar, and he looks at me as though I'd suggested we surrender the keep. You may be right about the regent, mind; it's the nobles I'd never trust with a pen." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fa_ask_forgot = {
      lines = { { id = "fqf_default", text = "You sound like Demar, which I suppose means he'll like you. Twenty years is a long time to wait, I know, and I've been waiting less of it than he has." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fa_ask_kt = {
      lines = { { id = "fqk_default", text = "My father would have said the same, and Dalaran was his home before this was. I may write to them after all; at worst they'll send a letter back explaining at length why they can't help." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fa_ask_hold = {
      lines = { { id = "fqh_default", text = "We have been, for twenty years, and it's cost us half the names on those memorials. But you're right that nobody will hold them for us, and I'd sooner hear that than another promise." } },
      choices = { { text = "Something else.", next = "BACK" } },
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
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Why do you think you came back, and he didn't?", tag = "Persuade", next = "father_why_me",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "MAGE" }, { trait = "kind" } } } },
          fail = { next = "father_not_now", fx = { affinity = -1 } } },
      },
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
        { id = "hm_default", text = "Busy collecting things: bones, stones, carved figures that hum when you aren't looking. Sergeant Riftan sends me the ones he takes off their dead, and I'd like to know what they're for before they finish doing it.",
          fx = { learn = { "twilights_hammer" } } },
      },
      choices = {
        { text = "Those things must be for something.", next = "hammer_for" },
        { text = "Is it safe, keeping them here?", next = "hammer_safe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hammer_for = {
      lines = { { id = "hf_default", text = "Listening, I think. To what, I don't know, and I'd like to keep not knowing a while longer. That's the first unscholarly thing I've ever said out loud." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    hammer_safe = {
      lines = { { id = "hs_default", text = "No, and I'll thank you to ask me something else." } },
      choices = { { text = "Ha. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    tower = {
      lines = {
        { id = "t_default", text = "The old mage tower. The Horde spared it to learn how our magic worked, and now the Hammer sits in it. I'd give a great deal for an hour in that tower, and rather less to be carried out.",
          fx = { learn = { "sunnyglade" } } },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    shop = {
      lines = { { id = "sh_default", text = "Wards against the cult trinkets Riftan sends me, and a lamp that doesn't need oil, because Farholde's out of oil. What do you work on?" } },
      choices = {
        { text = "Frost, because it's honest.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "Fire, because it's satisfying.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
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
        { text = "It's a tool, Ashe. Like yours.", next = "warlock_tool" },
        { text = "Fair.", next = "BACK" },
      },
    },
    warlock_tool = {
      lines = { { id = "wt_default", text = "Mine doesn't talk back, but the Hammer's trinkets do, and I suspect yours does too. I'll trust you, for now. Demar won't, so keep your little friend out of his sight." } },
      choices = {
        { text = "What I keep answers to me, and I'm not ashamed of it.", next = "BACK", reply = "Then you're braver than me. I'll keep mine in a box, and you keep yours on a leash.", fx = { align = { light = -1 } } },
        { text = "I'd be rid of it, if the power came any other way.", next = "BACK", reply = "I'm glad to hear it. I'd be rid of mine too, if I knew how.", fx = { align = { light = 1 } } },
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
    father_why_me = {
      lines = {
        { id = "fwm_default", text = "I don't know, and that's the honest answer, which is the worst kind. The dragon took everyone in that camp but me, and I've read every page of my father's notes since, looking for the reason it passed me by, and now I'm babbling, so I'll stop." },
        { id = "fwm_mage", when = { class = "MAGE" },
          text = "You'd think a student of a student of Antonidas could work it out, wouldn't you? The dragon took everyone but me, and I've read every line of my father's notes looking for a reason it passed me by, and I haven't found one, and I'm not sure I want to." },
      },
      choices = {
        { text = "Maybe there isn't a reason. You're here anyway.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    father_not_now = {
      lines = {
        { id = "fnn_default", text = "That's not a question I answer before supper, or after it, really. Ask me about the Hammer's curios instead; I'm much better company on that subject." },
        { id = "fnn_warlock", when = { class = "WARLOCK" },
          text = "Not to someone who smells faintly of sulfur, I'm afraid, however politely you ask. Ask me about the Hammer's curios instead." },
      },
      choices = {
        { text = "Of course.", next = "BACK" },
      },
    },
    xgnome = {
      lines = {
        { id = "xgn_default", text = "Oh, don't, I'll cry; I've read the catalogues, or the bits that got out, and there were treatises in there nobody's ever copied. Did you save anything? Even one book, even a page?" },
        { id = "xgn_student", when = { origin = "gnome_last_student" },
          text = "You studied there? Then you're a library yourself, whether you like it or not, and I want to hear everything you can still remember, slowly, while I write." },
      },
      choices = {
        { text = "A few pages. I'll show you sometime.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Nothing, now that it's gone.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
    xwarcl = {
      big = true,
      lines = {
        { id = "xwc_default", text = "Both, if the soldier listens. The Hammer's casters carry little bone fetishes on cords, and if you cut the cord before the chant finishes, the spell falls apart, or I think it does; I've only seen it twice. Riftan says hitting them works too, and he's not wrong, just unscientific." },
      },
      choices = {
        { text = "I'll test your theory and report back.", next = "BACK", reply = "Please do, and write it all down. The more we know about those fetishes, the better.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Hitting them works. I'll keep it simple.", next = "BACK", reply = "Simple works, I'll grant you. Just bring me the fetish after, if it's still in one piece.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = {
        { id = "xpa_default", text = "It does something. Riftan's lads stopped talking in their sleep after Sister Rowland prayed over them, and the figures went quiet for a night, and then they started humming again, louder, as if they'd been insulted. I wrote that down and underlined it twice." },
      },
      choices = {
        { text = "Then the Light should destroy them, not study them.", next = "BACK", reply = "It should, and perhaps one day it will. But I'd like to know what we're destroying first.", fx = { align = { light = 1 } } },
        { text = "Keep studying them. I'd rather know what we're fighting.", next = "BACK", reply = "Thank you. Most of the keep thinks I'm wasting my time, and you're the first to say otherwise.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhc_default", text = "They do, and not only animals that are with a hunter. The dogs at the keep won't walk past my door, and Cady the ranger's dog growls at the stairs, so animals notice things before we do, which is useful and a little insulting to scholarship." },
      },
      choices = {
        { text = "Trust the animals. Get rid of those things.", next = "BACK", reply = "You may be right, and the dogs certainly agree. I'll keep them in the box until I know more.", fx = { align = { light = 1 } } },
        { text = "Animals fear fire too, and we still use fire.", next = "BACK", reply = "That's what I tell myself, but the dogs don't flinch from fire. I'll keep studying.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xro_default", text = "I would, within the hour, because I count them every morning and again before bed, and that's not a joke, though I can see you hoped it was. Whoever took one would have it whispering to them by the second night, which I think is punishment enough, but I'd still come looking." },
      },
      choices = {
        { text = "I wouldn't touch those things for any price, Ashe.", next = "BACK", reply = "Good. They're not worth it, believe me, and they hum at night.", fx = { align = { honor = 1 } } },
        { text = "Anything's worth stealing, to the right buyer.", next = "BACK", reply = "Then you'd have to explain it to me within the hour, and to Demar after. I'd rather you didn't.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = {
        { id = "xap_default", text = "A figure the size of my hand, carved from a bone I can't name, and it's warm, always, even when the hearth's been out all night. If you've a prayer for things that shouldn't be warm, I'd be grateful, and if you haven't, please don't invent one on my table." },
      },
      choices = {
        { text = "I'll pray over it. Whatever's in it should be driven out.", next = "BACK", reply = "Please, and I'll watch. If anything moves, I'll write it down.", fx = { align = { light = 1 } } },
        { text = "Some things shouldn't be prayed over. Bury it deep.", next = "BACK", reply = "Bury it, maybe, but where? Everything here is already somebody's grave.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = {
        { id = "xdr_default", text = "Whether the land remembers things, mostly. The glades around Sunnyglade feel wrong to me in a way I can't measure, and I hate things I can't measure, so I'd love to know whether your people think soil can hold a grudge." },
      },
      choices = {
        { text = "Measure all you like, Ashe. Knowledge helps the land too.", next = "BACK", reply = "Thank you. Knowledge is the only thing I'm good at, and I'd like it to help someone.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some things shouldn't be measured, only felt.", next = "BACK", reply = "Felt, then, and the glades certainly feel wrong. I'll try listening instead of measuring.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Oh! Well, that's very kind, and nobody here says things like that, they mostly say 'Ashe, not now', so thank you. I'm going to be insufferable about it all afternoon, I'm afraid." },
        { id = "s2", text = "You really think so? My father would have told me not to let it go to my head, and then he'd have been quietly pleased for a week, and I believe I'll do the same." },
      },
      fail = {
        { id = "f1", text = "That's very smooth, and I've read enough letters from Stormwind's court to know what smooth is usually for. I'm sorry, that was sharp of me, but I'd honestly rather you just asked." },
        { id = "f2", text = "Hm, no, I don't think you mean that, and I'd know, because people are forever saying nice things to me in the hope that I'll stop talking. What is it you actually want?" },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha! Yes, I babble, and I know I babble, and Riftan says the very same thing with a good deal more swearing. You're quick, though, and I've missed arguing with someone quick." },
        { id = "s2", text = "Oh, that's good, I'm writing that one down, and then I'll think of a better answer in about an hour and be furious. Do stay, because hardly anyone here gives as good as they get." },
      },
      fail = {
        { id = "f1", text = "That wasn't clever, it was only unkind, and I do know the difference. I'm sorry, but I've work to do, and I'd thank you to be civil while I do it." },
        { id = "f2", text = "I've been laughed at by knights who can't spell their own horses' names, so I'm quite used to it, thank you. It never makes me think any better of the person laughing." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "Please don't do that. I've seen what it looks like when something truly means harm, and you look rather too much like it, so I'll tell you whatever I can if you'll only step back." },
        { id = "s2", text = "All right, yes, you've frightened me, and I'm talking faster, which is what I do when I'm frightened. Ask your question, and please keep your hands where I can see them." },
      },
      fail = {
        { id = "f1", text = "I've held relics of the Hammer that whispered worse things than that to me, in a far nastier voice, and I catalogued them anyway. The Knight Commander's sentries are just outside that door, if you'd like to try it on them." },
        { id = "f2", text = "No, I don't think so. I came home alone from the expedition west, and after that there isn't a great deal a raised voice among my books can do to me." },
      },
    },
  },
  blurts = {
    { id = "bl1", text = "I think the Knight Commander is unfair to Lord Bolvar, and I'd never say so in front of Demar. Please forget I said it." },
    { id = "bl2", text = "The mage tower in Sunnyglade is still warded, and I'm fairly certain the wards were my father's work. Whatever the Hammer wants inside, they can't get to it yet." },
    { id = "bl3", text = "I came back from the western expedition alone, and I haven't told anyone all of what we found there. Some of it still hums in a locked box under my bed." },
  },
  confides = {
    { id = "cnf_1", text = "The ward light on the Sunnyglade tower can be seen from the hill east of the ruins, and it flickers whenever the cultists test it. If it ever goes dark, ride for Farholde and tell Demar at once." },
    { id = "cnf_2", text = "Sister Rowland hasn't slept a full night since the sickness came to the chapel. If you have any skill with healing, an hour of your help would mean more to her than anything you could buy." },
    { id = "cnf_3", text = "Riftan's runners carry the Hammer's mementos back from the front in plain sacks, and anything that's whispering gets passed to me. If you find one out there, it goes the same way." },
  },
  topics = {
    grievance = {
      { id = "gv1", text = "I'm sorry, I'm trying very hard to be fair to you, and I'm not managing it. You've made it rather difficult, if I'm honest." },
      { id = "gv_wronged", when = { grudge = "wronged" }, text = "You spoke about my father's work as if it were an old man's hobby. It's all I have left of him, and you knew that when you said it." },
      { id = "gv_tone", when = { grudge = "tone" }, text = "You talk to me as though I were a clerk who'd got above herself. I'm Farholde's advisor, and I've earned the chair, even if it's covered in books." },
      { id = "gv_values", when = { grudge = "values" }, text = "I've watched what you do with the things you find out there, and you'd sell a Hammer relic to the first buyer without asking what it whispers. That frightens me." },
    },
    amends = {
      { id = "am1", text = "Bring me something from Sunnyglade and let me catalogue it properly, without arguing. I forgive people who help me read." },
      { id = "am_wronged", when = { grudge = "wronged" }, text = "Read my father's notes, honestly read them, and then tell me what you think. I'd like to hear you say something kind about him." },
    },
    spite = {
      { id = "sp1", text = "I think you're the sort of person who would use a book to prop a door open. I'm sorry, but there it is, and I've said it now." },
      { id = "sp_values", when = { grudge = { worst = "values" } }, text = "I think if the Hammer offered you a relic that hummed, you'd take it and never wonder why. I've buried people who did exactly that." },
    },
    knows = {
      { id = "tp_knows", text = "Oh, I know all sorts, and I'm out of practice at keeping any of it to myself. Ask, and stop me if I go on." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } },
        text = "Ask anything you like! You've been good to Farholde, and I've been saving up things to tell someone." },
    },
    background = { { id = "tp_bg", text = "I was my father's student before I was anything else, then Farholde's advisor, then the expedition west. I came back from that one alone.", next = "father" } },
    advice = { { id = "tp_ad", text = "If something the Hammer carried hums, don't put it in your pack; put it in mine. I mean it." } },
    siege_of_farholde = { { id = "tp_siege", text = "My father rode in that charge and came back, and he never talked about it, though he talked about everything else." } },
    twilights_hammer = { { id = "tp_hammernext", text = "Ah. Sit down; this one takes a while.", next = "hammer" }, { id = "tp_hammer", text = "They collect things that listen, and I collect what they collect, because someone should." } },
    sunnyglade = { { id = "tp_sunnyglade", text = "There's a mage tower in the ruins that the Horde couldn't bring themselves to burn. I think about it more than is healthy." } },
    brotherhood_horse = { { id = "tp_brotherhood", text = "Knights, mostly, and a few of us who can't sit a horse but can read. It works, somehow." } },
    fern_crimsonleaf = { { id = "tp_fern", text = "Presumed dead, the stone says. My father said she could vanish in a lit room. I like to think she's still practising." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran was where every mage dreamed of studying, and my father did, and he wanted me to as well, but I learned from him instead, which was better. They're rebuilding it now behind shields, and I'd love to see their libraries, though I doubt they'd let me in." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor are very great and very slow, and they'd still be debating the siege of Farholde if they'd been here. I'm sorry, I'm being unkind, but it's true." } },
    second_war = { { id = "tp_second_war", text = "The old war broke against these walls, and the book in the hall tells it far better than I can. Have you read it? You should, and then come back and tell me what you thought." } },
    bolvar = { { id = "tp_bolvar", text = "Lord Bolvar is a good man with too many duties, and I think the Knight Commander is unfair to him. I'd never say so in front of Demar, mind, so please don't repeat it." } },
    holy_light = {
      { id = "tp_holy_light", text = "I'm no priest, but I've seen Sister Rowland keep a dying soldier calm with nothing but a prayer and a steady voice. I don't understand it, but I'd never mock it." },
      { id = "tp_holy_light2", when = { class = "PRIEST" }, text = "Sister Rowland would be glad of another pair of hands in the chapel, and so would the soldiers. Go and see her, because she won't ask for help herself." },
    },
    blackrock = { { id = "tp_blackrock", text = "The Blackrock orcs were the Horde's iron fist in the old war, and the histories say they came this way more than once. I keep wondering whether any of them stayed in the mountains." } },
    theramore = { { id = "tp_theramore", text = "Lady Proudmoore's Theramore is the only Alliance city that's made peace with the orcs, and I think it's very brave of her. Demar thinks it's very foolish, so I don't mention it." } },
    _gated = {
      { id = "gt1", text = "Oh, I'd rather not go into that, not yet, if you don't mind. I know I talk about everything, but there are one or two things I keep for people I know well." },
      { id = "gt2", text = "That one I don't share with visitors, I'm sorry. Ask me again when you've been around Farholde a while longer." },
    },
    _none = { { id = "tp_none", text = "I don't know! I'd love to, though, so write it down for me, would you? I'll look into it." } },
    regard = {
      { id = "rg_1", text = "I think you're wonderful, honestly, and I'm sorry if that's too much. You listen, and you bring me interesting things, and you don't sigh when I start explaining them." },
      { id = "rg_2", text = "You're clever, {name}, properly clever, not the sort who only repeats things. I don't meet many people I can really talk to, and I've noticed you're one of them." },
      { id = "rg_mage", when = { class = "MAGE" }, text = "A fellow mage, and a good one! My father would have kept you up all night arguing ward theory, and I'm very tempted to do the same." },
      { id = "rg_light", when = { alignment = { axis = "light", min = 30 } }, text = "There's something steady about you, a sort of light, the way Sister Rowland has it. I don't understand it in the least, but I've learned to be glad of it." },
    },
    confide = {
      { id = "cf_1", text = "The box under my bed hums louder when it rains. I've measured it, which isn't at all the same as understanding it, and I'd much rather understand it." },
      { id = "cf_2", text = "I'm the one who talks Demar out of riding on Krol'dok with twelve men every few months. He thinks it was his own idea each time, and I let him." },
    },
    trust = {
      { id = "tr_1", text = "Demar, absolutely, even when he's being impossible, and Sister Rowland, who's never once told me a kind lie. Cady too, though she says about four words a week." },
      { id = "tr_2", text = "Riftan, though he grumbles, and Alphonse at the forge. I'd be careful of anyone at the port who offers to buy a Hammer relic from you, because they're not buying it to keep on a shelf." },
    },
    watchout = {
      { id = "wo_1", text = "Anything the Hammer carried that feels warm when it shouldn't, or cold when it shouldn't. Bring those to me, and please don't sleep beside them." },
      { id = "wo_2", text = "The Twilight's Shroud, where Riftan keeps his watch. The air there does things to your thoughts if you stay too long, and I think it's doing them to him." },
    },
    worries = {
      { id = "wy_1", text = "That Riftan's wearing out, and Demar too, and that I'm the only one who sees it. I'm a mage, not a healer, so all I can do is notice, which is awful." },
      { id = "wy_2", text = "That I'll open the wrong box one day, or the right one too soon. I'm very careful, but my father was careful too, and he still went west." },
    },
    hopes = {
      { id = "hp_1", text = "To finish my father's work on the Sunnyglade wards and put his name on it, properly, in a book someone in Dalaran will actually read. I'm sorry, that's a terribly vain thing to hope." },
      { id = "hp_2", text = "That Farholde has a proper library one day, with a fire and a window and nobody bleeding on the pages. I'd sit in it for a year and not say a word, which you won't believe." },
    },
    favor = {
      { id = "fv_1", text = "If you find any of my father's notes out in the glades, bring them to me before anyone else sees them. His hand is very small and slants backward, so you'll know it." },
      { id = "fv_2", text = "Make Demar eat something, if you're in the hall at supper. He listens to visitors more than he listens to me, which is infuriating." },
    },
    friendship = {
      { id = "fr_1", text = "Of course I do! Oh, I'm sorry, that was loud, but yes, you're my friend, {name}, and I haven't had many since I came back." },
      { id = "fr_2", text = "You're one of the few people I'd trust with my father's notes, and that's the most I can say of anyone. Yes, a friend, and a dear one." },
      { id = "fr_earned", when = { fondness = { best = "earned" } }, text = "You've carried more cursed rubbish back to Farholde for me than anyone alive, and you've never once asked me to stop. I'd call that friendship, wouldn't you?" },
    },
    never_told = {
      { id = "nt_1", text = "When I came back from the west alone, the first thing I felt wasn't grief, it was relief that I was alive. I've hated myself for it every day since." },
      { id = "nt_2", text = "I don't think my father ever finished the wards on the Sunnyglade tower. I think they're holding by luck, and I'm terrified someone in Krol'dok will work that out before I do." },
    },
  },
}

P:NPC {
  key = "riftan", id = TODO_NPC("Sergeant Riftan"), name = "Sergeant Riftan",
  bible = "bibles/riverglades.md", role = "soldier", tier = "quest",
  communities = { "brotherhood_horse" }, temper = { "weary", "steady" }, values = { "loyal", "stern" },
  notices = { "kit", "curse" },

  impression = {
    first = "He has fought the cultists so long he stopped counting the years.",
    third = "{name} met Sergeant Riftan, a weary veteran of the Brotherhood of the Horse holding the line against the Twilight cultists.",
  },

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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "No, you seem like someone who asks before taking, and the cultists never ask. Still, I've been at this too long to trust anything that glows, so prove me wrong on the ridge." } },
      choices = {
        { text = "I'll prove it on the ridge, Sergeant.", next = "BACK", reply = "Good. The ridge is where trust is earned, and I'll be watching.", fx = { align = { honor = 1 } } },
        { text = "I don't need to prove anything to you.", next = "BACK", reply = "You don't, but I'll be watching all the same, because that's what sergeants are for.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Sergeant Riftan, Brotherhood of the Horse. I've been fighting these cultists longer than some of our riders have been alive, and don't ask how long, because I stopped counting. Their dead carry odd carved trinkets, and I send them up to Ashe at the keep." },
        { id = "h_mementos", when = { questActive = TODO_QUEST("Twilight Mementos") },
          text = "The cultists' dead carry little carved trinkets. Bring me some, and don't hold them longer than you have to." },
        { id = "h_satchel", when = { questActive = TODO_QUEST("Lingering Essence") },
          text = "Take those trinkets to the keep, now, and find Ashe Amberhall. She'll talk your ear off, but she'll know what they are." },
        { id = "h_after", tags = { "news" }, when = { questDone = TODO_QUEST("Lingering Essence") },
          text = "Did Ashe say anything about me when you took her the trinkets? She did; I can tell by your face." },
        { id = "h_cages", when = { questActive = TODO_QUEST("No Soldier Left Behind") },
          text = "My scouts are rotting in cages inside the Twilight's Shroud, the cult's fortress. The keys are on their champions, so take them off the bodies, and if you find any Horde in there, leave them where they are." },
        { id = "h_cages_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("No Soldier Left Behind"), days = 3 } },
          text = "Five of my lads back on the line, thanks to you. One soldier can be the difference out here, and today it was you." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter, good. I could use someone who reads tracks better than my lads, because the cultists come down off that ridge and leave hardly a mark." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You came up on me quiet, and that's a skill out here, so don't do it again. The next man might not be as slow to draw as I am." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Say one for the lads on the line if you've a prayer to spare, and one for me if you've two." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. Ashe at the keep will want to talk at you for a week, so be useful on the line first, while you've still got a voice." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "I know that smell. Keep whatever's with you out of the lads' sight, because they've seen enough things with horns come crawling off that ridge." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, out here? The woods by the Shroud have gone quiet, and I'd like to know why from someone who would know." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Twilight", min = 30 } }, text = "Word on the line is you've been thinning out the Twilight on the ridge. The chanting's quieter at night and the lads have noticed, though they'd never say thank you, so I will." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman. I've fought cultists who talk to things in the fog, and I'll need a minute to decide whether you're any different." },
      },
      again = {
        { id = "h_again", text = "What else? Eyes on the ridge while you ask." },
        { id = "h_again2", text = "Go on, quietly." },
      },
      choices = {
        { text = "You look like you've been out here a long while.", next = "long" },
        { text = "What are these trinkets?", next = "trinkets" },
        { text = "Ashe seems an odd sort.", next = "ashe" },
        { text = "What do the lads make of the Horde across the river?", next = "rf_horde" },
        { text = "Need another sword on the line?", next = "line", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Ashe worries about you.", next = "worried", when = { heardLine = "ashe.rh_default" } },
        { text = "What's coming down off that ridge?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Need someone to get behind their lines?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Your men look worn thin, Sergeant.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Where would fire do the most good?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do the cultists call things up too, Sergeant?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "The woods have gone very quiet.", next = "xdruid", when = { class = "DRUID" } },
        { text = "Do I seem like the cultists to you, Sergeant?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Stay safe, Sergeant.", next = "END", fx = { affinity = 1 } },
      },
    },
    long = {
      lines = { { id = "l_default", text = "Long enough that the cultists know my face. I take that as a compliment, though they don't mean it as one." } },
      choices = {
        { text = "You never seem to rest.", next = "long_rest" },
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
        { text = "That's not natural.", next = "BACK", reply = "No, it isn't, and I've told Ashe as much. She keeps them in a box, and I keep my distance.", fx = { align = { light = 1 } } },
        { text = "Whatever's in them, I'd like a closer look myself.", next = "BACK", reply = "Ashe would love you for that. I'd rather you didn't, though.", fx = { align = { light = -1 } } },
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
    -- Opinion pass: Riftan asks whether the orcs of Rog'mar are enemies.
    rf_horde = {
      big = true,
      lines = {
        { id = "rh2_default", text = "Most of the lads would as soon shoot an orc as a cultist, and the old ones remember Sunnyglade. Thing is, Krom'rosh's orcs at Rog'mar kill Twilight on the far bank the same as we do on this one. You've seen them, so tell me: enemies or not?" },
      },
      choices = {
        { text = "They kill the same cultists. Leave them be.", next = "rf_horde_leave", fx = { opinion = { horde = "common_cause" }, align = { honor = 1 } } },
        { text = "An orc is an orc. Shoot first, Sergeant.", next = "rf_horde_shoot", fx = { opinion = { horde = "never" }, align = { honor = -1 } } },
        { text = "Let the orcs bleed on the ridge first. Then we'll see.", next = "rf_horde_use", fx = { opinion = { horde = "useful" }, trait = { practical = 1 } } },
        { text = "They're cutting down Ashenvale too. Never trust them.", next = "rf_horde_shoot", when = { race = "NightElf" }, fx = { opinion = { horde = "never", ashenvale = "war" } } },
        { text = "That's the Commander's call, not mine.", next = "BACK" },
      },
    },
    rf_horde_leave = {
      lines = { { id = "rhl_default", text = "Maybe. I've watched them from the ridge, and they fight like they mean it, and some of our recruits could stand to watch them. I'll not say that to the Commander, and neither will you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rf_horde_shoot = {
      lines = { { id = "rhs_default", text = "That's how the old hands see it, and I'll not argue with men who were at the siege. Just don't go starting a second war out here while we're still losing the first one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rf_horde_use = {
      lines = { { id = "rhu_default", text = "Cold, but sensible. Every cultist they put down is one less coming over my wall, and I'm too old to be choosy about who does the killing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    worried = {
      lines = { { id = "w_default", text = "She worries. Tell her I'm fine, and tell her I said it twice; she'll believe it more." } },
      choices = { { text = "I'll tell her.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhc_default", text = "Scouts in pairs, mostly, and now and then one of the Hammer's ogres, heavy enough to leave a trench in the mud. Follow the tracks back up if you've the nerve, but come and tell me before you go after anything big." },
      },
      choices = {
        { text = "I'll track them to their camp and report back.", next = "BACK", reply = "Good. Report what you find, and I'll send a patrol.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll track them and finish them myself.", next = "BACK", reply = "Finish them, then, but bring me back their marks. I like to count.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xro_default", text = "Always. They've a camp behind the Shroud where they keep prisoners and pray over them, and I've never got a man close enough to count heads. Go in quiet, count, and come back, and don't play the hero in there." },
      },
      choices = {
        { text = "Count heads and come back. Understood.", next = "BACK", reply = "Good. Heads first, then we decide.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If I can cut a prisoner loose, I will.", next = "BACK", reply = "If you can, then do, but don't get caught. I'll not lose two to save one.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = {
        { id = "xap_default", text = "Tired, and the two who carried the trinkets still talk in their sleep, though quieter now. Sister Rowland can't leave her chapel to come out here, and the lads say a prayer in the mud counts for more than one under a roof." },
      },
      choices = {
        { text = "I'll stand on the line and pray with them.", next = "BACK", reply = "They'll be glad of you, and so will I. The line needs voices tonight.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They need sleep and relief, not prayers.", next = "BACK", reply = "They need both, and they're getting neither. I'll take what I can get.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmg_default", text = "On the ridge, at dusk, when they come down to chant. Fire breaks the chanting, and anything that breaks the chanting is a friend of mine, but don't set the woods going, because the loggers have to live out here too." },
      },
      choices = {
        { text = "Careful fire, then. The loggers come first.", next = "BACK", reply = "Careful fire, yes, and the loggers will thank you. So will Turner.", fx = { align = { light = 1 } } },
        { text = "If the woods burn, the cultists burn with them.", next = "BACK", reply = "And the loggers with them, and the keep after. Keep it careful, please.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlk_default", text = "They call things, and the things come. I can't tell you what, only that my arrows don't care for them, and if you know how a calling works, you'll know how to break one. I don't care how you learned." },
      },
      choices = {
        { text = "I'll break their callings, and nothing more.", next = "BACK", reply = "Good. Break them, and I'll keep my arrows for whatever's left.", fx = { align = { light = 1 } } },
        { text = "Whatever they call, I'll take for myself.", next = "BACK", reply = "Then I'll be watching you as closely as the cultists. Mind yourself.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = {
        { id = "xdr_default", text = "Birds stopped first, then the deer, and now even the frogs keep quiet along the stream by the Shroud. Ashe says it's the trinkets listening, and I say whatever's listening doesn't want company." },
      },
      choices = {
        { text = "I'll cleanse that stream, whatever it costs.", next = "BACK", reply = "Then you'll have my thanks, and the frogs', if they ever start singing again.", fx = { align = { light = 1 } } },
        { text = "Let the woods stay quiet. Kill the cultists first.", next = "BACK", reply = "First, yes, and then the woods. I'll take that order.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've fought in these glades longer than I care to remember, and I've buried enough friends to learn a thing or two. Ask." },
    },
    background = { { id = "tp_bg", text = "Brotherhood a long time, out here longer. That's all of it." } },
    advice = { { id = "tp_ad", text = "When they start chanting, back up. Whatever they're calling, you don't want to be the first thing it sees." } },
    twilights_hammer = { { id = "tp_hammer", text = "They pray louder than they fight. I'd rather they just fought." } },
    second_war = { { id = "tp_second_war", text = "I was a boy when the old war came, and I remember the drums. I've heard drums in my sleep ever since, though these days they're cultist drums." } },
    holy_light = { { id = "tp_holy_light", text = "I don't pray much, but Sister Rowland does enough for the whole keep. I let her pray for me, and I keep the cultists off her." } },
    bolvar = { { id = "tp_bolvar", text = "Stormwind's Regent doesn't know my name, and I don't need him to. I need him to send us more men, which he won't." } },
    blackrock = { { id = "tp_blackrock", text = "The orcs in the mountains wear Blackrock colors sometimes, and they fight beside the cult. Or near it, anyway, and I've stopped caring which." } },
    _none = { { id = "tp_none", text = "Nothing I'd know about out here. Ask at the keep." } },
  },
}

P:NPC {
  key = "rowland", id = TODO_NPC("Sister Rowland"), name = "Sister Rowland",
  bible = "bibles/riverglades.md", role = "priest", tier = "quest",
  communities = { "farholde", "brotherhood_horse" }, temper = { "patient" }, values = { "kind", "pious" },
  prejudice = { class = "WARLOCK", amount = 10, why = "Tends soldiers maimed by the Hammer's dark sorcery; won't have the Nether near her sick." },
  notices = { "healer", "disease", "form" },

  impression = {
    first = "Her calm costs her more than she lets on.",
    third = "{name} met Sister Rowland, who tends the Brotherhood's sick in Farholde's chapel.",
  },

  greetings = {
    { id = "g_prejlock1", when = { prejudiced = true }, text = "Half the men in these beds are here because of what your kind summons. Don't come any nearer to them than you are." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "I'll pray for you, because I pray for everyone. I'll not let you sit with my sick." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "You've fetched water and carried bandages without asking for thanks, and I've noticed. I still won't let you near the worst of them, but you may stay." },
    { id = "g_default", text = "Quietly, please; some of them are sleeping." },
    { id = "g_back", when = { metBefore = true }, text = "You came back. Would you sit with one of them a moment? Talking helps, though I don't know why." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and they're no better, though they're no worse either, which I've learned to count as a mercy. Sit a moment, if you can." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Someone in the keep came away from you angry, and I've enough troubled souls in these beds without more of them walking about, so make peace if you can, quietly." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Someone came by the beds today and said you'd lifted their spirits, and that kind of news helps in here more than any tea, so thank you." },
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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I don't know, and that's the worst of it. I pray over them and they don't get better, so if the earth or the water knows something, I'll listen." } },
      choices = {
        { text = "The Light and the spirits can work together here.", next = "BACK", reply = "I'd like that, I truly would. Anything that helps them is welcome in my chapel.", fx = { align = { light = 1 } } },
        { text = "Prayer isn't working. Try harsher remedies.", next = "BACK", reply = "Harsher? They're already suffering. I'll try anything that doesn't make them suffer more.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    -- Deeds pass: the player's deaths.
    dd_deaths = {
      lines = { { id = "dd_default", text = "I thought so. I've never seen the healers in their grey place and I hope I never shall, but I've seen what it leaves behind: men who stop being afraid of the right things. Are you still afraid of dying, friend?" } },
      choices = {
        { text = "Yes, and I hope I stay that way.", next = "BACK", reply = "Good. Fear keeps you careful, and careful keeps you out of my chapel, which is the best thing I can wish anyone.", fx = { align = { light = 1 } } },
        { text = "No. Death's only a door now, and I know the way back.", next = "BACK", reply = "Then I'll pray for you, because that frightens me more than any fever in this room.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_cages", tags = { "news" }, when = { questDone = TODO_QUEST("No Soldier Left Behind") },
          text = "Two of the scouts you brought out of the Shroud are in my beds now, and I'm told it was you who carried the keys. They wake at night thinking they're still in the cages, but they wake here, and that's your doing." },
        { id = "h_dd_deaths", when = { deaths = { min = 10 } },
          text = "You've died more than once out there, I think; the ones the spirit healer sends back carry a chill on them that takes days to fade. Sit by the brazier a while before you go." },
        { id = "h_default", key = true,
          text = "I'm Sister Rowland, and these are the Brotherhood's sick. They're ill, and I don't yet know with what, so I keep them clean and fed and prayed over, and the rest is the Light's business." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Nights are worst. Fevers climb after dark, and I run out of clean linen by the second bell." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "You'll be one of the fighters, then. Leave your sword by the door, please; the men see a blade and try to sit up, and they shouldn't." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "You've a beast with you. Keep it near the door; some of the men find it a comfort and some don't, and I can't tell which until it's too late." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You move very softly, and I'm grateful for it in here, whatever the reason you learned to." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. Ashe keeps asking me whether the illness has an arcane smell to it, and I keep telling her I wouldn't know one if it sat on the bed." },
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "I know what you carry, and it's no different from what the Hammer used on these poor men. I'll speak with you at the door, but you'll not come further into this chapel." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "You've come back again, and the sick haven't stirred at you this time. Stay by the door, but you needn't hurry off." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "I know what you carry, and it sets my teeth on edge. Keep it outside the chapel, and you're as welcome as anyone who'll fetch water." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman. Wash your hands at the basin, and then, if your spirits can tell what ails these soldiers, I'll thank them as gladly as the Light." },
      },
      again = {
        { id = "h_again", text = "Something else? Softly, please." },
        { id = "h_again2", text = "Yes? I'm listening, though I'm also changing this bandage." },
      },
      choices = {
        { text = "I've died and come back more than once, Sister.", next = "dd_deaths", when = { deaths = { min = 10 } } },
        { text = "What's wrong with them?", next = "illness" },
        { text = "I don't know how you keep going in here.", next = "going" },
        { text = "Can I help?", next = "help" },
        { text = "Let me pray with you.", next = "pray", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "I know some field medicine.", next = "aid", when = { profession = "First Aid" } },
        { text = "A soldier can't do much good in here.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Could an animal help them, Sister?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do you need anything brought in quietly?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Magic might tell what the illness is.", next = "xmage", when = { class = "MAGE" } },
        { text = "Would you refuse my help, Sister?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "The Light keep you, Sister.", next = "END", reply = "And you, friend. If you pass the chapel at night, I'd be glad of the company.", fx = { align = { light = 1 } } },
        { text = "I'm a druid. I know herbs that ease fever.", next = "xdruid", when = { class = "DRUID" } },
        { text = "Can the spirits tell what ails your sick, Sister?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Prayer won't break a fever, Sister, but medicine might.", next = "END", reply = "Then bring me medicine, and I'll use it gladly. I'll keep praying, too.", fx = { align = { light = -1 } } },
      },
    },
    illness = {
      lines = { { id = "i_default", text = "I don't know. That's the honest answer, and I've stopped being ashamed of it. It's no plague I've read about, and it isn't a curse I can feel." } },
      choices = {
        { text = "It could be the Hammer's doing.", next = "illness_hammer" },
        { text = "Something else.", next = "BACK" },
      },
    },
    illness_hammer = {
      lines = { { id = "ih_default", text = "Everyone says that, and everyone wants it to be. I won't blame anyone until I know, because the moment I do, I'll stop looking." } },
      choices = {
        { text = "That's wise.", next = "BACK", reply = "Thank you. It's harder than it sounds, when everyone's frightened.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'd blame them anyway.", next = "BACK", reply = "Many would, and many do. I'll keep waiting for proof.", fx = { align = { order = 1 }, trait = { stern = 1 } } },
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
        { text = "Amen.", next = "BACK", reply = "Amen. Thank you, truly, it helps more than you know.", fx = { affinity = 2, align = { light = 2 }, trait = { pious = 1 } } },
        { text = "I'll say the words, but I've stopped believing anyone hears them.", next = "BACK", reply = "Say them anyway, if you would. Sometimes the words help even when we doubt them.", fx = { align = { light = -1 } } },
      },
    },
    aid = {
      lines = { { id = "ad_default", text = "Then roll up your sleeves. Bandages in the chest, boiled water on the fire. Don't let the big one by the window talk you into ale." } },
      choices = { { text = "I won't.", next = "BACK", fx = { affinity = 2, standing = { farholde = 1 } } } },
    },
    xdruid = {
      lines = { { id = "xdr_default", text = "Then I'll take every one you know, and I won't ask whether they come from the Light or from the earth. Some of the men will stare at you, so please don't change shape on the ward; they've seen enough strange things this year." } },
      choices = {
        { text = "I'll mind the ward. Show me the worst.", next = "illness", fx = { affinity = 2 } },
        { text = "They'll get used to me.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    xwarcl = {
      big = true,
      lines = {
        { id = "xwc_default", text = "More good than I can, some days. They were soldiers before they were patients, and they listen to soldiers, so sit with the big one by the window and tell him to eat his broth. He'll eat it for you when he won't for me." },
      },
      choices = {
        { text = "I'll order him to eat. He'll obey.", next = "BACK", reply = "Then do, and he'll eat. They listen to soldiers more than they listen to me.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll ask him kindly, as a friend would.", next = "BACK", reply = "That might work better, and it's kinder. Thank you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhc_default", text = "Sometimes. A soldier who's stopped talking to people will still talk to a dog, and I've seen Cady the ranger's dog do more for a low spirit than my tea. Bring yours at noon, when they're awake, and keep it off the beds." },
      },
      choices = {
        { text = "Gladly. They'll be good for each other.", next = "BACK", reply = "Bless you. I've seen it work before, and I'll be glad to see it again.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My companion's a fighter, Sister, not a nursemaid.", next = "BACK", reply = "Of course, and I'll not ask again. Still, if it ever has a spare hour.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xro_default", text = "Willow bark and clean linen, if you can find them, and I won't ask too closely where you found them. Farholde's stores are thin, and the Light has never told me a borrowed bandage heals any worse." },
      },
      choices = {
        { text = "I'll pay for every bandage I bring.", next = "BACK", reply = "Then you're more honest than most, and I'll thank you for it.", fx = { align = { honor = 1 } } },
        { text = "I'll bring them. Don't ask from where.", next = "BACK", reply = "I won't, friend. The sick don't care where linen comes from.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmg_default", text = "Ashe has tried, and she says it doesn't feel like anything she knows, which frightened her more than an answer would have. You're welcome to look, quietly, but please don't light anything in here." },
      },
      choices = {
        { text = "Then trust the Light and your care, Sister.", next = "BACK", reply = "I'm trying, and I'll keep trying. Thank you for saying it.", fx = { align = { light = 1 } } },
        { text = "Prayer hasn't worked. Let me try something stronger.", next = "BACK", reply = "Something stronger frightens me, but so does watching them fade. Tell me what you have in mind.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlk_default", text = "No, I won't refuse help, though I'll watch you give it. Water carried by cold hands is still water, so just don't touch anyone who's sleeping, and don't take it amiss when the men won't meet your eyes." },
      },
      choices = {
        { text = "All right, Sister. I'll carry water and keep my distance.", next = "BACK", reply = "Thank you. Leave the buckets by the chapel door, and I'll carry them the rest of the way myself.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "What I carry could do far more than fetch water.", next = "BACK", reply = "I'm sure it could, and that's exactly what I'm afraid of. Water, please, and nothing more.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The sick talk when they can't sleep, and I listen. Ask what you need, and the Light willing, I'll have an answer." },
    },
    background = { { id = "tp_bg", text = "I go where the sick are. Farholde has more than its share, so here I am." } },
    advice = { { id = "tp_ad", text = "Boil your water and wash your wounds. The Light helps those who've already done the dull part." } },
    twilights_hammer = { { id = "tp_hammer", text = "I pray for them too. Someone should, and nobody else will." } },
    holy_light = {
      { id = "tp_holy_light", text = "The Light doesn't always heal, and I never tell the soldiers that it does. It gives them comfort, though, and that's more than nothing." },
      { id = "tp_holy_light2", when = { class = "PALADIN" }, text = "A paladin in the chapel would lift the soldiers' spirits more than any prayer of mine. Come and sit with them, if you've a moment." },
      { id = "tp_holy_light3", when = { class = "PRIEST" }, text = "You know what it's like, then, to pray over someone and not know if it's working. Keep praying anyway, because they're listening even when the Light isn't." },
    },
    bolvar = { { id = "tp_bolvar", text = "The Regent writes to us about duty, and the Knight Commander burns the letters. I keep one, because I think he meant well." } },
    theramore = { { id = "tp_theramore", text = "I've heard Theramore has fine healers, trained by Lady Proudmoore's own priests. I pray for one of them every night." } },
    _none = { { id = "tp_none", text = "I'm sorry; my world's been this room, lately." } },
  },
}

P:NPC {
  key = "cady", id = TODO_NPC("Cady Lloydriel"), name = "Cady Lloydriel",
  bible = "bibles/riverglades.md", role = "soldier", tier = "quest",
  communities = { "farholde", "brotherhood_horse" }, temper = { "wary", "sharp" }, values = { "loyal", "cautious" },
  notices = { "pets", "elves", "form" },

  impression = {
    first = "Most of her attention stays on the cradle beside her.",
    third = "{name} met Cady Lloydriel, a ranger of the Brotherhood who keeps watch over Farholde's walls and a cradle.",
  },

  greetings = {
    { id = "g_default", text = "Mind the cradle, please, and mind your voice; elven ears hear everything." },
    { id = "g_dog", text = "My dog Aedamas likes you. Don't be flattered; he likes everyone." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. Luna the cat's sitting on the cradle again; don't take it personally." },
  },

  notice = {
    { id = "n_pet", cat = "pets", when = { class = "HUNTER", pet = { type = "Beast" } },
      text = "Your {pet} and my dog Aedamas are sizing each other up, so let them. Dogs settle these things faster than knights." },
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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "My cat Luna knows when a storm's coming, and she's been looking at you like you're one. Keep your voice down, and she might forgive you." } },
      choices = {
        { text = "I'll keep the storm quiet for the little one.", next = "BACK", reply = "Thank you. She's had enough storms for someone her size.", fx = { align = { light = 1 } } },
        { text = "Storms come when they come. Luna will cope.", next = "BACK", reply = "She copes with more than she should, and I'd rather she didn't have to. Quietly, please.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Cady Lloydriel. I left Quel'Thalas a long time ago to ride with the Brotherhood, and now I keep an eye on the walls, and on this one." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Quiet, please; it took an hour to get the little one down. Luna, my cat, helped, and she takes all the credit." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior. Walk softly past the cradle, if you know how; most of your kind don't." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. The Brotherhood will be glad of you, and the little one likes shiny things, so mind your gauntlets." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You're quiet, I'll give you that. My dog Aedamas heard you anyway, which you'll want to know." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Sister Rowland in the chapel could use you more than I could, though you're welcome to watch the walls with me a while." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. If you've come for Ashe, she's in the keep, talking to someone, probably herself." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Luna's hissing, and she doesn't hiss at people. I'll take her word for what you are, and keep my hand near my bow." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. My dog Aedamas can't decide whether you're a person or a smell, so give him a moment." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Shh. The cat's watching you, and the cat doesn't like strangers, so stand still." },
      },
      again = {
        { id = "h_again", text = "What else? I've a century or two of patience, but the little one hasn't." },
        { id = "h_again2", text = "Go on, quietly." },
      },
      choices = {
        { text = "Whose child is that?", next = "child" },
        { text = "Tell me about the animals.", next = "animals" },
        { text = "An elf, in a Stormwind order?", next = "elf" },
        { text = "You must see a lot from these walls.", next = "walls" },
        { text = "Fine dog. Did you train him yourself?", next = "hunter", when = { class = "HUNTER" } },
        { text = "You were staring.", next = "skyborne", when = { race = "Skyborne" } },
        { text = "You're quel'dorei. We don't often share a wall.", next = "xnightelf", when = { race = "NightElf" } },
        { text = "Need another pair of hands on the walls?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "The Brotherhood's knights can't fully trust an elf.", next = "xapala", when = { class = "PALADIN" } },
        { text = "How did your dog hear me?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "May I bless the little one?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you have any magic of your own, ranger?", next = "xmage", when = { class = "MAGE" } },
        { text = "Your cat hisses at me as though she knows something.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Would Aedamas like me better in another shape?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Does your cat know something about me, Cady?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    child = {
      lines = { { id = "c_default", text = "Someone who needs watching. That's all you need to know, and all I'm saying." } },
      choices = {
        { text = "Then I'll stop asking.", next = "BACK", fx = { affinity = 1 } },
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
        { text = "What do you make of the Alliance, then?", next = "elf_alliance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elf_quel = {
      lines = { { id = "eq_default", text = "I don't talk about Quel'Thalas with strangers. Ask me again when we aren't." } },
      choices = { { text = "I understand.", next = "BACK", fx = { affinity = 1 } } },
    },
    -- Opinion pass: Cady turns the question back on the player.
    elf_alliance = {
      big = true,
      lines = { { id = "ea_default", text = "You first. My king took Quel'Thalas out of the Alliance after the Second War, and the Alliance let him. Which of them was wrong?" } },
      choices = {
        { text = "Anasterian. He walked away from his allies.", next = "elf_alliance_king", fx = { opinion = { high_elves = "stubborn", alliance = "united" }, align = { order = 1 } } },
        { text = "The Alliance. It owed your people more than it gave.", next = "elf_alliance_fail", fx = { opinion = { alliance = "failed", high_elves = "respect" }, align = { order = -1 } } },
        { text = "The elves who stayed and fought are the wise ones.", next = "elf_alliance_stay", fx = { opinion = { high_elves = "respect" }, affinity = 1 } },
        { text = "Your Highborne cousins chose exile. Don't expect pity from us.", next = "elf_alliance_kal", when = { race = "NightElf" }, fx = { opinion = { high_elves = "distrust" }, affinity = -1 } },
        { text = "I don't know enough to judge.", next = "BACK" },
      },
    },
    elf_alliance_king = {
      lines = { { id = "eak_default", text = "Most humans say that. Some of them even say it kindly, and you did. He had his reasons, and I had mine for coming south anyway." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    elf_alliance_fail = {
      lines = { { id = "eaf_default", text = "Careful. People here would call that ungrateful, and they'd be half right. Still, I've heard it said less often than I've thought it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    elf_alliance_stay = {
      lines = { { id = "eas_default", text = "Or the stubborn ones. Either way, I'm still here, and so is the wall." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    elf_alliance_kal = {
      lines = { { id = "eal_default", text = "I don't want your pity, kaldorei. I want you to keep your arrows pointed the same way as mine while we're both on this wall." } },
      choices = { { text = "Something else.", next = "BACK" } },
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
    xnightelf = {
      lines = { { id = "xne_default", text = "No, we don't. I've no quarrel with the kaldorei, and the Brotherhood doesn't care whose ears are under the helm, so the wall's yours as much as mine." } },
      choices = {
        { text = "Old quarrels can stay old.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Your ancestors' magic nearly ended the world.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
    xwarcl = {
      big = true,
      lines = {
        { id = "xwc_default", text = "On the wall, no; it takes elf eyes to see through this fog. But when the bell rings at night, someone has to be on the gate before the riders are out of bed, and that could be you." },
      },
      choices = {
        { text = "I'll take the gate when the bell rings.", next = "BACK", reply = "Good. It rang three times last week, so you'll not wait long. Bring your own torch; ours keep going missing.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I go where the fighting is, not where I'm told.", next = "BACK", reply = "Then you'll find the fighting at the gate, whether you're told or not. It always comes there.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = {
        { id = "xpa_default", text = "They trust the bow. The elf part they've stopped noticing, which is the most anyone can ask of a knight, and more than I got anywhere else." },
      },
      choices = {
        { text = "That's how it should be. Judge by deeds alone.", next = "BACK", reply = "It should be, and here it mostly is. That's more than I found in Quel'Thalas, some years.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Trust is earned slowly. They were right to watch you.", next = "BACK", reply = "They were, and I don't hold it against them. I watched them too.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xro_default", text = "He hears everyone, and he smells the rest. The night the cultists tried the north wall, he was barking before the sentries saw a thing, so he's the best guard in the keep and he works for scraps." },
      },
      choices = {
        { text = "Good. A guard should hear everything.", next = "BACK", reply = "He does, and he'll tell me before you've finished thinking about it. Good dog.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll get past him one day. You'll see.", next = "BACK", reply = "You'll try, and he'll be waiting with his tail wagging. I'd like to see that.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = {
        { id = "xap_default", text = "No, thank you. The little one's had blessings enough from people who meant well, and the walls need them more, so bless the gate on your way out and I'll count it." },
      },
      choices = {
        { text = "I'll bless the gate, then, and every rider through it.", next = "BACK", reply = "Thank you. The gate could use it, and so could the riders.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Suit yourself. Blessings don't hold a wall anyway.", next = "BACK", reply = "They don't, but stone does, and so does a quiet night. Thank you for understanding.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmg_default", text = "A little, the way every elf has a little, and mine goes into the arrows. Ashe would love to measure it, so I've never told her." },
      },
      choices = {
        { text = "You should tell her. She might learn something useful.", next = "BACK", reply = "I might, one day. She'd write about it for a month, though, and I've arrows to make.", fx = { align = { order = 1 } } },
        { text = "Keep it to yourself. It's yours.", next = "BACK", reply = "Thank you. It's not much, but it's mine, and it's helped me hit what I aim at.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlk_default", text = "She does. I've known a few of your kind, and they all said what you're about to say, so save it, and keep whatever follows you well away from the cradle." },
      },
      choices = {
        { text = "Understood. It'll stay well away from the little one.", next = "BACK", reply = "Good. She's had enough strange things near her for one life.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "What follows me goes where I tell it, ranger.", next = "BACK", reply = "Then tell it to stay away from mine, and we'll get along. I'll not ask twice.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = {
        { id = "xdr_default", text = "He'd chase a cat, and Luna would never forgive either of you. Come as you are, or as a bear if you must, but not near the cradle, and not a cat; one in the house is plenty." },
      },
      choices = {
        { text = "As I am, then. Your house, your rules.", next = "BACK", reply = "Thank you. Luna will be glad, and so will he.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll wear whatever shape I please, ranger.", next = "BACK", reply = "Then mind his teeth, and her temper. Neither of them forgives easily.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I watch the walls and I watch the people inside them, so I know a fair bit. Ask, and I'll decide what to tell you." },
    },
    background = { { id = "tp_bg", text = "No. That one stays with me." } },
    advice = { { id = "tp_ad", text = "Watch the birds over the river, the way the rangers of Eversong taught me. When they go quiet, something's moving in the fog." } },
    brotherhood_horse = { { id = "tp_brotherhood", text = "Good riders and bad singers, and they keep their word, which is rarer than either." } },
    sylvanas = { { id = "tp_sylvanas", text = "She was the Ranger-General of Silvermoon, and I trained under her rangers when I was young. I won't say what she is now, but I'll say she was the best of us once." } },
    arthas = { { id = "tp_arthas", text = "Arthas marched on Quel'Thalas and burned it. I don't talk about him, and I'd thank you not to either." } },
    elune = { { id = "tp_elune", text = "The night elves pray to the moon, and I've never seen the harm in it. Luna seems to like the moonlight too, though she likes most things that aren't the dog." } },
    dalaran = { { id = "tp_dalaran", text = "My people studied in Dalaran alongside the humans, before the Scourge came. I don't know who's left, and I've stopped asking." } },
    _none = { { id = "tp_none", text = "Not mine to know, and I've learned that even an elf's long life doesn't cover everything." } },
  },
}

P:NPC {
  key = "wheatley", id = TODO_NPC("Wheatley"), name = "Wheatley", title = "Stable Master",
  bible = "bibles/riverglades.md", role = "stablemaster", tier = "service",
  communities = { "farholde" }, temper = { "gentle" }, values = { "patient" },
  notices = { "mount", "class" },

  impression = {
    first = "He likes horses better than their riders, and says so.",
    third = "{name} met Wheatley, Farholde's stable master, who tends every horse in the Brotherhood.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, the rider who actually brushes down their mount. Come in; the horses like you, and that's the only opinion I trust." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. I'll see to your mount, because the poor beast didn't choose you, but I'll not chat with you while I do it." },
    { id = "g_default", text = "Mind your step there; it's fresh, and the grey's been eating clover all morning." },
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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I think they've more sense than most riders, and that's spirit enough. Treat them well and the spirits can say what they like." } },
      choices = {
        { text = "Every beast has a spirit. I'll treat them so.", next = "BACK", reply = "Then they'll know it, and they'll work all the harder for you.", fx = { align = { light = 1 } } },
        { text = "A horse is a horse. It works or it doesn't.", next = "BACK", reply = "It works, mostly, when it's treated well. That's the whole trick.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    -- Deeds pass: Marshal Ryan's death.
    dd_ryan = {
      lines = { { id = "dr_default", text = "She'll go to a rider who needs her, I suppose, when the Commander says so. I keep putting it off, because the day she leaves that stall is the day Ryan's really gone, and I'm not ready to tell a horse that." } },
      choices = {
        { text = "Give her to a rider. Ryan would want her working.", next = "BACK", reply = "You're right, and I know you're right. I'll ask the Commander tomorrow, or maybe the day after.", fx = { align = { order = 1 } } },
        { text = "Keep her a while longer. Nobody will blame you.", next = "BACK", reply = "The Commander might, but he'll not say so. Thank you; I think she'd miss me as much as I'd miss her.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_ryan", tags = { "news" }, when = { questDone = TODO_QUEST("Dying Wish") },
          text = "I heard about Marshal Ryan. His bay mare's still in the third stall; I've fed and walked her every day since he rode west, because nobody ever told me to stop." },
        { id = "h_default", key = true, text = "Wheatley, stable master. Every horse in the Brotherhood comes through these stalls, and most of them are better company than their riders." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior. You'll ride hard and stable late, I'd wager, so let me say it now: the horse eats before you do." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! If you've a charger, I want to see it, because the Brotherhood's had a few and I've loved them all." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter, with a beast. Keep it off the straw and away from the grey in the end stall; he doesn't like anything with claws." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Quiet feet. The horses like that, actually; it's the loud ones that spook them." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. If you've a prayer that works on colic, I'll take it, because the ones for people don't seem to." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. Nothing flashy in here, please; the last time someone lit a spell near the stalls, it took me a day to catch them all." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "The horses don't like you, and I've learned to trust them. Stand by the door, if you would." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. You'll be telling me the horses have spirits, and I'll be telling you they eat before you do, so we'll get along." },
      },
      again = { { id = "h_again", text = "Anything else? Hold this bucket while you ask." } },
      choices = {
        { text = "What will become of Ryan's mare now?", next = "dd_ryan", when = { questDone = TODO_QUEST("Dying Wish") } },
        { text = "Let me see the stables.", next = "BUSINESS" },
        { text = "Who kept the stables before you?", next = "brienne" },
        { text = "Best horse you've ever had?", next = "best" },
        { text = "Do you stable druids?", next = "druid", when = { class = "DRUID" } },
        { text = "A good warhorse must be a big one.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Could my charger stable here?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the horses mind my companion?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Someone must have tried to steal a horse here once.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Shall I bless the horses before a ride?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Could magic make a horse faster?", next = "xmage", when = { class = "MAGE" } },
        { text = "Why do the horses fear me, Wheatley?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "The Brotherhood must need a steady supply of new horses.", next = "remounts" },
        { text = "Do you think the horses have spirits, Wheatley?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
    xwarcl = {
      big = true,
      lines = {
        { id = "xwc_default", text = "Nerve, not size. A big horse that bolts at a chant is worse than a pony that won't, and the Hammer chants a lot, so I teach them to stand by banging pots in the yard at night. The riders hate it, but the horses come home." },
      },
      choices = {
        { text = "Train them hard. A soldier's life depends on it.", next = "BACK", reply = "Hard, yes, and then harder, and then they'll stand. That's the job.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them run when they must. Horses know best.", next = "BACK", reply = "They do, sometimes, better than their riders. But not at the gate.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = {
        { id = "xpa_default", text = "I'd be honoured. Sir Howard's charger had the stall by the door, and nobody's put a horse in it since, but I think he'd say a paladin's mount ought to have it." },
      },
      choices = {
        { text = "Keep it empty. That stall is his memorial too.", next = "BACK", reply = "You're right, and I'm glad someone said it. The stall stays empty.", fx = { align = { order = 1 } } },
        { text = "Then I'll take it. The living need it more.", next = "BACK", reply = "Then you'll take it, and you'll treat the horse in it well. Sir Howard would want it used.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhc_default", text = "They mind it, but they'll get over it if it's patient and you're quiet. Two foals went missing from the far paddock this year, so anything with teeth gets looked at sideways; give them a day and an apple from your hand." },
      },
      choices = {
        { text = "I'll keep my beast well away from the paddocks.", next = "BACK", reply = "Thank you. The mares will thank you too, and so will I.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "They'll learn. My companion stays with me.", next = "BACK", reply = "They'll learn, slowly. Keep it on a short leash near the foals.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xro_default", text = "Once, a pirate up from the coast on a foggy night. The grey in the end stall kicked him through the fence before I'd got my boots on, and I gave the grey an extra carrot every day for a week." },
      },
      choices = {
        { text = "I hope the poor fool lived.", next = "BACK", reply = "He did, barely, and he walked funny the rest of the season. The grey's still proud of it.", fx = { align = { light = 1 } } },
        { text = "Good horse. Thieves get what they deserve.", next = "BACK", reply = "She is, and I give her an extra carrot every time I think of it.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = {
        { id = "xap_default", text = "Bless them? Nobody's ever asked. Rowland's too busy and the riders think it's soft, but I'd hold the bridles if you'd do it, and I won't tell anyone if you won't." },
      },
      choices = {
        { text = "Every creature deserves a blessing. Hold the bridles.", next = "BACK", reply = "Then I'll fetch them now. Nobody's ever asked, and they'll not know what to make of it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Better to bless the riders. Horses don't need it.", next = "BACK", reply = "The riders think the same, and they're wrong. Still, I'll not argue with a priest.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmg_default", text = "Faster? Ashe tried once, on a pony, and the pony went sideways through the hay barn. Feed and patience are the only spells I trust, and you can tell Dalaran I said so." },
      },
      choices = {
        { text = "You're right. I'll keep my spells away from your horses.", next = "BACK", reply = "Good. Feed and patience will get you further than any spell, and my barn's still standing.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "With the right spell, I could do it.", next = "BACK", reply = "Then try it on your own horse, and in someone else's barn.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlk_default", text = "Because they've more sense than people. They smell what you've been near, and it isn't anything that grew in a field, so I don't hold it against you, but I'll ask you not to touch them." },
      },
      choices = {
        { text = "All right, I'll keep my hands off them.", next = "BACK", reply = "Thank you. They'll calm down, given a little time.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They'll learn to bear me, like everything does.", next = "BACK", reply = "Some things bear more than others. These won't, and I'll not ask them to.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    remounts = {
      lines = { { id = "rm_default", text = "We breed our own, from the lines the Brotherhood brought east in the Second War. Ships don't carry horses out here, and the goblins quote me prices that would make a dwarf faint." } },
      choices = {
        { text = "Why not pay the goblins' price?", next = "remounts_goblins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    remounts_goblins = {
      lines = { { id = "rmb_default", text = "Because a horse raised in these glades knows the fog and the river, and one off a boat from Tanaris knows sand. Melbin, the goblin who runs the port, calls me sentimental, and he's right, but my horses come home." } },
      choices = {
        { text = "Raise your own. A goblin's horse won't know the fog.", next = "BACK", reply = "That's my thinking too. A horse raised here knows the fog, and the fog kills.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Riders need horses now. Pay the goblin.", next = "BACK", reply = "They do, and I know it, and I hate it. I'll talk to Melbin, but I'll not like it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I've been around horses since before I could walk. Ask them about me; they're more honest." } },
    advice = { { id = "tp_ad", text = "A horse that won't cross a bridge has a reason. Get off and look." } },
    siege_of_farholde = { { id = "tp_siege", text = "We lost more horses than riders, and I mourned every one. Don't tell the riders." } },
    second_war = { { id = "tp_second_war", text = "The Brotherhood's horses broke the Horde at Farholde in the old war, and I'll tell anyone who'll listen. The riders get the credit, but it was the horses that did the work." } },
    thrall = { { id = "tp_thrall", text = "Orcs ride wolves, and I'll say this for them, they keep their wolves well. I'd still rather a horse." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire has pony rides for children, and I went once just to check on the ponies. They were well kept, I'll give them that." } },
    _none = { { id = "tp_none", text = "Does it eat hay? If not, you'd best ask somebody else." } },
  },
}

P:NPC {
  key = "mayberry", id = TODO_NPC("Gretchen Mayberry"), name = "Gretchen Mayberry", title = "Gryphon Master",
  bible = "bibles/riverglades.md", role = "flightmaster", tier = "service",
  communities = { "farholde" }, temper = { "brisk" }, values = { "proud" },
  notices = { "flight" },

  impression = {
    first = "She is proud of every grumpy gryphon she keeps.",
    third = "{name} met Gretchen Mayberry, the Gryphon Master of Farholde Keep.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You're back! Even the grumpiest bird stopped sulking when it saw you, and that's high praise from a gryphon." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I'll put you on a bird, since that's my job, but I've told them to take the bumpy way round." },
    { id = "g_default", text = "Need a lift? The birds are fed, and grumpy with it, and one of them has eaten my left glove." },
    { id = "g_fog", when = { timeOfDay = "dawn" }, text = "Fog's in. They'll fly, but they'll complain the whole way." },
  },

  notice = {
    { id = "n_skyborne", cat = "flight", when = { race = "Skyborne" },
      text = "You're one of the gliding ones; Walk on Air, isn't it? Lovely, though it only goes downhill, and my birds do uphill." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It's the fog off the river that troubles them, not the wind. If you can ask the fog to lift now and then, I'll fly you for free." } },
      choices = {
        { text = "I'll ask the river spirits to lift the fog.", next = "BACK", reply = "Would you? Then my birds would fly again, and I'd be in your debt.", fx = { align = { order = -1 } } },
        { text = "The fog's a cult trick. Break the cult, and it lifts.", next = "BACK", reply = "Then break it, and quickly. I've had my birds grounded for a week.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    -- Deeds pass: the player died from a fall.
    dd_fall = {
      lines = { { id = "df_default", text = "Never, not once in all the years I've kept this roost. The birds know they've a passenger and fly as if they're carrying eggs; it's the people who jump off early to save a few minutes who end up in the river." } },
      choices = {
        { text = "That's a comfort. I'll keep my seat.", next = "BACK", reply = "Do. And if you're ever in a hurry, tell me, and I'll pick you the fastest bird, not the shortest drop." },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_fall", when = { deathCause = "falling" },
          text = "You've fallen from a height and not got up, haven't you? I can always tell, because folk who've done it grip the saddle straps like they mean to strangle them. My birds have never dropped anyone, I'll have you know." },
        { id = "h_dd_twilight", when = { killed = { name = "Twilight", min = 40 } },
          text = "My birds fly over the ridge every evening, and there are fewer cookfires in the Twilight camps each time. The riders say that's your work, so you'll get my best bird, at the usual rate." },
        { id = "h_default", key = true, text = "Gretchen Mayberry, Gryphon Master. If you're headed anywhere the Brotherhood holds, I'll have you there before the fog lifts." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior! The birds like a heavy rider, believe it or not; it keeps them steady in the wind off the river." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Don't polish that armour too bright before a flight, because the glare off the river spooks the birds." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter. Your beast walks, I'm afraid; gryphons won't share a saddle with anything that might be lunch." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Sneaking about the roost? Don't; a startled gryphon bites first and never apologizes." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Say something calming over the young male in the corner, would you? He's been sulking since the fog came in." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. You'll be wanting to teleport everywhere, I suppose, so you've come to sneer at my birds." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "The birds don't care for you, I'm sorry to say. They keep sniffing at your sleeves and backing off, but they'll fly you all the same; they're professionals." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! If you can talk to animals, ask the old female on the end why she won't eat fish, because I've tried everything else." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! The birds like you already; they always settle when the wind's friendly, and it seems the wind's friendly to you." },
      },
      again = { { id = "h_again", text = "Anything else? My gryphons like to be off before the river mist closes in again." } },
      choices = {
        { text = "I fell to my death once. Do your birds ever drop riders?", next = "dd_fall", when = { deathCause = "falling" } },
        { text = "I need a ride.", next = "BUSINESS" },
        { text = "Gryphons, this far from Ironforge?", next = "gryphons" },
        { text = "The flying can't be easy out here.", next = "flying" },
        { text = "Walk on Air beats a gryphon.", next = "glide", when = { race = "Skyborne" } },
        { text = "Gryphons must be useful in a fight.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do your gryphons fly to the front?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Where did you learn to handle gryphons?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Can a gryphon fly quietly?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "That one seems to be sulking.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why fly when a portal is faster?", next = "xmage", when = { class = "MAGE" } },
        { text = "Why don't the birds like me, Gretchen?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Why won't she eat fish?", next = "xdruid", when = { class = "DRUID" } },
        { text = "One of your routes must give you trouble.", next = "route" },
        { text = "Does the river wind trouble your gryphons, Gretchen?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
    xwarcl = {
      big = true,
      lines = {
        { id = "xwc_default", text = "Some are, though not mine. Wildhammer birds are bred for war, and these were bred to carry post and passengers, so they'll drop you at the front and turn for home before the arrows start, which I call sense." },
      },
      choices = {
        { text = "Sensible. Carry the riders and leave the fighting to us.", next = "BACK", reply = "Thank you. They carry, you fight, and everyone comes home.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A bird that flees a fight is wasted.", next = "BACK", reply = "Not wasted, only sensible. My old grey fled a fight once, and she's carried forty riders home since.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = {
        { id = "xpa_default", text = "As near as I'll let them, which isn't near: I set riders down on the road to the Twilight's Shroud and no closer. The Hammer's archers shoot at anything with feathers, and I won't lose a bird to save a few minutes." },
      },
      choices = {
        { text = "A few minutes could save a rider's life, Gretchen.", next = "BACK", reply = "It could, and it might cost a bird. That's the trade I make every night.", fx = { align = { light = 1 } } },
        { text = "Right call. The birds are hard to replace.", next = "BACK", reply = "They are, and they're friends besides. Thank you.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhc_default", text = "Menethil, under a dwarf handler who never once let me wear gloves. Treat a gryphon like a falcon and it'll take your hand; treat it like a dwarf, with respect and a little ale, and you'll get on fine." },
      },
      choices = {
        { text = "Respect first. A beast knows when you mean it.", next = "BACK", reply = "That's what my handler said too, and he was right. You'll do well with them.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A firm hand works better than respect.", next = "BACK", reply = "Then they'll show you otherwise, and the scars will remind you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xro_default", text = "Quiet as owls, with the wind behind them. I've had riders ask to be set down in the dark near the Shroud, and I don't ask why, and they don't tell me, and the bird keeps its beak shut too." },
      },
      choices = {
        { text = "Good. I prefer my work without witnesses.", next = "BACK", reply = "Good. My birds keep quiet, and so do I.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd rather land in daylight and be seen.", next = "BACK", reply = "Then you'll land where everyone's looking, which is your choice. My birds don't mind either way.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = {
        { id = "xap_default", text = "Fog makes him miserable, miserable makes him sulk, and sulking makes him bite. He's young and he's never seen weather like this coast, so if you've a calm word for him, I'll take it." },
      },
      choices = {
        { text = "Patience and a kind word. He'll settle.", next = "BACK", reply = "That's my thinking too. He's young, and he'll come round.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Work him harder. He'll forget to sulk.", next = "BACK", reply = "Harder makes him bite harder. I'll stick with kindness, thank you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmg_default", text = "Because a portal can't show you the Riverglades from above, and my birds can, fog and all. Besides, nobody ever tipped a portal." },
      },
      choices = {
        { text = "Time matters more than views. Portals win.", next = "BACK", reply = "Maybe for you. My birds will still be here when you change your mind.", fx = { align = { order = 1 } } },
        { text = "You've convinced me. I'll take the view.", next = "BACK", reply = "Good. You'll not regret it, I promise you.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlk_default", text = "They can smell it, whatever it is you keep company with. I can't, but I trust their noses more than mine, so ride light and keep your hands still, and they'll get you there." },
      },
      choices = {
        { text = "Understood. What I carry stays well away from the roost.", next = "BACK", reply = "Thank you. They'll fly gentler for you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They'll get used to it. Everything does, in the end.", next = "BACK", reply = "Some things, maybe. My birds aren't everything.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = {
        { id = "xdr_default", text = "If I knew, I wouldn't have asked! She was raised on mutton in Dun Morogh and won't touch river trout, and there's no mutton out here, so we've reached a sort of standoff." },
      },
      choices = {
        { text = "Find her some mutton. She's earned a little comfort.", next = "BACK", reply = "I've tried, and Melbin charges a fortune for it. Still, she's worth it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Hunger will settle it. Don't spoil her.", next = "BACK", reply = "That's what Demar says, and I'll not tell him you agreed. She'll come round.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    route = {
      lines = { { id = "rt_default", text = "The run to Powderfuse, over the river mouths. The wind comes off the sea sideways, and the goblins set off fireworks whenever a ship comes in, and I've had birds land a mile off course because of it." } },
      choices = {
        { text = "You ought to complain to the goblins.", next = "route_goblins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    route_goblins = {
      lines = { { id = "rtb_default", text = "Twice, to Melbin Powderfuse, who said the sky over his port is his too and offered to sell me a share of it. I told him where he could put his share, politely." } },
      choices = {
        { text = "Stand up to him. Your birds come first.", next = "BACK", reply = "I will, and I'll tell him you said so. My birds were here first.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Pay him something. It's easier than a feud.", next = "BACK", reply = "Easier, yes, and cheaper in the long run, maybe. I'll think on it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I learned to fly before I learned to swim, and Farholde's surrounded by water, so that's been an education." } },
    advice = { { id = "tp_ad", text = "Visit every roost you pass. The birds don't forget a face that brought them a treat." } },
    second_war = { { id = "tp_second_war", text = "The Wildhammer flew gryphons in the old war, and they taught the Alliance how. I've kept the tradition going, and my birds are the best in the Riverglades." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer know gryphons better than anyone, and I'd give a year's pay to learn from them. My birds are grumpy, but they'd be grumpier without what the Wildhammer taught us." } },
    bolvar = { { id = "tp_bolvar", text = "Stormwind sends us gryphons now and then, and I'm grateful for every one. I'd be more grateful if they sent riders to go with them." } },
    _none = { { id = "tp_none", text = "Can't help you there. I only know the sky and the birds in it." } },
  },
}

P:NPC {
  key = "alphonse", id = TODO_NPC("Alphonse Dumas"), name = "Alphonse Dumas",
  bible = "bibles/riverglades.md", role = "blacksmith", tier = "quest",
  communities = { "farholde" }, temper = { "taciturn" }, values = { "patient", "proud" },
  notices = { "kit", "craft" },

  impression = {
    first = "He spends his words like his coal, carefully and not often.",
    third = "{name} met Alphonse Dumas, the smith who keeps the Brotherhood shod and armed at Farholde.",
  },

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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I'd forge one for anyone on the wall. Iron's short and coal's shorter, so tell your spirits the forge needs feeding." } },
      choices = {
        { text = "Arm the wall first, Alphonse, not me.", next = "BACK", reply = "Good. The wall comes first, and I'll make yours after.", fx = { align = { honor = 1 } } },
        { text = "Sell to whoever pays most, Alphonse, starting with me.", next = "BACK", reply = "Coin's coin, aye, but the wall keeps the coin safe. I'll arm it first.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_cages", when = { questDone = TODO_QUEST("No Soldier Left Behind") },
          text = "Riftan tells me you took the cage keys off the Twilight champions and let his scouts out. I had a look at one of those keys afterwards, and it was cut fine. Somebody in that fortress knows their way round a forge, and I don't like that at all." },
        { id = "h_default", key = true, text = "Alphonse Dumas. I keep the Brotherhood shod and armed, though iron's short and coal's shorter. Patience I have plenty of." },
        { id = "h_mould", tags = { "news" }, when = { questActive = TODO_QUEST("Krol'dok Moulding") },
          text = "That's a key mould you've got, ogre work and crude as a boot. Let me look at it." },
        { id = "h_key", when = { questActive = TODO_QUEST("Key Ingredients") },
          text = "To cast a key from that mould I need thick leather and iron bars. I've got the fire, so you bring the rest." },
        { id = "h_key_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Key Ingredients"), days = 3 } },
          text = "That key's ugly, but it'll open the ogres' door in Krol'dok all the same. Ugly works." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "Plate. Good plate, too, though somebody's been mending it with the wrong rivets." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter. I can do arrowheads if you bring the iron, and I'll do them right." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Your knives want an edge, I'd guess. Leave them on the bench; I don't ask whose they've been in." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. There's not much for you at a forge, but you're welcome to the warmth." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. Ashe is always asking me for odd things, rings that don't melt and the like, so I suppose you'll want something odd too." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Keep whatever's in your shadow away from my fire; the embers don't like it." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid at a forge. That's new, and I'll not ask what you need iron for." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Your totems are good stone, and I'd forge you a mace to match if I had the coal." },
      },
      again = { { id = "h_again", text = "What else?" }, { id = "h_again2", text = "Go on; the hammer's not listening." } },
      choices = {
        { text = "Show me what you've got.", next = "BUSINESS" },
        { text = "Iron seems short around here.", next = "iron" },
        { text = "What will that key open?", next = "key",
          when = { any = { { questActive = TODO_QUEST("Key Ingredients") }, { questDone = TODO_QUEST("Key Ingredients") }, { questActive = TODO_QUEST("Krol'dok Moulding") } } } },
        { text = "You must have worked this forge a long time.", next = "forge" },
        { text = "Any advice for another smith?", next = "teach", when = { profession = "Blacksmithing" } },
        { text = "My armour's taken a beating out in these glades.", next = "xwarrior", when = { class = "WARRIOR" } },
        { text = "Will you look at my plate?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What do you need for arrowheads?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Can you make a blade that doesn't catch the light?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "You must say a prayer at the forge now and then.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What odd things has Ashe asked for?", next = "xmage", when = { class = "MAGE" } },
        { text = "Why don't your embers like me, smith?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Where does your charcoal come from?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Would you forge a mace for a shaman, Alphonse?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    iron = {
      lines = { { id = "i_default", text = "Ships come rarely and the goblins charge like it's gold. The rest I melt down from what the cultists leave behind." } },
      choices = {
        { text = "Cultist steel? Is it any good?", next = "iron_twilight" },
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
      lines = { { id = "f_default", text = "Long enough to know every sword in this keep by its ring. Ask Bertrand the mason and he'll say I never complain, but he's wrong; I complain to the anvil." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    teach = {
      lines = { { id = "t_default", text = "Don't quench in a hurry. Everything that ever cracked on me cracked because I was in a hurry." } },
      choices = { { text = "Thank you.", next = "BACK", fx = { affinity = 2 } } },
    },
    xwarrior = {
      lines = { { id = "xwa_default", text = "I can see. Bring me iron bars and I'll mend it; without them I can only tell you which dent will kill you first, and that one, there, on the left." } },
      choices = {
        { text = "Why's iron so short?", next = "iron" },
        { text = "I'll find iron.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xapala = {
      big = true,
      lines = {
        { id = "xpa_default", text = "Already did. The rivets are wrong and the left pauldron's taken something heavy, ogre I'd say, so I'll set it right, the old way, since that's what the plate was made for." },
      },
      choices = {
        { text = "Do it properly. I'll wait as long as it takes.", next = "BACK", reply = "Good. Properly takes time, but it'll hold.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Patch it quick. I'm needed at the front.", next = "BACK", reply = "Quick and it'll fail you. I'll do it properly, and you'll wait.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhc_default", text = "Iron, which I haven't got, and patience, which I have. Bring me bars and I'll make you heads that go through cultist leather instead of bouncing off it." },
      },
      choices = {
        { text = "I'll buy the iron properly, at the port.", next = "BACK", reply = "Good. Melbin's dear, but his iron's honest.", fx = { align = { honor = 1 } } },
        { text = "Cultist dead carry iron. I'll take theirs.", next = "BACK", reply = "Their iron's cursed, more than likely. I'll not forge from it.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xro_default", text = "I can, if you blacken it in oil, though it'll rust faster, mind; nothing's free. Fern Crimsonleaf, the Brotherhood's old agent, carried one like that, and she brought it back to me every week to be seen to." },
      },
      choices = {
        { text = "Blacken it. I do my work at night.", next = "BACK", reply = "Blacken it, then, and keep it oiled. Fern would have done the same.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Leave it bright. Let them see me coming.", next = "BACK", reply = "Bright it is, and they'll see you coming. Howard did the same.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = {
        { id = "xap_default", text = "Every time I quench. It's a short one, and I don't rightly know who it's to, but the steel comes out better, so I keep doing it." },
      },
      choices = {
        { text = "It's heard, even if you don't name who hears it.", next = "BACK", reply = "I hope so. It's the only prayer I know.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "That's habit, not prayer. Your skill makes the steel.", next = "BACK", reply = "Maybe, but I'll keep saying it. The steel's never complained.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmg_default", text = "A ring that won't melt, a bowl that won't break, and a box for the trinkets with no seams in it. I made the box; she said thank you, and then she nailed it shut anyway." },
      },
      choices = {
        { text = "Good. Keep that thing boxed and buried.", next = "BACK", reply = "They should, and this one will. I'll make sure of it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'd have opened it, just to look.", next = "BACK", reply = "You'd not be the first, and the last one regretted it. Leave it shut.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlk_default", text = "Fire knows. It leans away from you, the way it does when the bellows run backwards, so I'll work for you, but I'll keep the fire between us." },
      },
      choices = {
        { text = "I mean no harm to your forge, smith.", next = "BACK", reply = "Good. The fire will settle, given time.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fire's a servant. It'll learn its place.", next = "BACK", reply = "Fire's nobody's servant, friend, and you'd do well to remember it near my forge.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = {
        { id = "xdr_default", text = "From the scraps at Turner's logging camp, mostly. I'll not burn a good tree when a bad branch will do, if that's what you came to ask." },
      },
      choices = {
        { text = "Thank you. Take only what's already fallen.", next = "BACK", reply = "That's what I do, and the forest doesn't seem to mind.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Walls need iron and iron needs fire. Burn what you must.", next = "BACK", reply = "I'll burn what I must and not a twig more. The forest's done enough for us.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A smith, and a smith's son, and that's the whole of it." } },
    advice = { { id = "tp_ad", text = "Oil your blade after the river. The damp here eats steel faster than cultists do." } },
    krol_dok = { { id = "tp_kroldok", text = "Ogre steel's thick and stupid, like ogres." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons make the best steel in the world, and the worst tempers. I'd learn their secrets if I could, and I'd keep my distance while I did it." } },
    blackrock = { { id = "tp_blackrock", text = "The Blackrock orcs forge crude and heavy, all strength and no patience. You can tell an orc blade by the way it's never been properly tempered." } },
    second_war = { { id = "tp_second_war", text = "My master forged blades for Farholde in the old war, and I learned on his anvil. I still use his hammer." } },
    _none = { { id = "tp_none", text = "Don't know, and don't need to." } },
  },
}
