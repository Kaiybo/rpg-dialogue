-- Dalaran's watch, its returning citizens, the crews rebuilding the city, and the Kirin Tor's apprentices.
-- There is no Dalaran town in the World pack, so these pools aren't tied to a community: every line is gated
-- to Dalaran itself (its own zone, or its subzones inside the Alterac Mountains), so pooled NPCs elsewhere
-- in Alterac never use them. Voice: bibles/dalaran.md
local P = RPGDialogueAPI:Pack("rpgd.dalaran")
local TODO_QUEST = P.TODO_QUEST

P:Pool {
  id = "guard_dalaran", role = "guard",
  barks = {
    { id = "b_lamps", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "Lamps are steady tonight, so let's keep them that way." },
  },
  greetings = {
    { id = "g_default", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "Welcome to Dalaran. Keep to the lit streets, and stay clear of anything that hums." },
    { id = "g_helped", when = { all = { { questDone = TODO_QUEST("Friend of the Kirin Tor") }, { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } } } },
      text = "You're the archmage's guest, I'm told. Go where you like, then, and mind the scaffolds." },
    { id = "g_horde", when = { all = { { faction = "Horde" }, { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } } } },
      text = "You're in this city on Archmage Modera's word and nobody else's. Remember that while you walk." },
    { id = "g_skyborne", when = { all = { { race = "Skyborne" }, { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } } } },
      text = "Wind's greetings, if I have that right. The Sky Enclave is up by the skycutter landing, at the north end." },
  },
  notice = {
    { id = "n_xenclave", cat = "origin", when = { all = { { origin = "skyborne_sky_enclave_student" }, { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } } } },
      text = "Sky Enclave student, aren't you? You've the look of someone with a report due. Mind the Citadel stacks, because the last of your lot who fell asleep in there took two days to find." },
    { id = "n_mage", cat = "class", when = { all = { { class = "MAGE" }, { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } } } },
      text = "A mage. If you feel the street shiver under your boots, that's the ley lines settling, and the archmagi would rather you didn't try to help." },
    { id = "n_warlock", cat = "class", when = { all = { { class = "WARLOCK" }, { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } } } },
      text = "Keep your summoning circles out of my streets, warlock. This city has had more than enough of what comes through them." },
  },
  react = {
    { id = "r_stealth", on = "stealth", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "Out from behind there, please. We've had quite enough things creeping through our sewers lately." },
  },
  lines = {
    { id = "l_default", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "Everything is under control, {class}. That's what I've been told to say, and I'm saying it with a straight face." },
    { id = "l_constructs", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "The constructs on the upper streets went still once the trouble in the Citadel was put down. I still give them a wide berth, and so should you." },
    { id = "l_dome", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "I stood watch under the dome for years, and the first time it rained after, I shouted for a magus to fix the leak. The lads haven't let me forget it." },
    { id = "l_helped", when = { all = { { killed = { name = "Shade of the Archmage", min = 1 } }, { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } } } },
      text = "Word is you went up through the sewers to the top of the Citadel and came back down again. The watch is grateful, though we'd never say so to your face." },
    { id = "l_horde", when = { all = { { faction = "Horde" }, { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } } } },
      text = "Tarren Mill's just over the hills, and we haven't forgotten it. Do your business and be on your way." },
  },
  choices = {
    { text = "Anything I should watch for?", next = "END" },
    { text = "Carry on.", next = "END" },
  },
  topics = {
    alterac = { { id = "t_alterac", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "Syndicate in the hills and ogres in the old capital. The dome kept them out for years, and now we do, on half pay and cold porridge." } },
    syndicate = { { id = "t_syndicate", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "Alterac's leftover nobles and their cutthroats. They'd strip the lead off our roofs if we let them near." } },
    _none = { { id = "t_none", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "That's a question for the Citadel, not the watch." } },
  },
}

P:Pool {
  id = "citizen_dalaran", role = "citizen",
  barks = {
    { id = "b_cat", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "Shoo, cat! That's a new step, and it's not for sleeping on." },
  },
  greetings = {
    { id = "g_xenclave", when = { all = { { origin = "skyborne_sky_enclave_student" }, { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } } } }, text = "You're one of Evengale's students from the Sky Enclave, aren't you? I can always tell, because you look at our libraries as if you mean to carry them home in your pockets." },
    { id = "g_default", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "Mind the paving; half of it's new, and the other half is older than my grandmother." },
    { id = "g_night", when = { all = { { timeOfDay = "night" }, { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } } } },
      text = "Out late? The lamps here glow on their own, so at least you won't trip in the dark." },
  },
  lines = {
    { id = "l_cats", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "Have you noticed the cats? Every doorway they rebuild seems to come with one, and nobody remembers bringing any of them." },
    { id = "l_home", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "My family lived three streets from the Citadel before the Scourge came. The street's still there, more or less, and I mean to stand in it until it feels like home again." },
    { id = "l_crash", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "I heard the crash from the Citadel clear down by the Charter, and the windows rang for an hour afterward. Nobody's told us what it was, and I've stopped asking." },
    { id = "l_skyborne", when = { all = { { ["not"] = { race = "Skyborne" } }, { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } } } },
      text = "The elves from the sky keep mostly to their enclave up north. They're polite enough, though they look at our lamps as if the lamps were talking to them." },
    { id = "l_skyborne_me", when = { all = { { race = "Skyborne" }, { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } } } },
      text = "You're one of the sky folk! Welcome. I hope the city's kinder to you than the mountains are; they're kind to nobody." },
    { id = "l_after", when = { all = { { killed = { name = "Shade of the Archmage", min = 1 } }, { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } } } },
      text = "They say the trouble in the Citadel is finished, and the lamps have stopped flickering, so I'm inclined to believe them this once." },
    { id = "l_priest", when = { all = { { class = "PRIEST" }, { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } } } },
      text = "A priest! Would you say a word for my brother? He was a magus, and he fell when the city did, and nobody here prays much." },
  },
  choices = {
    { text = "Take care.", next = "END" },
    { text = "The Light keep you and yours.", next = "END", when = { class = "PRIEST" }, fx = { trait = { kind = 1 } } },
  },
  topics = {
    _none = { { id = "t_none", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "I just live here, friend. Ask one of the magi; they'll answer whether they know or not." } },
  },
}

P:Pool {
  id = "worker_dalaran", role = "worker",
  greetings = {
    { id = "g_default", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "Mind the mortar, and mind the magus floating that block over your head even more." },
  },
  lines = {
    { id = "l_default", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "The magi lift the stones and we set them, which sounds fair until a magus sneezes. We lost a whole cornice that way, and nobody's owned up to it." },
    { id = "l_dome", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "We worked under the dome for years, where nobody could see us. Now all of Alterac can watch us lay stone, and the foreman's started shaving." },
    { id = "l_dwarf", when = { all = { { race = "Dwarf" }, { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } } } },
      text = "A dwarf! Come look at this arch and tell me it's straight. The magi say it is, but the magi think a level is something you gain." },
    { id = "l_after", when = { all = { { killed = { name = "Shade of the Archmage", min = 1 } }, { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } } } },
      text = "The constructs went still once the trouble upstairs was dealt with. It took us a day to pry them out of the scaffolds, and one of them was holding a hod." },
  },
  choices = { { text = "Back to work, then.", next = "END" } },
  topics = {
    _none = { { id = "t_none", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "I lay stone for wizards, friend. Ask somebody who reads." } },
  },
}

P:Pool {
  id = "scholar_dalaran", role = "scholar",
  greetings = {
    { id = "g_xlumin", when = { all = { { origin = "skyborne_luminarian_scholar" }, { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } } } }, text = "Oh, you're the Skyborne who keeps asking everyone about magesmiths! Have you found anyone in this city who can tell you why your spells come harder? I'd dearly like to know too." },
    { id = "g_default", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "Excuse me! Sorry, I'm carrying four hundred pages, and none of them are in order." },
  },
  lines = {
    { id = "l_default", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "My master says the ley lines under the city are settling, the way a house settles after a storm. I hope he's right, because my room sits right on top of one." },
    { id = "l_stairs", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "I was on the lower stairs when the parlor upstairs went. I've never heard a sound like it, and I've been in the same room as a failed fireball." },
    { id = "l_mage", when = { all = { { class = "MAGE" }, { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } } } },
      text = "You're a mage? Please don't tell my master you saw me reading that book upside down; it's an exercise, I promise." },
    { id = "l_skyborne", when = { all = { { race = "Skyborne" }, { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } } } },
      text = "Is it true your people can feel a ley line just by reaching for it? I've been trying all week, and all I've felt is cold." },
    { id = "l_horde", when = { all = { { faction = "Horde" }, { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } } } },
      text = "Oh! You're... Horde. The archmage said there might be some of you about. I'm sure you're very nice." },
  },
  choices = { { text = "Good luck with your studies.", next = "END" } },
  topics = {
    _none = { { id = "t_none", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "That's not on my reading list, I'm afraid. Try my master; he loves a question he can't answer." } },
  },
}
