-- The Deathguard: Forsaken soldiers of Tirisfal. Dry, tired, and very hard to kill a second time.
local P = RPGDialogueAPI:Pack("rpgd.tirisfal")

P:Pool {
  id = "guard_brill", role = "guard", community = "brill",
  barks = {
    { id = "b_crusade", text = "Crusaders in the fields again. They never stop coming, but then, neither do we." },
    { id = "b_grave", text = "The graveyard's quiet tonight, and I don't trust it when it's quiet." },
  },
  greetings = {
    { id = "g_brill", text = "Brill belongs to the Dark Lady now. Mind your manners and you'll keep your bones." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Night or day, it's all the same to us. You might want a lamp, though." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Falling apart, are you? Join the club, though the smith can at least patch the armor." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 8, race = "Scourge" },
      text = "Freshly risen, are you? You'll stop flinching at your own reflection eventually; most of us did." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "I smell something living, or something sneaking. Either way, show yourself." } },
  lines = {
    { id = "l_default", text = "We keep the Crusade out of Brill and the mindless out of the graveyard. The Dark Lady asks no more of us than that, and no less, either." },
  },
  choices = { { text = "For the Dark Lady.", next = "END", fx = { standing = { brill = 1 } } } },
  topics = {
    knows = {
      { id = "t_kn1", text = "Brill hears from the fields, the graveyard and the Undercity road, and very little of it is cheerful. Here's what I know." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've done well by Brill, so I'll tell you what the Deathguard say when Executor Zygand isn't listening." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll answer, though I've known corpses with better manners than yours." },
    },
    scarlet_crusade = { { id = "t_crusade", text = "Living fanatics who think we're the plague, when we were its victims. They never listen long enough to hear it." } },
    _none = { { id = "t_none", text = "Ask Executor Zygand, by the inn. He likes questions about as much as I do." } },
  },
}

P:Pool {
  id = "guard_deathknell", role = "guard", community = "deathknell",
  barks = {
    { id = "xb_crypt", text = "Another one stirring in the crypt. Either it'll ask where it is, or it'll try to bite me, and I've learned to wait and see." },
    { id = "b_mindless", text = "Another one woke up mindless, so we put it back down. That's the job." },
  },
  greetings = {
    { id = "g_knell", text = "You're awake, and you're yourself, by the look of it. The undertaker will want to see you." },
    { id = "g_xbinder", when = { origin = "forsaken_vengeful_binder" }, text = "You're the one who woke up asking how to hurt the Lich King. I remember you, because most of them ask where they are first." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 4 },
      text = "Still getting used to the body? Walk slowly, because things fall off if you rush." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Sneaking already? You'll do well in the Undercity." } },
  lines = {
    { id = "xl_new", when = { race = "Scourge" }, text = "You're freshly risen, by the look of you, so here's what I tell them all: the Dark Lady freed you, and you owe her for it." },
    { id = "xl_scar", text = "The Scarlets have been creeping closer from the Solliden fields. If you're headed out past the graveyard, take a blade and a friend." },
    { id = "l_default", text = "Deathknell's where the Forsaken wake, though not all of us wake as ourselves, and those that don't, we deal with." },
  },
  choices = {
    { text = "What happens to those who don't wake as themselves?", next = "END", reply = "We put them down, quickly and as gently as we can, and bury them again." },
    { text = "I'll keep my wits about me.", next = "END", reply = "Good. Wits are the first thing the plague takes." },
    { text = "Understood.", next = "END", fx = { standing = { deathknell = 1 } } } },
  topics = {
    scarlet = { { id = "xt_sc", text = "Zealots in red who come to burn us in our graves. Kill them first." } },
    sylvanas = { { id = "xt_sy", text = "The Dark Lady freed us. Every Forsaken here owes her that." } },
    knows = {
      { id = "t_kn1", text = "We see everyone who wakes here, and they all come with questions. These are the ones I can answer." },
    },
    _none = { { id = "t_none", text = "Ask Shadow Priest Sarvis in the chapel. He has answers for everything, and opinions for the rest." } },
  },
}
