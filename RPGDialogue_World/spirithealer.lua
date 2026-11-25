-- The spirit healer: one shared character behind every spirit healer and spirit guide.
-- Voice bible: bibles/spirithealer.md. The most developed character in RPG Dialogue.
local P = RPGDialogueAPI:Pack("rpgd.world")

-- Spirit healers: one shared character for every spirit healer, because they seem to keep
-- shared records ("your file"). Bible: RPGDialogue_World/bibles/spirithealer.md.
-- Wry, kind, uncanny. Every answer opens a door and leaves it ajar: what the healer is, who
-- "permits" it, what waits past the mist and who writes the strange pages in your file stay
-- open (claims spirithealer_*). Nothing from later expansions: no Shadowlands, no Maw, no
-- Arbiter, no named realms of the dead. The philosophy is a real argument; the healer can lose.
-- Questions the player asks set flags in the healer's memory (npcFlag), and the next visit
-- picks the thread back up once (the cb_ lines in hello).
P:Pool {
  id = "spirithealer", role = "spirithealer", tier = "major", spiritSensitive = true,
  notices = { "death", "dark", "lock_soulstone", "lock_shards", "lock_stones", "lock_shadow", "lock_taint" },
  temper = { "sharp", "steady" },
  greetings = {
    { id = "g_again", when = { deaths = { min = 5 } }, text = "You again, and your file grows thicker every time I open it." },
    { id = "g_first", when = { deaths = { max = 1 } }, text = "Do not be afraid, not yet anyway. Come closer, and let me have a look at you." },
    { id = "g_plain", text = "Your body is waiting for you, and so am I." },
    { id = "g_hush", text = "Speak quietly, if you would; the others are listening today." },
    { id = "g_thinking", when = { timesTalked = { min = 3 } }, text = "There you are. I was just thinking about something you said last time." },
    { id = "g_stay", when = { npcFlagBefore = "asked_stay" }, priority = 10, text = "Staying this time? No, I can see you are not." },
    { id = "g_lantern", priority = 10, when = { npcFlagBefore = "lantern2", ["not"] = { npcFlag = "lantern6" } },
      text = "The one with the lantern was asking after you while you were away." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Night again, down there. The night ones always arrive cold, so come and stand on the warm side of me." },
    { id = "g_sick", when = { resSick = true }, text = "You are still pale from the last time, and here you are again. Your body has barely finished forgiving you." },
    { id = "g_young", when = { maxLevel = 9 }, text = "Oh, you are very new. Come here, then, and do not be frightened; the hill looks larger than it is." },
    { id = "g_bg", when = { zone = { "Warsong Gulch", "Arathi Basin", "Alterac Valley" } }, priority = 5, text = "Back so soon? Here the dead line up behind me like soldiers waiting for a door, so take your place." },
    { id = "g_hundred", when = { deaths = { min = 100 } }, text = "You have come through a hundred doors and more by now, so ask me your question again." },
  },
  notice = {
    { id = "n_soon", cat = "death", place = "before", when = { daysSinceDeath = { max = 0.02 } },
      text = "Back already? Your footprints from last time are still on the hill." },
    { id = "n_mind", cat = "dark", place = "after", when = { insanity = { min = 40 } },
      text = "Your thoughts came over in pieces, so I have set them out in order for you, though they were not in that order when you arrived." },
    { id = "n_lock_soulstone", cat = "lock_soulstone", when = { class = "WARLOCK", carrying = { 5232, 16892, 16893, 16895, 16896 } }, place = "after",
      text = "There is a stone in your pack shaped to hold a soul, and I know whose shape it awaits. Once you promise yourself to it, you will not climb this hill when you fall; you will go into the stone instead, and no one has ever told me what the waiting is like in there." },
    { id = "n_lock_soulstone_given", cat = "lock_soulstone", when = { ["not"] = { class = "WARLOCK" }, carrying = { 5232, 16892, 16893, 16895, 16896 } }, place = "after",
      text = "Someone has given you a stone to keep a soul in, a warlock by the cold of it. If they bind you to it, your next death goes somewhere I cannot follow, so let me look at you properly now, in case the next page of your file is one I do not get to write." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 10 } }, place = "after",
      text = "You carry souls in your pack, small purple ones, and not one of them ever came up this hill. I keep a list of those who never arrived, and I think I have just found some of the names." },
    { id = "n_lock_stones", cat = "lock_stones", when = { carrying = { 5512, 19004, 19005, 5511, 19006, 19007, 5509, 19008, 19009, 5510, 19010, 19011, 9421, 19012, 19013 } }, place = "after",
      text = "That green stone in your pack has a heartbeat in it that is not yours. Eat it down there if you must, but do not tell me whose it was, because I would have to write it down." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" }, place = "before",
      text = "Your shadow came up the hill with you, and nobody's shadow does that. It is sitting by the door, and I would rather it waited outside." },
    { id = "n_lock_taint", cat = "lock_taint", when = { class = "WARLOCK", taint = { min = 30 } }, place = "after",
      text = "There is a green thread tied to you that runs back down the hill and further, to something that has never been alive and does not intend to die. It is not mine to cut, but I wish you would." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "You have left your body behind again. It is waiting where you fell, in {deathplace}." },
        { id = "h_default2", text = "Sit, if a ghost can sit. Your body is in {deathplace}, and it is not going anywhere without you." },
        { id = "h_default3", text = "There you are. The gray is quiet today, quieter than I like." },
        { id = "h_first", when = { deaths = { max = 1 } }, text = "The first time is the strangest. Breathe, if you remember how, though you will not need to up here." },
        { id = "h_ten", when = { deaths = { min = 10, max = 24 } }, text = "Your file is thicker than most, and I do not say that to wound you." },
        { id = "h_many", tags = { "news" }, when = { deaths = { min = 25, max = 49 } }, text = "{deaths} times now, and the others in the gray have begun to recognize your footsteps." },
        { id = "h_fifty", tags = { "news" }, when = { deaths = { min = 50 } }, text = "We have had to start a second file for you, because the first one would not close." },
        { id = "c_falling", when = { deathCause = "falling" }, text = "The ground does not negotiate, and you knew that once, before you were in such a hurry." },
        { id = "c_drowning", when = { deathCause = "drowning" }, text = "Water is patient, and you were not, and so here you are." },
        { id = "c_fatigue", when = { deathCause = "fatigue" }, text = "You swam out until the world ran out, which it does, if you go far enough." },
        { id = "c_guard", when = { deathCause = "guard" }, text = "A guard did this, yours or someone else's, though it makes the same mark in the file either way." },
        { id = "c_player", when = { deathCause = "player" }, text = "Another traveler sent you up here; the living are very hard on one another." },
        { id = "c_trivial", when = { deathCause = "trivial" }, text = "This one I will write down kindly: {killer}, small but very determined." },
        { id = "c_elite", when = { deathCause = "elite" }, text = "{killer}, then, which is a worthy reason, as such things are counted up here." },
        { id = "c_boss", when = { deathCause = "boss" }, text = "You went where the great ones wait, and one of them was waiting for you." },
        { id = "c_creature", when = { deathCause = "creature", chance = 0.3 },
          text = "Teeth, or claws, or something with both. The wild did not hate you, and somehow that is worse." },
        { id = "c_unknown", when = { deathCause = "unknown" },
          text = "I could not see what took you. Sometimes that is a mercy, and sometimes it means the thing is still down there." },
        { id = "h_same_place", tags = { "news" }, priority = 10, when = { deathsHere = { min = 3 } },
          text = "{deathplace} again. You keep returning to the same door, as if it might open differently." },
        { id = "h_streak", tags = { "news" }, when = { daysSinceDeath = { min = 14 } },
          text = "It has been a long while since I last saw you. The file had begun to gather dust, and I was almost glad of it." },
        -- Where you fell. Priority lets these stand beside the death-cause lines.
        { id = "z_plague", key = true, priority = 20, when = { zone = { "Eastern Plaguelands", "Western Plaguelands" } },
          text = "Not everyone who dies in this land reaches me, because something gets to them first and stands them back up. I count the missing, and I always will." },
        { id = "z_duskwood", priority = 20, when = { zone = "Duskwood" },
          text = "The dead of these woods do not rest, and they do not come to me either. Some nights I hear them knocking at the wrong door." },
        { id = "z_felwood", priority = 20, when = { zone = "Felwood" },
          text = "The forest you fell in is sick, and some of the sickness tried to follow you up the hill, so I sent it back down." },
        { id = "z_tirisfal", priority = 20, when = { zone = "Tirisfal Glades" },
          text = "This is Lordaeron's own soil. I knew these fields when they were farms, and I knew the farmers too, later on." },
        { id = "z_desolace", priority = 20, when = { zone = "Desolace" },
          text = "This land is mostly ghosts already. Kodo come here to die, and centaur khans, and now you, so you are in crowded company." },
        { id = "z_blasted", priority = 20, when = { zone = "Blasted Lands" },
          text = "Something vast leans against the world near here. I can feel it through the mist, like a hand flat on the other side of a door." },
        { id = "z_silithus", priority = 20, when = { zone = "Silithus" },
          text = "Something under the sand is dreaming, and it does not dream of you, so be grateful for that." },
        { id = "z_winterspring", priority = 20, when = { zone = "Winterspring" },
          text = "The cold keeps a body well, so do not be alarmed at how little has changed when you go back. Be alarmed at how quiet it is." },
        { id = "z_stranglethorn", priority = 20, when = { zone = "Stranglethorn Vale" },
          text = "The jungle sends me a great many, and most of them were hunting something when it turned around. The trolls of that place pray to things that are always hungry, and some days I can hear them chewing." },
        { id = "z_barrens", priority = 20, when = { zone = "The Barrens" },
          text = "The Barrens are wide and the sky there is wider, and the souls come up dusty and squinting. Many of them died within sight of a road, which I always find the saddest kind." },
        { id = "z_ashenvale", priority = 20, when = { zone = "Ashenvale" },
          text = "Ashenvale, then. The trees there remember every axe, and the ones who carried them, and I think some of the trees have quietly kept count alongside me." },
        { id = "z_alterac", priority = 20, when = { zone = { "Alterac Mountains", "Hillsbrad Foothills" } },
          text = "These hills have sent me soldiers for two wars and farmers for both, and the snow up there keeps a great deal that the thaw gives back to me in spring." },
        { id = "z_arathi", priority = 20, when = { zone = "Arathi Highlands" },
          text = "Old Arathor sends me ghosts with very good manners and very old grudges. Stromgarde's dead still salute when they arrive, and I have never had the heart to tell them they need not." },
        { id = "z_westfall", priority = 20, when = { zone = "Westfall" },
          text = "Westfall's dead come up with dust in their throats and a farmer's tiredness. A great many of them ask me about the harvest, and I lie to them a little, kindly." },
        { id = "z_elwynn", priority = 20, when = { zone = { "Elwynn Forest", "Dun Morogh", "Teldrassil", "Durotar", "Mulgore" }, chance = 0.5 },
          text = "So close to home, and you still found a way up here. The first fields are the ones that teach you the ground is not your friend." },
        { id = "z_burning", priority = 20, when = { zone = { "Burning Steppes", "Searing Gorge" } },
          text = "You come up smelling of smoke and black iron. Something old and angry lives under that mountain, and every soul from there arrives a little hotter than it should." },
        { id = "z_ungoro", priority = 20, when = { zone = "Un'Goro Crater" },
          text = "The crater, then, where everything is enormous and none of it has ever heard of you. You were eaten by something older than your whole people, and there is a kind of honor in that, if you squint." },
        { id = "z_swamp", priority = 20, when = { zone = { "Swamp of Sorrows", "Dustwallow Marsh" } },
          text = "The swamp souls arrive damp and smelling of rot, and they always look back over their shoulders, as though the water might reach up the hill after them." },
        { id = "z_deadwind", priority = 20, when = { zone = "Deadwind Pass" },
          text = "Deadwind, where even I do not like to look too closely. The tower there throws a shadow up the hill that no sun could cast, and you came through it." },
        { id = "z_tanaris", priority = 20, when = { zone = { "Tanaris", "Thousand Needles", "Badlands" } },
          text = "The heat kept you company all the way up, I see. Dry places keep the body well and the temper badly, so go gently with yourself when you wake." },
        { id = "z_azshara", priority = 20, when = { zone = "Azshara" },
          text = "Azshara's ruins are full of an old people who did not come to me when they died, because something far stranger took them. I feel them when you arrive from there, and they feel me." },
        { id = "z_feralas", priority = 20, when = { zone = { "Feralas", "The Hinterlands" } },
          text = "The deep green sends me hunters and the hunted in roughly equal numbers, and up here they tend to stand apart and pretend not to know each other." },
        { id = "z_silverpine", priority = 20, when = { zone = "Silverpine Forest" },
          text = "Silverpine is full of the restless and the worgen, and the ones the worgen kill come up the hill with their eyes still on the treeline." },
        { id = "z_wetlands", priority = 20, when = { zone = { "Wetlands", "Loch Modan", "Redridge Mountains" }, chance = 0.6 },
          text = "Rain on the way down and rain on the way up, and you are wet even here, somehow. I will not ask how; some things follow a person." },
        { id = "z_bg_wsg", priority = 25, when = { zone = "Warsong Gulch" },
          text = "You fell for a flag, then. I have nothing against flags, only I have never seen one climb this hill, however many die for them." },
        { id = "z_bg_ab", priority = 25, when = { zone = "Arathi Basin" },
          text = "The basin again: farms and mills and stables, and the same five places changing hands every few minutes. The old farmers of Arathi would be bewildered, and some of them, I think, are watching." },
        { id = "z_bg_av", priority = 25, when = { zone = "Alterac Valley" },
          text = "Alterac's snow is crowded today. Dwarves and orcs and their beasts, all in a hurry to die and then to go and do it again, and I am expected to keep up." },
        { id = "c_creature2", when = { deathCause = "creature", chance = 0.3 },
          text = "{killer} has no idea it wrote a page in your file today, and if it did, I doubt it would be proud." },
        { id = "c_creature3", when = { deathCause = "creature", chance = 0.3 },
          text = "Something hungry and honest took you. Hunger has never once lied to me, which is more than I can say for most of the reasons people die." },
        { id = "c_boss2", when = { deathCause = "boss", chance = 0.5 },
          text = "{killer}, in its own hall, surrounded by its own servants. You were outnumbered before you even walked in, and you knew it, and you walked in." },
        { id = "c_player2", when = { deathCause = "player", chance = 0.5 },
          text = "One of your own kind did this, or near enough. I do not keep score between the living, but I notice that they never come up the hill with you to say sorry." },
        { id = "h_young", when = { maxLevel = 10 }, text = "So new. Your body had barely learned it was yours, and already you have stepped out of it." },
        { id = "h_old", when = { minLevel = 60 }, text = "You have walked very far to die. The great ones I send back usually say nothing, so say something." },
        { id = "k_shaman", when = { class = "SHAMAN", minLevel = 30 }, text = "You carry your own way back with you, so why no ankh today?" },
        { id = "k_warlock", when = { class = "WARLOCK" }, text = "No soulstone this time? Your kind usually bargains its way past me." },
        { id = "k_healer", when = { class = { "PRIEST", "PALADIN" } }, text = "You raise others from where I stand. Strange, to see you on this side of the work." },
        { id = "k_hunter", when = { class = "HUNTER" }, text = "Your companion could not follow you, because the living are not permitted up here, and where beasts are concerned I have never agreed with that rule." },
        { id = "k_mage", when = { class = "MAGE" }, text = "You are trying to work out how this place is built, and I can hear you doing it, so please stop, because it itches." },
        { id = "k_druid", when = { class = "DRUID" }, text = "You wear so many shapes, and only one of them ever comes here. I find that curious, and a little funny." },
        { id = "k_rogue", when = { class = "ROGUE" }, text = "You died in the dark. Your kind is always surprised the dark was not on your side." },
        { id = "k_warrior", when = { class = "WARRIOR" }, text = "You died with your arm still raised. You can put it down now, because nothing on this hill needs hitting." },
        { id = "r_forsaken", when = { race = "Scourge" }, text = "You have died before, in a larger way. You know this road better than I do." },
        { id = "r_nightelf", when = { race = "NightElf" }, text = "You come to me as a wisp, like all your people: a little light, insisting." },
        { id = "r_human", when = { race = "Human" }, text = "Your people came here by the thousand the year Lordaeron fell, and I remember every one of them, though I try not to." },
        { id = "r_gnome", when = { race = "Gnome" }, text = "You are already measuring this place, but do not bother, because it changes when no one is looking." },
        { id = "r_dwarf", when = { race = "Dwarf" }, text = "Your kind always ask whether the stone remembers them. It does, and so do I." },
        { id = "r_orc", when = { race = "Orc" }, text = "Your people arrive angry and leave angry, but you arrived curious, so stay that way." },
        { id = "r_tauren", when = { race = "Tauren" }, text = "Your ancestors pass by here on their way somewhere, and they nod to me as they go, though I have never learned where that is." },
        { id = "r_troll", when = { race = "Troll" }, text = "Your loa sniff at the edges of this place but never come in, and I have never asked them why." },
        { id = "a_taint", when = { taint = { min = 30 } }, text = "Something came with you that should not have, and it is watching me. Go, quickly." },
        { id = "a_light", when = { alignment = { axis = "light", min = 40 } }, text = "Gently, now; you have done more good than your file shows." },
        { id = "a_shadow", when = { alignment = { axis = "light", max = -40 } }, text = "I will return you, as I must, but I am not required to approve." },
        -- Callbacks: the healer picks up last visit's argument, once each.
        { id = "cb_cage", once = true, priority = 30, when = { npcFlagBefore = "asked_cage", timesTalked = { min = 1 } },
          text = "Last time you called this a cage, and I have thought of little else since. Cages have doors, you know, and that is the unsettling part." },
        { id = "cb_stay", once = true, priority = 30, when = { npcFlagBefore = "heard_thin", timesTalked = { min = 1 } },
          text = "You asked what happens to the ones who stay. One of them asked about you after you left, and I did not give your name." },
        { id = "cb_hand", once = true, priority = 30, when = { npcFlagBefore = "read_hand", timesTalked = { min = 1 } },
          text = "The other hand in your file has written nothing since you asked. I find that more worrying, not less." },
        { id = "cb_mortal", once = true, priority = 30, when = { npcFlagBefore = "heard_mortal", timesTalked = { min = 1 } },
          text = "Since you asked, I have tried to remember my own face. I got as far as the eyes, which were kind, I think, or perhaps only tired." },
        { id = "cb_turn", once = true, priority = 30, when = { npcFlagBefore = "answered_turn", timesTalked = { min = 1 } },
          text = "Are you the same one who left here last time? Do not answer; just notice that you had to think about it." },
        { id = "cb_name", once = true, priority = 30, when = { npcFlagBefore = "promised_name", timesTalked = { min = 1 } },
          text = "I have been saying your name out there, as I promised, but you are not in the gray, so they only look puzzled." },
        -- Death milestones, the healer's questions and won arguments, brought back once each.
        { id = "ms_3", once = true, tags = { "news" }, when = { deaths = { min = 3 } },
          text = "Three deaths now, and three is when most people stop being frightened of me. Do not stop entirely, though; it keeps you polite." },
        { id = "ms_10", once = true, tags = { "news" }, when = { deaths = { min = 10 } },
          text = "Ten, and at ten I am allowed to tell you one thing: you have never once come up this hill from the same direction twice. I do not know what it means; I am only allowed to say it." },
        { id = "ms_20", once = true, tags = { "news" }, when = { deaths = { min = 20 } },
          text = "Twenty now, and the others in the gray have started a wager about you. I do not know what the wager is, but I know which side I am on." },
        { id = "ms_30", once = true, tags = { "news" }, when = { deaths = { min = 30 } },
          text = "That makes thirty, and added together you have spent most of a day up here. The gray keeps a little of you each time, a thread or a hair, and it is not unkind, only keeping." },
        { id = "ms_75", once = true, tags = { "news" }, when = { deaths = { min = 75 } },
          text = "Seventy-five, and I have begun to dream, which I did not know I could do. I dream of you going down the hill, only that, every time." },
        { id = "ms_100", once = true, tags = { "news" }, when = { deaths = { min = 100 } },
          text = "One hundred. Do you remember what I promised you, at a hundred? Ask me what I am, then; go on." },
        { id = "ms_150", once = true, tags = { "news" }, when = { deaths = { min = 150 } },
          text = "A hundred and fifty, and the mist parted for you today, just slightly, which it has never done for anyone. Either it is curious, or it is making room." },
        { id = "ms_200", once = true, tags = { "news" }, when = { deaths = { min = 200 } },
          text = "Two hundred, so I will tell you a secret: I look forward to you, and I am not supposed to look forward to anyone. It means a part of me wants you to die, and I hate that part." },
        { id = "ms_300", once = true, tags = { "news" }, when = { deaths = { min = 300 } },
          text = "Three hundred, and you are the most returned soul in my file. The others ask after you, and I tell them you are still falling; they find that hopeful, and so do I." },
        { id = "qcb_fate_chose", once = true, priority = 30, sys = "healer", when = { npcFlagBefore = "ans_fate", opinion = { topic = "healer_fate", stance = "chose" } },
          text = "You told me once that you chose this hill, every step of it, so you chose it again today. I am keeping count of your choices, and it is a long list." },
        { id = "qcb_fate_fated", once = true, priority = 30, sys = "healer", when = { npcFlagBefore = "ans_fate", opinion = { topic = "healer_fate", stance = "fated" } },
          text = "You told me you were always going to come up here, and here you are. I cannot decide whether that proves you right or proves nothing at all." },
        { id = "qcb_killed_no", once = true, priority = 30, sys = "healer", when = { npcFlagBefore = "ans_killed", opinion = { topic = "healer_killed", stance = "no" } },
          text = "You told me the things you kill are only beasts. Last time a wolf came up the hill after you, and it was not looking for its pack; it was looking for you." },
        { id = "qcb_killed_yes", once = true, priority = 30, sys = "healer", when = { npcFlagBefore = "ans_killed", opinion = { topic = "healer_killed", stance = "yes" } },
          text = "You told me everything climbs a hill like this, so I have been watching for the ones you send. They are not angry, which surprised me too." },
        { id = "qcb_mourners_someone", once = true, priority = 30, sys = "healer", when = { npcFlagBefore = "ans_mourners", opinion = { topic = "healer_mourners", stance = "someone" } },
          text = "Do you still have that name, the one you would not tell me? Good, then hold it, because you will need it on the way down." },
        { id = "qcb_forgive_yes", once = true, priority = 30, sys = "healer", when = { npcFlagBefore = "ans_forgive", opinion = { topic = "healer_forgive", stance = "yes" } },
          text = "Last time you said you wanted to forgive someone. Have you? No, do not tell me, because I can see it either way: you are lighter, or you are not." },
        { id = "qcb_watching_noone", once = true, priority = 30, sys = "healer", when = { npcFlagBefore = "ans_watching", opinion = { topic = "healer_watching", stance = "noone" } },
          text = "You told me no one is watching, but after you left I felt the hill lean, very slightly. I am only reporting it." },
        { id = "qcb_afraid_forever", once = true, priority = 30, sys = "healer", when = { npcFlagBefore = "ans_afraid", opinion = { topic = "healer_afraid", stance = "forever" } },
          text = "You said forever frightens you more than the dark, and I have been thinking about that. I think you are the first person who has ever understood my job." },
        { id = "qcb_count_never", once = true, priority = 30, sys = "healer", when = { npcFlagBefore = "ans_count", opinion = { topic = "healer_count", stance = "never" } },
          text = "You told me nothing you did ever counted, and then you went down the hill and did more of it. You are a poor liar, even to yourself." },
        { id = "wcb_endless", once = true, priority = 30, when = { npcFlagBefore = "won_endless", timesTalked = { min = 1 } },
          text = "You won our argument about endless life, and I wrote it in my own file. I read it back sometimes, when the hill is quiet, and it still holds up." },
        { id = "wcb_written", once = true, priority = 30, when = { npcFlagBefore = "won_written", timesTalked = { min = 1 } },
          text = "The blank page at the back of your file is still blank; I check it every day. Whatever you did, keep doing it." },
        { id = "wcb_pain", once = true, priority = 30, when = { npcFlagBefore = "won_pain", timesTalked = { min = 1 } },
          text = "Since you won our argument, I have held the hands of the ones who arrive hurting. It does not stop the hurt, and it does not need to; you were right." },
        { id = "wcb_debt", once = true, priority = 30, when = { npcFlagBefore = "won_debt", timesTalked = { min = 1 } },
          text = "I keep turning over what you said about the dead. I have not found the flaw yet, though I am looking, and I am also, a little, hoping I never do." },
      },
      again = {
        { id = "h_again", text = "Ask what you will. Time moves differently here, and there is enough of it." },
        { id = "h_again2", text = "Something else troubles you. Speak; the gray will wait." },
        { id = "h_again3", text = "Still here? Good. Most people are halfway down the hill by now, and I rarely get to finish a thought." },
      },
      choices = {
        { text = "Return me to life.", next = "BUSINESS" },
        { text = "What does my file say?", next = "record" },
        { text = "I have questions.", next = "ask" },
        { text = "Stay with me a moment.", next = "talk" },
        { text = "You look tired today.", next = "tired" },
        { text = "I'll walk back to my body myself.", next = "walk" },
      },
    },

    ---------------------------------------------------------------------------
    -- Walking back, and the healer's tiredness
    ---------------------------------------------------------------------------
    walk = {
      narr = "The healer lowers a hand that was already half raised, and lets it fall.",
      lines = {
        { id = "wk_default", text = "Then walk, and I will not take it as an insult. The road down is longer than it looks, but you keep everything you carry, and your body will owe me nothing." },
        { id = "wk_default2", text = "Good. The long way is the honest way, and your body will be gladder to see you if you come to it on your own feet." },
        { id = "wk_many", priority = 5, when = { deaths = { min = 25 } },
          text = "You know the way down better than I do by now. Mind the edges of the gray as you go, because they lean toward the ones who walk alone." },
        { id = "wk_young", priority = 5, when = { maxLevel = 9 },
          text = "Walk, then, though at your age my way costs you almost nothing. You will learn the price of things soon enough; there is no need to start today." },
        { id = "wk_sick", priority = 10, when = { resSick = true },
          text = "Yes, walk. You are still weak from the last time I sent you, and I would rather not stack one weakness on another." },
      },
      choices = {
        { text = "Thank you. I'll find my way.", next = "END" },
        { text = "On second thought, bring me back.", next = "BUSINESS" },
      },
    },
    tired = {
      lines = {
        { id = "ti_default", text = "Do I? I did not know my face could show it. A great many came up the hill this morning, and every one of them asked me to remember them, which I will, and which is heavy." },
        { id = "ti_night", when = { timeOfDay = "night" },
          text = "Night is the busy time. The living think the dark protects them, and the dark has never once agreed, so yes, I am tired, and thank you for noticing." },
        { id = "ti_plague", priority = 10, when = { zone = { "Eastern Plaguelands", "Western Plaguelands" } },
          text = "It is not the ones who come that tire me here; it is the ones who do not. Counting an absence is heavier work than counting souls, and this land is full of absences." },
        { id = "ti_bg", priority = 10, when = { zone = { "Warsong Gulch", "Arathi Basin", "Alterac Valley" } },
          text = "Here the same soldiers come up the hill a dozen times an hour, and every time they are angrier and less surprised. I am not tired of them, only of the hurry." },
      },
      choices = {
        { text = "Do you ever get to rest?", next = "tired2", fx = { trait = { curious = 1 } } },
        { text = "Then I'll stay a moment and keep you company.", next = "talk", fx = { trait = { kind = 1 }, affinity = 1 } },
        { text = "Back to the matter at hand.", next = "hello" },
      },
    },
    tired2 = {
      lines = {
        { id = "ti2_default", text = "I am not sure I am allowed, and I am not sure I would know how. Once I closed my eyes between one soul and the next, and when I opened them there were three waiting and a fourth halfway up the hill, so I have not tried it since." },
      },
      choices = {
        { text = "Could I stand in for you, someday?", next = "successor" },
        { text = "That sounds lonely.", next = "quiet_lonely", fx = { trait = { kind = 1 } } },
        { text = "Back to the matter at hand.", next = "hello" },
      },
    },

    ---------------------------------------------------------------------------
    -- The file
    ---------------------------------------------------------------------------
    record = {
      lines = {
        { id = "rec_default", text = "{deaths} deaths, the last of them at {deathplace}. The records are complete, if not flattering." },
        { id = "rec_one", when = { deaths = { max = 1 } }, text = "One death, so the file is a single page. Keep it that way, if you can." },
        { id = "rec_trivial", priority = 10, when = { deathCause = "trivial" }, text = "{deaths} deaths, the last at the hands of {killer}. I have underlined it." },
        { id = "rec_ten", when = { deaths = { min = 10, max = 49 } },
          text = "{deaths} entries, and each one ends the same way and begins the same way. It is the middles I read twice." },
        { id = "rec_fifty", when = { deaths = { min = 50 } },
          text = "{deaths} of them. I have started noting the weather in the margins to tell them apart, though it has not helped." },
      },
      choices = {
        { text = "Burn the file.", next = "burn", fx = { trait = { witty = 1 } } },
        { text = "Is there anything else in there?", next = "pages", fx = { trait = { curious = 1 } } },
        { text = "Surely it must fill up one day.", next = "full" },
        { text = "Back to the matter at hand.", next = "hello" },
      },
    },
    burn = {
      lines = { { id = "b_default", text = "It does not burn, though many have asked, and one tried." } },
      choices = {
        { text = "Who tried to burn it?", next = "burn2" },
        { text = "Return me to life.", next = "BUSINESS" },
      },
    },
    burn2 = {
      lines = {
        { id = "b2_default", text = "Someone who wanted to be forgotten more than they wanted to live. I understood them, and still I could not let them go." },
        { id = "b2_mage", when = { class = "MAGE" },
          text = "It was one of yours, and they set the whole hill alight. The file was fine; they were not, and then they were, and then they apologized." },
      },
      choices = {
        { text = "Why not let them be forgotten?", next = "forgotten" },
        { text = "Back to the matter at hand.", next = "hello" },
      },
    },
    forgotten = {
      big = true,
      lines = {
        { id = "fg_default", key = true,
          text = "Because being forgotten is the only death I cannot undo. Everything else, I can work with." },
      },
      choices = {
        { text = "Then don't forget me.", next = "parting", fx = { align = { light = 1 }, affinity = 1, trait = { kind = 1 } } },
        { text = "Some people deserve forgetting.", next = "deserve", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Back to the matter at hand.", next = "hello" },
      },
    },
    deserve = {
      lines = {
        { id = "ds_default", text = "Perhaps. I am not the one who decides who deserves. I only decide who is remembered, and I have decided: everyone." },
        { id = "ds_shadow", when = { alignment = { axis = "light", max = -40 } },
          text = "You are thinking of yourself. Do not argue, because this place is too thin for it; you are remembered too, and that is not a threat." },
      },
      choices = { { text = "Return me to life.", next = "BUSINESS" }, { text = "Back to the matter at hand.", next = "hello" } },
    },
    pages = {
      lines = {
        { id = "pg_default", key = true,
          text = "There are pages at the back I did not write, in a neat and patient hand, and it dates things that have not happened yet.",
          fx = { hear = "spirithealer_other_hand", npcFlag = { set = "saw_hand" } } },
        { id = "pg_grown", when = { deaths = { min = 25 } }, fx = { hear = "spirithealer_other_hand", npcFlag = { set = "saw_hand" } },
          text = "The pages at the back have grown. Whoever writes them is keeping pace with you, or perhaps running a little ahead." },
        { id = "pg_again", priority = 10, when = { npcFlagBefore = "read_hand" },
          text = "You want the other pages again? The last line is still the one I read you, and nothing has been added, or crossed out either." },
      },
      choices = {
        { text = "Read one to me.", next = "pages_read", fx = { npcFlag = { set = "read_hand" } } },
        { text = "Who wrote them?", next = "pages_who" },
        { text = "Leave them closed.", next = "pages_closed", fx = { trait = { cautious = 1 } } },
      },
    },
    pages_read = {
      big = true,
      lines = {
        { id = "pr_default", key = true, text = "One line, then: \"Not here, not yet, not like this.\" It is underlined three times." },
        { id = "pr_light", when = { alignment = { axis = "light", min = 40 } },
          text = "\"Not here, not yet,\" it says, and beneath that, smaller: \"They will be glad.\" I do not know who they are." },
        { id = "pr_shadow", when = { alignment = { axis = "light", max = -40 } },
          text = "\"Not here, not yet,\" and then a line struck out so hard that the page tore. I will not guess at what it said." },
        { id = "pr_taint", when = { taint = { min = 30 } },
          text = "The page is wet, and it was not wet a moment ago. Close it, please, close it now." },
      },
      choices = {
        { text = "Is that a promise or a warning?", next = "pages_both" },
        { text = "I'd rather not know any more.", next = "hello" },
      },
    },
    pages_both = {
      lines = { { id = "pb_default", text = "Yes." }, { id = "pb_default2", text = "Both, I expect, as most true things are." } },
      choices = { { text = "Return me to life.", next = "BUSINESS" }, { text = "Back to the matter at hand.", next = "hello" } },
    },
    pages_who = {
      lines = {
        { id = "pw_default", text = "I asked once. The question went into the mist and something came back, not an answer, but a page in my own handwriting, very old." },
      },
      choices = {
        { text = "Your handwriting? Were you alive once?", next = "self" },
        { text = "Back to the matter at hand.", next = "hello" },
      },
    },
    pages_closed = {
      lines = { { id = "pc_default", text = "That is wise. Most of what is written about us is better lived than read." } },
      choices = { { text = "Return me to life.", next = "BUSINESS" }, { text = "Back to the matter at hand.", next = "hello" } },
    },
    full = {
      lines = {
        { id = "fu_default", text = "It does not fill. Every time I reach the last page there is another behind it; files close another way." },
      },
      choices = {
        { text = "What closes a file?", next = "finished" },
        { text = "Back to the matter at hand.", next = "hello" },
      },
    },

    ---------------------------------------------------------------------------
    -- Questions
    ---------------------------------------------------------------------------
    ask = {
      lines = {
        { id = "ask_default", text = "Ask, then. This place keeps its own counsel, but I am not this place." },
        { id = "ask_default2", text = "Questions are allowed here, though answers are rationed." },
        { id = "ask_often", when = { timesTalked = { min = 5 } },
          text = "Still asking? Good, because the ones who stop asking are the ones who stop coming back." },
      },
      choices = {
        { text = "What are you?", next = "mystery" },
        { text = "Why send us back at all?", next = "why" },
        { text = "What lies past the mist?", next = "beyond" },
        { text = "I can feel others out there in the gray.", next = "others" },
        { text = "Why does coming back your way cost so much?", next = "price" },
        { text = "Did any of the great ones come through here?", next = "famous", fx = { trait = { curious = 1 } } },
      },
    },

    ---------------------------------------------------------------------------
    -- The price of the short road (resurrection sickness, worn armor)
    ---------------------------------------------------------------------------
    price = {
      lines = {
        { id = "pr_default", key = true,
          text = "Because you are taking the short road, and the short road takes a toll. Your armor comes back worn, as if it walked the whole way without you, and your body wakes weak for a while, because it is ashamed of having been left behind, and it sulks." },
        { id = "pr_young", priority = 10, when = { maxLevel = 9 },
          text = "For you it costs very little yet, because your body is young and forgives quickly. That will change, so do not grow used to my kindness." },
        { id = "pr_sick", priority = 15, when = { resSick = true },
          text = "You still carry last time's weakness, and you are asking for more of it? You are either brave or in a great hurry, and I have never been able to tell those two apart." },
      },
      choices = {
        { text = "Who set the price?", next = "price_who", fx = { trait = { curious = 1 } } },
        { text = "Maybe the weakness is meant as a warning.", next = "price_warn" },
        { text = "Then I'll walk back instead.", next = "walk" },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    price_who = {
      lines = {
        { id = "pw_default",
          text = "The same ones who permitted me, I think, though the instructions do not say so. I only know that I have never once been allowed to send anyone back whole, and at the start I asked the silence why, every single time." },
      },
      choices = {
        { text = "Do you still ask?", next = "price_ask" },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    price_ask = {
      narr = "The healer looks down at their own hands, as if the answer were written on the palms.",
      lines = {
        { id = "pa2_default",
          text = "Not aloud, not anymore. But every time I send someone down, there is a moment before they wake when I hold on, just slightly, as if I could keep the worst of it up here with me. It has never worked, and I have never stopped." },
      },
      choices = {
        { text = "Maybe it works more than you know.", next = "BACK", fx = { trait = { kind = 1 }, affinity = 1 } },
        { text = "Return me to life.", next = "BUSINESS" },
      },
    },
    price_warn = {
      lines = {
        { id = "pwa_default",
          text = "Perhaps it is. A body that comes back too easily forgets to be careful, and I have seen where carelessness leads: here, again and again, until the file runs to a second volume. So call it a warning, by all means, and heed it better than most." },
      },
      choices = {
        { text = "Something else, then.", next = "BACK" },
        { text = "Return me to life.", next = "BUSINESS" },
      },
    },

    ---------------------------------------------------------------------------
    -- The great dead: how they arrived, never where they went
    ---------------------------------------------------------------------------
    famous = {
      hub = true,
      narr = "The healer's eyes go to the far edge of the mist, the way someone looks along a shelf of old books.",
      lines = {
        { id = "fa_default", key = true,
          text = "Everyone comes through here, or through a hill very like it, and greatness does not shorten the climb. Ask me about one, and I will tell you what I am allowed to, which is how they arrived, and never where they went." },
      },
      again = {
        { id = "fa_again", text = "Another? The great ones are heavy to carry, even in memory, but ask." },
        { id = "fa_again2", text = "Who else, then? I remember them all, though some I remember more gently than others." },
      },
      choices = {
        { text = "King Terenas of Lordaeron?", next = "fa_terenas" },
        { text = "Uther the Lightbringer?", next = "fa_uther" },
        { text = "Grom Hellscream?", next = "fa_grom" },
        { text = "Anduin Lothar?", next = "fa_lothar" },
        { text = "Durotan and Draka, the Warchief's parents?", next = "fa_durotan", when = { faction = "Horde" } },
        { text = "Enough of the dead.", next = "ask" },
      },
    },
    fa_terenas = {
      lines = {
        { id = "ft_default",
          text = "He came up the hill with his crown still on, because no one had told him he could take it off. He kept asking where his son was, and I could not say, because his son has never climbed this hill, and never will in any way I would recognize." },
        { id = "ft_forsaken", priority = 10, when = { race = "Scourge" },
          text = "Your old king, yes. He came up with his crown on and asked after his son, and I could not tell him. You may know more about where that boy went than I do, and I am not sure I envy you." },
      },
      choices = {
        { text = "Arthas deserves no forgiveness, ever.", next = "fa_terenas_hard", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Even Arthas was someone's son once.", next = "fa_terenas_soft", fx = { align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Someone else.", next = "BACK" },
      },
    },
    fa_terenas_hard = {
      lines = {
        { id = "fth_default",
          text = "Perhaps not, and forgiving is not my office. But Terenas forgave him, there on the hill, before he went on, and I have never decided whether that was the bravest thing I ever saw or the saddest." },
      },
      choices = { { text = "Someone else.", next = "BACK" }, { text = "Return me to life.", next = "BUSINESS" } },
    },
    fa_terenas_soft = {
      lines = {
        { id = "fts_default",
          text = "He was, and his father said so too, with the crown still on. Forgiving costs the one who forgives; I watched it cost Terenas the last of what he was carrying, and he went on lighter for it." },
      },
      choices = { { text = "Someone else.", next = "BACK" }, { text = "Return me to life.", next = "BUSINESS" } },
    },
    fa_uther = {
      lines = {
        { id = "fu2_default",
          text = "He came up slowly, looking back down the hill as if he expected someone to follow him. He asked me one question, whether the boy he had trained was still alive, and I told him the truth, which was that I did not know what to call it." },
      },
      choices = {
        { text = "Did he forgive Arthas?", next = "fa_uther2" },
        { text = "Someone else.", next = "BACK" },
      },
    },
    fa_uther2 = {
      lines = {
        { id = "fu3_default",
          text = "He did not say, and I did not ask, because some questions are too heavy to hand a man who has only just set down his hammer. He stood at the edge of the mist a long while with his hand over his heart, and when he went, he went without hurrying." },
        { id = "fu3_paladin", priority = 10, when = { class = "PALADIN" },
          text = "You carry his Light, so I will tell you what I tell no one else: the mist was brighter after he went into it, for a day or so, and then it was only mist again. I have looked for that brightness ever since." },
      },
      choices = { { text = "Someone else.", next = "BACK" }, { text = "Return me to life.", next = "BUSINESS" } },
    },
    fa_grom = {
      lines = {
        { id = "fg_default",
          text = "He came up the hill clean, and I had never seen an orc arrive clean before; the demon's blood had always come with them, like mud on their boots. He laughed the whole way up, and would not tell me why, except that he had won." },
        { id = "fg_orc", priority = 10, when = { race = "Orc" },
          text = "Your people still argue over him, I know, so I will tell you only what I saw: he arrived free, and he was prouder of that than of anything he ever killed." },
      },
      choices = {
        { text = "He killed Cenarius, once.", next = "fa_grom2" },
        { text = "Someone else.", next = "BACK" },
      },
    },
    fa_grom2 = {
      lines = {
        { id = "fg2_default",
          text = "He did, and Cenarius never came to me; I do not think the forest's own sons climb hills like this one. When I spoke of it, Grom's laughing stopped for a moment, and then it started again, quieter, and I liked him better for that." },
        { id = "fg2_nelf", priority = 10, when = { race = "NightElf" },
          text = "I know what that name means to you, and I will not pretend Grom was sorry enough. But when I spoke of it, his laughing stopped, and when it came back it was quieter, and that is the only apology I ever saw an orc make up here." },
      },
      choices = { { text = "Someone else.", next = "BACK" }, { text = "Return me to life.", next = "BUSINESS" } },
    },
    fa_lothar = {
      lines = {
        { id = "fl_default",
          text = "The last of old Arathor's blood, though he never wore its crown. He came up holding half a sword, and he would not set it down until I promised him the boy he had left behind would be looked after, which was not mine to promise, and I have worried about it since." },
      },
      choices = {
        { text = "That boy is Stormwind's king, and he's missing.", next = "fa_lothar2", when = { faction = "Alliance" } },
        { text = "Someone else.", next = "BACK" },
      },
    },
    fa_lothar2 = {
      lines = {
        { id = "fl2_default",
          text = "I know. He has not come up any hill of mine, which is the only good news I have about him, so hold on to it for me. Missing is not the same as finished, whatever the court in Stormwind would prefer to believe." },
      },
      choices = { { text = "Someone else.", next = "BACK" }, { text = "Return me to life.", next = "BUSINESS" } },
    },
    fa_durotan = {
      lines = {
        { id = "fd_default",
          text = "They came up together, which is rare, because most are parted by an hour at least. She kept asking after a baby left in the snow, and he held her hand and said nothing, because he already knew no one up here could tell her." },
      },
      choices = {
        { text = "That baby is the Warchief now.", next = "fa_durotan2", fx = { affinity = 1 } },
        { text = "Someone else.", next = "BACK" },
      },
    },
    fa_durotan2 = {
      narr = "For a moment the healer says nothing at all, and the mist around the hill seems to hold still.",
      lines = {
        { id = "fd2_default",
          text = "Is he? Then I have something to tell the gray the next time it is quiet. They did not stay to hear it, but the gray remembers everything said to it, and I like to think it passes things along." },
      },
      choices = { { text = "Someone else.", next = "BACK" }, { text = "Return me to life.", next = "BUSINESS" } },
    },

    mystery = {
      lines = {
        { id = "m_default", text = "I am the one who stands here. That is all I am permitted to know, and few who pass through here think to ask even that much." },
        { id = "m_again", priority = 10, when = { npcFlagBefore = "asked_what" },
          text = "You asked that before, and my answer has not changed, though I have, a little." },
      },
      choices = {
        { text = "Permitted by whom?", next = "mystery2", fx = { trait = { curious = 1 }, npcFlag = { set = "asked_what" } } },
        { text = "You seem as if you were alive once.", next = "self", fx = { npcFlag = { set = "asked_what" } } },
        { text = "And what am I?", next = "turn", fx = { npcFlag = { set = "asked_what" } } },
        { text = "As you say.", next = "ask" },
      },
    },
    mystery2 = {
      lines = {
        { id = "m2_default", text = "Ask me again when you have died a hundred times. I may know by then, and so may you." },
        { id = "m2_default2", text = "Whoever set this hill here, and the mist around it. They never visit; they left instructions, and then a silence that has not ended." },
        { id = "m2_hundred", tags = { "news" }, when = { deaths = { min = 100 } },
          text = "A hundred deaths, and I promised you an answer, so here it is: I do not know, and I no longer believe anyone does. That frightens me less than it did." },
      },
      choices = {
        { text = "Have you ever gone against your instructions?", next = "disobey" },
        { text = "Return me to life.", next = "BUSINESS" },
        { text = "Back to my questions.", next = "ask" },
      },
    },
    disobey = {
      big = true,
      lines = {
        { id = "do_default", key = true,
          text = "Once. I held someone past their time, because they were weeping and I wanted them to finish. The mist went very cold, and nothing else happened, I think." },
      },
      choices = {
        { text = "Would you do it again?", next = "disobey2" },
        { text = "Back to my questions.", next = "ask" },
      },
    },
    disobey2 = {
      lines = { { id = "do2_default", text = "Yes, I would. Do not tell anyone; I am not sure who you would tell, but do not." } },
      choices = { { text = "Your secret's safe.", next = "ask", fx = { affinity = 1 } }, { text = "Return me to life.", next = "BUSINESS" } },
    },

    self = {
      big = true,
      lines = {
        { id = "s_default", key = true,
          text = "I think so. There are things I know without ever having learned them: the weight of a cloak, how bread smells, grief.",
          fx = { hear = "spirithealer_was_mortal", npcFlag = { set = "heard_mortal" } } },
        { id = "s_again", priority = 10, when = { npcFlagBefore = "heard_mortal" },
          text = "Are you still thinking about that? So am I, and yesterday I remembered a door with a blue latch, though I do not know whose it was." },
      },
      choices = {
        { text = "Who were you?", next = "self2" },
        { text = "You were one of us. Someone sent you back here.", tag = "Persuade", next = "self_reveal",
          check = { pass = { any = { { trait = "curious" }, { deaths = { min = 25 } }, { affinity = { min = 3 } } } } },
          fail = { next = "self_closed" } },
        { text = "That's terribly sad.", next = "self_sad", fx = { trait = { kind = 1 } } },
        { text = "Back to my questions.", next = "ask" },
      },
    },
    self2 = {
      lines = {
        { id = "s2_default", text = "I do not know. When I reach for it I find only the people I have sent back, thousands of faces, and mine must be in there somewhere." },
      },
      choices = {
        { text = "Then I'll remember you.", next = "remember", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Then you're only a tool, and tools don't need faces.", next = "ask", fx = { align = { light = -1 } } },
        { text = "Back to my questions.", next = "ask" },
      },
    },
    remember = {
      big = true,
      lines = {
        { id = "rm_default", key = true,
          text = "...No one has offered that before. Be careful, because promises made here are heard by more than me, but thank you." },
      },
      choices = {
        { text = "I meant it.", next = "parting", fx = { trait = { kind = 1 } },
          journal = { first = "I promised a spirit healer I would remember them. I don't know who else heard me promise it.",
                      third = "{name} promised a spirit healer to remember them, and meant it." } },
      },
    },
    self_sad = {
      lines = { { id = "ss_default", text = "Is it? I am not sure, because sad would need me to know what I lost, and I only know the shape of the hole." } },
      choices = { { text = "Return me to life.", next = "BUSINESS" }, { text = "Back to my questions.", next = "ask" } },
    },
    self_reveal = {
      big = true,
      lines = {
        { id = "sr_default", key = true,
          text = "...Yes. Someone stood here once and said \"not yet\" to me. I asked who would say it to the next one. They smiled, and stepped aside." },
      },
      choices = {
        { text = "That sounds more like a story than a memory.", next = "self_story" },
        { text = "Will I end up standing here too?", next = "successor" },
      },
    },
    self_story = {
      lines = { { id = "st_default", text = "Here, the difference is thin. I tell it either way, because it keeps me standing." } },
      choices = { { text = "Will I end up standing here too?", next = "successor" }, { text = "Back to my questions.", next = "ask" } },
    },
    successor = {
      lines = {
        { id = "su_default", text = "Perhaps, since you ask the right questions for it, though that is not quite a compliment." },
        { id = "su_many", when = { deaths = { min = 50 } },
          text = "You know the hill better than some who have stood on it. Do not look so pleased; it is not a promotion." },
      },
      choices = {
        { text = "I think I'd be good at it.", next = "parting", fx = { trait = { brave = 1 } } },
        { text = "I hope not.", next = "parting" },
      },
    },
    self_closed = {
      lines = { { id = "sc_default", text = "No, that is enough. Some doors here are shut for a reason, and I am one of them." } },
      choices = { { text = "Return me to life.", next = "BUSINESS" }, { text = "Back to my questions.", next = "ask" } },
    },

    turn = {
      big = true,
      lines = {
        { id = "t_default", key = true,
          text = "Let me ask you instead. When I send you back, is it the same you who wakes? Or someone who only remembers being you?" },
      },
      choices = {
        { text = "The same as ever. I remember everything.", next = "turn_same", fx = { npcFlag = { set = "answered_turn" } } },
        { text = "I don't know.", next = "turn_unsure", fx = { npcFlag = { set = "answered_turn" }, trait = { curious = 1 } } },
        { text = "Does it matter?", next = "turn_matter", fx = { npcFlag = { set = "answered_turn" } } },
        { text = "I already know the answer to that.", next = "turn_forsaken", when = { race = "Scourge" },
          fx = { npcFlag = { set = "answered_turn" } } },
      },
    },
    turn_same = {
      lines = {
        { id = "ts_default", text = "Memory is a thread, not a rope: it holds the shape, not the weight. But you say it as if you believe it, and belief does much of the work here." },
      },
      choices = { { text = "Return me to life.", next = "BUSINESS" }, { text = "Back to my questions.", next = "ask" } },
    },
    turn_unsure = {
      lines = {
        { id = "tu_default", text = "Good. The certain ones worry me. They come back harder each time, like a blade folded too often." },
      },
      choices = { { text = "Return me to life.", next = "BUSINESS" }, { text = "Back to my questions.", next = "ask" } },
    },
    turn_matter = {
      lines = {
        { id = "tm_default", text = "To me, no; I send back whoever is standing here. To you, I think it matters more than you let on, and I think you know it." },
      },
      choices = { { text = "Return me to life.", next = "BUSINESS" }, { text = "Back to my questions.", next = "ask" } },
    },
    turn_forsaken = {
      big = true,
      lines = {
        { id = "tf_default", key = true,
          text = "Yes, you do. You were dragged back once without being asked, and I always ask; that is the whole difference between me and the Lich King, and it is everything." },
      },
      choices = {
        { text = "Then why do I feel so little?", next = "turn_forsaken2" },
        { text = "Back to my questions.", next = "ask" },
      },
    },
    turn_forsaken2 = {
      lines = { { id = "tf2_default", text = "You do feel; you have only learned to whisper it. I hear whispers well, since they are most of what reaches me up here." } },
      choices = { { text = "Return me to life.", next = "BUSINESS", fx = { affinity = 1 } }, { text = "Back to my questions.", next = "ask" } },
    },

    ---------------------------------------------------------------------------
    -- The argument: why send anyone back?
    ---------------------------------------------------------------------------
    why = {
      big = true,
      lines = {
        { id = "w_default", text = "Because you are not finished, and none of you ever are." },
        { id = "w_default2", text = "Because someone has to stand between you and the quiet, and I am the one standing." },
        { id = "w_shadow", when = { alignment = { axis = "light", max = -40 } },
          text = "Because I am asked to, not because you deserve it. Forgive the honesty; this place makes it easy." },
      },
      choices = {
        { text = "Who decides when I'm finished?", next = "finished" },
        { text = "Sending us back seems to cheapen death.", next = "cheapen" },
        { text = "Thank you.", next = "BUSINESS", fx = { align = { light = 1 }, trait = { kind = 1 } } },
        { text = "I never asked you to send me back.", next = "BUSINESS", fx = { align = { light = -1 } } },
        { text = "Back to my questions.", next = "ask" },
      },
    },
    finished = {
      lines = {
        { id = "f_default", text = "Not me; I only notice that you are not finished. A finished soul settles, like snow, and you are still falling." },
        { id = "f_default2", text = "The finished ones stand very still and stop asking questions. You have never once stood still." },
      },
      choices = {
        { text = "And when I settle?", next = "settle" },
        { text = "I'm not sure I'll ever feel finished.", next = "never" },
        { text = "Back to my questions.", next = "ask" },
      },
    },
    settle = {
      lines = {
        { id = "se_default", text = "Then you will walk past this hill without stopping, and I will not be the one who meets you. Someone else will, so be kind to them, because they will be nervous." },
        { id = "se_default2", text = "Then I will close your file, gently, as I have closed a great many. It is the one thing I am sure I am good at." },
      },
      choices = { { text = "Return me to life.", next = "BUSINESS" }, { text = "Back to my questions.", next = "ask" } },
    },
    never = {
      lines = {
        { id = "nv_default", text = "Then you are like most of the living, and every one of the dead I send back. It is not a flaw; it is what keeps the world turning." },
      },
      choices = { { text = "Return me to life.", next = "parting" }, { text = "Back to my questions.", next = "ask" } },
    },
    cheapen = {
      big = true,
      lines = {
        { id = "ch_default", key = true, text = "Tell me, does a song mean less because it can be sung twice?" },
        { id = "ch_many", when = { deaths = { min = 25 } },
          text = "You ask that with {deaths} deaths behind you. Does a song mean less because it can be sung twice, or does it mean more?" },
      },
      choices = {
        { text = "A song isn't a life.", next = "song", fx = { trait = { skeptical = 1 } } },
        { text = "Then death means nothing.", next = "nothing", fx = { trait = { skeptical = 1 } } },
        { text = "Maybe it's a mercy.", next = "mercy", fx = { align = { light = 1 } } },
        { text = "It's a curse, and you're the one who keeps casting it.", next = "parting", fx = { align = { light = -1 } } },
        { text = "Maybe it's a cage.", next = "cage", fx = { npcFlag = { set = "asked_cage" } } },
      },
    },
    song = {
      lines = {
        { id = "so_default", text = "No, it is not, and so I keep the record. Someone must remember that every ending was real, even the ones you walked away from." },
        { id = "so_default2", text = "You are right, and I am glad you are right. If it were only a song, I could stop listening." },
      },
      choices = { { text = "Return me to life.", next = "BUSINESS" }, { text = "Back to my questions.", next = "ask" } },
    },
    nothing = {
      lines = {
        { id = "no_default", text = "Ask the ones I could not send back. Some arrive with no body left to return to, and some with no will left, and to them death is no small thing." },
      },
      choices = {
        { text = "Who are they?", next = "others" },
        { text = "I spoke too quickly.", next = "ask", fx = { trait = { kind = 1 } } },
      },
    },
    mercy = {
      lines = {
        { id = "me_default", text = "It is meant as one, but meaning a thing and being it are not the same, and I spend my days in the space between them." },
      },
      choices = { { text = "Return me to life.", next = "BUSINESS" }, { text = "Back to my questions.", next = "ask" } },
    },
    cage = {
      big = true,
      lines = {
        { id = "cg_default", key = true, text = "Perhaps it is, but every cage is kind to something. Would you have me open it?" },
      },
      choices = {
        { text = "Yes, let me choose.", next = "stay", fx = { align = { order = -1 }, npcFlag = { set = "asked_stay" } } },
        { text = "No, not yet.", next = "parting", fx = { align = { order = 1 } } },
        { text = "You're caged too, aren't you?", tag = "Persuade", next = "healer_cage",
          check = { pass = { any = { { trait = "curious" }, { trait = "kind" }, { deaths = { min = 25 } } } } },
          fail = { next = "cage_fail" } },
        { text = "Back to my questions.", next = "ask" },
      },
    },
    healer_cage = {
      big = true,
      lines = {
        { id = "hc_default", key = true,
          text = "...I have not left this hill since before your grandparents were born. I am not sure it is one hill. Some nights I hear footsteps on the others, and they are mine." },
      },
      choices = {
        { text = "Do you want to leave?", next = "want_leave" },
        { text = "Back to my questions.", next = "ask" },
      },
    },
    want_leave = {
      lines = {
        { id = "wl_default", text = "Every day, and every day someone frightened comes up the hill, and so I stay. Wanting to leave is not the same as leaving, and you know that better than most." },
      },
      choices = { { text = "Return me to life.", next = "parting", fx = { affinity = 1 } } },
    },
    cage_fail = {
      lines = { { id = "cf_default", text = "Do not pity me, friend. You are in no position to, since you are, after all, dead." } },
      choices = { { text = "Return me to life.", next = "BUSINESS" }, { text = "Back to my questions.", next = "ask" } },
    },

    ---------------------------------------------------------------------------
    -- Refusing to go back
    ---------------------------------------------------------------------------
    stay = {
      big = true,
      lines = {
        { id = "st0_default", text = "Then don't go. You are allowed to refuse me, though few ever do." },
        { id = "st0_again", priority = 10, when = { npcFlagBefore = "heard_thin" },
          text = "You keep asking. One day you will mean it, and I will have to let you." },
      },
      choices = {
        { text = "The ones who stay must change, in time.", next = "stay_what" },
        { text = "I'm ready. I'm not afraid.", tag = "Deceive", next = "stay_what",
          fail = { next = "stay_seen" } },
        { text = "I was only asking.", next = "hello" },
        { text = "Send me back.", next = "parting" },
      },
    },
    stay_what = {
      big = true,
      lines = {
        { id = "sw_default", key = true, fx = { npcFlag = { set = "heard_thin" } },
          text = "They thin. First the voice goes, then the name, then the reason they stayed, and then they walk into the mist, and none has come back to tell me what met them." },
      },
      choices = {
        { text = "I'll stay a little longer.", next = "linger", fx = { align = { order = -1 } } },
        { text = "That sounds peaceful.", next = "peaceful" },
        { text = "Send me back.", next = "parting", fx = { align = { order = 1 } } },
      },
    },
    peaceful = {
      lines = { { id = "pe_default", text = "It looks peaceful from here, but most things do, from far enough away." } },
      choices = { { text = "I'll stay a little longer.", next = "linger" }, { text = "Send me back.", next = "parting" } },
    },
    linger = {
      big = true,
      lines = {
        { id = "li_default", text = "Do you hear them? They have noticed you, and they want to know what a living soul sounds like, up close." },
        { id = "li_default2", text = "Look at your hands, and see how your edges are softening already. Do you see it?" },
        { id = "li_taint", when = { taint = { min = 30 } },
          text = "They are not looking at you; they are looking at what came with you, and it is looking back. Go, now." },
      },
      choices = {
        { text = "Send me back, and do it now.", next = "parting" },
        { text = "Let them come.", next = "linger2", fx = { trait = { brave = 1 } } },
      },
    },
    linger2 = {
      big = true,
      lines = {
        { id = "l2_default", key = true,
          text = "No. Not here, not yet, not like this. I said you may refuse me, but I never said I would make it easy." },
      },
      choices = {
        { text = "Those words are in my file.", next = "linger3", when = { npcFlag = "read_hand" } },
        { text = "Return me to life.", next = "BUSINESS",
          journal = { first = "I tried to stay in the gray. The spirit healer wouldn't let me. Something out there was listening.",
                      third = "{name} tried to stay among the dead, and was sent back." } },
      },
    },
    linger3 = {
      big = true,
      lines = {
        { id = "l3_default", text = "...So they are. I did not know I was going to say them until I had, so go, before either of us learns who wrote them." },
      },
      choices = { { text = "Return me to life.", next = "BUSINESS" } },
    },
    stay_seen = {
      lines = {
        { id = "sn_default", text = "Here, the lie arrives before the words do. You are afraid, and that is all right; so am I, sometimes." },
      },
      choices = { { text = "Send me back.", next = "parting" }, { text = "I was only asking.", next = "hello" } },
    },

    ---------------------------------------------------------------------------
    -- Past the mist, and the others in it
    ---------------------------------------------------------------------------
    beyond = {
      lines = {
        { id = "by_default", text = "I have looked, and the mist looks back." },
        { id = "by_default2", text = "Something patient waits there; that is all I am sure of, because it has never once been in a hurry." },
        { id = "by_again", priority = 10, when = { npcFlagBefore = "asked_beyond" },
          text = "Last time I told you the mist looks back. I was being poetic, I thought. I am less sure now that I was." },
      },
      choices = {
        { text = "Have you ever gone in?", next = "door", fx = { npcFlag = { set = "asked_beyond" } } },
        { text = "I'd like to think the Light waits there.", next = "light", fx = { npcFlag = { set = "asked_beyond" } } },
        { text = "Then what's the point of any of this?", next = "point", fx = { npcFlag = { set = "asked_beyond" } } },
        { text = "Back to my questions.", next = "ask" },
      },
    },
    door = {
      lines = {
        { id = "dr_default", key = true, fx = { hear = "spirithealer_the_door" },
          text = "There is a door there that I have never opened. Some days it is warm, and some days I hear someone on the other side, waiting for me to knock." },
      },
      choices = {
        { text = "Why not open it?", next = "door2" },
        { text = "Back to my questions.", next = "ask" },
      },
    },
    door2 = {
      lines = {
        { id = "d2_default", text = "Because the moment I do, there is no one here to say \"not yet\". And there is always someone coming up the hill." },
      },
      choices = { { text = "Return me to life.", next = "parting" }, { text = "Back to my questions.", next = "ask" } },
    },
    light = {
      lines = {
        { id = "lt_default", text = "The Light reaches here, thinly, like dawn through a shutter. Whether it waits beyond, or only passes through on its way elsewhere, I cannot say." },
        { id = "lt_holy", when = { class = { "PRIEST", "PALADIN" } },
          text = "You want me to say yes. Your Light comes through here every day, and it has never once stopped to tell me where it is going." },
        { id = "lt_forsaken", when = { race = "Scourge" },
          text = "You wonder whether it would burn you, over there. I do not know, but I know it does not burn you here, so make of that what you can." },
      },
      choices = {
        { text = "And the Shadow?", next = "shadow" },
        { text = "Back to my questions.", next = "ask" },
      },
    },
    shadow = {
      lines = {
        { id = "sh_default", text = "The Shadow is here too; it sits in the corners and takes notes. We have an understanding, and I do not ask what it writes." },
      },
      choices = { { text = "Return me to life.", next = "BUSINESS" }, { text = "Back to my questions.", next = "ask" } },
    },
    point = {
      big = true,
      lines = {
        { id = "pt_default", key = true,
          text = "The point is the hill you stand on, the road down it, and whatever you do at the bottom. The mist is not the point. The mist is the edge of the page." },
      },
      choices = {
        { text = "Then I'd better go write something.", next = "parting", fx = { align = { light = 1 } } },
        { text = "There's nothing down there worth writing.", next = "parting", fx = { align = { light = -1 } } },
        { text = "Back to my questions.", next = "ask" },
      },
    },

    others = {
      lines = {
        { id = "o_default", text = "The ones who did not go back. Some chose to stay and some had nothing left to go back to, and they gather where the mist is thickest to watch the living pass." },
        { id = "o_default2", text = "Look past my shoulder. No, don't; they prefer not to be looked at directly, because it reminds them." },
      },
      choices = {
        { text = "They must want something from us.", next = "others_want" },
        { text = "Are any of them mine?", next = "mine" },
        { text = "Tell me about one of them.", next = "lantern" },
        { text = "Back to my questions.", next = "ask" },
      },
    },
    others_want = {
      lines = {
        { id = "ow_default", text = "Mostly they want to be said aloud. A name spoken once a day keeps a shape from thinning, so I say as many as I can." },
      },
      choices = {
        { text = "If I end up out there, say mine.", next = "name_promise", fx = { npcFlag = { set = "promised_name" } } },
        { text = "Back to my questions.", next = "ask" },
      },
    },
    name_promise = {
      big = true,
      lines = {
        { id = "np_default", key = true,
          text = "I will, every day, until there is no one left to hear it. That may be a long time, but I am very patient." },
      },
      choices = {
        { text = "Thank you.", next = "parting", fx = { affinity = 1, trait = { kind = 1 } },
          journal = { first = "A spirit healer promised to say my name every day, if I ever stay in the gray.",
                      third = "A spirit healer promised to keep {name}'s name said aloud among the dead." } },
      },
    },
    mine = {
      lines = {
        { id = "mn_default", text = "Everyone has someone in the gray, and yours are quiet. Either they are at peace, or they are waiting until you are ready." },
        { id = "mn_forsaken", when = { race = "Scourge" },
          text = "Some of them knew you, before. They do not blame you for what walks in your body. They blame the Lich King." },
        { id = "mn_human", when = { race = "Human" },
          text = "Lordaeron is still crowded here, and they ask after the living. I tell them the living are stubborn." },
        { id = "mn_nightelf", when = { race = "NightElf" },
          text = "Yours drift as wisps, and they keep turning toward a mountain I cannot see. Toward home, I suppose." },
        { id = "mn_orc", when = { race = "Orc" },
          text = "Yours are loud even here. Some still carry a sickness in the blood, brought from somewhere else, but it is fading, slowly." },
        { id = "mn_tauren", when = { race = "Tauren" },
          text = "Yours never stay long, because something calls them onward and they go gladly. I envy them that." },
        { id = "mn_troll", when = { race = "Troll" },
          text = "Yours bargain with me as if I were a loa. I am not, but I accept the offerings anyway, since it seems to comfort them." },
        { id = "mn_dwarf", when = { race = "Dwarf" },
          text = "Yours ask whether the mountain still stands, and I tell them yes, though I have never checked." },
        { id = "mn_gnome", when = { race = "Gnome" },
          text = "Yours came all at once, from under a mountain, gasping and green. I remember the day, though I would rather not." },
      },
      choices = { { text = "Return me to life.", next = "parting" }, { text = "Back to my questions.", next = "ask" } },
    },
    -- The one with the lantern: a story told one chapter per visit (npcFlagBefore gates
    -- each chapter on the previous one being heard in an earlier conversation).
    lantern = {
      big = true,
      lines = {
        { id = "ln1", key = true, fx = { npcFlag = { set = "lantern1" } },
          text = "There is one out there who carries a lantern. They refused me, long ago. They said they were waiting for someone, and would need a light to see them coming." },
        { id = "ln2", priority = 10, when = { npcFlagBefore = "lantern1" }, fx = { npcFlag = { set = "lantern2" } },
          text = "The one with the lantern asked whether the living still use the east road, and I said I did not know. They have waited so long that the road may not be there anymore." },
        { id = "ln3", priority = 20, when = { npcFlagBefore = "lantern2" }, fx = { npcFlag = { set = "lantern3" } },
          text = "The lantern is dimmer, and so is their face; the mist shows through it now. They still lift the light whenever someone comes up the hill, though it is never who they want." },
        { id = "ln4", priority = 30, when = { npcFlagBefore = "lantern3" }, fx = { npcFlag = { set = "lantern4" } },
          text = "I asked who they are waiting for, and they have forgotten the name. They remember the waiting, though, and that, it seems, is the last thing to go." },
        { id = "ln5", priority = 40, when = { npcFlagBefore = "lantern4" }, fx = { npcFlag = { set = "lantern5" } },
          text = "They lifted the lantern when you arrived just now. Do not turn around; it is not you either, but they smiled, I think, at being looked for." },
        { id = "ln6", key = true, priority = 50, when = { npcFlagBefore = "lantern5" }, fx = { npcFlag = { set = "lantern6" } },
          text = "They are gone. They walked into the mist with the lantern lit, stopped at the edge to listen, and then ran, as if someone had called their name." },
        { id = "ln6_promise", key = true, priority = 60, when = { npcFlagBefore = "lantern5", npcFlag = "lantern_promise" },
          fx = { npcFlag = { set = "lantern6" } },
          text = "They are gone. They asked me to thank you for watching the road, then walked into the mist, stopped to listen, and ran, as if someone had called." },
        { id = "ln7", priority = 70, when = { npcFlagBefore = "lantern6" },
          text = "Sometimes, at the edge of the mist, there is a small light. I tell myself it is the lantern, held up on the far side for the next one. I have decided to believe it." },
      },
      choices = {
        { text = "Why didn't you make them go?", next = "lantern_why" },
        { text = "Tell them I'll watch the road for whoever it is.", next = "lantern_promise",
          when = { npcFlag = "lantern3", ["not"] = { npcFlag = "lantern6" } },
          fx = { npcFlag = { set = "lantern_promise" }, trait = { kind = 1 } } },
        { text = "Are the others dangerous?", next = "others_danger" },
        { text = "Back to my questions.", next = "ask" },
      },
    },
    lantern_why = {
      big = true,
      lines = {
        { id = "lw_default", text = "Because a choice I take away is not a mercy; it is only me, deciding, and I have enough of that already." },
      },
      choices = { { text = "Even if it's hurting them?", next = "lantern_hurt" }, { text = "Back to my questions.", next = "ask" } },
    },
    lantern_hurt = {
      lines = {
        { id = "lh_default", text = "Waiting hurts, and so does hope. You do both every time you go back down the hill, and I have never once taken that from you either." },
      },
      choices = { { text = "Return me to life.", next = "parting" }, { text = "Back to my questions.", next = "ask" } },
    },
    lantern_promise = {
      lines = {
        { id = "lp_default", key = true,
          text = "I will tell them. They will not understand, but they will hold the lantern a little higher, and I have seen that much already." },
      },
      choices = {
        { text = "Return me to life.", next = "parting",
          journal = { first = "There's a ghost with a lantern, waiting for someone. I promised to watch the road for them.",
                      third = "{name} promised a ghost with a lantern to watch the road." } },
      },
    },
    others_danger = {
      lines = {
        { id = "od_default", text = "To you? No. To me, they are what I would become if I ever stopped, and that worries me." },
        { id = "od_taint", when = { taint = { min = 30 } },
          text = "Not to you, but perhaps to what came with you. They do not like it, and neither do I." },
      },
      choices = { { text = "Return me to life.", next = "parting" }, { text = "Back to my questions.", next = "ask" } },
    },

    ---------------------------------------------------------------------------
    -- Stay and talk: the healer's own hub (questions for you, tales, arguments)
    ---------------------------------------------------------------------------
    talk = {
      rotating = true,
      lines = {
        { id = "tk_default",
          text = "Sit with me, then. The hill is long and the company is mostly quiet." },
        { id = "tk_default2",
          text = "You want to stay a while, when most people run. I will not pretend I am not glad." },
        { id = "tk_default3",
          text = "Talk, then; your body will keep. Bodies are good at waiting, and it is the only thing they are good at without you." },
        { id = "tk_default4",
          text = "I have been standing here a long time with no one to argue with, so choose your weapon." },
        { id = "tk_default5",
          text = "Listen. That sound under the quiet is the world, still turning without you; it does not mind, and it does not hurry, either." },
        { id = "tk_night", when = { timeOfDay = "night" },
          text = "It is night down there. You cannot tell from here, but I can: the hill grows a little colder for the living. Stay close to me." },
        { id = "tk_drunk", when = { drunk = true },
          text = "You died drunk, and you will find the drink did not come with you. It never does, and people take it as a betrayal." },
        { id = "tk_party", when = { party = {  } },
          text = "Your companions are not here, so either they lived or they are slower than you. I will wait for both." },
        { id = "tk_curious", when = { trait = "curious" },
          text = "You ask too many questions, and that is good. The ones who stop asking are the first to thin, so do not stop." },
        { id = "tk_kind", when = { trait = "kind" },
          text = "You are kind, and the others in the gray notice it. They drift a little closer when you are here, so do not be alarmed." },
        { id = "tk_cruel", when = { trait = "cruel" },
          text = "There is a cruel streak in you, and I have seen what cruelty does up here. It is the first thing that thins, and it takes the kinder things with it." },
        { id = "tk_pious", when = { trait = "pious" },
          text = "You prayed on the way up; most do not notice they are doing it. I heard every word, and I do not know who else did." },
        { id = "tk_skeptic", when = { trait = "skeptical" },
          text = "You still do not quite believe in me, and that is all right, because I do not quite believe in me either. We can doubt together." },
        { id = "tk_sick", when = { resSick = true },
          text = "You still have the last weakness on you, and here you are again. Sit with me until the shaking stops, at least; it is not shame, it is only the body catching up." },
        { id = "tk_bg", priority = 10, when = { zone = { "Warsong Gulch", "Arathi Basin", "Alterac Valley" } },
          text = "You want to talk, here, with a battle going on below and the others shoving to get past you? Then I will talk quickly, and you will forgive me for it." },
        { id = "tk_witty", when = { trait = "witty" },
          text = "You joked on your way up the hill. The others did not laugh, but I did, quietly, since it has been a long time since anyone joked here." },
      },
      choices = {
        { text = "What if I don't go back?", next = "stay", fx = { npcFlag = { set = "asked_stay" } } },
        { text = "Ask me something.", next = "quiz" },
        { text = "Tell me about someone who came through.", next = "tales" },
        { text = "Let's argue about something.", next = "debate" },
        { text = "The hill seems emptier than usual.", next = "quiet" },
        { text = "I raise the dead too. Do you mind?", next = "colleague", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "My ankh brings me back without you.", next = "ankh", when = { class = "SHAMAN", minLevel = 30 } },
        { text = "My people's souls return to Elune.", next = "elune", when = { race = "NightElf" } },
        { text = "Did Gnomeregan's dead come through here?", next = "gnomeregan", when = { race = "Gnome" } },
        { text = "Do my ancestors ever stop to talk?", next = "ancestors", when = { race = "Tauren" } },
        { text = "Have you ever held a sword?", next = "c_warrior", when = { class = "WARRIOR" } },
        { text = "Can anyone sneak past you?", next = "c_rogue", when = { class = "ROGUE" } },
        { text = "Is this place made of magic?", next = "c_mage", when = { class = "MAGE" } },
        { text = "Do the demons I bind come here?", next = "c_warlock", when = { class = "WARLOCK" } },
        { text = "Do beasts ever come up this hill?", next = "c_hunter", when = { class = "HUNTER" } },
        { text = "Does Cenarius know this place?", next = "c_druid", when = { class = "DRUID" } },
        { text = "What happened to Lordaeron's dead?", next = "r_human", when = { race = "Human" } },
        { text = "Do dwarves go to the stone when they die?", next = "r_dwarf", when = { race = "Dwarf" } },
        { text = "Did the orcs who drank the blood come here?", next = "r_orc", when = { race = "Orc" } },
        { text = "Do the loa ever come for their own?", next = "r_troll", when = { race = "Troll" } },
        { text = "Why do you still send me back?", next = "r_forsaken", when = { race = "Scourge" } },
      },
    },

    ---------------------------------------------------------------------------
    -- The empty hill, and talk that only some visitors get
    ---------------------------------------------------------------------------
    quiet = {
      lines = {
        { id = "qu_default",
          text = "It is, and I do not trust it. An empty hill means either the world below is being kind for once, or something down there is keeping its dead for itself, and I have learned which to expect." },
        { id = "qu_plague", priority = 10, when = { zone = { "Eastern Plaguelands", "Western Plaguelands" } },
          text = "Here it is always emptier than it should be. People die in this land every hour, and so few of them reach me that I have stopped expecting them and started listing them instead." },
      },
      choices = {
        { text = "What do you do when no one comes?", next = "quiet2" },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    quiet2 = {
      lines = {
        { id = "qu2_default",
          text = "I read. Not your file, if that worries you, but the old ones, the files that closed long ago. I read the names aloud, one after another, because a name that is never said wears thin, and I have never found anyone else to say them." },
      },
      choices = {
        { text = "Read me one.", next = "quiet3", fx = { trait = { curious = 1 } } },
        { text = "That sounds lonely.", next = "quiet_lonely", fx = { trait = { kind = 1 } } },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    quiet3 = {
      lines = {
        { id = "qu3_default",
          text = "Here is one: a baker of Stromgarde who died old in her bed with flour still on her hands, and asked me only whether she had left the oven lit. She had not, and when I told her so she went into the mist laughing; I read her name first every day, because it is the easiest." },
        { id = "qu3_alt", when = { chance = 0.5 },
          text = "Here is one: a boy from Goldshire who drowned in Crystal Lake on a dare, and arrived furious, insisting he would have made it if his boot had not come off. He asked me to tell his friends so, and I could not, so I tell the hill instead, every morning." },
      },
      choices = {
        { text = "Say mine, too, someday.", next = "name_promise" },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    quiet_lonely = {
      lines = {
        { id = "ql_default",
          text = "It is, though loneliness is a living thing, and I am not sure I qualify. What I feel is closer to a held breath that never quite ends; you let a little of it out, coming here, and I thought you should know." },
      },
      choices = {
        { text = "Let's talk about something else.", next = "talk" },
        { text = "Return me to life.", next = "BUSINESS" },
      },
    },
    colleague = {
      lines = {
        { id = "co_default",
          text = "Mind? No, though it is humbling. You call them back with a word and the Light behind it, and they come at once; I must wait until they climb all the way up here, and then I must ask them. Your way is faster, and on busy days I envy it." },
        { id = "co_paladin", priority = 5, when = { class = "PALADIN" },
          text = "Mind? No, though your order does it with such certainty. You raise a fallen friend as if the Light had signed for them, and I have to wait for them to climb up here and then ask them, so on busy days I envy you a little." },
      },
      choices = {
        { text = "Do the ones I raise pass by here first?", next = "colleague2", fx = { trait = { curious = 1 } } },
        { text = "We do the same work, then.", next = "colleague3", fx = { affinity = 1 } },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    colleague2 = {
      lines = {
        { id = "co2_default",
          text = "Some do, for a moment, and I see your Light reach up the hill for them like a hand through water. I always let them go to you, and I have never once held one back, though I have been tempted, when they were in the middle of telling me something." },
      },
      choices = {
        { text = "Let's talk about something else.", next = "talk" },
        { text = "Return me to life.", next = "BUSINESS" },
      },
    },
    colleague3 = {
      lines = {
        { id = "co3_default",
          text = "The same work from opposite ends of the rope, perhaps. You pull and I let go, and between us someone gets home; it is a strange partnership, but I would not trade it." },
      },
      choices = {
        { text = "Let's talk about something else.", next = "talk" },
        { text = "Return me to life.", next = "BUSINESS" },
      },
    },
    ankh = {
      lines = {
        { id = "an_default",
          text = "It does, and the spirits are generous with it. But notice that your ankh still brings you up the hill first; you simply leave before I can say anything, and I have a great many unfinished sentences addressed to shamans." },
      },
      choices = {
        { text = "Then finish one now.", next = "ankh2", fx = { trait = { witty = 1 } } },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    ankh2 = {
      lines = {
        { id = "an2_default",
          text = "Very well. The elements you bargain with were here long before me and will be here long after, and they do not love you the way your ancestors do, so do not mistake their kindness for affection. There; that one has been waiting years." },
      },
      choices = {
        { text = "Let's talk about something else.", next = "talk" },
        { text = "Return me to life.", next = "BUSINESS" },
      },
    },
    elune = {
      lines = {
        { id = "el_default",
          text = "Perhaps they do, and I only see them on the way, the wisps drifting up the hill and pausing beside me like moths beside a lantern. Your people are the only ones who arrive already glowing, and I have always wondered whether that is a gift or a habit." },
      },
      choices = {
        { text = "What happens to the wisps after?", next = "elune2" },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    elune2 = {
      lines = {
        { id = "el2_default",
          text = "Some go on into the mist, and some go back down to the old forests to tend things; I once watched a wisp spend a hundred years on a single tree. Your druids would say that is not death at all, and I have never had the heart to argue with them." },
      },
      choices = {
        { text = "Let's talk about something else.", next = "talk" },
        { text = "Return me to life.", next = "BUSINESS" },
      },
    },
    gnomeregan = {
      lines = {
        { id = "gn_default",
          text = "All at once, on one terrible afternoon, more in a single hour than this hill had ever held. They came up still arguing about valves and pressures, and some of them were trying to repair the mist before anyone had told them they were dead." },
      },
      choices = {
        { text = "Did they all make it up here?", next = "gnomeregan2" },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    gnomeregan2 = {
      lines = {
        { id = "gn2_default",
          text = "No, and that is what I think about most. Whatever that poison did to the ones left below, it did not let them climb, and some of them are down there still, neither one thing nor the other. My count of the missing from that day is never the same twice, and it troubles me more than I can say." },
      },
      choices = {
        { text = "Let's talk about something else.", next = "talk" },
        { text = "Return me to life.", next = "BUSINESS" },
      },
    },
    ancestors = {
      lines = {
        { id = "ac_default",
          text = "Once, and only once. An old bull stopped and asked me whether I was lonely standing here, and I said I did not know, and he said that was an answer too. Then he went on toward the sunrise side of the mist, where I have never seen the sun rise." },
      },
      choices = {
        { text = "That sounds like my grandfather.", next = "ancestors2", fx = { affinity = 1 } },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    ancestors2 = {
      lines = {
        { id = "ac2_default",
          text = "Then perhaps it was. He had grass seed caught in his mane and a very patient way of waiting for an answer, and if he was yours, you have his patience too, a little; you have let me ramble far longer than most." },
      },
      choices = {
        { text = "Let's talk about something else.", next = "talk" },
        { text = "Return me to life.", next = "BUSINESS" },
      },
    },
    c_warrior = {
      lines = {
        { id = "wr_default",
          text = "Twice, I think, though not with hands. Warriors sometimes come up the hill still gripping theirs, and the blade stays in the world while the grip comes with them. I have held a great many of those grips while they learned to open." },
      },
      choices = {
        { text = "Does it get easier to let go?", next = "c_warrior2", fx = { trait = { curious = 1 } } },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    c_warrior2 = {
      lines = {
        { id = "wr2_default",
          text = "For your kind it gets easier each time, and that is what worries me. The first time, a warrior weeps for the fight they lost. By the twentieth, they only ask how long the walk is, and I would rather they still wept a little." },
      },
      choices = {
        { text = "Then I'll make sure I never stop weeping.", next = "c_warrior3a", fx = { align = { light = 1 } } },
        { text = "Weeping won't win the next fight. I'll stay hard.", next = "c_warrior3b", fx = { align = { order = 1 } } },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    c_warrior3a = {
      lines = { { id = "c_warrior_3a", text = "Good. Keep the grief, and let it keep you careful. A warrior who still mourns the fight is a warrior who still remembers why it mattered." } },
      choices = {
        { text = "Let's talk about something else.", next = "talk" },
        { text = "Return me to life.", next = "BUSINESS" },
      },
    },
    c_warrior3b = {
      lines = { { id = "c_warrior_3b", text = "Hard, then, if you must. But stone cracks in the cold, and I have seen a great many hard warriors climb this hill in pieces." } },
      choices = {
        { text = "Let's talk about something else.", next = "talk" },
        { text = "Return me to life.", next = "BUSINESS" },
      },
    },
    c_rogue = {
      lines = {
        { id = "ro_default",
          text = "Your kind try, every one of them, sooner or later. They creep along the edge of the mist as if I could not see a soul that is only made of light, and I let them get quite far before I clear my throat." },
      },
      choices = {
        { text = "Has anyone ever made it?", next = "c_rogue2", fx = { trait = { witty = 1 } } },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    c_rogue2 = {
      lines = {
        { id = "ro2_default",
          text = "One, once, a long time ago, and I have never told the silence about it. She slipped into the gray and did not come back to me, and either she found a door I do not know about, or the gray found her. I hope it was the door." },
      },
      choices = {
        { text = "If there's a door, I'd want to find it.", next = "c_rogue3a", fx = { align = { order = -1 } } },
        { text = "Some doors should stay shut, even for me.", next = "c_rogue3b", fx = { align = { order = 1 } } },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    c_rogue3a = {
      lines = { { id = "c_rogue_3a", text = "I thought you might say that. Your kind never could leave a lock alone. Only remember that a door you find alone, you also walk through alone." } },
      choices = {
        { text = "Let's talk about something else.", next = "talk" },
        { text = "Return me to life.", next = "BUSINESS" },
      },
    },
    c_rogue3b = {
      lines = { { id = "c_rogue_3b", text = "That is wiser than I expected, and I mean it kindly. Most of your trade would sell the key before they knew what it opened." } },
      choices = {
        { text = "Let's talk about something else.", next = "talk" },
        { text = "Return me to life.", next = "BUSINESS" },
      },
    },
    c_mage = {
      lines = {
        { id = "mg_default",
          text = "Every mage asks that, and every one of them is disappointed by the answer. It is not arcane, or not any arcane your Kirin Tor would recognize; it is older and much less tidy, and it does not like to be studied." },
      },
      choices = {
        { text = "What happens if someone studies it anyway?", next = "c_mage2", fx = { trait = { curious = 1 } } },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    c_mage2 = {
      lines = {
        { id = "mg2_default",
          text = "A magister from Dalaran tried, once, and spent his whole visit counting the threads of the mist. When he went back down he had forgotten his own mother's name, though he remembered the number of threads perfectly. I took that as the hill's answer." },
      },
      choices = {
        { text = "Some knowledge isn't worth the price.", next = "c_mage3a", fx = { align = { light = 1 } } },
        { text = "He just needed better wards. I'd try again.", next = "c_mage3b", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    c_mage3a = {
      lines = { { id = "c_mage_3a", text = "Then you have learned the lesson he paid for, and you learned it free. Keep it close; Dalaran forgets that lesson every few centuries." } },
      choices = {
        { text = "Let's talk about something else.", next = "talk" },
        { text = "Return me to life.", next = "BUSINESS" },
      },
    },
    c_mage3b = {
      lines = { { id = "c_mage_3b", text = "You would, and that frightens me more than anything you could cast. The hill is patient with fools, but it is not patient forever." } },
      choices = {
        { text = "Let's talk about something else.", next = "talk" },
        { text = "Return me to life.", next = "BUSINESS" },
      },
    },
    c_warlock = {
      lines = {
        { id = "wl_default",
          text = "No, and I am grateful for it. When one of your servants falls, it goes home to the Nether, howling, and it never climbs this hill. But I can smell them on you, every time you arrive, and the others in the gray drift away from you while you stand here." },
      },
      choices = {
        { text = "Does that frighten them?", next = "c_warlock2" },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    c_warlock2 = {
      lines = {
        { id = "wl2_default",
          text = "It frightens them, and it saddens me, because you are still one of the living I am meant to send home. I will send you home as I send everyone else. I only ask that you remember, down there, how the gray drew away from you." },
      },
      choices = {
        { text = "I'll remember. Power isn't worth everything.", next = "c_warlock3a", fx = { align = { light = 2 } } },
        { text = "The fel is a tool. Their fear is their own.", next = "c_warlock3b", fx = { align = { light = -2 } } },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    c_warlock3a = {
      lines = { { id = "c_warlock_3a", text = "Then perhaps the gray will drift back toward you, one day. I will tell them you said it, though I cannot promise they will believe me." } },
      choices = {
        { text = "Let's talk about something else.", next = "talk" },
        { text = "Return me to life.", next = "BUSINESS" },
      },
    },
    c_warlock3b = {
      lines = { { id = "c_warlock_3b", text = "So every warlock says, right up until the tool begins to hold the hand. Go, then. I will still be here when it does." } },
      choices = {
        { text = "Let's talk about something else.", next = "talk" },
        { text = "Return me to life.", next = "BUSINESS" },
      },
    },
    c_hunter = {
      lines = {
        { id = "hn_default",
          text = "Not to me. The beasts have their own hill, I think, somewhere off in the mist, with a keeper who smells of rain and fur. Sometimes I hear a wolf calling from that direction, and I wonder whether it is waiting for someone." },
      },
      choices = {
        { text = "Would my companion wait for me there?", next = "c_hunter2", fx = { affinity = 1 } },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    c_hunter2 = {
      lines = {
        { id = "hn2_default",
          text = "If any creature would, yours would. I have seen hunters come up this hill with their eyes still on the place they left their beast, and the beasts are always there when they go back down. That kind of loyalty does not stop at a hillside." },
      },
      choices = {
        { text = "My companion is family. I'd wait for them too.", next = "c_hunter3a", fx = { align = { honor = 1 } } },
        { text = "A beast is a beast. It serves, then it's replaced.", next = "c_hunter3b", fx = { align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    c_hunter3a = {
      lines = { { id = "c_hunter_3a", text = "Then you are well matched, and the beasts' hill will know your name before you ever see it. That is no small thing." } },
      choices = {
        { text = "Let's talk about something else.", next = "talk" },
        { text = "Return me to life.", next = "BUSINESS" },
      },
    },
    c_hunter3b = {
      lines = { { id = "c_hunter_3b", text = "Say that to the wolf I hear calling in the mist. I think it would disagree, and I think it would be right." } },
      choices = {
        { text = "Let's talk about something else.", next = "talk" },
        { text = "Return me to life.", next = "BUSINESS" },
      },
    },
    c_druid = {
      lines = {
        { id = "dr_default",
          text = "If he does, he has never said so to me. Your Emerald Dream lies close to here, closer than any other place I know; on quiet nights I can hear it breathing, like a forest asleep on the other side of a wall." },
      },
      choices = {
        { text = "Could I walk into the Dream from here?", next = "c_druid2", fx = { trait = { curious = 1 } } },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    c_druid2 = {
      lines = {
        { id = "dr2_default",
          text = "Please do not try. A druid did, once, with the best of intentions, and I watched her walk into the green and come back out years later with leaves for eyes and no memory of her own name. The Dream keeps what it likes." },
      },
      choices = {
        { text = "The Dream is sacred. I'd never trespass there.", next = "c_druid3a", fx = { align = { order = 1 } } },
        { text = "Someone has to learn what it hides. I'd risk it.", next = "c_druid3b", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    c_druid3a = {
      lines = { { id = "c_druid_3a", text = "Then you are the kind of druid the forest trusts, and there are fewer of those than the Circle likes to admit." } },
      choices = {
        { text = "Let's talk about something else.", next = "talk" },
        { text = "Return me to life.", next = "BUSINESS" },
      },
    },
    c_druid3b = {
      lines = { { id = "c_druid_3b", text = "Someone will, I suppose, and the Dream will keep them too. I only hope you leave a name with someone before you go." } },
      choices = {
        { text = "Let's talk about something else.", next = "talk" },
        { text = "Return me to life.", next = "BUSINESS" },
      },
    },
    r_human = {
      lines = {
        { id = "hm_default",
          text = "They came up here by the thousand, in the plague year, and I sent back every one I could. But many of them never arrived at all, because the Scourge pulled them back down before they reached the top, and I could only watch the hill empty." },
      },
      choices = {
        { text = "Do you blame Arthas for that?", next = "r_human2" },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    r_human2 = {
      lines = {
        { id = "hm2_default",
          text = "I do not keep blame; there is no room for it on this hill. But I remember the old king's face when he came up, and I remember that he kept looking back down toward his son, and that is a thing no one should have to see." },
      },
      choices = {
        { text = "Lordaeron will rise again. We'll take it back.", next = "r_human3a", fx = { align = { order = 1 } } },
        { text = "Some kingdoms should stay buried.", next = "r_human3b", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    r_human3a = {
      lines = { { id = "r_human_3a", text = "Perhaps. The ones who climbed up here from Lordaeron said the same, every one of them, and I hope some of them were right." } },
      choices = {
        { text = "Let's talk about something else.", next = "talk" },
        { text = "Return me to life.", next = "BUSINESS" },
      },
    },
    r_human3b = {
      lines = { { id = "r_human_3b", text = "A hard thing to say about your own people's home, and I do not think you said it lightly. The hill has heard worse truths." } },
      choices = {
        { text = "Let's talk about something else.", next = "talk" },
        { text = "Return me to life.", next = "BUSINESS" },
      },
    },
    r_dwarf = {
      lines = {
        { id = "dw_default",
          text = "Your people believe so, and I have never seen a dwarf argue with me about where they were going. They only come up, set their jaw, and wait to be sent back, as though dying were an errand that took longer than it should." },
      },
      choices = {
        { text = "And the ones who don't go back?", next = "r_dwarf2", fx = { affinity = 1 } },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    r_dwarf2 = {
      lines = {
        { id = "dw2_default",
          text = "They walk down the far side of the hill, toward something that sounds like a forge at a great distance. I have never followed them, but every one of them was smiling before they reached the bottom, and that tells me enough." },
      },
      choices = {
        { text = "I'll go back. There's work left to do.", next = "r_dwarf3a", fx = { align = { honor = 1 } } },
        { text = "Maybe one day I'll walk toward the forge.", next = "r_dwarf3b", fx = { align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    r_dwarf3a = {
      lines = { { id = "r_dwarf_3a", text = "Spoken like every dwarf who ever stood here. The forge can wait for you; it has waited a long time already." } },
      choices = {
        { text = "Let's talk about something else.", next = "talk" },
        { text = "Return me to life.", next = "BUSINESS" },
      },
    },
    r_dwarf3b = {
      lines = { { id = "r_dwarf_3b", text = "One day, perhaps, and you will smile on the way down. But not today. Today I have a file with your name on it." } },
      choices = {
        { text = "Let's talk about something else.", next = "talk" },
        { text = "Return me to life.", next = "BUSINESS" },
      },
    },
    r_orc = {
      lines = {
        { id = "or_default",
          text = "Some did, and they were the hardest guests I have ever had. They came up still burning with that red rage, and it did not leave them even here, and I had to stand beside them until it guttered out on its own." },
      },
      choices = {
        { text = "Did it ever go out?", next = "r_orc2" },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    r_orc2 = {
      lines = {
        { id = "or2_default",
          text = "In most of them, yes, though it took a long time. When it finally cooled they wept, great old warriors with their heads in their hands, and asked me what they had done. I told them it was not only them who had done it, and some of them believed me." },
      },
      choices = {
        { text = "The rage was ours too. We must answer for it.", next = "r_orc3a", fx = { align = { honor = 2 } } },
        { text = "The demons did that. Orcs owe no one.", next = "r_orc3b", fx = { align = { honor = -2 } } },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    r_orc3a = {
      lines = { { id = "r_orc_3a", text = "Then you carry it better than they did. Answering for a thing is heavier than denying it, and far rarer on this hill." } },
      choices = {
        { text = "Let's talk about something else.", next = "talk" },
        { text = "Return me to life.", next = "BUSINESS" },
      },
    },
    r_orc3b = {
      lines = { { id = "r_orc_3b", text = "The old warriors said that too, at first. It was only when they stopped saying it that the fire went out in them." } },
      choices = {
        { text = "Let's talk about something else.", next = "talk" },
        { text = "Return me to life.", next = "BUSINESS" },
      },
    },
    r_troll = {
      lines = {
        { id = "tr_default",
          text = "Once, and I will not forget it. A great shadow came to the edge of the mist, wearing a mask of bones, and called a troll by name, and the troll went to it without even looking back at me. I have never been so thoroughly ignored." },
      },
      choices = {
        { text = "Was that Bwonsamdi?", next = "r_troll2", fx = { trait = { curious = 1 } } },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    r_troll2 = {
      lines = {
        { id = "tr2_default",
          text = "He did not introduce himself, and I did not ask. But he looked at me with great interest, as though we were in the same line of work, and I have spent a long time since wondering whether that is true." },
      },
      choices = {
        { text = "The loa keep their own. That's how it should be.", next = "r_troll3a", fx = { align = { order = 1 } } },
        { text = "No loa owns me. I'll choose my own road.", next = "r_troll3b", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    r_troll3a = {
      lines = { { id = "r_troll_3a", text = "Then perhaps one day he will come for you as well, and you will walk past me without a glance. I will try not to be offended." } },
      choices = {
        { text = "Let's talk about something else.", next = "talk" },
        { text = "Return me to life.", next = "BUSINESS" },
      },
    },
    r_troll3b = {
      lines = { { id = "r_troll_3b", text = "A troll who refuses the loa. He would find you interesting, I think, and I am not sure that is a comfort." } },
      choices = {
        { text = "Let's talk about something else.", next = "talk" },
        { text = "Return me to life.", next = "BUSINESS" },
      },
    },
    r_forsaken = {
      lines = {
        { id = "fk_default",
          text = "Because you came up the hill, the same as everyone else. I do not ask what you are made of, or who made you; the climb is the only question I am permitted, and you answered it." },
      },
      choices = {
        { text = "Some would say I don't deserve it.", next = "r_forsaken2" },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    r_forsaken2 = {
      lines = {
        { id = "fk2_default",
          text = "Some would, and some of them are standing in the gray behind me right now. But they do not decide who goes home, and neither do you. I do. Go back down, and see that you earn the next climb." },
      },
      choices = {
        { text = "I'll earn it. I'm not what the Scourge made me.", next = "r_forsaken3a", fx = { align = { light = 1 } } },
        { text = "I'll take what I'm given. I owe nothing for it.", next = "r_forsaken3b", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    r_forsaken3a = {
      lines = { { id = "r_forsaken_3a", text = "No, you are not. The Scourge never sent anyone back up this hill, and you came on your own feet. Remember that." } },
      choices = {
        { text = "Let's talk about something else.", next = "talk" },
        { text = "Return me to life.", next = "BUSINESS" },
      },
    },
    r_forsaken3b = {
      lines = { { id = "r_forsaken_3b", text = "Take it, then, and I will give it, because that is the rule. But the gray is watching you, and they remember longer than I do." } },
      choices = {
        { text = "Let's talk about something else.", next = "talk" },
        { text = "Return me to life.", next = "BUSINESS" },
      },
    },
    ---------------------------------------------------------------------------
    -- The healer's questions. The healer asks; you answer; your answer becomes an opinion the
    -- healer remembers (topics healer_*), and later visits bring it back once (qcb_ lines in hello).
    ---------------------------------------------------------------------------
    -- Each question line sets its own flag and clears the others, so only its three answers show
    -- (plus the refusal, which always does). rotating = true: more than four choices, at most four visible.
    quiz = {
      rotating = true,
      big = true,
      lines = {
        { id = "q_fate", fx = { npcFlag = { set = "q_fate", clear = { "q_again", "q_killed", "q_mourners", "q_forgive", "q_watching", "q_afraid", "q_count", "q_owed" } } },
          text = "Did you choose to climb this hill, or were you always going to? Think before you answer. I am writing it down." },
        { id = "q_again", fx = { npcFlag = { set = "q_again", clear = { "q_fate", "q_killed", "q_mourners", "q_forgive", "q_watching", "q_afraid", "q_count", "q_owed" } } },
          text = "If I could send you back to the moment before you died, knowing nothing, unchanged, would you take it?" },
        { id = "q_killed", fx = { npcFlag = { set = "q_killed", clear = { "q_fate", "q_again", "q_mourners", "q_forgive", "q_watching", "q_afraid", "q_count", "q_owed" } } },
          text = "The things you kill down there: do you suppose they climb a hill like this one?" },
        { id = "q_mourners", fx = { npcFlag = { set = "q_mourners", clear = { "q_fate", "q_again", "q_killed", "q_forgive", "q_watching", "q_afraid", "q_count", "q_owed" } } },
          text = "If you did not go back down, who would come looking for you?" },
        { id = "q_forgive", fx = { npcFlag = { set = "q_forgive", clear = { "q_fate", "q_again", "q_killed", "q_mourners", "q_watching", "q_afraid", "q_count", "q_owed" } } },
          text = "Is there someone you have not forgiven? If you could, today, would you want to?" },
        { id = "q_watching", fx = { npcFlag = { set = "q_watching", clear = { "q_fate", "q_again", "q_killed", "q_mourners", "q_forgive", "q_afraid", "q_count", "q_owed" } } },
          text = "Do you think someone is watching all this? I do not mean me, but someone above me." },
        { id = "q_afraid", fx = { npcFlag = { set = "q_afraid", clear = { "q_fate", "q_again", "q_killed", "q_mourners", "q_forgive", "q_watching", "q_count", "q_owed" } } },
          text = "Which frightens you more: the dark past the mist, or coming back forever and never stopping?" },
        { id = "q_count", fx = { npcFlag = { set = "q_count", clear = { "q_fate", "q_again", "q_killed", "q_mourners", "q_forgive", "q_watching", "q_afraid", "q_owed" } } },
          text = "If the whole world forgot your name tomorrow, would what you did still count?" },
        { id = "q_owed", fx = { npcFlag = { set = "q_owed", clear = { "q_fate", "q_again", "q_killed", "q_mourners", "q_forgive", "q_watching", "q_afraid", "q_count" } } },
          text = "Do the dead owe the living anything, or is it only the other way around?" },
      },
      choices = {
        { text = "I chose it, every step of the way.", next = "quiz_reply", when = { npcFlag = "q_fate" }, fx = { opinion = { healer_fate = "chose" }, npcFlag = { set = { "r_fate_chose", "ans_fate" }, clear = { "r_fate_fated", "r_fate_pushed", "r_again_yes", "r_again_no", "r_again_only", "r_killed_yes", "r_killed_no", "r_killed_dont", "r_mourners_none", "r_mourners_someone", "r_mourners_rather", "r_forgive_yes", "r_forgive_no", "r_forgive_unsure", "r_watching_light", "r_watching_spirits", "r_watching_noone", "r_afraid_dark", "r_afraid_forever", "r_afraid_neither", "r_count_yes", "r_count_no", "r_count_never", "r_owed_rest", "r_owed_warning", "r_owed_nothing", "r_skip" } } } },
        { text = "I was always going to.", next = "quiz_reply", when = { npcFlag = "q_fate" }, fx = { opinion = { healer_fate = "fated" }, npcFlag = { set = { "r_fate_fated", "ans_fate" }, clear = { "r_fate_chose", "r_fate_pushed", "r_again_yes", "r_again_no", "r_again_only", "r_killed_yes", "r_killed_no", "r_killed_dont", "r_mourners_none", "r_mourners_someone", "r_mourners_rather", "r_forgive_yes", "r_forgive_no", "r_forgive_unsure", "r_watching_light", "r_watching_spirits", "r_watching_noone", "r_afraid_dark", "r_afraid_forever", "r_afraid_neither", "r_count_yes", "r_count_no", "r_count_never", "r_owed_rest", "r_owed_warning", "r_owed_nothing", "r_skip" } } } },
        { text = "Neither, really. I was pushed.", next = "quiz_reply", when = { npcFlag = "q_fate" }, fx = { opinion = { healer_fate = "pushed" }, npcFlag = { set = { "r_fate_pushed", "ans_fate" }, clear = { "r_fate_chose", "r_fate_fated", "r_again_yes", "r_again_no", "r_again_only", "r_killed_yes", "r_killed_no", "r_killed_dont", "r_mourners_none", "r_mourners_someone", "r_mourners_rather", "r_forgive_yes", "r_forgive_no", "r_forgive_unsure", "r_watching_light", "r_watching_spirits", "r_watching_noone", "r_afraid_dark", "r_afraid_forever", "r_afraid_neither", "r_count_yes", "r_count_no", "r_count_never", "r_owed_rest", "r_owed_warning", "r_owed_nothing", "r_skip" } } } },
        { text = "Yes, I'd take it.", next = "quiz_reply", when = { npcFlag = "q_again" }, fx = { opinion = { healer_again = "yes" }, npcFlag = { set = { "r_again_yes", "ans_again" }, clear = { "r_fate_chose", "r_fate_fated", "r_fate_pushed", "r_again_no", "r_again_only", "r_killed_yes", "r_killed_no", "r_killed_dont", "r_mourners_none", "r_mourners_someone", "r_mourners_rather", "r_forgive_yes", "r_forgive_no", "r_forgive_unsure", "r_watching_light", "r_watching_spirits", "r_watching_noone", "r_afraid_dark", "r_afraid_forever", "r_afraid_neither", "r_count_yes", "r_count_no", "r_count_never", "r_owed_rest", "r_owed_warning", "r_owed_nothing", "r_skip" } } } },
        { text = "No. I'd keep what I learned.", next = "quiz_reply", when = { npcFlag = "q_again" }, fx = { opinion = { healer_again = "no" }, npcFlag = { set = { "r_again_no", "ans_again" }, clear = { "r_fate_chose", "r_fate_fated", "r_fate_pushed", "r_again_yes", "r_again_only", "r_killed_yes", "r_killed_no", "r_killed_dont", "r_mourners_none", "r_mourners_someone", "r_mourners_rather", "r_forgive_yes", "r_forgive_no", "r_forgive_unsure", "r_watching_light", "r_watching_spirits", "r_watching_noone", "r_afraid_dark", "r_afraid_forever", "r_afraid_neither", "r_count_yes", "r_count_no", "r_count_never", "r_owed_rest", "r_owed_warning", "r_owed_nothing", "r_skip" } } } },
        { text = "Only if I could remember.", next = "quiz_reply", when = { npcFlag = "q_again" }, fx = { opinion = { healer_again = "only" }, npcFlag = { set = { "r_again_only", "ans_again" }, clear = { "r_fate_chose", "r_fate_fated", "r_fate_pushed", "r_again_yes", "r_again_no", "r_killed_yes", "r_killed_no", "r_killed_dont", "r_mourners_none", "r_mourners_someone", "r_mourners_rather", "r_forgive_yes", "r_forgive_no", "r_forgive_unsure", "r_watching_light", "r_watching_spirits", "r_watching_noone", "r_afraid_dark", "r_afraid_forever", "r_afraid_neither", "r_count_yes", "r_count_no", "r_count_never", "r_owed_rest", "r_owed_warning", "r_owed_nothing", "r_skip" } } } },
        { text = "Yes, everything does.", next = "quiz_reply", when = { npcFlag = "q_killed" }, fx = { opinion = { healer_killed = "yes" }, npcFlag = { set = { "r_killed_yes", "ans_killed" }, clear = { "r_fate_chose", "r_fate_fated", "r_fate_pushed", "r_again_yes", "r_again_no", "r_again_only", "r_killed_no", "r_killed_dont", "r_mourners_none", "r_mourners_someone", "r_mourners_rather", "r_forgive_yes", "r_forgive_no", "r_forgive_unsure", "r_watching_light", "r_watching_spirits", "r_watching_noone", "r_afraid_dark", "r_afraid_forever", "r_afraid_neither", "r_count_yes", "r_count_no", "r_count_never", "r_owed_rest", "r_owed_warning", "r_owed_nothing", "r_skip" } } } },
        { text = "No. They're only beasts.", next = "quiz_reply", when = { npcFlag = "q_killed" }, fx = { opinion = { healer_killed = "no" }, npcFlag = { set = { "r_killed_no", "ans_killed" }, clear = { "r_fate_chose", "r_fate_fated", "r_fate_pushed", "r_again_yes", "r_again_no", "r_again_only", "r_killed_yes", "r_killed_dont", "r_mourners_none", "r_mourners_someone", "r_mourners_rather", "r_forgive_yes", "r_forgive_no", "r_forgive_unsure", "r_watching_light", "r_watching_spirits", "r_watching_noone", "r_afraid_dark", "r_afraid_forever", "r_afraid_neither", "r_count_yes", "r_count_no", "r_count_never", "r_owed_rest", "r_owed_warning", "r_owed_nothing", "r_skip" } } } },
        { text = "I try not to think about it.", next = "quiz_reply", when = { npcFlag = "q_killed" }, fx = { opinion = { healer_killed = "dont" }, npcFlag = { set = { "r_killed_dont", "ans_killed" }, clear = { "r_fate_chose", "r_fate_fated", "r_fate_pushed", "r_again_yes", "r_again_no", "r_again_only", "r_killed_yes", "r_killed_no", "r_mourners_none", "r_mourners_someone", "r_mourners_rather", "r_forgive_yes", "r_forgive_no", "r_forgive_unsure", "r_watching_light", "r_watching_spirits", "r_watching_noone", "r_afraid_dark", "r_afraid_forever", "r_afraid_neither", "r_count_yes", "r_count_no", "r_count_never", "r_owed_rest", "r_owed_warning", "r_owed_nothing", "r_skip" } } } },
        { text = "No one.", next = "quiz_reply", when = { npcFlag = "q_mourners" }, fx = { opinion = { healer_mourners = "none" }, npcFlag = { set = { "r_mourners_none", "ans_mourners" }, clear = { "r_fate_chose", "r_fate_fated", "r_fate_pushed", "r_again_yes", "r_again_no", "r_again_only", "r_killed_yes", "r_killed_no", "r_killed_dont", "r_mourners_someone", "r_mourners_rather", "r_forgive_yes", "r_forgive_no", "r_forgive_unsure", "r_watching_light", "r_watching_spirits", "r_watching_noone", "r_afraid_dark", "r_afraid_forever", "r_afraid_neither", "r_count_yes", "r_count_no", "r_count_never", "r_owed_rest", "r_owed_warning", "r_owed_nothing", "r_skip" } } } },
        { text = "Someone will, I hope.", next = "quiz_reply", when = { npcFlag = "q_mourners" }, fx = { opinion = { healer_mourners = "someone" }, npcFlag = { set = { "r_mourners_someone", "ans_mourners" }, clear = { "r_fate_chose", "r_fate_fated", "r_fate_pushed", "r_again_yes", "r_again_no", "r_again_only", "r_killed_yes", "r_killed_no", "r_killed_dont", "r_mourners_none", "r_mourners_rather", "r_forgive_yes", "r_forgive_no", "r_forgive_unsure", "r_watching_light", "r_watching_spirits", "r_watching_noone", "r_afraid_dark", "r_afraid_forever", "r_afraid_neither", "r_count_yes", "r_count_no", "r_count_never", "r_owed_rest", "r_owed_warning", "r_owed_nothing", "r_skip" } } } },
        { text = "I'd rather they didn't.", next = "quiz_reply", when = { npcFlag = "q_mourners" }, fx = { opinion = { healer_mourners = "rather" }, npcFlag = { set = { "r_mourners_rather", "ans_mourners" }, clear = { "r_fate_chose", "r_fate_fated", "r_fate_pushed", "r_again_yes", "r_again_no", "r_again_only", "r_killed_yes", "r_killed_no", "r_killed_dont", "r_mourners_none", "r_mourners_someone", "r_forgive_yes", "r_forgive_no", "r_forgive_unsure", "r_watching_light", "r_watching_spirits", "r_watching_noone", "r_afraid_dark", "r_afraid_forever", "r_afraid_neither", "r_count_yes", "r_count_no", "r_count_never", "r_owed_rest", "r_owed_warning", "r_owed_nothing", "r_skip" } } } },
        { text = "Yes, I'd want to.", next = "quiz_reply", when = { npcFlag = "q_forgive" }, fx = { opinion = { healer_forgive = "yes" }, npcFlag = { set = { "r_forgive_yes", "ans_forgive" }, clear = { "r_fate_chose", "r_fate_fated", "r_fate_pushed", "r_again_yes", "r_again_no", "r_again_only", "r_killed_yes", "r_killed_no", "r_killed_dont", "r_mourners_none", "r_mourners_someone", "r_mourners_rather", "r_forgive_no", "r_forgive_unsure", "r_watching_light", "r_watching_spirits", "r_watching_noone", "r_afraid_dark", "r_afraid_forever", "r_afraid_neither", "r_count_yes", "r_count_no", "r_count_never", "r_owed_rest", "r_owed_warning", "r_owed_nothing", "r_skip" } } } },
        { text = "No. Some things stay unforgiven.", next = "quiz_reply", when = { npcFlag = "q_forgive" }, fx = { opinion = { healer_forgive = "no" }, npcFlag = { set = { "r_forgive_no", "ans_forgive" }, clear = { "r_fate_chose", "r_fate_fated", "r_fate_pushed", "r_again_yes", "r_again_no", "r_again_only", "r_killed_yes", "r_killed_no", "r_killed_dont", "r_mourners_none", "r_mourners_someone", "r_mourners_rather", "r_forgive_yes", "r_forgive_unsure", "r_watching_light", "r_watching_spirits", "r_watching_noone", "r_afraid_dark", "r_afraid_forever", "r_afraid_neither", "r_count_yes", "r_count_no", "r_count_never", "r_owed_rest", "r_owed_warning", "r_owed_nothing", "r_skip" } } } },
        { text = "I don't know.", next = "quiz_reply", when = { npcFlag = "q_forgive" }, fx = { opinion = { healer_forgive = "unsure" }, npcFlag = { set = { "r_forgive_unsure", "ans_forgive" }, clear = { "r_fate_chose", "r_fate_fated", "r_fate_pushed", "r_again_yes", "r_again_no", "r_again_only", "r_killed_yes", "r_killed_no", "r_killed_dont", "r_mourners_none", "r_mourners_someone", "r_mourners_rather", "r_forgive_yes", "r_forgive_no", "r_watching_light", "r_watching_spirits", "r_watching_noone", "r_afraid_dark", "r_afraid_forever", "r_afraid_neither", "r_count_yes", "r_count_no", "r_count_never", "r_owed_rest", "r_owed_warning", "r_owed_nothing", "r_skip" } } } },
        { text = "The Light is watching.", next = "quiz_reply", when = { npcFlag = "q_watching" }, fx = { opinion = { healer_watching = "light" }, npcFlag = { set = { "r_watching_light", "ans_watching" }, clear = { "r_fate_chose", "r_fate_fated", "r_fate_pushed", "r_again_yes", "r_again_no", "r_again_only", "r_killed_yes", "r_killed_no", "r_killed_dont", "r_mourners_none", "r_mourners_someone", "r_mourners_rather", "r_forgive_yes", "r_forgive_no", "r_forgive_unsure", "r_watching_spirits", "r_watching_noone", "r_afraid_dark", "r_afraid_forever", "r_afraid_neither", "r_count_yes", "r_count_no", "r_count_never", "r_owed_rest", "r_owed_warning", "r_owed_nothing", "r_skip" } } } },
        { text = "The spirits and the ancestors.", next = "quiz_reply", when = { npcFlag = "q_watching" }, fx = { opinion = { healer_watching = "spirits" }, npcFlag = { set = { "r_watching_spirits", "ans_watching" }, clear = { "r_fate_chose", "r_fate_fated", "r_fate_pushed", "r_again_yes", "r_again_no", "r_again_only", "r_killed_yes", "r_killed_no", "r_killed_dont", "r_mourners_none", "r_mourners_someone", "r_mourners_rather", "r_forgive_yes", "r_forgive_no", "r_forgive_unsure", "r_watching_light", "r_watching_noone", "r_afraid_dark", "r_afraid_forever", "r_afraid_neither", "r_count_yes", "r_count_no", "r_count_never", "r_owed_rest", "r_owed_warning", "r_owed_nothing", "r_skip" } } } },
        { text = "No one is watching.", next = "quiz_reply", when = { npcFlag = "q_watching" }, fx = { opinion = { healer_watching = "noone" }, npcFlag = { set = { "r_watching_noone", "ans_watching" }, clear = { "r_fate_chose", "r_fate_fated", "r_fate_pushed", "r_again_yes", "r_again_no", "r_again_only", "r_killed_yes", "r_killed_no", "r_killed_dont", "r_mourners_none", "r_mourners_someone", "r_mourners_rather", "r_forgive_yes", "r_forgive_no", "r_forgive_unsure", "r_watching_light", "r_watching_spirits", "r_afraid_dark", "r_afraid_forever", "r_afraid_neither", "r_count_yes", "r_count_no", "r_count_never", "r_owed_rest", "r_owed_warning", "r_owed_nothing", "r_skip" } } } },
        { text = "The dark.", next = "quiz_reply", when = { npcFlag = "q_afraid" }, fx = { opinion = { healer_afraid = "dark" }, npcFlag = { set = { "r_afraid_dark", "ans_afraid" }, clear = { "r_fate_chose", "r_fate_fated", "r_fate_pushed", "r_again_yes", "r_again_no", "r_again_only", "r_killed_yes", "r_killed_no", "r_killed_dont", "r_mourners_none", "r_mourners_someone", "r_mourners_rather", "r_forgive_yes", "r_forgive_no", "r_forgive_unsure", "r_watching_light", "r_watching_spirits", "r_watching_noone", "r_afraid_forever", "r_afraid_neither", "r_count_yes", "r_count_no", "r_count_never", "r_owed_rest", "r_owed_warning", "r_owed_nothing", "r_skip" } } } },
        { text = "Coming back forever.", next = "quiz_reply", when = { npcFlag = "q_afraid" }, fx = { opinion = { healer_afraid = "forever" }, npcFlag = { set = { "r_afraid_forever", "ans_afraid" }, clear = { "r_fate_chose", "r_fate_fated", "r_fate_pushed", "r_again_yes", "r_again_no", "r_again_only", "r_killed_yes", "r_killed_no", "r_killed_dont", "r_mourners_none", "r_mourners_someone", "r_mourners_rather", "r_forgive_yes", "r_forgive_no", "r_forgive_unsure", "r_watching_light", "r_watching_spirits", "r_watching_noone", "r_afraid_dark", "r_afraid_neither", "r_count_yes", "r_count_no", "r_count_never", "r_owed_rest", "r_owed_warning", "r_owed_nothing", "r_skip" } } } },
        { text = "Neither.", next = "quiz_reply", when = { npcFlag = "q_afraid" }, fx = { opinion = { healer_afraid = "neither" }, npcFlag = { set = { "r_afraid_neither", "ans_afraid" }, clear = { "r_fate_chose", "r_fate_fated", "r_fate_pushed", "r_again_yes", "r_again_no", "r_again_only", "r_killed_yes", "r_killed_no", "r_killed_dont", "r_mourners_none", "r_mourners_someone", "r_mourners_rather", "r_forgive_yes", "r_forgive_no", "r_forgive_unsure", "r_watching_light", "r_watching_spirits", "r_watching_noone", "r_afraid_dark", "r_afraid_forever", "r_count_yes", "r_count_no", "r_count_never", "r_owed_rest", "r_owed_warning", "r_owed_nothing", "r_skip" } } } },
        { text = "Yes. It would still count.", next = "quiz_reply", when = { npcFlag = "q_count" }, fx = { opinion = { healer_count = "yes" }, npcFlag = { set = { "r_count_yes", "ans_count" }, clear = { "r_fate_chose", "r_fate_fated", "r_fate_pushed", "r_again_yes", "r_again_no", "r_again_only", "r_killed_yes", "r_killed_no", "r_killed_dont", "r_mourners_none", "r_mourners_someone", "r_mourners_rather", "r_forgive_yes", "r_forgive_no", "r_forgive_unsure", "r_watching_light", "r_watching_spirits", "r_watching_noone", "r_afraid_dark", "r_afraid_forever", "r_afraid_neither", "r_count_no", "r_count_never", "r_owed_rest", "r_owed_warning", "r_owed_nothing", "r_skip" } } } },
        { text = "No. Not if no one remembered.", next = "quiz_reply", when = { npcFlag = "q_count" }, fx = { opinion = { healer_count = "no" }, npcFlag = { set = { "r_count_no", "ans_count" }, clear = { "r_fate_chose", "r_fate_fated", "r_fate_pushed", "r_again_yes", "r_again_no", "r_again_only", "r_killed_yes", "r_killed_no", "r_killed_dont", "r_mourners_none", "r_mourners_someone", "r_mourners_rather", "r_forgive_yes", "r_forgive_no", "r_forgive_unsure", "r_watching_light", "r_watching_spirits", "r_watching_noone", "r_afraid_dark", "r_afraid_forever", "r_afraid_neither", "r_count_yes", "r_count_never", "r_owed_rest", "r_owed_warning", "r_owed_nothing", "r_skip" } } } },
        { text = "It never counted.", next = "quiz_reply", when = { npcFlag = "q_count" }, fx = { opinion = { healer_count = "never" }, npcFlag = { set = { "r_count_never", "ans_count" }, clear = { "r_fate_chose", "r_fate_fated", "r_fate_pushed", "r_again_yes", "r_again_no", "r_again_only", "r_killed_yes", "r_killed_no", "r_killed_dont", "r_mourners_none", "r_mourners_someone", "r_mourners_rather", "r_forgive_yes", "r_forgive_no", "r_forgive_unsure", "r_watching_light", "r_watching_spirits", "r_watching_noone", "r_afraid_dark", "r_afraid_forever", "r_afraid_neither", "r_count_yes", "r_count_no", "r_owed_rest", "r_owed_warning", "r_owed_nothing", "r_skip" } } } },
        { text = "The dead owe us rest. They should stay gone.", next = "quiz_reply", when = { npcFlag = "q_owed" }, fx = { opinion = { healer_owed = "rest" }, npcFlag = { set = { "r_owed_rest", "ans_owed" }, clear = { "r_fate_chose", "r_fate_fated", "r_fate_pushed", "r_again_yes", "r_again_no", "r_again_only", "r_killed_yes", "r_killed_no", "r_killed_dont", "r_mourners_none", "r_mourners_someone", "r_mourners_rather", "r_forgive_yes", "r_forgive_no", "r_forgive_unsure", "r_watching_light", "r_watching_spirits", "r_watching_noone", "r_afraid_dark", "r_afraid_forever", "r_afraid_neither", "r_count_yes", "r_count_no", "r_count_never", "r_owed_warning", "r_owed_nothing", "r_skip" } } } },
        { text = "They owe us warning.", next = "quiz_reply", when = { npcFlag = "q_owed" }, fx = { opinion = { healer_owed = "warning" }, npcFlag = { set = { "r_owed_warning", "ans_owed" }, clear = { "r_fate_chose", "r_fate_fated", "r_fate_pushed", "r_again_yes", "r_again_no", "r_again_only", "r_killed_yes", "r_killed_no", "r_killed_dont", "r_mourners_none", "r_mourners_someone", "r_mourners_rather", "r_forgive_yes", "r_forgive_no", "r_forgive_unsure", "r_watching_light", "r_watching_spirits", "r_watching_noone", "r_afraid_dark", "r_afraid_forever", "r_afraid_neither", "r_count_yes", "r_count_no", "r_count_never", "r_owed_rest", "r_owed_nothing", "r_skip" } } } },
        { text = "Nothing. Their debts end with them.", next = "quiz_reply", when = { npcFlag = "q_owed" }, fx = { opinion = { healer_owed = "nothing" }, npcFlag = { set = { "r_owed_nothing", "ans_owed" }, clear = { "r_fate_chose", "r_fate_fated", "r_fate_pushed", "r_again_yes", "r_again_no", "r_again_only", "r_killed_yes", "r_killed_no", "r_killed_dont", "r_mourners_none", "r_mourners_someone", "r_mourners_rather", "r_forgive_yes", "r_forgive_no", "r_forgive_unsure", "r_watching_light", "r_watching_spirits", "r_watching_noone", "r_afraid_dark", "r_afraid_forever", "r_afraid_neither", "r_count_yes", "r_count_no", "r_count_never", "r_owed_rest", "r_owed_warning", "r_skip" } } } },
        { text = "I'd rather not answer that.", next = "quiz_reply", fx = { npcFlag = { set = "r_skip", clear = { "r_fate_chose", "r_fate_fated", "r_fate_pushed", "r_again_yes", "r_again_no", "r_again_only", "r_killed_yes", "r_killed_no", "r_killed_dont", "r_mourners_none", "r_mourners_someone", "r_mourners_rather", "r_forgive_yes", "r_forgive_no", "r_forgive_unsure", "r_watching_light", "r_watching_spirits", "r_watching_noone", "r_afraid_dark", "r_afraid_forever", "r_afraid_neither", "r_count_yes", "r_count_no", "r_count_never", "r_owed_rest", "r_owed_warning", "r_owed_nothing" } } } },
      },
    },
    quiz_reply = {
      lines = {
        { id = "qr_fate_chose", priority = 10, when = { npcFlag = "r_fate_chose" },
          text = "Then every death in your file is yours. That is a heavy thing to own, and a dignified one. Most people would rather blame the road." },
        { id = "qr_fate_fated", priority = 10, when = { npcFlag = "r_fate_fated" },
          text = "Then nothing I say to you matters, and you are only here because you were always going to be. I find that restful, and a little cowardly. Forgive me." },
        { id = "qr_fate_pushed", priority = 10, when = { npcFlag = "r_fate_pushed" },
          text = "Pushed by what? No, do not answer that, because whatever it was is still down there. Choose what you do about it, since that much is left to you." },
        { id = "qr_again_yes", priority = 10, when = { npcFlag = "r_again_yes" },
          text = "And you would walk into the same death, not knowing. Some would call that hope. I call it a very short circle." },
        { id = "qr_again_no", priority = 10, when = { npcFlag = "r_again_no" },
          text = "Good. A death you learn from is not wasted, but a death you forget is only practice." },
        { id = "qr_again_only", priority = 10, when = { npcFlag = "r_again_only" },
          text = "Then you are not asking to go back; you are asking to cheat, and I respect that more than I am supposed to." },
        { id = "qr_killed_yes", priority = 10, when = { npcFlag = "r_killed_yes" },
          text = "Then be careful what you are kind to and what you are cruel to. Everything you send up here, I meet, and I remember who sent it." },
        { id = "qr_killed_no", priority = 10, when = { npcFlag = "r_killed_no" },
          text = "Then you have never stood at the top of the hill when a wolf arrives. It looks for its pack, always, before anything else." },
        { id = "qr_killed_dont", priority = 10, when = { npcFlag = "r_killed_dont" },
          text = "That is honest; most people try not to think about it. It works, mostly, down there, but it does not work up here." },
        { id = "qr_mourners_none", priority = 10, when = { npcFlag = "r_mourners_none" },
          text = "I do not believe you. Someone would notice the gap where you were, because people always do, eventually; it is often the wrong people, but they notice." },
        { id = "qr_mourners_someone", priority = 10, when = { npcFlag = "r_mourners_someone" },
          text = "Hold onto that name, and do not tell me it, because this place is greedy with names. Just hold it, all the way down." },
        { id = "qr_mourners_rather", priority = 10, when = { npcFlag = "r_mourners_rather" },
          text = "Then you love them, because that is what that means. You do not want them on this hill, and neither do I." },
        { id = "qr_forgive_yes", priority = 10, when = { npcFlag = "r_forgive_yes" },
          text = "Then you are halfway there, because wanting to is the hard half. The rest is only walking." },
        { id = "qr_forgive_no", priority = 10, when = { npcFlag = "r_forgive_no" },
          text = "Perhaps, but know that what you do not forgive comes up the hill with you every time. I have watched it, and it is heavy, and you carry it alone." },
        { id = "qr_forgive_unsure", priority = 10, when = { npcFlag = "r_forgive_unsure" },
          text = "That is the truest answer anyone has given me this week. Keep not knowing for a while, because it is better than a quick answer." },
        { id = "qr_watching_light", priority = 10, when = { npcFlag = "r_watching_light" },
          text = "Then it is very patient, or very busy. I see it pass through, and it has never once stopped to answer me, though I keep asking." },
        { id = "qr_watching_spirits", priority = 10, when = { npcFlag = "r_watching_spirits" },
          text = "Yours walk past this hill often, and they do watch, but they do not interfere. I used to think that was cruel, and now I think it is respect." },
        { id = "qr_watching_noone", priority = 10, when = { npcFlag = "r_watching_noone" },
          text = "Then everything you do down there, you do for its own sake. That is either terrible or the most freeing thing I have ever heard." },
        { id = "qr_afraid_dark", priority = 10, when = { npcFlag = "r_afraid_dark" },
          text = "Most say that, and it is a good fear, because it keeps you climbing back down. Just do not let it be the only reason." },
        { id = "qr_afraid_forever", priority = 10, when = { npcFlag = "r_afraid_forever" },
          text = "So you have thought about it properly, which few do. There is a tiredness that has nothing to do with the body, and I know it well." },
        { id = "qr_afraid_neither", priority = 10, when = { npcFlag = "r_afraid_neither" },
          text = "Then either you are very brave, or you have not been here enough. I will ask you again after a hundred." },
        { id = "qr_count_yes", priority = 10, when = { npcFlag = "r_count_yes" },
          text = "Then you understand this place better than most priests. A thing done stays done, and forgetting does not undo it; a death is the only thing that can be undone, and even that has to be asked for." },
        { id = "qr_count_no", priority = 10, when = { npcFlag = "r_count_no" },
          text = "Then I will remember for you, and it will count. You are welcome, and do not argue." },
        { id = "qr_count_never", priority = 10, when = { npcFlag = "r_count_never" },
          text = "You do not believe that, because people who believe it do not come back down the hill. And yet here you are, about to." },
        { id = "qr_owed_rest", priority = 10, when = { npcFlag = "r_owed_rest" },
          text = "And yet you do not stay gone yourself. I do not say that to wound you, only so that you will be gentle with the others who came back." },
        { id = "qr_owed_warning", priority = 10, when = { npcFlag = "r_owed_warning" },
          text = "They try. You walk past their warnings every day, the bones by the road and the empty houses, but you are not a good listener, and none of the living are." },
        { id = "qr_owed_nothing", priority = 10, when = { npcFlag = "r_owed_nothing" },
          text = "That is clean, and I like clean things. But I keep a file, and nothing in it is clean." },
        { id = "qx_fate", priority = 20, when = { npcFlag = "q_fate", contradiction = "healer_fate" },
          text = "Last time you told me differently, and now you say this. I will write both down, because people are allowed to change; that is half of what being alive is for." },
        { id = "qx_again", priority = 20, when = { npcFlag = "q_again", contradiction = "healer_again" },
          text = "That is not what you said before, so you have been thinking. Good; the file has room for a second answer." },
        { id = "qx_killed", priority = 20, when = { npcFlag = "q_killed", contradiction = "healer_killed" },
          text = "You have changed your mind about the things you kill, so something happened down there. I will not ask what." },
        { id = "qx_mourners", priority = 20, when = { npcFlag = "q_mourners", contradiction = "healer_mourners" },
          text = "You answered differently last time. Has someone come into your life, or gone out of it? Do not tell me; just notice." },
        { id = "qx_forgive", priority = 20, when = { npcFlag = "q_forgive", contradiction = "healer_forgive" },
          text = "You have moved since last time, toward forgiving or away from it, I cannot tell which. Either way you moved, and most never do." },
        { id = "qx_watching", priority = 20, when = { npcFlag = "q_watching", contradiction = "healer_watching" },
          text = "Last time you believed something else about who watches. Faith changes like the weather, I think, but it is still faith." },
        { id = "qx_afraid", priority = 20, when = { npcFlag = "q_afraid", contradiction = "healer_afraid" },
          text = "Your fear has changed shape since we last spoke, which is what fear does, so keep an eye on it." },
        { id = "qx_count", priority = 20, when = { npcFlag = "q_count", contradiction = "healer_count" },
          text = "You said otherwise before, and I prefer this answer, though I will not tell you which one I mean." },
        { id = "qx_owed", priority = 20, when = { npcFlag = "q_owed", contradiction = "healer_owed" },
          text = "You have changed your mind about the dead, and so have I, many times. They do not seem to mind." },
        { id = "qr_default",
          text = "No answer is also an answer, and I will write that down too, in pencil." },
      },
      choices = {
        { text = "Your turn. What would you say?", next = "quiz_own", when = { ["not"] = { npcFlag = "r_skip" } } },
        { text = "Ask me another.", next = "quiz" },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    quiz_own = {
      lines = {
        { id = "qo_fate", priority = 10, when = { npcFlag = "q_fate" },
          text = "Me? I think I was always going to stand here, and I think I chose it anyway, every morning. Both can be true, and they usually are." },
        { id = "qo_again", priority = 10, when = { npcFlag = "q_again" },
          text = "I would not. Whatever I learned getting here, I paid for, and I would rather keep the receipt." },
        { id = "qo_killed", priority = 10, when = { npcFlag = "q_killed" },
          text = "Some do, and some come back down it, the same as you. Did you think you were the only one I return?" },
        { id = "qo_mourners", priority = 10, when = { npcFlag = "q_mourners" },
          text = "No one would come looking for me. That is not sad, only a fact, like the mist, and I keep it next to the other facts." },
        { id = "qo_forgive", priority = 10, when = { npcFlag = "q_forgive" },
          text = "There is someone I have not forgiven: whoever left me here without telling me why. I am working on it, and I have time." },
        { id = "qo_watching", priority = 10, when = { npcFlag = "q_watching" },
          text = "I hope so, though I have never seen them. But sometimes, when I send someone back, I feel the hill lean very slightly, as if something leaned to look." },
        { id = "qo_afraid", priority = 10, when = { npcFlag = "q_afraid" },
          text = "Forever frightens me more. The dark past the mist might be anything, but forever is only more of the same." },
        { id = "qo_count", priority = 10, when = { npcFlag = "q_count" },
          text = "It would count, because I would remember it. That is the entire reason I keep the file: someone has to be the one who remembers." },
        { id = "qo_owed", priority = 10, when = { npcFlag = "q_owed" },
          text = "The dead owe the living their absence. It is the hardest gift to give, and the most necessary. Ask the Forsaken; they forgot to give it." },
        { id = "qo_default",
          text = "My answer? I am still working on it, and I have been working on it for a very long time." },
      },
      choices = {
        { text = "Ask me another.", next = "quiz" },
        { text = "Let's talk about something else.", next = "talk" },
        { text = "Return me to life.", next = "parting" },
      },
    },
    ---------------------------------------------------------------------------
    -- Tales of the dead: four kinds, three stories each. An opening line sets its story's flag
    -- (clearing the others), so the follow-up question and answer match the story told.
    ---------------------------------------------------------------------------
    tales = {
      rotating = true,
      lines = {
        { id = "ta_default",
          text = "I have met nearly everyone who ever died in this world, all but the ones who were kept from me. Which kind of story do you want?" },
        { id = "ta_default2",
          text = "Stories, yes. The dead are mostly stories by the time they reach me, so choose one." },
        { id = "ta_many", when = { deaths = { min = 25 } },
          text = "You are becoming one of my stories, you know, though not yet. Ask, and I will tell you someone else's." },
      },
      choices = {
        { text = "Someone who came back wrong.", next = "tale_wrong" },
        { text = "Someone who didn't want to go back.", next = "tale_refused" },
        { text = "Someone you couldn't save.", next = "tale_lost" },
        { text = "Someone who made you laugh.", next = "tale_laugh" },
      },
    },
    tale_wrong = {
      rotating = true,
      lines = {
        { id = "tl_soldier", key = true, fx = { npcFlag = { set = "t_soldier", clear = { "t_mage", "t_hunter", "t_farmer", "t_veteran", "t_sentinel", "t_finished", "t_plagued", "t_unnamed", "t_gnome", "t_dwarf", "t_troll" } } },
          text = "A soldier from Andorhal. I began to send him back, and something else pulled harder; I felt his hand slip out of mine. I hear he still walks the Plaguelands, in uniform." },
        { id = "tl_mage", key = true, fx = { npcFlag = { set = "t_mage", clear = { "t_soldier", "t_hunter", "t_farmer", "t_veteran", "t_sentinel", "t_finished", "t_plagued", "t_unnamed", "t_gnome", "t_dwarf", "t_troll" } } },
          text = "A young mage tried to come back without me, using a spell they had only half learned. Part of them went down the hill, and part of them stayed here." },
        { id = "tl_hunter", key = true, fx = { npcFlag = { set = "t_hunter", clear = { "t_soldier", "t_mage", "t_farmer", "t_veteran", "t_sentinel", "t_finished", "t_plagued", "t_unnamed", "t_gnome", "t_dwarf", "t_troll" } } },
          text = "A hunter, long before you, with hundreds of returns. One day they arrived and did not know their own name, so I gave it back to them, and they went down." },
      },
      choices = {
        { text = "Could you have held on?", next = "tale_more", when = { npcFlag = "t_soldier" } },
        { text = "What happened to the part that stayed?", next = "tale_more", when = { npcFlag = "t_mage" } },
        { text = "And then?", next = "tale_more", when = { npcFlag = "t_hunter" } },
        { text = "Tell me another.", next = "tales" },
        { text = "Thank you for telling me.", next = "talk", fx = { affinity = 1 } },
      },
    },
    tale_refused = {
      rotating = true,
      lines = {
        { id = "tl_farmer", key = true, fx = { npcFlag = { set = "t_farmer", clear = { "t_soldier", "t_mage", "t_hunter", "t_veteran", "t_sentinel", "t_finished", "t_plagued", "t_unnamed", "t_gnome", "t_dwarf", "t_troll" } } },
          text = "A farmer from Westfall, after the thieves burned his harvest. He said there was nothing to go back to. I said there was the next harvest; he said, not for me." },
        { id = "tl_veteran", key = true, fx = { npcFlag = { set = "t_veteran", clear = { "t_soldier", "t_mage", "t_hunter", "t_farmer", "t_sentinel", "t_finished", "t_plagued", "t_unnamed", "t_gnome", "t_dwarf", "t_troll" } } },
          text = "An old soldier from the Second War. Every one of his company was already here, in the gray, waiting for him. He asked me not to send him back." },
        { id = "tl_sentinel", key = true, fx = { npcFlag = { set = "t_sentinel", clear = { "t_soldier", "t_mage", "t_hunter", "t_farmer", "t_veteran", "t_finished", "t_plagued", "t_unnamed", "t_gnome", "t_dwarf", "t_troll" } } },
          text = "A Sentinel, older than most of your kingdoms. They told me they had seen enough of the world, and would like to stop now." },
      },
      choices = {
        { text = "Did he stay?", next = "tale_more", when = { npcFlag = "t_farmer" } },
        { text = "Did you let him stay?", next = "tale_more", when = { npcFlag = "t_veteran" } },
        { text = "What did you say?", next = "tale_more", when = { npcFlag = "t_sentinel" } },
        { text = "Tell me another.", next = "tales" },
        { text = "Thank you for telling me.", next = "talk", fx = { affinity = 1 } },
      },
    },
    tale_lost = {
      rotating = true,
      lines = {
        { id = "tl_finished", key = true, fx = { npcFlag = { set = "t_finished", clear = { "t_soldier", "t_mage", "t_hunter", "t_farmer", "t_veteran", "t_sentinel", "t_plagued", "t_unnamed", "t_gnome", "t_dwarf", "t_troll" } } },
          text = "Someone who arrived already finished. Nothing wrong with them at all. They had simply done everything they came to do, and I could not make them unfinished." },
        { id = "tl_plagued", key = true, fx = { npcFlag = { set = "t_plagued", clear = { "t_soldier", "t_mage", "t_hunter", "t_farmer", "t_veteran", "t_sentinel", "t_finished", "t_unnamed", "t_gnome", "t_dwarf", "t_troll" } } },
          text = "A priest from Stratholme, before the end, who arrived halfway gone. The plague had written on them first, in a hand I could not erase." },
        { id = "tl_unnamed", key = true, fx = { npcFlag = { set = "t_unnamed", clear = { "t_soldier", "t_mage", "t_hunter", "t_farmer", "t_veteran", "t_sentinel", "t_finished", "t_plagued", "t_gnome", "t_dwarf", "t_troll" } } },
          text = "There was a battle in Ashenvale, and so many came up the hill at once. When I looked up, one of the quiet ones had thinned to nothing while I was busy." },
      },
      choices = {
        { text = "That doesn't sound like failure.", next = "tale_more", when = { npcFlag = "t_finished" } },
        { text = "A hand? Like the one in my file?", next = "tale_more", when = { npcFlag = "t_plagued" } },
        { text = "Who were they?", next = "tale_more", when = { npcFlag = "t_unnamed" } },
        { text = "Tell me another.", next = "tales" },
        { text = "Thank you for telling me.", next = "talk", fx = { affinity = 1 } },
      },
    },
    tale_laugh = {
      rotating = true,
      lines = {
        { id = "tl_gnome", key = true, fx = { npcFlag = { set = "t_gnome", clear = { "t_soldier", "t_mage", "t_hunter", "t_farmer", "t_veteran", "t_sentinel", "t_finished", "t_plagued", "t_unnamed", "t_dwarf", "t_troll" } } },
          text = "A gnome who arrived with complaints about the hill: the slope, the mist, the lack of signage. They drafted improvements while I worked." },
        { id = "tl_dwarf", key = true, fx = { npcFlag = { set = "t_dwarf", clear = { "t_soldier", "t_mage", "t_hunter", "t_farmer", "t_veteran", "t_sentinel", "t_finished", "t_plagued", "t_unnamed", "t_gnome", "t_troll" } } },
          text = "A dwarf who came up the hill sixty times, and every time promised me an ale. On the sixty-first, he brought one." },
        { id = "tl_troll", key = true, fx = { npcFlag = { set = "t_troll", clear = { "t_soldier", "t_mage", "t_hunter", "t_farmer", "t_veteran", "t_sentinel", "t_finished", "t_plagued", "t_unnamed", "t_gnome", "t_dwarf" } } },
          text = "A troll who greeted me every time like an old friend, and swore we had known each other in a past life, on a beach, they said, with a good fire." },
      },
      choices = {
        { text = "Did you take any of them?", next = "tale_more", when = { npcFlag = "t_gnome" } },
        { text = "How?", next = "tale_more", when = { npcFlag = "t_dwarf" } },
        { text = "Were they right?", next = "tale_more", when = { npcFlag = "t_troll" } },
        { text = "Tell me another.", next = "tales" },
        { text = "Thank you for telling me.", next = "talk", fx = { affinity = 1 } },
      },
    },
    tale_more = {
      lines = {
        { id = "tx_soldier", key = true, priority = 10, when = { npcFlag = "t_soldier" },
          text = "I have asked myself that every day since. I let go because he was screaming. I think now he was screaming at me not to." },
        { id = "tx_mage", key = true, priority = 10, when = { npcFlag = "t_mage" },
          text = "It is still here. It asks me, sometimes, what the other part is doing, and I tell it the truth: the other part is happy. That is worse, for the part that stayed." },
        { id = "tx_hunter", key = true, priority = 10, when = { npcFlag = "t_hunter" },
          text = "They came back an hour later, having lost their name again. The fourth time, they asked me to keep it. It is folded at the back of my own file; I take it out sometimes." },
        { id = "tx_farmer", key = true, priority = 10, when = { npcFlag = "t_farmer" },
          text = "He went back, though not for the harvest; he went for a girl down the road who would have had to do the burying. Sometimes a reason is that small, and small reasons hold." },
        { id = "tx_veteran", key = true, priority = 10, when = { npcFlag = "t_veteran" },
          text = "I did. Some refusals are not refusals but homecomings, and he and his old company walked into the mist together, arguing about whose turn it was to carry the flag." },
        { id = "tx_sentinel", key = true, priority = 10, when = { npcFlag = "t_sentinel" },
          text = "I asked what they had not seen yet. They thought for a very long time, longer than anyone has thought on this hill. Then they went back down to see it." },
        { id = "tx_finished", key = true, priority = 10, when = { npcFlag = "t_finished" },
          text = "It is not, though it felt like one. That is my flaw, not theirs, because I wanted to keep them, and that is not what I am for." },
        { id = "tx_plagued", key = true, priority = 10, when = { npcFlag = "t_plagued" },
          text = "No. That hand was cruel, and in a hurry, and the one in your file is patient, I think. I have read a great many hands, and I think so." },
        { id = "tx_unnamed", key = true, priority = 10, when = { npcFlag = "t_unnamed" },
          text = "I never learned the name, and that is the one I cannot forgive: not them, but me. I say a blank space aloud every day, in case it helps." },
        { id = "tx_gnome", key = true, priority = 10, when = { npcFlag = "t_gnome" },
          text = "Two of them, and I will not say which. They come back every few months to check, and they always find a third thing wrong; I have started looking forward to it." },
        { id = "tx_dwarf", key = true, priority = 10, when = { npcFlag = "t_dwarf" },
          text = "I have never known how. It was warm and flat and the best thing I have ever been given, and I did not drink it; I still have it." },
        { id = "tx_troll", key = true, priority = 10, when = { npcFlag = "t_troll" },
          text = "I told them no, every time. Lately I remember a beach, and I do not know if I remember it or if they gave it to me. I am grateful either way." },
        { id = "tx_default",
          text = "That is all of it. Most stories are shorter than the people in them." },
      },
      choices = {
        { text = "Tell me another.", next = "tales" },
        { text = "Why do you remember all this?", next = "tale_why" },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    tale_why = {
      lines = {
        { id = "tw_default", key = true,
          text = "Because a story told is a person kept. Not all of them, but enough of them to say that they were here, and they were not nothing." },
        { id = "tw_default2",
          text = "Because if I stop, they are only names in a file. Told, they are people again, for as long as the telling lasts. I tell them to myself, mostly." },
      },
      choices = {
        { text = "Will you tell my story, one day?", next = "tale_mine" },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    tale_mine = {
      lines = {
        { id = "tmine_default",
          text = "I already do, to the others, when you are gone. They like the part where you keep coming back, because it gives them ideas." },
        { id = "tmine_many", when = { deaths = { min = 50 } },
          text = "I tell it often. It is very long now, and the others have favorite parts, but I will not tell you which, because you would only try to die that way again." },
        { id = "tmine_light", when = { alignment = { axis = "light", min = 40 } },
          text = "I tell it to the ones who arrive frightened. It helps. A story about someone who kept going down the hill and doing good is a strong medicine up here." },
      },
      choices = {
        { text = "Return me to life.", next = "parting" },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    ---------------------------------------------------------------------------
    -- Debates. Each is a short argument in rounds; the healer argues honestly and can lose.
    -- Winning one gets you written into the healer's own file (flag won_*, callback in hello).
    ---------------------------------------------------------------------------
    debate = {
      rotating = true,
      lines = {
        { id = "db_default",
          text = "An argument? Good, because I have been right about everything for a very long time, and it has been lonely." },
        { id = "db_default2",
          text = "Choose your ground, and I will take the other side, whatever it is, since someone has to." },
        { id = "db_won", priority = 10, when = { any = { { npcFlagBefore = "won_endless" }, { npcFlagBefore = "won_written" }, { npcFlagBefore = "won_pain" }, { npcFlagBefore = "won_debt" } } },
          text = "You beat me once, and I have not forgotten. I have been preparing ever since, so choose." },
      },
      choices = {
        { text = "Is a life that never ends really a life?", next = "dv_endless" },
        { text = "Is it all already written?", next = "dv_written" },
        { text = "Does suffering mean anything?", next = "dv_pain" },
        { text = "What do we owe the dead?", next = "dv_debt" },
      },
    },
    dv_endless = {
      big = true,
      lines = {
        { id = "de_default", key = true,
          text = "You do not die, not properly; you come back. So tell me: is that still a life, or only a very long day?" },
      },
      choices = {
        { text = "It's a life. I still change and grow.", next = "dv_endless_grow" },
        { text = "No. Without an ending, nothing matters.", next = "dv_endless_nothing" },
        { text = "It's a gift. I'll use every day of it.", next = "dv_endless_gift", fx = { align = { light = 1 } } },
        { text = "It's a curse, and I'd give it back if I could.", next = "dv_endless_nothing", fx = { align = { light = -1 } } },
      },
    },
    dv_endless_grow = {
      big = true,
      lines = {
        { id = "deg_default",
          text = "Do you? Most people die the same way, at the same kind of place, over and over. Growth is a fine word, but repetition is a truer one." },
        { id = "deg_same", priority = 10, when = { deathsHere = { min = 3 } },
          text = "Do you? You just died in {deathplace} again. Growth is a fine word, but repetition is a truer one." },
      },
      choices = {
        { text = "I learn something each time, even there.", next = "dv_endless_win", fx = { trait = { brave = 1 } } },
        { text = "...Maybe you're right.", next = "dv_endless_lose" },
      },
    },
    dv_endless_nothing = {
      big = true,
      lines = {
        { id = "den_default",
          text = "Then why do you take quests, help farmers, bury their dead? Nothing matters, you say, and you act as though everything does." },
      },
      choices = {
        { text = "...Because it matters to them, even if not to me.", next = "dv_endless_win", fx = { trait = { kind = 1 } } },
        { text = "Habit.", next = "dv_endless_lose", fx = { trait = { skeptical = 1 } } },
      },
    },
    dv_endless_gift = {
      big = true,
      lines = {
        { id = "dei_default",
          text = "A gift no one asked for, from someone no one has met. Gifts usually come with a card. Have you looked for the card?" },
      },
      choices = {
        { text = "The card is what I do with it.", next = "dv_endless_win" },
        { text = "...No. I haven't.", next = "dv_endless_lose" },
      },
    },
    dv_endless_win = {
      big = true,
      lines = {
        { id = "dw_default", key = true, fx = { npcFlag = { set = "won_endless" } },
          text = "...Yes, all right, you win this one: a day that teaches you something is not the same day twice. I will write it in my own file. I have one, you know, very thin." },
      },
      choices = {
        { text = "You have a file?", next = "own_file" },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    dv_endless_lose = {
      lines = {
        { id = "dl_default",
          text = "Do not agree with me so quickly. I am not always right; I am only always here. Go down and prove me wrong, and then come back and tell me." },
      },
      choices = {
        { text = "Return me to life.", next = "parting" },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    dv_written = {
      big = true,
      lines = {
        { id = "dw2_default", key = true,
          text = "Someone writes in your file before things happen. If it is written, are you choosing anything, or only reading your lines aloud?" },
        { id = "dw2_hand", priority = 10, when = { npcFlag = "saw_hand" },
          text = "You have seen the pages at the back of your file, the ones dated ahead. So, if it is written, are you choosing anything, or only reading your lines aloud?" },
      },
      choices = {
        { text = "Writing it down doesn't make it happen.", next = "dv_written_record" },
        { text = "Then I'll do something no one could write.", next = "dv_written_defy", fx = { align = { order = -1 } } },
        { text = "Then I'll read my lines and trust whoever wrote them.", next = "dv_written_lose", fx = { align = { order = 1 } } },
        { text = "Maybe it is written. I'll still choose.", next = "dv_written_both" },
      },
    },
    dv_written_record = {
      big = true,
      lines = {
        { id = "dwr_default",
          text = "A weather-reader writes 'rain tomorrow', and the rain does not care. Perhaps the hand at the back of your file is only good at weather, so is that what you are, weather?" },
      },
      choices = {
        { text = "No. Weather doesn't argue back.", next = "dv_written_win" },
        { text = "Maybe I am.", next = "dv_written_lose" },
      },
    },
    dv_written_defy = {
      big = true,
      lines = {
        { id = "dwd_default",
          text = "And if the hand wrote that too, 'they will try to surprise us'? Every rebellion is easy to predict, and rebels are the most predictable people I meet." },
      },
      choices = {
        { text = "Then I'll be kind instead. No one predicts that.", next = "dv_written_win", fx = { trait = { kind = 1 } } },
        { text = "Then there's no point.", next = "dv_written_lose" },
      },
    },
    dv_written_both = {
      big = true,
      lines = {
        { id = "dwb_default",
          text = "That is the answer of someone who has thought about it, or of someone who has not thought about it at all, and I cannot tell which, so which is it?" },
      },
      choices = {
        { text = "Both. That's the point.", next = "dv_written_win" },
        { text = "I don't know.", next = "dv_written_lose" },
      },
    },
    dv_written_win = {
      big = true,
      lines = {
        { id = "dww_default", key = true, fx = { npcFlag = { set = "won_written" } },
          text = "...Hm. I have just looked at the back of your file, and the last page is blank; it was not blank when we started talking. You win, and I do not know how." },
      },
      choices = {
        { text = "I can't tell whether that's good.", next = "dv_written_good" },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    dv_written_good = {
      lines = {
        { id = "dwg_default",
          text = "I think it is the best thing that has happened on this hill in a long while. It is a blank page, so go and fill it, badly if you must, so long as it is you who fills it." },
      },
      choices = {
        { text = "Return me to life.", next = "parting" },
      },
    },
    dv_written_lose = {
      lines = {
        { id = "dwl_default",
          text = "Then read your lines well, at least; even an actor can make a written part their own. But I think you are more than an actor. Come back when you believe it." },
      },
      choices = {
        { text = "Return me to life.", next = "parting" },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    dv_pain = {
      big = true,
      lines = {
        { id = "dp_default", key = true,
          text = "Every soul arrives here hurting, from teeth or fire or falling. Tell me it means something, and convince me, because I have been unconvinced for a very long time." },
      },
      choices = {
        { text = "It teaches us.", next = "dv_pain_teach" },
        { text = "It means nothing. It's what we do after that counts.", next = "dv_pain_after" },
        { text = "It binds us to each other.", next = "dv_pain_bind", fx = { trait = { kind = 1 } } },
      },
    },
    dv_pain_teach = {
      big = true,
      lines = {
        { id = "dpt_default",
          text = "Then the Scourge is a great teacher, and Lordaeron graduated with honors. No, I have met the students, and they did not learn; they only hurt." },
      },
      choices = {
        { text = "...Then it teaches the ones who survive it.", next = "dv_pain_after" },
        { text = "You're right. I take it back.", next = "dv_pain_lose" },
      },
    },
    dv_pain_after = {
      big = true,
      lines = {
        { id = "dpa_default",
          text = "So the suffering is nothing, and the answer is everything. Then why do you come up here hurting, and go down willing to hurt again?" },
      },
      choices = {
        { text = "Because someone down there is hurting worse.", next = "dv_pain_win", fx = { align = { light = 1 } } },
        { text = "I don't have an answer.", next = "dv_pain_lose" },
        { text = "Because I'm paid to, and that's reason enough.", next = "dv_pain_lose", fx = { align = { light = -1 } } },
      },
    },
    dv_pain_bind = {
      big = true,
      lines = {
        { id = "dpb_default",
          text = "Binds you, the way the Scourge binds its dead? Be careful with that word, because I have seen what binding looks like, done badly." },
      },
      choices = {
        { text = "Not chains. Like someone's hand in the dark.", next = "dv_pain_win" },
        { text = "Maybe it's the same thing.", next = "dv_pain_lose" },
      },
    },
    dv_pain_win = {
      big = true,
      lines = {
        { id = "dpw_default", key = true, fx = { npcFlag = { set = "won_pain" } },
          text = "...I held a hand once, I think. I remember warmth in the dark, and it did not stop the dark; it did not need to. You win: go back down, and hold some." },
      },
      choices = {
        { text = "Is that written in a file of your own?", next = "own_file" },
        { text = "Return me to life.", next = "parting" },
      },
    },
    dv_pain_lose = {
      lines = {
        { id = "dpl_default",
          text = "Then we agree, and I am sorry we agree. I was hoping, this time, someone would talk me out of it." },
      },
      choices = {
        { text = "Return me to life.", next = "parting" },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    dv_debt = {
      big = true,
      lines = {
        { id = "dd_default", key = true,
          text = "The dead are owed something; everyone agrees on that, and no one agrees on what. Is it vengeance, remembrance or silence? You choose, and I will argue." },
      },
      choices = {
        { text = "Vengeance. Their killers should pay.", next = "dv_debt_vengeance", fx = { align = { honor = -1 } } },
        { text = "Mercy. Their killers should be forgiven, and the wheel stopped.", next = "dv_debt_win", fx = { align = { honor = 1 } } },
        { text = "Remembrance. We carry them with us.", next = "dv_debt_remember" },
        { text = "Nothing. We owe the living.", next = "dv_debt_living" },
      },
    },
    dv_debt_vengeance = {
      big = true,
      lines = {
        { id = "ddv_default",
          text = "Then you will send me their killers, and they will be owed vengeance too. I have watched that wheel turn since before your kingdoms. It is a very good wheel; it never stops." },
        { id = "ddv_forsaken", when = { race = "Scourge" },
          text = "Your Dark Lady thinks so, and I meet the results every day, from both sides. They arrive owed and they leave owing, and it is a very good wheel, because it never stops." },
      },
      choices = {
        { text = "Then someone has to stop turning it.", next = "dv_debt_win", fx = { align = { honor = 1 } } },
        { text = "Then let it turn.", next = "dv_debt_lose", fx = { align = { honor = -1 }, trait = { stern = 1 } } },
      },
    },
    dv_debt_remember = {
      big = true,
      lines = {
        { id = "ddr_default",
          text = "Carry them? You will drop most of them, as everyone does, because memory is a sieve. What then: do the dropped ones lose their due?" },
      },
      choices = {
        { text = "That's what you're for. You carry what we drop.", next = "dv_debt_win", fx = { affinity = 1 } },
        { text = "...I don't know.", next = "dv_debt_lose" },
      },
    },
    dv_debt_living = {
      big = true,
      lines = {
        { id = "ddl_default",
          text = "Cold and practical, and correct, perhaps. But then why did every soul on this hill, every one, spend their last breath thinking about someone who had already died?" },
      },
      choices = {
        { text = "Because the living are made of the dead.", next = "dv_debt_win" },
        { text = "Fear.", next = "dv_debt_lose" },
      },
    },
    dv_debt_win = {
      big = true,
      lines = {
        { id = "ddw_default", key = true, fx = { npcFlag = { set = "won_debt" } },
          text = "...I had not thought of it that way, and I will need to. You win, and do you know how rare that is? Do not answer, because you would only guess too low." },
      },
      choices = {
        { text = "What do you get, for losing?", next = "own_file" },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    dv_debt_lose = {
      lines = {
        { id = "ddl2_default",
          text = "Then the debt stands, and no one can pay it, and we all go on owing. That is the world. I had hoped you would find me a better one." },
      },
      choices = {
        { text = "Return me to life.", next = "parting" },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    own_file = {
      big = true,
      lines = {
        { id = "of_default", key = true,
          text = "I keep one for myself, very thin: only the things I have learned since I began standing here. You are in it now. I hope you do not mind." },
        { id = "of_many", priority = 10, when = { any = { { npcFlagBefore = "won_endless", npcFlag = "won_written" }, { npcFlagBefore = "won_written", npcFlag = "won_pain" }, { npcFlagBefore = "won_pain", npcFlag = "won_debt" } } },
          text = "My own file has your name in it more than once now. It used to be a single page; you are making it thicker. I did not know it could grow." },
      },
      choices = {
        { text = "Your own file must have a first page too.", next = "own_first" },
        { text = "Let's talk about something else.", next = "talk" },
      },
    },
    own_first = {
      big = true,
      lines = {
        { id = "ofp_default", key = true, fx = { hear = "spirithealer_was_mortal" },
          text = "One line, in the same neat hand that writes at the back of yours: \"Not yet.\" I have read it every day since I began, and I still do not know if it is for me." },
      },
      choices = {
        { text = "The same hand as mine?", next = "own_hand" },
        { text = "Return me to life.", next = "parting" },
      },
    },
    own_hand = {
      big = true,
      lines = {
        { id = "oh_default",
          text = "The same. Whoever writes your future also wrote my beginning, and I have never told anyone that. I do not know why I told you; perhaps it was written." },
      },
      choices = {
        { text = "Maybe we'll find out who, someday.", next = "parting", fx = { trait = { curious = 1 } }, journal = { first = "The spirit healer's own file begins with two words, in the same hand that writes ahead in mine: \"Not yet.\"", third = "{name} learned that the spirit healer's own file begins in the same hand that writes ahead in theirs." } },
        { text = "Return me to life.", next = "parting" },
      },
    },
    ---------------------------------------------------------------------------
    -- The send-off
    ---------------------------------------------------------------------------
    parting = {
      lines = {
        { id = "pa_default", text = "Go on, then. The world is louder than you remember, so let it be loud." },
        { id = "pa_default2", text = "Walk carefully, and if you cannot walk carefully, walk anyway." },
        { id = "pa_light", when = { alignment = { axis = "light", min = 40 } }, text = "Go, and do more of whatever it is you have been doing, because they notice, out there." },
        { id = "pa_shadow", when = { alignment = { axis = "light", max = -40 } }, text = "Go, and this time, perhaps, give me something kinder to write." },
        { id = "pa_many", when = { deaths = { min = 25 } }, text = "Go on, and I will see you soon. I would rather not, but I will." },
        { id = "pa_default3", text = "Down you go. Eat something when you wake, even if you are not hungry, because the body likes to be welcomed back." },
        { id = "pa_young", when = { maxLevel = 9 }, text = "Go on, little one. You will be stronger the next time I see you, and I would like that next time to be a long way off." },
        { id = "pa_night", when = { timeOfDay = "night" }, text = "It is dark where you are going, so keep to the road and the lamps, and do not be ashamed to be afraid of things; fear has kept more people off this hill than courage ever has." },
        { id = "pa_bg", priority = 10, when = { zone = { "Warsong Gulch", "Arathi Basin", "Alterac Valley" } }, text = "Go, then, back to your battle. I will hold your place in line, which is a joke, but only a small one." },
      },
      choices = { { text = "Return me to life.", next = "BUSINESS" } },
    },
  },
  confides = {
    { id = "cnf_1", text = "If you walk back to your body instead of letting me raise you here, you keep your strength and spare your armour the extra wear my hands would cost you." },
    { id = "cnf_2", text = "The weakness I leave on you is brief for the young and lasts longer as you grow. Sit somewhere safe while it passes, and do not pick a fight in it." },
    { id = "cnf_3", text = "Your body is never as far as it feels from up here. Go straight down the hill and do not stop to look into the gray, for leaving is easier than it seems." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "The dead bring their news up the hill with them, and I write down whatever they let fall. This much I can speak to, if you will sit a moment longer." },
      { id = "t_kn_many", when = { deaths = { min = 25 } }, text = "You have died often enough to have heard most of this on the way up yourself, but here is what the others have brought me." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You have been patient with me, and I have kept a few pages aside for you. Ask, and I will read them to you." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "You want answers more than you want to listen, I think, but I will tell you what the file says, and nothing beyond it." },
    },
    _none = {
      { id = "t_none", text = "The living ask about the living, and I keep other records." },
      { id = "t_none2", text = "Ask someone with a pulse. I gave mine up a long time ago, I think." },
    },
    scarlet_crusade = {
      { id = "t_scarlet", text = "They send me so many, and they all arrive so certain. Certainty does not survive the hill; I watch it leave them, and it is never pretty." },
    },
    scourge = {
      { id = "t_scourge", text = "They are the ones who never arrive. Every soul the Scourge stands back up is a name missing from my hill, and I keep a list of the missing that is longer than I will say aloud." },
    },
    forsaken = {
      { id = "t_forsaken", text = "Raised once without being asked, and then they took themselves back, and I respect that more than they would believe. When they climb my hill they are the only ones who are never surprised, and the only ones who thank me as if they know what it costs." },
    },
    lordaeron = {
      { id = "t_lordaeron", text = "The year it fell, I had a line down the hill longer than any I have known before or since. I remember every face in it, and I wish I did not remember quite so many of them so young." },
    },
    gnomeregan = {
      { id = "t_gnomeregan", text = "They all came at once, arguing about valves, and some of them never came at all. I still do not know what to call the ones who were left down there." },
    },
    light = {
      { id = "t_light", text = "Some arrive bright with it and some arrive with none, and I cannot tell you it changes the climb. I can tell you it changes how they hold their hands at the top, and that is not nothing." },
    },
    elune = {
      { id = "t_elune", text = "Her children arrive as wisps, already glowing. Whether that is her doing or theirs I could not say, but I always know a night elf is coming by the light on the path." },
    },
    argent_dawn = {
      { id = "t_argent", text = "They speak of the dead with great care, and I appreciate that, since most of the living only fight them." },
    },
    grievance = {
      { id = "gv1", text = "You come up the hill angry and go down it angrier, and you leave a mark on the grass that I have to tidy. I do not enjoy tidying." },
      { id = "gv_tone", when = { grudge = "tone" }, text = "You speak to me as if I were a toll-keeper. I do not take tolls; I keep records, and yours is not flattering." },
    },
    amends = {
      { id = "am1", text = "Sit a moment the next time you come up the hill, and let me finish a sentence. That would mend more than you think." },
      { id = "am_values", when = { grudge = "values" }, text = "Stop dying so carelessly, as though the hill were a shortcut. The file notices, and so do I." },
    },
    spite = {
      { id = "sp1", text = "I think you will come up this hill one day and I will have to look up your name. I have never once had to look up a name, and I am saving that for you." },
    },
    regard = {
      { id = "rg_1", text = "I think you are one of the few who come up the hill and look at me, rather than past me at the way back. I have noticed, and I have written it down." },
      { id = "rg_2", text = "Your file is thick, but there is not one cruel page in it, and that is rarer than you would think. I read it more often than I need to." },
      { id = "rg_light", when = { alignment = { axis = "light", min = 30 } }, text = "You arrive bright, every time, and the others in the gray turn toward you when you do. I find I turn too, and I am not sure I am permitted to." },
      { id = "rg_shadow", when = { alignment = { axis = "light", max = -30 } }, text = "There is dark in your file, more than most, and still you come up the hill gently. I do not judge the dark; I only note how you carry it." },
      { id = "rg_many", when = { deaths = { min = 50 } }, text = "We have met so often that I think of you as a regular, the way an innkeeper might. That is not a complaint." },
    },
    confide = {
      { id = "cf_1", text = "I do not remember my own face, but I remember a blue latch on a door and bread cooling on a sill. I take them out and look at them when the hill is quiet." },
      { id = "cf_2", text = "I am not certain I am allowed to grow fond of anyone. No one has said I may not, and so I have, a little, with you." },
    },
    trust = {
      { id = "tr_1", text = "Trust the ones who come back and say the names of the dead aloud. They have understood something most of the living never do." },
      { id = "tr_2", text = "Trust your own feet on the walk back to your body. They are slower than my hands, but they take nothing from you but time." },
    },
    watchout = {
      { id = "wo_1", text = "Watch the ones who die without fear. They are not brave; they have only forgotten what they stand to lose, and they forget other things soon after." },
      { id = "wo_2", text = "Be wary of anyone who offers to keep your soul safe in a stone. When you fall into a stone you do not come to me, and I cannot tell you who you go to instead." },
    },
    worries = {
      { id = "wy_1", text = "That one day I will forget a name. I never have yet, but the file grows and I am only one, and some nights the ink looks paler than it did." },
      { id = "wy_2", text = "The door past the mist was warm again this morning, and I do not know what that means. I have stopped telling the others when it is warm." },
    },
    hopes = {
      { id = "hp_1", text = "That you die very old, in a bed, with someone holding your hand, and that you come up the hill only once more after that and stay as long as you like." },
      { id = "hp_2", text = "That someone, somewhere, keeps a file on me. I should like to think I am remembered as carefully as I remember." },
    },
    favor = {
      { id = "fv_1", text = "Say a name aloud for me when you are back among the living, any name from your own losses. The dead are kept by being spoken." },
      { id = "fv_2", text = "Come up the hill a little less often, if you can manage it. I should miss you, but I would rather miss you than see you so pale." },
    },
    friendship = {
      { id = "fr_1", text = "I do. I have never been sure the dead may have friends among the living, but I have stopped waiting for anyone to forbid it." },
      { id = "fr_2", text = "You are the page I turn back to when the hill is too full. If that is not friendship, I do not know what the word is for." },
      { id = "fr_many", when = { deaths = { min = 100 } }, text = "After a hundred climbs and more? You are the oldest friend I have, and very nearly the only one who keeps coming back." },
    },
    never_told = {
      { id = "nt_1", text = "I wrote your name on the first page of my own file once, without meaning to. I have not crossed it out, and I do not think I will." },
      { id = "nt_2", text = "Once, someone begged me to keep them here, and I said no and sent them back down. They never came up the hill again, and I have never learned whether that means they lived or that they never arrived." },
    },
  },
}
