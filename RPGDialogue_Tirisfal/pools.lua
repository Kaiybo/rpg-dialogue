-- The Deathguard: Forsaken soldiers of Tirisfal. Dry, tired, and very hard to kill a second time.
local P = RPGDialogueAPI:Pack("rpgd.tirisfal")

P:Pool {
  id = "guard_brill", role = "guard", community = "brill",
  barks = {
    { id = "yb_rats", text = "The apothecaries are paying for live rats again. Don't ask me what for, I've stopped wondering." },
    { id = "yb_inn", text = "Someone's singing at the Gallows' End. Badly. At least it means they're still themselves." },
    { id = "yb_mills", text = "Lights out at Agamand Mills again. The family's still walking their fields, poor wretches." },
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
    { id = "yl_orc", when = { race = "Orc" }, text = "An orc, in Brill. Welcome, friend. The zeppelin tower's south of here, and the inn's the building that isn't a graveyard." },
    { id = "yl_tauren", when = { race = "Tauren" }, text = "A tauren, in Brill. Mind the doorframes. The dead built this town for living humans, and the living humans were short." },
    { id = "yl_night", when = { timeOfDay = "night" }, text = "Brill at night is quiet as a crypt, which it mostly is. Keep to the lamps and you'll keep your bones." },
    { id = "l_default", text = "We keep the Crusade out of Brill and the mindless out of the graveyard. The Dark Lady asks no more of us than that, and no less, either." },
  },
  choices = {
    { text = "Brill should burn the Scarlet camps before they strike.", next = "END", reply = "Aye, and I'd carry the torch. The Executor says wait. We wait.", fx = { align = { order = -1 } } },
    { text = "Hold the line. The Executor knows what he's doing.", next = "END", reply = "That's the spirit. Patience is the only thing the dead have plenty of.", fx = { align = { order = 1 } } },
    { text = "For the Dark Lady.", next = "END", fx = { standing = { brill = 1 } } },
  },
  topics = {
    agamand = { { id = "yt_agamand", text = "The Agamands owned half the land round Brill. Now they walk it mindless, and the Deathguard pay to have them put down." } },
    gallows_end = { { id = "yt_ge", text = "The Gallows' End is the inn. It's where Brill drinks, though few of us can taste it." } },
    apothecaries = { { id = "yt_apoth", text = "The apothecaries in Brill brew things that make the cemetery bats fall out of the sky. Mind your drinks." } },
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
    { id = "yb_bell", text = "The chapel bell hasn't rung since the plague. Some nights I swear I hear it anyway." },
    { id = "yb_solliden", text = "Smoke over Solliden again. The Scarlets are burning something, or someone." },
    { id = "yb_new", text = "Fresh earth by the crypt. Somebody's coming up tonight, mark my words." },
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
    { id = "yl_human", when = { race = "Human" }, text = "A living human, in Deathknell? Either you're very lost or the Dark Lady's sent you. I'll not ask which, but the Deathguard will." },
    { id = "yl_troll", when = { race = "Troll" }, text = "A troll, here at the graves. Your people know a thing or two about the dead, I hear. Keep your voodoo away from the newly risen, if you would." },
    { id = "xl_new", when = { race = "Scourge" }, text = "You're freshly risen, by the look of you, so here's what I tell them all: the Dark Lady freed you, and you owe her for it." },
    { id = "xl_scar", text = "The Scarlets have been creeping closer from the Solliden fields. If you're headed out past the graveyard, take a blade and a friend." },
    { id = "l_default", text = "Deathknell's where the Forsaken wake, though not all of us wake as ourselves, and those that don't, we deal with." },
  },
  choices = {
    { text = "The mindless should be studied, not just destroyed.", next = "END", reply = "Tell that to the apothecaries. They'd agree with you, and that frightens me.", fx = { align = { light = -1 } } },
    { text = "Put them down cleanly. They deserve that mercy.", next = "END", reply = "Aye. That's what we do, and what we'll keep doing.", fx = { align = { light = 1 } } },
    { text = "What happens to those who don't wake as themselves?", next = "END", reply = "We put them down, quickly and as gently as we can, and bury them again." },
    { text = "I'll keep my wits about me.", next = "END", reply = "Good. Wits are the first thing the plague takes." },
    { text = "Understood.", next = "END", fx = { standing = { deathknell = 1 } } } },
  topics = {
    solliden = { { id = "yt_sol", text = "Solliden Farmstead's crawling with Scarlets. They think it's a holy outpost. It's a barn." } },
    crypt = { { id = "yt_crypt", text = "The crypt beneath the chapel is where the newly risen wake. It's also where the mindless wander, so mind your step." } },
    scarlet = { { id = "xt_sc", text = "Zealots in red who come to burn us in our graves. Kill them first." } },
    sylvanas = { { id = "xt_sy", text = "The Dark Lady freed us. Every Forsaken here owes her that." } },
    knows = {
      { id = "t_kn1", text = "We see everyone who wakes here, and they all come with questions. These are the ones I can answer." },
    },
    _none = { { id = "t_none", text = "Ask Shadow Priest Sarvis in the chapel. He has answers for everything, and opinions for the rest." } },
  },
}
