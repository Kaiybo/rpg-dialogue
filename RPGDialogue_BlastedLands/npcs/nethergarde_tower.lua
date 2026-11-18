-- Nethergarde's alchemist (0.39.0): Nina Lightbrew, at the top of the keep's tower.
-- Voice: bibles/blastedlands.md ("Nina Lightbrew")
local P = RPGDialogueAPI:Pack("rpgd.blastedlands")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "nina_lightbrew", id = TODO_NPC("Nina Lightbrew"), name = "Nina Lightbrew", title = "Alchemy Supplies",
  bible = "bibles/blastedlands.md", role = "vendor", tier = "service",
  communities = { "nethergarde" }, temper = { "brisk" }, values = { "craft", "careful" },
  notices = { "craft", "arcane" },

  impression = {
    first = "Nina Lightbrew sells alchemy supplies from the top floor of Nethergarde's tower, among the mages who watch the Dark Portal. She's practical and quick, and she thinks the Blasted Lands' strange plants deserve more respect than they get.",
    third = "{name} met Nina Lightbrew, who sells alchemy supplies at the top of Nethergarde's tower.",
  },

  greetings = {
    { id = "g_default", text = "You climbed all those stairs for vials? Good, because nobody else does, and I've got plenty." },
    { id = "g_back", when = { metBefore = true }, text = "Back up the tower again! Your legs must be stronger than mine by now." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist! Have you tried anything with the plants out in the wastes yet? They grow in that red clay, of all places, and they're not like anything in Elwynn." },
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "Another mage for the tower? No, you're just visiting, I can tell; the ones who live here look much more tired." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "That something here wants to live badly enough to grow in fel-soaked ash. I've a notion your spirits would understand that better than the mages downstairs, who think everything outside the window is a hazard." } },
      choices = {
        { text = "Then the land isn't dead. It can still be healed.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Anything that grows in fel should be burned, Nina.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Healing, always, and something against fire, because the Shadowsworn don't fight fair. I'd tell you to carry an elixir of strength as well, but I've seen what the bloodmages put in theirs, and I'd rather sell you something honest." } },
      choices = {
        { text = "Preparation wins fights. I'll carry what you recommend.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I don't fight with bottles. Steel is enough.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Some do, and the animals have learned which ones, which is more than I can say for the soldiers. Firebloom grows out in the wastes, and I've watched the boars eat round it as neatly as a cook trims a roast." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Some do, and the animals have learned which ones. Keep {pet} away from the red flowers by the road, though; I don't think firebloom would kill a beast, but it would make it very sorry for a day." },
      },
      choices = {
        { text = "The land still grows things. That's worth something.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Nothing out here is worth saving. Let it burn.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "More than you'd think, because the plants here grew up beside the Portal's taint and learned to live with it. The mages downstairs call them corrupted, but I've brewed better salves from Blasted Lands roots than anything that grows in Elwynn." } },
      choices = {
        { text = "Then the land isn't lost. Something good still grows.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Tainted things are tainted. I'd rather not risk it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I trust whatever works, and both work, in their way. A soldier with a fever wants a potion, and a soldier who can't sleep beside the Portal wants a priest, and I'd never pretend one could do the other's job." } },
      choices = {
        { text = "Both are gifts, but the Light comes first.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Well said. Use whatever works and waste no time.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Mana potions, by the crate, because a Watcher who runs dry in the middle of a reading has to start the whole night over. I've told them to sleep more and brew less, and they've told me to sell more and talk less." } },
      choices = {
        { text = "They should rest more. Overwork helps nobody.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Portal doesn't rest, so neither should they.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Nina.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because the captain would have me down those stairs faster than I could carry the vials. Antidotes I'll sell to anyone, though, since half the scorpids out there would kill a soldier before he made it back to the gate." } },
      choices = {
        { text = "Antidotes save lives. That's the better trade.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Poison wins fights. Antidotes only lose them slower.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Another question, then.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Blindweed, firebloom, and a twisted thistle that grows only near the Tainted Scar, and every one of them is stronger and stranger than it should be. The mages want to know if it's the fel magic doing it, and I want to know if it's useful, so we're both very busy." } },
      choices = {
        { text = "Twisted plants should be destroyed, Nina, not brewed into potions.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If they're useful, use them. Something good should come of this place.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Mana potions and anything that settles the stomach, mostly, since summoning near the Portal leaves people green for days. The Watchers keep an eye on who comes up these stairs, so buy what you need and keep your demon downstairs, and nobody will make trouble for you." } },
      choices = {
        { text = "I'll keep my demon downstairs, Nina. Rules are rules.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My demon stays with me, Watchers or no Watchers.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. You'll be wanting something to settle you, I expect, because everyone who calls up demons this close to the Portal comes up these stairs sooner or later looking pale." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior, all the way up the tower stairs! Healing potions are on the left shelf, and yes, I know you'll want the large ones." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter! If you find anything growing out there that isn't dead, bring it up and show me, because nobody else in this tower will look at it twice." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue. If you're shopping for poison reagents, I don't keep them, and if you're shopping for antidotes, I keep plenty, so it depends which end of the knife you're on." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage, up all these stairs! Do try not to practise anything fiery near the shelves, because half of this stock goes bang if you look at it wrongly." },
        { id = "h_default", key = true,
          text = "Nina Lightbrew, alchemy supplies, at the top of the tower where the mages can find me easily. Vials, reagents, a few potions for the soldiers, and a quiet place to brew, as long as nobody downstairs is practicing fire spells." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, up all these stairs! If you're here for holy water, I'm afraid I sell the other kind, the sort that cures fevers instead of driving off demons." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! You'll be after healing potions, I expect, because even a knight of the Light runs short of breath for prayers out in the wastes." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid of the Circle! Come see what grows in the Blasted Lands, because some of these plants are like nothing in any herbal I've ever read." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, in the mages' tower! Mind the stairs, and if the earth tells you anything about the herbs out in the wastes, I'd love to hear it." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a flask of something cooling on the sill, and it mustn't boil over." },
        { id = "h_again2", text = "Ask away, I'm not going anywhere. Those stairs are terrible." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Why sell potions at the top of a tower?", next = "tower" },
        { text = "I can't see much growing out in the Blasted Lands.", next = "plants" },
        { text = "What's it like living beside the Dark Portal?", next = "portal" },
        { text = "What do the Watchers buy from you most?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why no poisons, Nina?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "You seem to trust potions over prayers, Nina.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What grows in the Blasted Lands that could heal anyone?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Which potion should a warrior carry near the Portal, Nina?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "I'd guess the plants out here poison the animals.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What grows in the Blasted Lands that interests an alchemist, Nina?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What do warlocks usually buy from you, Nina?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What do the wastes' plants tell an alchemist, Nina?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    tower = {
      lines = { { id = "t_default", text = "Because the mages buy more from me than anyone else, and they won't come down unless the keep's on fire. Besides, the fumes from a bad batch go straight out the window up here, instead of through the barracks." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    plants = {
      lines = { { id = "p_default", text = "Not much, but what does grow is tough and strange, like firebloom and gromsblood in the canyons. The soldiers bring me samples sometimes, and I've learned to wear gloves." } },
      choices = {
        { text = "Why the gloves?", next = "plants_gloves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plants_gloves = {
      lines = { { id = "pg_default", text = "Because anything that grows in soil the Dark Portal poisoned might be poison itself. Most of it isn't, but I'd rather find that out with a test than with my own fingers." } },
      choices = {
        { text = "Better safe than sorry.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "You'd learn more by taking risks.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    portal = {
      lines = { { id = "po_default", text = "Quiet, mostly, since it's been dark for years. The mages watch it day and night anyway, and when I look out the window and see it sitting there, I'm glad they do." },
        { id = "po_orc", when = { race = "Orc" }, text = "Quiet, these days, since it's been dark for years. You'll know better than I do what came through it once, and the mages here watch it day and night to make sure nothing does again." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I make potions and sell what other people need to make theirs. Nethergarde needed someone who could do that, so here I am." } },
    advice = { { id = "tp_ad", text = "Wear gloves when you pick anything out in the wastes. You'll be glad you did." } },
    nethergarde = { { id = "tp_ng", text = "A keep full of mages and soldiers staring at a dead portal, and the best-supplied alchemist in the south at the top of it." } },
    draenethyst = { { id = "tp_draenethyst", text = "Draenethyst is a strange crystal, and it hums if you hold it close, and I've never seen anything like it in the books. I'd love to study it, but Kum'isha buys every one before I can." } },
    dalaran = { { id = "tp_dalaran", text = "The mages here talk about Dalaran like it was the center of the world, and maybe it was. I learned my trade in Stormwind, and I'm happy with it." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor mages upstairs ask me for potions and never ask what's in them. That's either trust or carelessness, and I haven't decided which." } },
    dreadmaul = { { id = "tp_dreadmaul", text = "The ogres trample the best herbs in the Blasted Lands, and I'd like to see them gone just for that." } },
    _none = { { id = "tp_none", text = "I don't know about that, I'm afraid. Ask one of the mages downstairs." } },
  },
}
