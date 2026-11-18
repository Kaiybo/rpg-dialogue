-- Gut feelings (core Systems/Insight.lua): the dim note under a page when you sense how
-- someone means what they just said. Pools by tell: lie, true (they believe it, right or
-- wrong), hiding (a half-truth), afraid. {his}/{him}/{His} follow the speaker's sex
-- ("their"/"them" when unknown); {npc} is their name. Class variants come up now and then.
local P = RPGDialogueAPI:Pack("rpgd.world")

P:GutNotes {
  id = "generic",
  lie = {
    "Something in {his} voice doesn't sit right.",
    "{npc} says it a little too smoothly to be the truth.",
    "You catch {his} eyes slide away as the words come out.",
    "It sounds rehearsed, as though {npc} has said it often and believed it never.",
    "Your gut tells you that wasn't the truth.",
  },
  ["true"] = {
    "{npc} believes every word of it.",
    "There's no guile in it; {npc} means what {his} words say.",
    "Whether or not it's so, {npc} is certain of it.",
    "You hear nothing false in {his} voice, only conviction.",
  },
  hiding = {
    "{npc} is hiding something.",
    "There's more to it than {npc} is letting on.",
    "{His} answer stops just short of something.",
    "You get the sense {npc} chose those words with care.",
  },
  afraid = {
    "{npc} is frightened, and trying hard not to show it.",
    "There's fear under {his} words, held down tight.",
    "{His} hands aren't quite steady as {npc} says it.",
  },
  class = {
    ROGUE = {
      lie = { "Your training says {npc} is lying.", "You've told that kind of lie yourself, and you know the sound of it." },
      hiding = { "You know someone holding something back when you see it, and {npc} is." },
    },
    PRIEST = {
      lie = { "The Light gives you no peace about those words.", "You've heard enough confessions to know that wasn't one." },
      ["true"] = { "You've sat with enough troubled souls to know {npc} believes it." },
      afraid = { "You've seen this fear at bedsides; {npc} is more scared than {his} words let on." },
    },
    DRUID = {
      lie = { "{npc} goes still the way prey does, and the words ring false." },
      afraid = { "You know the smell of fear, and it's on {him} now." },
    },
    SHAMAN = {
      lie = { "The spirits are quiet, and you don't believe a word of it." },
      ["true"] = { "The spirits stir no warning; {npc} speaks from the heart." },
    },
    PALADIN = {
      lie = { "Your oath sits uneasy; that was no honest answer." },
    },
    WARLOCK = {
      lie = { "You know a bargain built on a lie when you hear one." },
    },
    HUNTER = {
      afraid = { "{npc} has the look of a cornered animal." },
    },
  },
}
