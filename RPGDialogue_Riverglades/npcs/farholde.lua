-- Farholde Keep: the Brotherhood of the Horse, twenty years holding the Riverglades. Voice: bibles/riverglades.md
local P = RPGDialogueAPI:Pack("rpgd.riverglades")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "demar", id = TODO_NPC("Demar Brant"), name = "Demar Brant", title = "Knight Commander",
  bible = "bibles/riverglades.md", role = "soldier", tier = "major",
  communities = { "farholde", "brotherhood_horse" }, temper = { "proud", "steady" }, values = { "loyal", "brave", "stern" },
  notices = { "class", "stormwind", "kit" },

  impression = {
    first = "Knight Commander Demar Brant holds Farholde with what Stormwind left him, which he insists is nothing. He speaks of his dead by name, and he sized me up like a man counting swords for the wall.",
    third = "{name} met Knight Commander Demar Brant, who has held Farholde for the Brotherhood of the Horse through twenty hard years.",
  },

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
        { id = "h_warm", when = { disposition = { min = 75 } },
          text = "There you are. The riders ask after you when you're gone a while, and I've stopped pretending I don't." },
        { id = "h_fern_resolved", tags = { "news" }, key = true, when = { thread = { id = "farholde_lost", state = "resolved" } },
          text = "Gray came up to the keep, his first time in a year, and we didn't argue about Fern; we drank to her. I'm told that was your doing, so thank you, and don't make me say it twice." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "I walk the walls at night, a habit since the siege. The river's loud after dark, and I'd rather hear it than the quiet." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage, from Dalaran or one of Stormwind's towers. Ashe will want you before I do, but I'll want you more, because fire on a wall is worth ten men behind it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "You've a smell about you I learned in the siege, {class}. Keep whatever you've bound on a short leash inside my walls, or my riders will see to it for you." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A kaldorei, this far into the human lands. The Riverglades were green before the Hammer came, and I'd like to see them green again before I'm buried in them." },
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
        { text = "A warrior's sword, Commander, if the Brotherhood will have it.", next = "xwarrior", when = { class = "WARRIOR" } },
        { text = "Your memorial names a Ravenholdt agent. Fern.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "I scout. Where do you need eyes?", next = "xhunter", when = { class = "HUNTER" } },
        { text = "What would you have a mage do here, Commander?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "My magic could be turned on the Hammer, Commander.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "The land here is sick, Commander. Can it heal?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "I'll be on my way.", next = "END" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Burn what the Hammer leaves standing in Sunnyglade, and teach my riders to tell a cultist's ward from a farmer's charm. Alden Amberhall did both before the west took him, and nobody's done either since." } },
      choices = {
        { text = "I'll fight beside your riders. Farholde deserves its own mages.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I go where the study is, Commander, not where the war is.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Could it? The Hammer's priests started out saying the same, I'd wager, that they'd use the dark and not be used by it. Prove it at Krol'dok, and I'll judge you by what you bring back, not by what follows you around." } },
      choices = {
        { text = "Fire answers fire. I'll use whatever wins this war.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "You're right to be wary. Power like mine should be watched.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Ask Sunnyglade. The cultists foul the wells and burn the orchards for sport, and nothing grows where they've camped. There was an orchard by Windstead once, and I'd give a great deal to see it bear again." } },
      choices = {
        { text = "Then drive them out, and the land will mend in time.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The land outlasts your war. Fight it less and tend it more.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
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
        { text = "Then trust it. I don't break ranks.", next = "BACK", fx = { affinity = 2, align = { order = 1 }, standing = { farholde = 1 } } },
        { text = "I fight best on my own, Commander.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Lothar was one of yours?", next = "lothar" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xro_default", fx = { learn = { "fern_crimsonleaf" } },
        text = "Fern Crimsonleaf, our lead agent, who went into the Horde camp the night before Howard's charge and killed their leaders in the dark. We never saw her again. I've never cared much for your trade, but I've never once said a word against it since that night." } },
      choices = {
        { text = "What happened to her?", next = "fern" },
        { text = "Some work only gets done in the dark.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd rather win it Howard's way, in the open.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
      },
    },
    xhunter = {
      lines = {
        { id = "xhu_default", text = "Everywhere, and nowhere I can spare a rider. Rosalind Ashwood was our lead scout, with eyes as keen as an elf's, and I haven't had one like her since; walk the Bristle Hills for me and tell me what the gnolls are doing." },
        { id = "xhu_human", when = { race = "Human" },
          text = "A Stormwind hunter with a beast at heel; Rosalind would have liked you, since she always said the kingdom wasted its woodsmen. Walk the Bristle Hills for me and tell me what the gnolls are doing." },
      },
      choices = {
        { text = "Who was Rosalind?", next = "memorials" },
        { text = "I'll walk the hills.", next = "BACK", fx = { affinity = 1, standing = { farholde = 1 } } },
      },
    },
  },

  topics = {
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
    _none = { { id = "tp_none", text = "If it isn't in the Riverglades, it isn't my concern. Ask Ashe; she reads." } },
  },
}

P:NPC {
  key = "ashe", id = TODO_NPC("Ashe Amberhall"), name = "Ashe Amberhall",
  bible = "bibles/riverglades.md", role = "scholar", tier = "major",
  communities = { "farholde", "brotherhood_horse" }, temper = { "sharp", "chatty" }, values = { "curious", "loyal" },
  notices = { "arcane", "curse" },

  impression = {
    first = "Ashe Amberhall talks faster than I can write, then catches herself and apologizes, then carries on anyway. Underneath all the books there is someone grieving, and very good at not showing it.",
    third = "{name} met Ashe Amberhall, the Knight Commander's advisor at Farholde, a quick-tongued mage who keeps her father's notes.",
  },

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
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Demar will be glad, he always is, and he'll put you on the wall before you've had a meal, so do eat first; I'm quite serious." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, in Farholde! You'll want to see the memorials; Demar won't talk about the ones who carried the Light, but they're there, and they're worth reading." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, good; Cady's been the only one reading the Riverglades' tracks for months, and she has a cradle to watch as well." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You walk the way Fern used to, which is to say I didn't hear you until you were at my elbow. Please don't do that near the curios; I nearly dropped one." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Sister Rowland could use you in the chapel more than I could, though I'd be glad of your eye on these curios; something in them doesn't like being looked at." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid of the Cenarion Circle! I've read about Moonglade, but I've never met anyone who's been, so forgive me if I ask too many questions; I usually do." },
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
        { text = "Gnomeregan had libraries too, once.", next = "xgnome", when = { race = "Gnome" } },
        { text = "Do you ever wish you'd learned the sword instead?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "How does the Light fare against the Hammer's magic?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What tracks should a hunter watch for here?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you want me to steal something from the Hammer?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Let me look at the curios. Faith can sense a curse.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Ask, then. What do you want to know?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Thank you, Ashe.", next = "END" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every day of the siege, honestly, and then I'd set a cultist's banner alight from the parapet and remember why I didn't. My father said steel and spellcraft are two ends of the same argument, and I think he meant we need both and neither should be smug about it. I'm babbling." } },
      choices = {
        { text = "Your father was right. Neither one wins alone.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A sword answers to nobody, and I prefer it that way.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Better than mine, if I'm honest, which annoys me more than it should. Their curses come apart when a paladin's near, the way frost lets go of a window, and I've been trying to write down why for a month without any success at all." } },
      choices = {
        { text = "The Light isn't a puzzle to solve. Trust it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Write it down. Faith works better when it's understood.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Boots that come out of the northwest caves at night and don't go back in, mostly, and the wolves have stopped going near Sunnyglade, which tells you more than any scout's report. Animals know a curse before I do, and I find that both useful and a little humbling." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Is that your {pet}? Keep it away from the satchel on my desk, please; the last thing I want is a cursed trinket in a beast's jaws." },
      },
      choices = {
        { text = "I'll hunt them in the open and let them see me coming.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Better to lay snares at the caves and wait.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Their notes, if they keep any, and I suspect they do, because zealots love to write things down. A page in the Hammer's own hand would tell me more than a cart of their trinkets, though Demar would say a dead cultist tells him enough." } },
      choices = {
        { text = "I'll take their pages. A quiet theft saves lives.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd rather face them openly than rifle through their tents.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Then look, but don't touch, and tell me if you feel what I feel, a sort of cold that sits behind the eyes. My father would have known the word for it, and I've three books open and still no word." } },
      choices = {
        { text = "Burn them. Some things shouldn't be studied.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Study them. We need to know our enemy's tools.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Whether the land itself can be cursed, or only the things on it. Nothing grows at Sunnyglade now, and I can't tell if the Hammer poisoned the soil or if the soil simply remembers what was done on it." } },
      choices = {
        { text = "The land can heal, once the cultists are driven off it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some ground stays poisoned. Salt it and move on.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
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
        { text = "Nothing. It's gone.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Oh, I know a great deal, and I'm out of practice at keeping any of it to myself. Ask, and stop me if I go on." },
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
    _none = { { id = "tp_none", text = "I don't know! I'd love to, though, so write it down for me, would you? I'll look into it." } },
  },
}

P:NPC {
  key = "riftan", id = TODO_NPC("Sergeant Riftan"), name = "Sergeant Riftan",
  bible = "bibles/riverglades.md", role = "soldier", tier = "quest",
  communities = { "brotherhood_horse" }, temper = { "weary", "steady" }, values = { "loyal", "stern" },
  notices = { "kit", "curse" },

  impression = {
    first = "Sergeant Riftan has fought the cultists so long he has stopped counting the years. He keeps one eye on the ridge even while he talks, and complains about Ashe in a way that sounds almost fond.",
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
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Good, because I need eyes on the ridge more than I need another sword, and my lads can't see past the Shroud at dusk." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You'll be the quiet sort, then. Fine, because the Shroud's no place for loud boots, and I've buried enough lads who learned that the hard way." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest out at the front. Sister Rowland sends her blessings up with the supply cart, but it's not the same as having someone here when the lads go down." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "Another mage. Ashe sends you up here, does she? Tell her I'm fine, and tell her I said it before you asked, so she knows it's true." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "I can smell the Shroud on you, and you've not even been out there yet. Whatever you carry, keep it away from my lads; they've seen enough of that sort of magic." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf, out here. The trees by the Shroud have gone black at the roots, and I'd be glad of someone who can tell me whether that's sickness or something worse." },
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
        { text = "What's moving on the ridge, Sergeant?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I could slip into their camp tonight.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Who tends your wounded out here, Sergeant?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "She worries about you, Sergeant. So should you.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "My magic isn't the Hammer's, Sergeant.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Show me those roots, Sergeant.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Stay safe, Sergeant.", next = "END", fx = { affinity = 1 } },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Cultists in pairs, every night, carrying something wrapped in cloth from the caves toward Sunnyglade. I've never got close enough to see what it is, and I've stopped sending lads to try." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep your {pet} close tonight. The Hammer's lot set snares along the ridge, and I've lost a good dog to one already." },
      },
      choices = {
        { text = "Then I'll go myself and see what they carry.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Shoot the porters from cover, whatever they're carrying.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "You could, and the last one who said that came back with a satchel of trinkets and a cough he never shook. Go if you're going, but don't pick up anything that hums, and if you do, take it straight to Ashe and not to me." } },
      choices = {
        { text = "I'll cut their sentries' throats and be back by dawn.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll scout and nothing more. No killing in the dark.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Me, mostly, and I'm no hand at it. The cuts heal well enough, but the ones who handle the Hammer's trinkets go grey and quiet, and I don't know a prayer for that." } },
      choices = {
        { text = "Send them back to the chapel and let the Light work.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some can't be saved. Spend your care on those who can.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "She worries about everybody, that one, and she's usually right, which is the worst of it. I've been at this wall long enough that the quiet nights frighten me more than the loud ones, and I suppose that's what she's on about." } },
      choices = {
        { text = "Take a rest, Sergeant. The wall will hold for a week.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Stay at your post. Your lads need you there.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Maybe it isn't. From where I stand, with the dead to count, it all looks much the same, and I'll judge you by which side of the ridge you're on when the cultists come." } },
      choices = {
        { text = "Judge me by the cultists I burn, then.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Fair enough. Power like mine should be watched.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They're down the slope past the second watchfire, and they ooze when you cut them, which no tree I know of ought to do. My lads won't camp near them anymore, and I can't say I blame them." } },
      choices = {
        { text = "Burn the grove before the rot spreads.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Leave it to me. I'll try to heal it first.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
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
    knows = {
      { id = "tp_knows", text = "I've fought in these glades longer than I care to remember, and I've learned a thing or two the hard way. Ask." },
    },
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

  impression = {
    first = "Sister Rowland keeps the sick soldiers clean, fed and prayed over, and won't pretend to know what ails them. There is a calm about her that I suspect costs her more than she lets on.",
    third = "{name} met Sister Rowland, who tends the Brotherhood's sick in Farholde's chapel.",
  },

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
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Sit a moment before you go back out, and let me see that arm; you're holding it as if it pains you, and pride never mended anything." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. If you're going into the hills, bring me back anything that grows by clean water, because my fever draught is running thin." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You came in without a sound, and half my patients didn't stir. I'll take that as a kindness, though I suspect it's only habit." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "Another of Ashe's kind? She sends me salves out of her books, and half of them work, which is better than most physic I've been sent." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Mind where you stand, please; the men can feel what you carry, even when they can't name it, and they've little enough strength to spare." },
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
        { text = "I'm a druid. I know herbs that ease fever.", next = "xdruid", when = { class = "DRUID" } },
        { text = "How many of the Brotherhood have you lost, Sister?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What's in your fever draught, Sister?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Has anything gone missing from your chapel, Sister?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Could magic find the cause of this sickness?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I could leave, if my presence troubles them.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Prayer won't break a fever, Sister, but medicine might.", next = "END", fx = { align = { light = -1 } } },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More to the sickness this season than to the cultists' blades, and that's the hardest part of it. A sword cut I can stitch, but this fever takes the strongest first, and I have no name for it yet." } },
      choices = {
        { text = "Then I'll stand watch so your sick can rest.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Send the sick away. The wall needs men who can stand.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Willow bark, honey, and whatever clean herbs the hunters bring me, which is fewer every month. It eases the fever but doesn't break it, and I'll not pretend otherwise to the men who drink it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} may come in, but keep it away from the beds, please. The sick don't need anything more to fret about." },
      },
      choices = {
        { text = "Tell them the truth. They deserve to know.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let them hope a while. Hope does its own work.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Bandages, now and then, and once a bottle of wine meant for the rites. I didn't ask, because the man who took it was dying, and I hope it was a comfort to him." } },
      choices = {
        { text = "Theft is theft. You should have stopped him.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You did right. Let the dying have their comforts.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Ashe has tried, and the Light has tried through me, and neither of us has found it yet. I won't guess at the cause, because a wrong guess would have us treating the wrong thing while men die." } },
      choices = {
        { text = "Then test every guess. Waiting kills men too.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "You're right to be careful. A wrong cure is worse.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "That's kind of you to offer, and kindness is rarer out here than you'd think. Stay a moment, but by the door, and tell me honestly whether you sense anything of your own craft in this fever." } },
      choices = {
        { text = "I'll tell you plainly, Sister, whatever I sense.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Better you don't know what my craft senses.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
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
    xdruid = {
      lines = { { id = "xdr_default", text = "Then I'll take every one you know, and I won't ask whether they come from the Light or from the earth. Some of the men will stare at you, so please don't change shape on the ward; they've seen enough strange things this year." } },
      choices = {
        { text = "I'll mind the ward. Show me the worst.", next = "illness", fx = { affinity = 2 } },
        { text = "They'll get used to me.", next = "BACK", fx = { trait = { witty = 1 } } },
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
    _none = { { id = "tp_none", text = "I'm sorry; my world's been this room, lately." } },
  },
}

P:NPC {
  key = "cady", id = TODO_NPC("Cady Lloydriel"), name = "Cady Lloydriel",
  bible = "bibles/riverglades.md", role = "soldier", tier = "quest",
  communities = { "farholde", "brotherhood_horse" }, temper = { "wary", "sharp" }, values = { "loyal", "cautious" },
  notices = { "pets", "elves", "form" },

  impression = {
    first = "Cady Lloydriel is a ranger of few words, and most of her attention stays on the cradle beside her. Her dog and cat seem to have more opinions than she shares.",
    third = "{name} met Cady Lloydriel, a ranger of the Brotherhood who keeps watch over Farholde's walls and a cradle.",
  },

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
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Lower your voice near the cradle, please; you can be as loud as you like out on the wall." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Aedamas likes you, which counts for more with me than the plate does." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "Luna heard you before I did, and I heard you before Aedamas did, so you're good, but not as good as you think." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Sister Rowland could use you more than I could, and she'd never ask, so I'm asking for her." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. Ashe will be glad of you, and I'll be glad she has someone else to talk at." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Aedamas growled at you, and he doesn't growl at much. Whatever's following you about, keep it out of the barracks." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A kaldorei druid. Aedamas will want to sniff you, and Luna will pretend you're not there, so don't take either of them personally." },
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
        { text = "You're quel'dorei. We don't often share a wall.", next = "xnightelf", when = { race = "NightElf" } },
        { text = "How long have you ridden with the Brotherhood?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Would you have the Light bless the child?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Who watches the cradle while you're out on patrol?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Is the sickness spreading to the families?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Did you ever study magic yourself?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "My servant won't trouble the child. I promise.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Your animals seem well cared for out here.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Long enough that the men stopped asking why an elf rides with them, which took a while. I stayed because they needed a bow and nobody else was offering one, and I've not found a reason to leave since." } },
      choices = {
        { text = "Then they're lucky. Loyalty like yours is rare.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Loyalty's fine, but I'd have gone home long ago.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "No, thank you, and don't take that wrongly; the child sleeps well enough without prayers said over the cradle. If you want to be useful, ride out and make the road safer, and that will do more good than any blessing." } },
      choices = {
        { text = "A blessing never hurts. I'll pray for you both anyway.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fair enough. Deeds before prayers, then.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Someone I trust, and that's all you'll get on the subject. Ask me about the road instead; the Horde's been moving scouts past Rog'mar, and I've counted more than usual this month." } },
      choices = {
        { text = "Fair. Some things are no one else's business.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Secrets get people killed out here. Tell someone.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Not yet, and I watch the child for it every night, which is all I can do. Rowland says there's no pattern to it, and I've stopped looking for one, because I'd only start seeing it everywhere." } },
      choices = {
        { text = "Trust the Light to keep the child safe.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Trust your own eyes. They've kept the child safe so far.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "A little, as most of my people do, and I gave it up for the bow because the bow never argues back. Ashe argues back, which is why I like her, though I'd never tell her so." } },
      choices = {
        { text = "The arcane should be mastered, not set aside.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You chose well. Simple tools serve best.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "You'll forgive me if a warlock's promise doesn't put me at ease. Stand where I can see you, and we'll get along well enough." } },
      choices = {
        { text = "Fair. You've a child to guard; I'd do the same.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Your fear of my craft is what keeps you weak.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Better than the men, some days, because the animals don't complain about the rations. Aedamas came to me as a pup from a farm near Windstead, and he still won't go near the old road." } },
      choices = {
        { text = "Animals know who to trust. Listen to them.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Beasts are beasts. Trust your own judgment, ranger.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
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
    xnightelf = {
      lines = { { id = "xne_default", text = "No, we don't. I've no quarrel with the kaldorei, and the Brotherhood doesn't care whose ears are under the helm, so the wall's yours as much as mine." } },
      choices = {
        { text = "Old quarrels can stay old.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Your ancestors' magic nearly ended the world.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I watch the walls and I watch the people inside them, so I know a fair bit. Ask, and I'll decide what to tell you." },
    },
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

  impression = {
    first = "Wheatley, the stable master, plainly likes horses better than the people who ride them, and he said as much. I found it hard to hold that against him.",
    third = "{name} met Wheatley, Farholde's stable master, who tends every horse in the Brotherhood.",
  },

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
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, and you ride heavy, I'd guess, so tell me your horse's name before you tell me your own." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, then. Keep your beast clear of the stalls, if you would; my mares don't care for strange teeth." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "I know that walk. If you're here for a horse, you'll pay for it, and if you're here for a horse without paying, you'll find my mares bite." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Sister Rowland blesses the horses before a long ride, and the riders swear it helps, though I suspect it's the oats." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage, is it? Don't conjure anything near the stalls; the last time Ashe tried, the horses spent the night kicking their doors." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Whatever you ride, my mares won't stand in a stall beside it, so we'll find you a post outside the walls." },
      },
      again = { { id = "h_again", text = "Anything else? Hold this bucket while you ask." } },
      choices = {
        { text = "Let me see the stables.", next = "BUSINESS" },
        { text = "Who kept the stables before you?", next = "brienne" },
        { text = "Best horse you've ever had?", next = "best" },
        { text = "Do you stable druids?", next = "druid", when = { class = "DRUID" } },
        { text = "What makes a good warhorse, Wheatley?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do the horses smell the cultists before your sentries?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I'd never steal a Brotherhood horse.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Would you like me to bless the horses too?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Horses don't care for magic, then?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "My steed's no danger to your mares.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Nerve before speed, and a rider who doesn't saw at its mouth. The Brotherhood's horses charged a siege line once and came back for more, and that's not breeding alone, it's trust." } },
      choices = {
        { text = "A horse is a tool. Train it hard and it obeys.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Treat it like a comrade, and it'll ride into fire.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Every time. They'll stamp and roll their eyes an hour before the sentries call, and I've learned to wake the Commander when they do. Brienne taught me that, before she was under a stone." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has been eyeing my mares since you came in, {class}. Tie it by the trough, and we'll all stay friends." },
      },
      choices = {
        { text = "Trust the beasts. They've never lied to you.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Horses spook at shadows. Trust trained sentries.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Good, because every one of them has a name, and every rider in this keep would know it under a stranger. Some fool tried it the spring before last, and the mare brought him back to the gate by herself." } },
      choices = {
        { text = "Clever horse. I'd still have tried it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Stealing a soldier's horse is low. Serves him right.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "If you like, and they won't mind it, though Copper will try to eat your sleeve. I'll take any blessing going for these animals, because they've carried this keep through twenty years and asked for nothing but hay." } },
      choices = {
        { text = "The Light watches over every creature. I'll bless them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Better to feed them well. Prayers won't fill a manger.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They don't care for anything that smells of a lightning storm, and that's most of what you lot do. I'll keep your horse for you gladly, but you'll have to come in quiet, without your sparks." } },
      choices = {
        { text = "Fair. I'll leave the magic at the gate.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "They'll have to get used to it. Magic's here to stay.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Maybe not, but they don't know that, and they'd rather kick down a wall than find out. I've seen what the Hammer's beasts do to a stable, and I'll not take chances with these ones." } },
      choices = {
        { text = "A wise caution. Your horses come first.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fear makes beasts weak. Toughen them up.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
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

  impression = {
    first = "Gretchen Mayberry runs Farholde's gryphons briskly and is proud of every grumpy one of them. If the fog troubles her, she keeps it to herself.",
    third = "{name} met Gretchen Mayberry, the Gryphon Master of Farholde Keep.",
  },

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
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! My gryphons like a heavy rider, believe it or not; it keeps them steady in the wind off the mountains." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! I've flown dispatches for a few of your order, and they always fed the birds before they fed themselves, so you're welcome at my roost." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Keep your beast off my perches; the birds will tolerate a great deal, but not a cat sharpening its claws on their roost." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You don't need a gryphon, I'd wager; you look like you'd rather climb over the wall than fly over it." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! I'll fly you to the wounded wherever they are; my birds have carried more of Sister Rowland's patients than I can count." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. You can teleport, I'm told, so I'll not take it personally if you never use my birds." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "My birds don't care for your sort, and they'll screech the whole flight, but they'll carry you, because I tell them to." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! My birds like your kind, which isn't fair, because they barely tolerate me after ten years." },
      },
      again = { { id = "h_again", text = "Anything else? My gryphons like to be off before the river mist closes in again." } },
      choices = {
        { text = "I need a ride.", next = "BUSINESS" },
        { text = "Gryphons, this far from Ironforge?", next = "gryphons" },
        { text = "How's the flying out here?", next = "flying" },
        { text = "Walk on Air beats a gryphon.", next = "glide", when = { race = "Skyborne" } },
        { text = "Do your gryphons fight, or only fly?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you fly even when the weather turns?", next = "xapala", when = { class = "PALADIN" } },
        { text = "How do you train a gryphon?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Has anyone ever tried to steal a gryphon?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you fly the sick out of the Riverglades?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Your birds must see more of the land than I do.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why do your gryphons fear my kind?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Gryphons are proud. They choose whom they trust.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They'll fight if they're cornered, and they're vicious when they do, but I don't send them into battle and never will. They carry the wounded and the post, and that's worth more to Farholde than a few clawed cultists." } },
      choices = {
        { text = "Train them for war. Farholde needs every weapon.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Keep them for the wounded. That's the nobler work.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "When the post demands it, and it usually does, though the winds over the Steppes are cruel and the smoke makes my birds cough. A soldier's letter from home has kept more men on that wall than any sermon, so I fly." } },
      choices = {
        { text = "Fly anyway. Soldiers are waiting on those letters.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Ground them. A dead bird delivers nothing.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "With patience, raw meat and a thick pair of gloves, in about that order. The hatchlings take a year before they'll carry anyone, and I won't rush one, no matter how short the keep is." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is staring at my birds, {class}, and my birds are staring back. Let's not find out who blinks first." },
      },
      choices = {
        { text = "Rushing them would cost lives. Take your year.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The keep needs birds now. Push them harder.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Once, and the bird threw him into the river halfway to the Steppes. He swam back, sheepish, and paid his fare like everyone else, and I've told the story to every rider since." } },
      choices = {
        { text = "He learned his lesson. Leave it there.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "He should have hanged. Thieves don't change.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "When Rowland asks, and she asks less than she used to, because the sick don't travel well and she won't send the worst of them. I bring her bandages back, and letters for the men, and that's the best I can do." } },
      choices = {
        { text = "Fly them out. Better care waits beyond these hills.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Keep them here. Spreading the fever helps no one.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They do, and I've learned to read them; a bird that won't fly over the northwest caves is telling me something. Ashe asked me once to tie a little glass bead to their harness so she could see what they see, and I told her no." } },
      choices = {
        { text = "Let her try it. The knowledge could save lives.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "You were right. Your birds aren't her experiment.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Something about the smell, I think, like burnt hair and sulfur, and gryphons hate fire more than anything. I don't hold it against you, but I'd ask you not to summon anything near the roost." } },
      choices = {
        { text = "Fair. I'll keep my demons away from your birds.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They'll get used to it. I'm not hiding what I am.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "That they are, and these ones remember every rough hand they've known. If you could ask them what's frightening them over the northwest ridge, I'd be grateful, because they won't tell me." } },
      choices = {
        { text = "I'll listen to them. Beasts know more than we think.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Better to send scouts. Birds can't give a report.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
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

  impression = {
    first = "Alphonse Dumas spends his words the way he spends his coal, carefully and not often. He talked to me without once looking up from the anvil.",
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
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Alphonse Dumas. I keep the Brotherhood shod and armed, though iron's short and coal's shorter. Patience I have plenty of." },
        { id = "h_mould", tags = { "news" }, when = { questActive = TODO_QUEST("Krol'dok Moulding") },
          text = "A key mould, ogre work, crude as a boot. Let me look at it." },
        { id = "h_key", when = { questActive = TODO_QUEST("Key Ingredients") },
          text = "I need thick leather and iron bars. I've got the fire, so you bring the rest." },
        { id = "h_key_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Key Ingredients"), days = 3 } },
          text = "That key's ugly, but it'll open their door all the same. Ugly works." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Bring your hammer to the bench before you leave; a hammer that's struck the Hammer's cultists will need its head seen to." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Your arrowheads are dull; I can tell from here, and I'll fix them if you've the coin." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue. Don't touch the bench, and we'll get along." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Sister Rowland wants new needles for her stitching, and I've not had a minute; if you're headed to the chapel, take them with you." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. Ashe sends me puzzles from her books, and I send back iron, and we both pretend the other's work is the easy part." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. Your hands smell of brimstone and so does my forge, so I suppose we've that much in common." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf. You'll not want iron, I suppose, but I've leather and buckles if you need them." },
      },
      again = { { id = "h_again", text = "What else?" }, { id = "h_again2", text = "Go on; the hammer's not listening." } },
      choices = {
        { text = "Show me what you've got.", next = "BUSINESS" },
        { text = "Why's iron so short?", next = "iron" },
        { text = "What will that key open?", next = "key",
          when = { any = { { questActive = TODO_QUEST("Key Ingredients") }, { questDone = TODO_QUEST("Key Ingredients") }, { questActive = TODO_QUEST("Krol'dok Moulding") } } } },
        { text = "How long have you worked this forge?", next = "forge" },
        { text = "Any advice for another smith?", next = "teach", when = { profession = "Blacksmithing" } },
        { text = "My armour took a beating at Krol'dok.", next = "xwarrior", when = { class = "WARRIOR" } },
        { text = "What do you look for in a well-kept weapon?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Can you make heads that'll bite through Twilight leather?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Will you fit a blade for poison?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "How long have you worked this forge?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Could you forge something that holds an enchantment?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Could your steel hold a demon's bindings?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Where does your ore come from now?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Care, and a hand that knows its limits. Most fighters bring me steel they've let rust, and a paladin's usually the exception, which I put down to all that kneeling and polishing." } },
      choices = {
        { text = "Faith asks for care in all things, even steel.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A weapon's a weapon. It only needs to kill.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I can, if you bring me the leather to test them on. The cultists wear hide boiled in something that turns ordinary iron, and I've been trying to work out what for weeks." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep your {pet} back from the forge. Sparks and fur don't mix, and I've singed one before." },
      },
      choices = {
        { text = "Take what you need from their dead. They won't miss it.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll bring hide from a fair kill, not from grave-robbing.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I make blades, and what you put on them is your business. I won't cut a groove for poison, though, because I've seen what the Hammer's cultists do with it, and I'll not hand that to anyone." } },
      choices = {
        { text = "Fair. Poison's a coward's tool.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Poison wins wars. Your scruples will cost lives.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Twelve years, since the old smith died in the siege's last winter. I learned on his anvil, and I still find his marks on the hammer handles when I'm working late." } },
      choices = {
        { text = "He'd be proud. Keep his forge burning as he did.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Make it your own. The dead don't own the living.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "With the right ore and a mage at my elbow, maybe. Iron fights magic, and that Krol'dok moulding showed me the Hammer's smiths know a trick I don't, which I don't care for one bit." } },
      choices = {
        { text = "Learn their trick, and turn it against them.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Leave their craft alone. It'll taint your forge.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I don't know, and I'm not keen to find out. Iron's honest, and what you lot do with it after it leaves my bench isn't on my conscience, but I'll not have any of it done in my forge." } },
      choices = {
        { text = "Fair. Your forge, your rules.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Steel serves whoever wields it. Don't be squeamish.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The hills north of the keep, when the cultists let us dig, which isn't often. The mine's half shut, and the men who work it carry swords to the rock face, which isn't how mining's meant to go." } },
      choices = {
        { text = "Take only what you need from the hills.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Strip the hills while you can. A war needs iron.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
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
    xwarrior = {
      lines = { { id = "xwa_default", text = "I can see. Bring me iron bars and I'll mend it; without them I can only tell you which dent will kill you first, and that one, there, on the left." } },
      choices = {
        { text = "Why's iron so short?", next = "iron" },
        { text = "I'll find iron.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A smith, and a smith's son, and that's the whole of it." } },
    advice = { { id = "tp_ad", text = "Oil your blade after the river. The damp here eats steel faster than cultists do." } },
    krol_dok = { { id = "tp_kroldok", text = "Ogre steel's thick and stupid, like ogres." } },
    _none = { { id = "tp_none", text = "Don't know, and don't need to." } },
  },
}
