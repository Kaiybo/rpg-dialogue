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
    { text = "I'll keep my eyes open.", next = "END" },
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
    { id = "yb0", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } }, text = "Somebody's left a broom sweeping the square on its own again, and it's swept my cat into the fountain." },
    { id = "yb1", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } }, text = "Fresh bread from the Charter bakery! Well, fresh this morning, which is fresh enough for Dalaran." },
    { id = "b_cat", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "Shoo, cat! That's a new step, and it's not for sleeping on." },
  },
  greetings = {
    { id = "yg0", when = { all = { { race = "Dwarf" }, { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } } } }, text = "A dwarf in Dalaran! You'll be here for the stonework, I expect. Everyone says it's the finest in Lordaeron, and nobody can tell me who laid it." },
    { id = "g_xenclave", when = { all = { { origin = "skyborne_sky_enclave_student" }, { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } } } }, text = "You're one of Evengale's students from the Sky Enclave, aren't you? I can always tell, because you look at our libraries as if you mean to carry them home in your pockets." },
    { id = "g_default", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "Mind the paving; half of it's new, and the other half is older than my grandmother." },
    { id = "g_night", when = { all = { { timeOfDay = "night" }, { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } } } },
      text = "Out late? The lamps here glow on their own, so at least you won't trip in the dark." },
  },
  lines = {
    { id = "yl0", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } }, text = "My mother kept a candle shop by the Violet Citadel before the city fell. I've opened it again, though half my customers can make their own light with a word." },
    { id = "yl1", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } }, text = "They say the Scourge came right up to the walls before Antonidas fell. I wasn't here; I'd gone to my sister's in Southshore, and I've never decided if that was luck or cowardice." },
    { id = "yl2", when = { all = { { metBefore = true }, { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } } } }, text = "You're back again! My neighbour asked if you were my cousin, and I said yes, because it was easier than explaining." },
    { id = "yl3", when = { all = { { faction = "Horde" }, { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } } } }, text = "You're Horde, aren't you? The archmagi say we're to be civil, and I'm trying, but my father died at the Siege of Dalaran, and you'll forgive me if I'm slow about it." },
    { id = "l_cats", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "Have you noticed the cats? Every doorway they rebuild seems to come with one, and nobody remembers bringing any of them." },
    { id = "l_home", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "My family lived three streets from the Citadel before the Scourge came. The street's still there, more or less, and I mean to stand in it until it feels like home again." },
    { id = "l_crash", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "I heard the crash from the Citadel clear down by the city gate, and the windows rang for an hour afterward. Nobody's told us what it was, and I've stopped asking." },
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
    { text = "The Kirin Tor know best. Trust their rebuilding.", next = "END", reply = "I hope you're right. They've rebuilt the walls, at least, and walls are a start.", fx = { align = { order = 1 } } },
    { text = "Don't wait on the magi. Rebuild your own street.", next = "END", reply = "That's what my husband says. He's been laying cobbles on our corner every night.", fx = { align = { order = -1 } } },
    { text = "Take care.", next = "END" },
    { text = "The Light keep you and yours.", next = "END", when = { class = "PRIEST" }, fx = { trait = { kind = 1 } } },
  },
  topics = {
    antonidas = { { id = "tp_yantonidas", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } }, text = "The Grand Magus. He fell when the city did, and nobody's filled his chair since, not really." } },
    alterac = { { id = "tp_yalterac", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } }, text = "The mountains are full of ogres and Syndicate thieves. We keep to the city, mostly." } },
    _none = { { id = "t_none", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "I just live here, friend. Ask one of the magi; they'll answer whether they know or not." } },
  },
}

P:Pool {
  id = "worker_dalaran", role = "worker",
  barks = {
    { id = "yb0", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } }, text = "Watch your head! That block's floating, and the magus who floated it just went to lunch." },
    { id = "yb1", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } }, text = "Hand me that trowel, would you? No, the other one. The one that isn't glowing." },
  },
  greetings = {
    { id = "yg0", when = { all = { { race = "Human" }, { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } } } }, text = "Another Lordaeron face, by the look of you. Pick up a hod if you're staying; we've a city to finish." },
    { id = "g_default", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "Mind the mortar, and mind the magus floating that block over your head even more." },
  },
  lines = {
    { id = "yl0", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } }, text = "I was a mason in Andorhal before the plague, and I came here when the Kirin Tor put out the call for workers. Good pay, and nobody here tries to eat you, mostly." },
    { id = "yl1", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } }, text = "The foreman says this street will be done by midsummer. He said that last midsummer, and the one before." },
    { id = "yl2", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } }, text = "Strangest job I ever had was setting a doorway that leads into a cupboard on one side and a garden on the other. I didn't ask, and the magus didn't explain." },
    { id = "yl3", when = { all = { { class = "WARRIOR" }, { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } } } }, text = "You've a good back on you for lifting. If the fighting dries up, come see the foreman; he'll start you on cornices." },
    { id = "l_x1", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } }, text = "A magus asked me to make a wall that hums. I asked him what key. He didn't laugh, and now I'm learning music." },
    { id = "l_x2", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } }, text = "The pay is good and the work is strange. Last week I mortared a window that opened onto a different room each morning." },

    { id = "l_default", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "The magi lift the stones and we set them, which sounds fair until a magus sneezes. We lost a whole cornice that way, and nobody's owned up to it." },
    { id = "l_dome", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "We worked under the dome for years, where nobody could see us. Now all of Alterac can watch us lay stone, and the foreman's started shaving." },
    { id = "l_dwarf", when = { all = { { race = "Dwarf" }, { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } } } },
      text = "A dwarf! Come look at this arch and tell me it's straight. The magi say it is, but the magi think a level is something you gain." },
    { id = "l_after", when = { all = { { killed = { name = "Shade of the Archmage", min = 1 } }, { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } } } },
      text = "The constructs went still once the trouble upstairs was dealt with. It took us a day to pry them out of the scaffolds, and one of them was holding a hod." },
  },
  choices = {
    { text = "Good work deserves fair pay. Ask for more.", next = "END", reply = "Aye, I've been saying that to the lads. The foreman won't like it, but we'll ask.", fx = { align = { honor = 1 } } },
    { text = "Take what they give. Dalaran's paying well enough.", next = "END", reply = "You're probably right. There's worse work in Lordaeron, and most of it's undead.", fx = { align = { honor = -1 } } },
    { text = "Back to work, then.", next = "END" } },
  topics = {
    andorhal = { { id = "tp_yandorhal", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } }, text = "I was a mason there, once. Now it's a ruin full of skeletons." } },
    foreman = { { id = "tp_yforeman", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } }, text = "He shouts a lot, but the walls stand. That's all you can ask of a foreman." } },
    _none = { { id = "t_none", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "I lay stone for wizards, friend. Ask somebody who reads." } },
  },
}

P:Pool {
  id = "scholar_dalaran", role = "scholar",
  barks = {
    { id = "yb0", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } }, text = "Has anyone seen my notes on ley convergence? They were in a blue folder, and now the folder's purple." },
    { id = "yb1", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } }, text = "Third bell! I'm late for lecture, and Magus Thalor locks the door at the third bell." },
  },
  greetings = {
    { id = "yg0", when = { all = { { class = "MAGE" }, { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } } } }, text = "Oh, you're a mage! Could you check this sigil for me? I've drawn it eleven times, and it keeps setting my desk on fire." },
    { id = "g_xlumin", when = { all = { { origin = "skyborne_luminarian_scholar" }, { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } } } }, text = "Oh, you're the Skyborne who keeps asking everyone about magesmiths! Have you found anyone in this city who can tell you why your spells come harder? I'd dearly like to know too." },
    { id = "g_default", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "Excuse me! Sorry, I'm carrying four hundred pages, and none of them are in order." },
  },
  lines = {
    { id = "yl0", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } }, text = "My master was one of the first magi to come back after the city fell. He says the libraries were the first thing they rebuilt, before the houses, and I think he's proud of that." },
    { id = "yl1", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } }, text = "I'm writing a treatise on the old wards that kept the city hidden. My master says it's too ambitious for an apprentice, which is why I'm writing it at night." },
    { id = "yl2", when = { all = { { race = "Gnome" }, { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } } } }, text = "A gnome! Is it true Gnomeregan had a library of engineering texts the size of a city block? I'd give my eyebrows to read even a page of it." },
    { id = "yl3", when = { all = { { race = "Scourge" }, { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } } } }, text = "You're... one of the Forsaken. Forgive me for staring, but my master says the Dark Lady was a ranger, not a mage, and I've always wondered how she learned what she knows." },
    { id = "l_x1", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } }, text = "I spent three hours yesterday copying a single rune. My master looked at it, said it was upside down, and went to lunch." },
    { id = "l_x2", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } }, text = "The library's lamps never go out, which sounds wonderful until you realise it means nobody ever tells you to go to bed." },
    { id = "l_x3", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } }, text = "Everyone whispers about the Shade upstairs. I try not to think about it, which mostly means I think about nothing else." },

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
  choices = {
    { text = "Some knowledge should stay locked away.", next = "END", reply = "My master would agree with you. I'm not sure I do, but I'll keep the forbidden shelf shut.", fx = { align = { light = 1 } } },
    { text = "Knowledge is for everyone. Read it all.", next = "END", reply = "That's what I think too! Don't tell my master I said so.", fx = { align = { light = -1 } } },
    { text = "Good luck with your studies.", next = "END" } },
  topics = {
    violet_citadel = { { id = "tp_yviolet_citadel", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } }, text = "The heart of the city. The archmagi meet there, and apprentices aren't allowed past the second floor." } },
    ley_lines = { { id = "tp_yley_lines", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } }, text = "The rivers of power under the city. My room sits right on top of one, and I sleep badly." } },
    _none = { { id = "t_none", when = { any = { { zone = "Dalaran" }, { subzone = { "Dalaran", "Violet Citadel", "Sky Enclave", "Path of Renewal", "Dalaran Charter", "Eclipse with Shears", "Magical Menagerie" } } } },
      text = "That's not on my reading list, I'm afraid. Try my master; he loves a question he can't answer." } },
  },
}
