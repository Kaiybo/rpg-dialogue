local P = RPGDialogueAPI:Pack("rpgd.world")

-- Deeds that travel (0.117.0): what you said to one person, overheard from others of your
-- side later on. Each needs a deed recorded by Systems/Overheard.lua ("said:<topic>_<stance>"
-- or "said:align_<axis>_<up|down>"); never from the one you said it to. Off unless the
-- `overheard` setting is on, and as rare as other exchanges.
-- {deedNpc}: who you said it to. {deedZone}: where.

---------------------------------------------------------------------------
-- Alliance
---------------------------------------------------------------------------
P:Exchange { id = "exd_jaina_admire_a", side = "Alliance", deed = { "said:jaina_admire", "said:jaina_trust", "said:jaina_respect" },
  a = { role = "citizen" }, b = { role = "citizen" },
  lines = {
    { who = "a", text = "That's the {class} who spoke up for Lady Proudmoore, so I hear. Said Theramore is the wisest thing the Alliance has built in years." },
    { who = "b", text = "Brave thing to say aloud in this city, with half the court still calling her a turncoat." },
  } }

P:Exchange { id = "exd_jaina_traitor_a", side = "Alliance", deed = "said:jaina_traitor",
  a = { role = "guard" }, b = { role = "citizen" },
  lines = {
    { who = "b", text = "I heard that one told {deedNpc} that Jaina Proudmoore betrayed her own father to the orcs." },
    { who = "a", text = "Plenty of old soldiers say the same over their ale, though few say it sober. Keep your voice down." },
  } }

P:Exchange { id = "exd_scourge_hate_a", side = "Alliance", deed = "said:scourge_hate",
  a = { role = "guard" }, b = { role = "guard" },
  lines = {
    { who = "a", text = "Word is that {race} swore to {deedNpc} that every walking corpse in Lordaeron will burn before the end." },
    { who = "b", text = "Good. We could use a few more with that sort of fire, and fewer who only talk about it." },
  } }

P:Exchange { id = "exd_scourge_pity_a", side = "Alliance", deed = "said:scourge_pity",
  a = { role = "citizen" }, b = { role = "vendor" },
  lines = {
    { who = "a", text = "Did you hear? That {class} said the dead of Lordaeron deserve pity, not just a sword." },
    { who = "b", text = "My cousin farmed outside Andorhal before the plague. I'd like to think someone pities him, wherever he walks now." },
  } }

P:Exchange { id = "exd_peace_for_a", side = "Alliance", deed = "said:peace_for",
  a = { role = "guard" }, b = { role = "citizen" },
  lines = {
    { who = "b", text = "That's the one talking about peace with the orcs, isn't it? Said it plain as day in {deedZone}." },
    { who = "a", text = "Talk is cheap until a Warsong raider comes through the trees. Still, I'd not mind a quiet year." },
  } }

P:Exchange { id = "exd_peace_against_a", side = "Alliance", deed = { "said:peace_against", "said:peace_war" },
  a = { role = "guard" }, b = { role = "guard" },
  lines = {
    { who = "a", text = "That {class} has no time for treaties with the Horde, by all accounts. Told {deedNpc} as much." },
    { who = "b", text = "Neither has the captain, and he lost two brothers at Blackrock Spire. They'd get on." },
  } }

P:Exchange { id = "exd_prestor_a", side = "Alliance", deed = "said:prestor_distrust", sameTown = true,
  a = { role = "citizen" }, b = { role = "citizen" },
  lines = {
    { who = "a", text = "Someone's been saying Lady Prestor has the regent wrapped round her finger, and saying it loudly." },
    { who = "b", text = "And it's that {race} there, I'd wager. Walk on, friend; the nobles have long ears in this city." },
  } }

P:Exchange { id = "exd_bolvar_a", side = "Alliance", deed = "said:bolvar_trust", sameTown = true,
  a = { role = "guard" }, b = { role = "citizen" },
  lines = {
    { who = "b", text = "That {class} told {deedNpc} that Highlord Bolvar is the only honest man left at court." },
    { who = "a", text = "The watch would mostly agree, though we'd never say so in front of the house nobles." },
  } }

P:Exchange { id = "exd_crusade_a", side = "Alliance", deed = "said:scarlet_crusade_hate",
  a = { role = "citizen" }, b = { role = "vendor" },
  lines = {
    { who = "a", text = "I'm told that one called the Scarlet Crusade a pack of butchers in red tabards." },
    { who = "b", text = "My sister went north to join them and stopped writing home a year ago. Perhaps the {class} has the right of it." },
  } }

P:Exchange { id = "exd_kaldorei_a", side = "Alliance", deed = { "said:night_elves_distrust", "said:night_elves_arrogant" },
  a = { role = "citizen" }, b = { role = "citizen" },
  lines = {
    { who = "a", text = "That {race} has been grumbling that the night elves look down on the rest of us." },
    { who = "b", text = "They've had ten thousand years to practise looking down on folk. You can hardly blame them for being good at it." },
  } }

P:Exchange { id = "exd_druids_a", side = "Alliance", deed = { "said:druids_wary", "said:cenarion_circle_distrust" },
  a = { role = "guard" }, b = { role = "citizen" },
  lines = {
    { who = "b", text = "That one doesn't trust the druids, so I hear. Said a man who turns into a bear has a bear's judgement." },
    { who = "a", text = "Ha! I'd not say it in Darnassus, but I've wondered the same myself on long watches." },
  } }

---------------------------------------------------------------------------
-- Horde
---------------------------------------------------------------------------
P:Exchange { id = "exd_warchief_trust_h", side = "Horde", deed = { "said:warchief_trust", "said:warchief_respect", "said:thrall_trust", "said:thrall_respect", "said:thrall_admire" },
  a = { role = "guard" }, b = { role = "citizen" },
  lines = {
    { who = "b", text = "That {race} spoke well of the Warchief to {deedNpc}. Said Thrall freed us once and will lead us right again." },
    { who = "a", text = "Good words, and true ones. Lok'tar to anyone who says them where the doubters can hear." },
  } }

P:Exchange { id = "exd_warchief_soft_h", side = "Horde", deed = { "said:warchief_soft", "said:warchief_distrust", "said:thrall_doubt", "said:thrall_distrust" },
  a = { role = "guard" }, b = { role = "guard" },
  lines = {
    { who = "a", text = "I hear that one thinks the Warchief has gone soft, talking peace with the humans of Theramore." },
    { who = "b", text = "Plenty of old Warsong grunts think the same, but they don't say it outside Grommash Hold. That one has nerve." },
  } }

P:Exchange { id = "exd_jaina_h", side = "Horde", deed = { "said:jaina_admire", "said:jaina_trust", "said:jaina_respect" },
  a = { role = "citizen" }, b = { role = "vendor" },
  lines = {
    { who = "a", text = "That {class} told {deedNpc} the human sorceress in Theramore can be trusted. A human!" },
    { who = "b", text = "She did fight beside us at Mount Hyjal, and the Warchief keeps faith with her. Stranger things have been said." },
  } }

P:Exchange { id = "exd_jaina_traitor_h", side = "Horde", deed = "said:jaina_traitor",
  a = { role = "guard" }, b = { role = "citizen" },
  lines = {
    { who = "b", text = "Did you hear? That one says the Proudmoore woman turned on her own father, so she'll turn on us too." },
    { who = "a", text = "A sharp thought, and not a foolish one. Still, the Warchief chose his friends, and I trust his eye." },
  } }

P:Exchange { id = "exd_scourge_hate_h", side = "Horde", deed = "said:scourge_hate",
  a = { role = "guard" }, b = { role = "guard" },
  lines = {
    { who = "a", text = "That {race} swore to see the Scourge burned out of the northern lands. Said it like a blood oath." },
    { who = "b", text = "Then may the spirits guide that blade. The dead have taken enough from this world." },
  } }

P:Exchange { id = "exd_forsaken_distrust_h", side = "Horde", deed = { "said:forsaken_distrust", "said:sylvanas_distrust" },
  a = { role = "citizen" }, b = { role = "citizen" },
  lines = {
    { who = "a", text = "That one says the Forsaken can't be trusted, and that their Dark Lady has her own plans." },
    { who = "b", text = "Many think it, and few say it. I've smelled what they brew in the Undercity, and I wonder too." },
  } }

P:Exchange { id = "exd_forsaken_trust_h", side = "Horde", deed = { "said:forsaken_trust", "said:sylvanas_loyal", "said:forsaken_pity" },
  a = { role = "guard" }, b = { role = "citizen" },
  lines = {
    { who = "b", text = "I heard that {class} stood up for the Forsaken in front of {deedNpc}. Said they've earned their place." },
    { who = "a", text = "They bleed for the Horde, if they bleed at all. That's enough for me, whatever they smell like." },
  } }

P:Exchange { id = "exd_peace_for_h", side = "Horde", deed = "said:peace_for",
  a = { role = "guard" }, b = { role = "vendor" },
  lines = {
    { who = "b", text = "That one speaks of peace with the Alliance, like the Warchief does. Said it in {deedZone}, I'm told." },
    { who = "a", text = "Peace is well and good until the night elves send their sentinels after our lumber camps again." },
  } }

P:Exchange { id = "exd_peace_against_h", side = "Horde", deed = { "said:peace_against", "said:peace_war" },
  a = { role = "guard" }, b = { role = "guard" },
  lines = {
    { who = "a", text = "That {race} wants war with the Alliance, by all accounts. Doesn't care much for the Warchief's treaties." },
    { who = "b", text = "Hot blood. It will serve well in Ashenvale, if it doesn't get the rest of us killed first." },
  } }

P:Exchange { id = "exd_druids_h", side = "Horde", deed = { "said:druids_balance", "said:druids_admire", "said:cenarion_circle_admire", "said:cenarion_circle_respect" },
  a = { role = "citizen" }, b = { role = "citizen" },
  lines = {
    { who = "a", text = "That {class} spoke of the druids with respect, I hear. Said the Earthmother's balance matters more than war." },
    { who = "b", text = "Hamuul Runetotem would be glad to hear it. The young braves only want to talk about axes." },
  } }

P:Exchange { id = "exd_demons_h", side = "Horde", deed = "said:demons_useful",
  a = { role = "guard" }, b = { role = "citizen" },
  lines = {
    { who = "b", text = "That one told {deedNpc} that demons can be useful, if you hold the leash tight enough." },
    { who = "a", text = "So said Gul'dan once, and we all know how that ended. Watch that {race} closely." },
  } }

P:Exchange { id = "exd_crusade_h", side = "Horde", deed = "said:scarlet_crusade_hate",
  a = { role = "guard" }, b = { role = "citizen" },
  lines = {
    { who = "a", text = "That one hates the Scarlet Crusade, I hear, and wants to see their monastery burned to the stones." },
    { who = "b", text = "The Forsaken will cheer for that, and so will I. Those red-cloaked fanatics hang our scouts in Tirisfal." },
  } }

---------------------------------------------------------------------------
-- Alignment: big stances, either side
---------------------------------------------------------------------------
P:Exchange { id = "exd_light_up", deed = "said:align_light_up",
  a = { role = "citizen" }, b = { role = "citizen" },
  lines = {
    { who = "a", text = "They say that {class} showed mercy to someone who had no right to expect any." },
    { who = "b", text = "There's little enough of that going around these days. I'd shake {g:his|her} hand, if I dared." },
  } }

P:Exchange { id = "exd_light_down", deed = "said:align_light_down",
  a = { role = "guard" }, b = { role = "citizen" },
  lines = {
    { who = "b", text = "I heard that one did something cruel in {deedZone}, and didn't seem to mind it much." },
    { who = "a", text = "Hard times make hard people. Still, I'll keep my hand near my sword while {g:he|she}'s about." },
  } }

P:Exchange { id = "exd_order_up", deed = "said:align_order_up",
  a = { role = "guard" }, b = { role = "guard" },
  lines = {
    { who = "a", text = "Word is that {race} stood by the law when it would have been easier to look away." },
    { who = "b", text = "If the rest of the recruits had half that spine, my days would be a great deal shorter." },
  } }

P:Exchange { id = "exd_order_down", deed = "said:align_order_down",
  a = { role = "vendor" }, b = { role = "citizen" },
  lines = {
    { who = "b", text = "That one has no love for rules, I hear. Told {deedNpc} that laws are for those too timid to think." },
    { who = "a", text = "Then I'll count my coins twice after {g:he|she} leaves my stall. Nothing personal, mind." },
  } }

P:Exchange { id = "exd_honor_up", deed = "said:align_honor_up",
  a = { role = "citizen" }, b = { role = "guard" },
  lines = {
    { who = "a", text = "They say that {class} kept a promise in {deedZone} when breaking it would have paid far better." },
    { who = "b", text = "A word kept is worth more than gold, my father used to say. He died poor, but people trusted him." },
  } }

P:Exchange { id = "exd_honor_down", deed = "said:align_honor_down",
  a = { role = "citizen" }, b = { role = "citizen" },
  lines = {
    { who = "a", text = "Be careful with that one. I hear {g:he|she} talked {deedNpc} round with a pack of honeyed lies." },
    { who = "b", text = "Then I'll believe nothing {g:he|she} tells me, not even the time of day." },
  } }

P:Exchange { id = "exd_light_up_inn", deed = "said:align_light_up", sameTown = true,
  a = { role = "innkeeper" }, b = { role = "citizen" },
  lines = {
    { who = "b", text = "That's the {race} {deedNpc} won't stop talking about, the kind one." },
    { who = "a", text = "Kindness is good for trade. The first round is on the house if {g:he|she} stops in tonight." },
  } }

P:Exchange { id = "exd_order_down_guard", deed = "said:align_order_down", sameTown = true,
  a = { role = "guard" }, b = { role = "guard" },
  lines = {
    { who = "a", text = "That one was overheard telling {deedNpc} what {g:he|she} thinks of the watch, and it wasn't kind." },
    { who = "b", text = "Then {g:he|she} can think it quietly in a cell, if {g:he|she} makes trouble. Eyes front." },
  } }

---------------------------------------------------------------------------
-- Passing remarks: one line from someone you target
---------------------------------------------------------------------------
P:Exchange { id = "exr_jaina_a", remark = true, side = "Alliance", deed = { "said:jaina_admire", "said:jaina_trust", "said:jaina_respect" },
  lines = { { text = "You're the one who spoke up for Lady Proudmoore. Not everyone here agrees, but I respect you for saying it." } } }

P:Exchange { id = "exr_jaina_traitor_a", remark = true, side = "Alliance", deed = "said:jaina_traitor",
  lines = { { text = "I hear you've strong words about Theramore. Mind where you say them; the lady has friends here too." } } }

P:Exchange { id = "exr_scourge_a", remark = true, side = "Alliance", deed = "said:scourge_hate",
  lines = { { text = "You're the one sworn against the Scourge, aren't you? The north needs more like you, friend." } } }

P:Exchange { id = "exr_prestor_a", remark = true, side = "Alliance", deed = "said:prestor_distrust",
  lines = { { text = "A word of advice, {class}: some say you've been talking about Lady Prestor, and the court notices that sort of thing." } } }

P:Exchange { id = "exr_warchief_h", remark = true, side = "Horde", deed = { "said:warchief_trust", "said:warchief_respect", "said:thrall_trust", "said:thrall_respect" },
  lines = { { text = "I hear you speak well of the Warchief. Lok'tar, {race}; you keep the right company." } } }

P:Exchange { id = "exr_warchief_soft_h", remark = true, side = "Horde", deed = { "said:warchief_soft", "said:warchief_distrust" },
  a = { role = "guard" },
  lines = { { text = "Word gets round, {race}. Doubt the Warchief if you must, but do it far from Orgrimmar's gates." } } }

P:Exchange { id = "exr_forsaken_h", remark = true, side = "Horde", deed = { "said:forsaken_distrust", "said:sylvanas_distrust" },
  lines = { { text = "You don't trust the Forsaken either, so I've heard. Wise, maybe, but keep it among the living." } } }

P:Exchange { id = "exr_druids_h", remark = true, side = "Horde", deed = { "said:druids_balance", "said:druids_admire" },
  lines = { { text = "They say you honor the druids' balance. The Earthmother smiles on that, I think." } } }

P:Exchange { id = "exr_light_up", remark = true, deed = "said:align_light_up",
  lines = { { text = "I've heard what you did for that poor soul. There's still some decency in the world, then." } } }

P:Exchange { id = "exr_light_down", remark = true, deed = "said:align_light_down",
  lines = { { text = "I've heard things about you, {class}. I hope they're not true, but I'll mind my purse all the same." } } }

P:Exchange { id = "exr_honor_up", remark = true, deed = "said:align_honor_up",
  lines = { { text = "People say your word is good. That counts for a lot in these parts, more than you'd think." } } }

P:Exchange { id = "exr_honor_down", remark = true, deed = "said:align_honor_down",
  lines = { { text = "Folk say you've a silver tongue. Don't waste it on me; I've nothing worth the lying." } } }

P:Exchange { id = "exr_order_up", remark = true, deed = "said:align_order_up", a = { role = "guard" },
  lines = { { text = "The watch speaks well of you, {class}. Keep to the law and you'll always have a friend at the gate." } } }
