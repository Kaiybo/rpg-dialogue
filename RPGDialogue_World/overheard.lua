local P = RPGDialogueAPI:Pack("rpgd.world")

-- Overheard exchanges (0.116.0): pairs of townsfolk talking while the player passes.

P:Exchange { id = "ex_sw_guard_defias", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Stormwind City" },
  lines = {
    { who = "a", text = "Third masked man we've hauled out of the Cut-Throat Alley this week, and every one of them swears he's a stonemason." },
    { who = "b", text = "Half of them probably were, before the nobles stiffed them on the cathedral wages. Doesn't make the knives any duller, though." },
  } }

P:Exchange { id = "ex_sw_guard_prestor", a = { role = "guard" }, b = { role = "citizen" }, when = { zone = "Stormwind City" },
  lines = {
    { who = "b", text = "They say Lady Prestor has the regent's ear morning and night now, and the council does whatever she smiles at." },
    { who = "a", text = "I'd keep that kind of talk off the trade district, friend. The lady has a great many admirers in the keep." },
    { who = "b", text = "That's rather what worries me." },
  } }

P:Exchange { id = "ex_sw_vendor_taxes", a = { role = "vendor" }, b = { role = "citizen" }, when = { zone = "Stormwind City" },
  lines = {
    { who = "a", text = "Another tax on cloth, if you can believe it, and the crier swears it's all going to the walls." },
    { who = "b", text = "The walls have looked the same for three years. I think they're paying for someone's very nice curtains." },
  } }

P:Exchange { id = "ex_sw_inn_westfall", a = { role = "innkeeper" }, b = { role = "citizen" }, when = { zone = "Stormwind City" },
  lines = {
    { who = "b", text = "My cousin's farm in Westfall went to the Defias last spring, and the Stormwind army never so much as sent a letter." },
    { who = "a", text = "You're not the first to say it at this bar, and I doubt you'll be the last. Drink slow; it's a long winter for everyone." },
  } }

P:Exchange { id = "ex_sw_trainers_cathedral", a = { role = "trainer" }, b = { role = "trainer" }, when = { zone = "Stormwind City" },
  lines = {
    { who = "a", text = "The bishops want every novice in the cathedral at dawn prayers, even the ones who came in from the Barrens last night." },
    { who = "b", text = "The Light is patient, but I've never been sure the bishops are." },
  } }

P:Exchange { id = "ex_sw_child_king", a = { role = "child" }, b = { role = "citizen" }, when = { zone = "Stormwind City" },
  lines = {
    { who = "a", text = "Is it true the king just went away on a boat and never came home, and now his son has to be king instead?" },
    { who = "b", text = "Hush, now, and don't go saying that near the keep. Prince Anduin is only a boy, and the regent looks after things for him." },
  } }

P:Exchange { id = "ex_sw_guard_notice", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Stormwind City" },
  lines = {
    { who = "a", text = "Look sharp; there's another one coming through the gate with half the Burning Steppes still on their boots." },
    { who = "b", text = "A {race} {class}, by the look of it. At least this one's walking in under their own power." },
  } }

P:Exchange { id = "ex_if_guard_darkiron", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Ironforge" },
  lines = {
    { who = "a", text = "Caught a lad sniffin' about the vault doors last night, and I'd swear on my beard he had the look of a Dark Iron about him." },
    { who = "b", text = "Ye say that about every dwarf wi' a sunburn, Thurgan. Still, I'd sooner check twice than let one o' Thaurissan's brood near the gold." },
  } }

P:Exchange { id = "ex_if_tinker_refugee", a = { role = "citizen" }, b = { role = "citizen" }, when = { zone = "Ironforge", subzone = "Tinker Town" },
  lines = {
    { who = "a", text = "I've recalculated the radiation decay in Gnomeregan four times now, and by my best figures we can go home in roughly nine hundred years." },
    { who = "b", text = "Well, that's a great deal sooner than last week's estimate, so I'd call it progress." },
  } }

P:Exchange { id = "ex_if_smith_ore", a = { role = "blacksmith" }, b = { role = "citizen" }, when = { zone = "Ironforge" },
  lines = {
    { who = "a", text = "Price o' mithril's gone up again, and ye can thank the Dark Irons for squattin' on half the good veins in the Searing Gorge." },
    { who = "b", text = "Aye, and the other half are crawlin' wi' troggs. A dwarf can't swing a pick these days without hittin' somethin' that bites back." },
  } }

P:Exchange { id = "ex_if_inn_ale", a = { role = "innkeeper" }, b = { role = "citizen" }, when = { zone = "Ironforge" },
  lines = {
    { who = "b", text = "This is the third keg o' Thunderbrew ye've tapped tonight, and it's no' even past the supper bell." },
    { who = "a", text = "It's the Explorers' League, lad. They come back from Uldaman wi' tales o' titans and a thirst like a dry riverbed." },
  } }

P:Exchange { id = "ex_if_trainer_magni", a = { role = "trainer" }, b = { role = "trainer" }, when = { zone = "Ironforge" },
  lines = {
    { who = "a", text = "King Magni's been in the Hall o' Explorers again, starin' at those tablets like the stone might start talkin' to him." },
    { who = "b", text = "Leave the man be. If the titans did make us from the earth, I'd want to read about it too." },
  } }

P:Exchange { id = "ex_if_child_gnome", a = { role = "child" }, b = { role = "citizen" }, when = { zone = "Ironforge" },
  lines = {
    { who = "a", text = "The gnome boy in Tinker Town says he can make my pony fly if I let him borrow it for one afternoon." },
    { who = "b", text = "Ye'll do no such thing, lass. Last time a gnome made somethin' fly, we were sweepin' it off the Great Forge for a week." },
  } }

P:Exchange { id = "ex_da_sentinels_warsong", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Darnassus" },
  lines = {
    { who = "a", text = "The reports from Ashenvale grow darker by the week. The Warsong orcs fell trees as though the forest owed them a debt." },
    { who = "b", text = "Then the Sentinels will collect it, sister. Elune has watched over those groves for ten thousand years, and she is not done." },
  } }

P:Exchange { id = "ex_da_druids_dream", a = { role = "trainer" }, b = { role = "trainer" }, when = { zone = "Darnassus" },
  lines = {
    { who = "a", text = "Some of the younger druids speak of troubled sleep, as if something stirs uneasily at the edges of the Emerald Dream." },
    { who = "b", text = "The young always sleep poorly at first, shan'do. Still, I would not dismiss it out of hand; Malfurion himself has been quiet a long while." },
  } }

P:Exchange { id = "ex_da_vendor_dwarves", a = { role = "vendor" }, b = { role = "citizen" }, when = { zone = "Darnassus" },
  lines = {
    { who = "b", text = "Another boat of dwarves came into Rut'theran this morning, asking where the nearest tavern was before they asked anything else." },
    { who = "a", text = "We are allies now, and we must be gracious. But I confess I hid the moonberry wine until they had gone." },
  } }

P:Exchange { id = "ex_da_inn_highborne", a = { role = "innkeeper" }, b = { role = "citizen" }, when = { zone = "Darnassus" },
  lines = {
    { who = "b", text = "My grandmother still speaks of the Highborne as though she saw them only yesterday, and she becomes very cross with anyone who dabbles in magic." },
    { who = "a", text = "She did see them, and she remembers the cost of their folly better than any of us. Let her be cross; she has earned it." },
  } }

P:Exchange { id = "ex_da_child_moon", a = { role = "child" }, b = { role = "citizen" }, when = { zone = "Darnassus" },
  lines = {
    { who = "a", text = "If Elune lives in the moon, why does she let it go thin and dark sometimes?" },
    { who = "b", text = "Even the goddess rests, little one, and the moon always comes back full. That is the lesson, if you are patient enough to learn it." },
  } }

P:Exchange { id = "ex_da_guard_notice", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Darnassus" },
  lines = {
    { who = "a", text = "There walks another young one of the Alliance through the Craftsmen's Terrace, gazing up at the branches." },
    { who = "b", text = "Let them gaze, so long as they keep their torches far from the bark. Ishnu-alah, {class}." },
  } }

P:Exchange { id = "ex_og_grunts_ashenvale", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Orgrimmar" },
  lines = {
    { who = "a", text = "My brother writes from Ashenvale that the night elf archers strike from the trees and are gone before the blood hits the ground." },
    { who = "b", text = "Then the Warsong will cut down more trees until there is nowhere left to hide. Grom would not have flinched from it." },
  } }

P:Exchange { id = "ex_og_grunt_peon", a = { role = "guard" }, b = { role = "peon" }, when = { zone = "Orgrimmar" },
  lines = {
    { who = "a", text = "You there, peon, that crate belongs in the Valley of Strength, not in the middle of the gate where I can trip over it." },
    { who = "b", text = "Zug zug. Me move it. Me move it slow, though, because it very heavy." },
  } }

P:Exchange { id = "ex_og_vendor_camps", a = { role = "vendor" }, b = { role = "citizen" }, when = { zone = "Orgrimmar" },
  lines = {
    { who = "b", text = "My son complains that Durotar is nothing but red dust and scorpids, and he wants to know why we came here." },
    { who = "a", text = "Then tell him about the internment camps. Dust that belongs to us is better than green grass behind a human fence." },
  } }

P:Exchange { id = "ex_og_inn_kolkar", a = { role = "innkeeper" }, b = { role = "citizen" }, when = { zone = "Orgrimmar" },
  lines = {
    { who = "b", text = "The Kolkar centaur hit another caravan out on the Southfury road, and the raiders took every kodo they could catch." },
    { who = "a", text = "Then the warriors will ride out and make them pay for it. Sit, drink, and leave the anger for the battle." },
  } }

P:Exchange { id = "ex_og_trainers_shamans", a = { role = "trainer" }, b = { role = "trainer" }, when = { zone = "Orgrimmar" },
  lines = {
    { who = "a", text = "The young ones come to Thrall's shamans asking for lightning before they have learned to listen to a single stone." },
    { who = "b", text = "We were the same once, and the warlocks offered us faster power. We know how that ended, so we will teach them patience." },
  } }

P:Exchange { id = "ex_og_child_thrall", a = { role = "child" }, b = { role = "citizen" }, when = { zone = "Orgrimmar" },
  lines = {
    { who = "a", text = "When I grow up I'm going to be the Warchief, and I'll have a big wolf and a hammer just like Thrall's." },
    { who = "b", text = "Then you had better learn to carry water first, little grunt. Even Thrall did chores in the camps before he ever held a hammer." },
  } }

P:Exchange { id = "ex_og_grunt_notice", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Orgrimmar" },
  lines = {
    { who = "a", text = "That {race} walks like they have seen real fighting, not like the fresh grunts off the boats." },
    { who = "b", text = "Good. The Horde has enough talkers. Lok'tar, {class}." },
  } }

P:Exchange { id = "ex_tb_braves_grimtotem", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Thunder Bluff" },
  lines = {
    { who = "a", text = "The Grimtotem were seen near the Stonetalon trails again, and they did not lower their weapons when our scouts called out." },
    { who = "b", text = "Cairne hopes they will remember they are tauren before they remember their anger. I hope he is right, but I keep my spear close." },
  } }

P:Exchange { id = "ex_tb_vendor_kodo", a = { role = "vendor" }, b = { role = "citizen" }, when = { zone = "Thunder Bluff" },
  lines = {
    { who = "a", text = "The great kodo herds have been slow to come back to the plains this season, and the hides are thin." },
    { who = "b", text = "The rains were late as well. The Earth Mother gives in her own time, and we can only wait for her like the grass does." },
  } }

P:Exchange { id = "ex_tb_inn_orcs", a = { role = "innkeeper" }, b = { role = "citizen" }, when = { zone = "Thunder Bluff" },
  lines = {
    { who = "b", text = "An orc in the lift this morning asked me how we can live so high above the ground without getting dizzy." },
    { who = "a", text = "Did you tell him that the wind holds us up? It always makes them look over the edge, which is the best part." },
  } }

P:Exchange { id = "ex_tb_trainers_druids", a = { role = "trainer" }, b = { role = "trainer" }, when = { zone = "Thunder Bluff" },
  lines = {
    { who = "a", text = "The young druids on Elder Rise speak often of the night elves and their great tree, as though the kaldorei invented the old ways." },
    { who = "b", text = "Let them learn from whoever will teach them. Hamuul says the land listens to anyone who speaks to it with respect." },
  } }

P:Exchange { id = "ex_tb_child_lift", a = { role = "child" }, b = { role = "citizen" }, when = { zone = "Thunder Bluff" },
  lines = {
    { who = "a", text = "Can I ride the lift down and back up one more time, please, just once more before supper?" },
    { who = "b", text = "You have ridden it six times already, little calf. The lift-keeper will think you mean to live there." },
  } }

P:Exchange { id = "ex_tb_braves_notice", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Thunder Bluff" },
  lines = {
    { who = "a", text = "A {class} of the Horde comes up the lift. They have the dust of the Barrens on them." },
    { who = "b", text = "Then they have walked far, and they are welcome here. May the eternal sun shine upon you, traveler." },
  } }

P:Exchange { id = "ex_uc_guards_scarlet", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Undercity" },
  lines = {
    { who = "a", text = "The Scarlet Crusade burned three of our patrols outside Brill last week, and they sang hymns while they did it." },
    { who = "b", text = "They always sing. I used to know some of those hymns myself, before I died and learned how little the Light cared." },
  } }

P:Exchange { id = "ex_uc_apothecaries", a = { role = "trainer" }, b = { role = "citizen" }, when = { zone = "Undercity" },
  lines = {
    { who = "b", text = "The Royal Apothecary Society has been ordering a great many rat cages lately, and nobody will say what for." },
    { who = "a", text = "Then nobody is meant to know, and a wise corpse would stop asking. The Dark Lady has her reasons." },
  } }

P:Exchange { id = "ex_uc_vendor_living", a = { role = "vendor" }, b = { role = "citizen" }, when = { zone = "Undercity" },
  lines = {
    { who = "a", text = "An orc came in this morning and held his breath the entire time he bought from me, as though death were catching." },
    { who = "b", text = "For him it might be. Our allies are fond of us in the way one is fond of a useful knife." },
  } }

P:Exchange { id = "ex_uc_inn_memory", a = { role = "innkeeper" }, b = { role = "citizen" }, when = { zone = "Undercity" },
  lines = {
    { who = "b", text = "I passed my old house on the road to Lordaeron yesterday, and somebody had planted roses where my wife kept her herbs." },
    { who = "a", text = "The living do love to tidy up after us. Do you want something to drink, or would you rather just stand there and remember?" },
  } }

P:Exchange { id = "ex_uc_guards_scourge", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Undercity" },
  lines = {
    { who = "a", text = "The Scourge are thicker than ever around Andorhal, and the Lich King still calls to some of us in the dark." },
    { who = "b", text = "Let him call. I belong to Sylvanas now, and I'd sooner rot in the sewers than answer that voice again." },
  } }

P:Exchange { id = "ex_uc_child_none", a = { role = "citizen" }, b = { role = "citizen" }, when = { zone = "Undercity" },
  lines = {
    { who = "a", text = "A child's ghost has been wandering the Apothecarium again, asking everyone for its mother." },
    { who = "b", text = "Someone should tell it the truth, and someone should tell it kindly. I doubt we have anyone left who can do both." },
  } }

P:Exchange { id = "ex_bb_vendor_pirates", a = { role = "vendor" }, b = { role = "citizen" }, when = { zone = "Stranglethorn Vale", subzone = "Booty Bay" },
  lines = {
    { who = "a", text = "Bloodsail raided another supply ship off the coast, and you know who's paying for it? Me, that's who, because insurance went up twelve percent overnight." },
    { who = "b", text = "Pass it on to the customers, pal, same as everybody else does. That's what customers are for." },
  } }

P:Exchange { id = "ex_bb_inn_shark", a = { role = "innkeeper" }, b = { role = "citizen" }, when = { zone = "Stranglethorn Vale", subzone = "Booty Bay" },
  lines = {
    { who = "b", text = "Somebody fell off the docks last night and the sharks got him before the bouncers could even finish laughing." },
    { who = "a", text = "Did he settle his tab first? Tell me he settled his tab, because I'm not chasing a shark for six silver." },
  } }

P:Exchange { id = "ex_bb_guard_tournament", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Stranglethorn Vale", subzone = "Booty Bay" },
  lines = {
    { who = "a", text = "Listen, listen, if one more hunter drags a dead tiger through the bank lobby, I'm charging the cleaning fee to the Hemet Nesingwary fan club." },
    { who = "b", text = "Good luck with that, buddy. Nesingwary doesn't pay, he just writes another book about it." },
  } }

P:Exchange { id = "ex_bb_banker_neutral", a = { role = "banker" }, b = { role = "citizen" }, when = { zone = "Stranglethorn Vale", subzone = "Booty Bay" },
  lines = {
    { who = "a", text = "Horde deposit at the left window, Alliance deposit at the right window, and both of them glaring at each other like I'm not even here." },
    { who = "b", text = "As long as the gold's the same color, sweetheart, who cares who's glaring?" },
  } }

P:Exchange { id = "ex_gz_guard_wastewander", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Tanaris", subzone = "Gadgetzan" },
  lines = {
    { who = "a", text = "Wastewander bandits tried the east wall again last night, so we gave 'em the new cannon, and it only blew up a little bit." },
    { who = "b", text = "A little bit is Marin's whole left eyebrow, but sure, I'd call that a successful field test." },
  } }

P:Exchange { id = "ex_gz_vendor_water", a = { role = "vendor" }, b = { role = "citizen" }, when = { zone = "Tanaris", subzone = "Gadgetzan" },
  lines = {
    { who = "b", text = "Five silver for a canteen of water? On my mother's ledger, that's highway robbery." },
    { who = "a", text = "It's desert robbery, friend, which is a completely different tax bracket. The water comes a long way and so does the markup." },
  } }

P:Exchange { id = "ex_gz_inn_venture", a = { role = "innkeeper" }, b = { role = "citizen" }, when = { zone = "Tanaris", subzone = "Gadgetzan" },
  lines = {
    { who = "b", text = "Some Venture Company suit came in asking about land prices, and I told him the only thing for sale out here is sand." },
    { who = "a", text = "Don't joke, kid, because they'll buy the sand. Then they'll charge us rent to stand on it." },
  } }

P:Exchange { id = "ex_ra_vendor_barrens", a = { role = "vendor" }, b = { role = "citizen" }, when = { zone = "The Barrens", subzone = "Ratchet" },
  lines = {
    { who = "a", text = "Horde caravan wants a discount 'cause the Kolkar shot their kodo full of arrows on the way here, and I'm sympathetic, I really am." },
    { who = "b", text = "So what'd you charge 'em?" },
    { who = "a", text = "Full price plus a little extra for the sympathy, which ain't free, pal." },
  } }

P:Exchange { id = "ex_ra_guards_boat", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "The Barrens", subzone = "Ratchet" },
  lines = {
    { who = "a", text = "Boat to Booty Bay's late again, and there's a line of orcs and humans on the dock tryin' very hard not to stab each other." },
    { who = "b", text = "Sell 'em some snacks while they wait. Nothin' keeps the peace like overpriced fish on a stick." },
  } }

P:Exchange { id = "ex_ra_venture", a = { role = "citizen" }, b = { role = "citizen" }, when = { zone = "The Barrens", subzone = "Ratchet" },
  lines = {
    { who = "a", text = "Heard the Venture Company's cuttin' down half the trees in Stonetalon, and the tauren are fit to be tied about it." },
    { who = "b", text = "Bad for the tauren, sure, but lumber prices are down, so I gotta say I'm conflicted." },
  } }

P:Exchange { id = "ex_el_inn_cold", a = { role = "innkeeper" }, b = { role = "citizen" }, when = { zone = "Winterspring", subzone = "Everlook" },
  lines = {
    { who = "b", text = "My toes went numb walkin' in from Frostsaber Rock, and I think one of 'em's still out there." },
    { who = "a", text = "Firewood's two silver a log, buddy, and toes are extra. Everlook ain't cheap because Winterspring ain't warm." },
  } }

P:Exchange { id = "ex_el_guard_furbolg", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Winterspring", subzone = "Everlook" },
  lines = {
    { who = "a", text = "The Winterfall furbolgs are actin' strange again, all red-eyed and mean, like somebody slipped 'em somethin' nasty." },
    { who = "b", text = "Somebody probably did, and if I find out who, I'm sendin' 'em an invoice for every guard they mauled." },
  } }

P:Exchange { id = "ex_el_vendor_yeti", a = { role = "vendor" }, b = { role = "citizen" }, when = { zone = "Winterspring", subzone = "Everlook" },
  lines = {
    { who = "a", text = "Yeti hides are sellin' like crazy this season, sparks and sprockets, I can't keep 'em on the rack." },
    { who = "b", text = "That's 'cause every adventurer up here keeps gettin' punched off a cliff by one and wants revenge." },
  } }

P:Exchange { id = "ex_al_goldshire_kobolds", a = { role = "citizen" }, b = { role = "citizen" }, when = { zone = "Elwynn Forest", faction = "Alliance" },
  lines = {
    { who = "a", text = "The kobolds came up out of the Jasperlode mine again and stole every candle in my cellar, can you imagine it?" },
    { who = "b", text = "You no take candle, they always say. I've never understood what they want with them all." },
  } }

P:Exchange { id = "ex_al_goldshire_inn", a = { role = "innkeeper" }, b = { role = "citizen" }, when = { zone = "Elwynn Forest", subzone = "Goldshire", faction = "Alliance" },
  lines = {
    { who = "b", text = "There's a man upstairs who's been playing the same three notes on his lute for an hour." },
    { who = "a", text = "He's been at it since Tuesday. I've started charging him for the room by the note." },
  } }

P:Exchange { id = "ex_al_westfall_harvest", a = { role = "citizen" }, b = { role = "citizen" }, when = { zone = "Westfall", faction = "Alliance" },
  lines = {
    { who = "a", text = "The harvest golems in the Molsen field have started walking about at night, and nobody's working the levers." },
    { who = "b", text = "That'll be the Defias again. They'd steal the sun out of the sky if they could find a buyer for it." },
  } }

P:Exchange { id = "ex_al_westfall_guard", a = { role = "guard" }, b = { role = "citizen" }, when = { zone = "Westfall", faction = "Alliance" },
  lines = {
    { who = "b", text = "Is Stormwind ever going to send more soldiers out here, or is the People's Militia all we're going to get?" },
    { who = "a", text = "I've asked, and I'll keep asking. Until then, lock your doors and keep a pitchfork by the bed." },
  } }

P:Exchange { id = "ex_al_redridge_orcs", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Redridge Mountains", faction = "Alliance" },
  lines = {
    { who = "a", text = "The Blackrock orcs were burning watchfires above Lakeshire all night, bold as you like." },
    { who = "b", text = "Let them burn. As long as the bridge holds, they can glare at us across the water till spring." },
  } }

P:Exchange { id = "ex_al_redridge_fish", a = { role = "vendor" }, b = { role = "citizen" }, when = { zone = "Redridge Mountains", subzone = "Lakeshire", faction = "Alliance" },
  lines = {
    { who = "b", text = "The murlocs have been stealing nets off the docks again, and now they're selling the fish back to us, I swear it." },
    { who = "a", text = "I'd not be surprised. They're smarter than the magistrate gives them credit for, and that's not saying much." },
  } }

P:Exchange { id = "ex_al_duskwood_worgen", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Duskwood", faction = "Alliance" },
  lines = {
    { who = "a", text = "Something was howling out past the Raven Hill road last night, and it didn't sound like any wolf I've ever heard." },
    { who = "b", text = "Keep the lanterns lit and don't go walking alone, and don't ask too many questions about what it was." },
  } }

P:Exchange { id = "ex_al_duskwood_inn", a = { role = "innkeeper" }, b = { role = "citizen" }, when = { zone = "Duskwood", subzone = "Darkshire", faction = "Alliance" },
  lines = {
    { who = "b", text = "Old Abercrombie bought another batch of thread and a whole crate of bandages, and he lives alone out there." },
    { who = "a", text = "He's a strange one, but strange is common in Darkshire. Just don't take him up on supper." },
  } }

P:Exchange { id = "ex_al_lochmodan_dam", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Loch Modan", faction = "Alliance" },
  lines = {
    { who = "a", text = "Troggs got as far as the Stonewrought Dam again, and one o' them was chewin' on a rock like it was a biscuit." },
    { who = "b", text = "Aye, and the mountaineers chased 'em off, but they'll be back. They breed faster than rabbits in a warm burrow." },
  } }

P:Exchange { id = "ex_al_teldrassil", a = { role = "citizen" }, b = { role = "citizen" }, when = { zone = "Teldrassil", faction = "Alliance" },
  lines = {
    { who = "a", text = "The Gnarlpine furbolgs were our friends once, and now they hurl stones at anyone who walks near their dens." },
    { who = "b", text = "Something has poisoned their hearts. I pray the druids learn what it is before we must raise our bows against them." },
  } }

P:Exchange { id = "ex_al_ashenvale_sentinels", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Ashenvale", faction = "Alliance" },
  lines = {
    { who = "a", text = "Warsong axes again near the Splintertree road, and the forest goes quiet wherever they work." },
    { who = "b", text = "Then we will be quieter still. They hear nothing until our arrows find them." },
  } }

P:Exchange { id = "ex_ho_durotar_quilboar", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Durotar", faction = "Horde" },
  lines = {
    { who = "a", text = "The Burning Blade cultists in Skull Rock keep summoning their little fire demons, as if we did not burn enough for that kind of power." },
    { who = "b", text = "Then we will burn them out. Shame is not something the Horde forgets, and neither are those who would bring it back." },
  } }

P:Exchange { id = "ex_ho_durotar_razor", a = { role = "peon" }, b = { role = "guard" }, when = { zone = "Durotar", subzone = "Razor Hill", faction = "Horde" },
  lines = {
    { who = "a", text = "Me fall asleep under tree, and boss come yell at me, but there no trees here anyway." },
    { who = "b", text = "Then how did you fall asleep under one, peon? Back to work before I find a tree to hang you from." },
  } }

P:Exchange { id = "ex_ho_barrens_crossroads", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "The Barrens", subzone = "The Crossroads", faction = "Horde" },
  lines = {
    { who = "a", text = "The Kolkar have been bold this season, striking the Crossroads walls and running before we can mount." },
    { who = "b", text = "Then we stop mounting and start running faster. A grunt's legs are as good as any raptor's." },
  } }

P:Exchange { id = "ex_ho_barrens_harpies", a = { role = "citizen" }, b = { role = "citizen" }, when = { zone = "The Barrens", faction = "Horde" },
  lines = {
    { who = "a", text = "The harpies stole my good blanket off the line again, and I watched one fly off wearing it like a cape." },
    { who = "b", text = "At least it is warm in the Barrens, and you will not miss it until winter." },
  } }

P:Exchange { id = "ex_ho_mulgore_quilboar", a = { role = "guard" }, b = { role = "citizen" }, when = { zone = "Mulgore", faction = "Horde" },
  lines = {
    { who = "b", text = "Palemane gnolls were seen near Bloodhoof again, digging at the grave mounds of our ancestors." },
    { who = "a", text = "Then the braves will walk those hills at night, and the spirits will help us drive them out." },
  } }

P:Exchange { id = "ex_ho_tirisfal_brill", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Tirisfal Glades", faction = "Horde" },
  lines = {
    { who = "a", text = "The Scarlets marched past Brill again this morning, waving their banners and shouting about purification." },
    { who = "b", text = "Let them shout. We have a great deal of patience now, and an unlimited supply of graves." },
  } }

P:Exchange { id = "ex_ho_tirisfal_inn", a = { role = "innkeeper" }, b = { role = "citizen" }, when = { zone = "Tirisfal Glades", subzone = "Brill", faction = "Horde" },
  lines = {
    { who = "b", text = "Someone ordered a meal at the counter, and I had to remind them they have not had a stomach for three years." },
    { who = "a", text = "Habit is the last thing to die, and the second-to-last thing to rot. Serve them the broth anyway; it smells familiar." },
  } }

P:Exchange { id = "ex_ho_ashenvale_warsong", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Ashenvale", faction = "Horde" },
  lines = {
    { who = "a", text = "Every tree we take down, the night elves take a grunt in return. It is a bad price, but Orgrimmar needs the wood." },
    { who = "b", text = "Hellscream died in these woods to free us. We will not run from them now." },
  } }

P:Exchange { id = "ex_rx_warlock_sw", a = { role = "guard" }, b = { role = "citizen" }, when = { pet = { type = "Demon" }, zone = "Stormwind City", class = "WARLOCK" },
  lines = {
    { who = "b", text = "Did you see that? There's a demon walking down the street behind that one, plain as day, and nobody's stopping it." },
    { who = "a", text = "The Mage Quarter vouches for them, more's the pity. Keep your children close and your opinions closer." },
  } }

P:Exchange { id = "ex_rx_warlock_og", a = { role = "guard" }, b = { role = "guard" }, when = { pet = { type = "Demon" }, zone = "Orgrimmar", class = "WARLOCK" },
  lines = {
    { who = "a", text = "Another warlock passes with a demon at heel, and the shamans in the Valley of Wisdom will not look at them." },
    { who = "b", text = "We remember what that power cost us. Watch that one, {class}, and watch the thing that follows." },
  } }

P:Exchange { id = "ex_rx_night_guard", a = { role = "guard" }, b = { role = "guard" }, when = { timeOfDay = "night", faction = "Alliance", zone = { "Stormwind City", "Ironforge", "Elwynn Forest" } },
  lines = {
    { who = "a", text = "Quiet night so far, but quiet's when the thieves come out, so keep your eyes on the alleys." },
    { who = "b", text = "Somebody's still out walking, though. A {race}, out at this hour; I hope they know what they're doing." },
  } }

P:Exchange { id = "ex_rx_night_horde", a = { role = "guard" }, b = { role = "guard" }, when = { timeOfDay = "night", faction = "Horde", zone = { "Orgrimmar", "Durotar", "The Barrens" } },
  lines = {
    { who = "a", text = "The fires burn low and the scorpids come out to hunt. I do not like the desert at night." },
    { who = "b", text = "Then stand closer to the fire, and stop complaining like a peon." },
  } }

P:Exchange { id = "ex_rx_ghost", a = { role = "citizen" }, b = { role = "citizen" }, when = { ghost = true },
  lines = {
    { who = "a", text = "Did you feel that? It went cold all of a sudden, right down the back of my neck." },
    { who = "b", text = "Someone walking over your grave, my gran used to say. I'd rather they walked over someone else's." },
  } }

P:Exchange { id = "ex_rx_paladin_if", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Ironforge", class = "PALADIN" },
  lines = {
    { who = "a", text = "There goes one o' the Silver Hand, polished up like a new kettle." },
    { who = "b", text = "Uther's lot or no', I'm glad o' one more hammer on our side. Light be wi' ye, {class}." },
  } }

P:Exchange { id = "ex_rx_hallow", a = { role = "citizen" }, b = { role = "citizen" }, when = { holiday = "hallowsend" },
  lines = {
    { who = "a", text = "The children have been running through the streets in masks all evening, and one of them stole my hat." },
    { who = "b", text = "That's the spirit of the season. Just be thankful it was only your hat." },
  } }
