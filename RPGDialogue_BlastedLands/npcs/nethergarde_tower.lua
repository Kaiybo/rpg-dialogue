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
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Nina Lightbrew, alchemy supplies, at the top of the tower where the mages can find me easily. Vials, reagents, a few potions for the soldiers, and a quiet place to brew, as long as nobody downstairs is practicing fire spells." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a flask of something cooling on the sill, and it mustn't boil over." },
        { id = "h_again2", text = "Ask away, I'm not going anywhere. Those stairs are terrible." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Why sell potions at the top of a tower?", next = "tower" },
        { text = "What grows out in the Blasted Lands?", next = "plants" },
        { text = "What's it like living beside the Dark Portal?", next = "portal" },
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
    _none = { { id = "tp_none", text = "I don't know about that, I'm afraid. Ask one of the mages downstairs." } },
  },
}
