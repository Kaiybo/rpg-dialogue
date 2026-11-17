-- Troll throughlines: the Darkspear's lost isles (Durotar, Orgrimmar), the blood priests of
-- Zul'Gurub (Stranglethorn, Tanaris; both factions) and the troll wars of the Hinterlands
-- (Aerie Peak for the Alliance, Revantusk Village for the Horde). Beats connect existing
-- Year 1 storylines (Zalazane; the Zandalar on Yojamba Isle and Yeh'kinya's egg; Sharpbeak
-- and the Vile Priestess Hexx) and invent no events. The Echo Isles are not retaken here,
-- and nothing later is foreshadowed.
local P = RPGDialogueAPI:Pack("rpgd.world")
local TODO_QUEST = P.TODO_QUEST

-- The Darkspear and Zalazane. Gadrin taught him, Vol'jin swam with him as a boy, and the
-- hexed on the Echo Isles still wear Darkspear faces. Vol'jin asks the player what they are
-- to the tribe now, and the player decides the ending.
P:Thread {
  id = "darkspear_isles",
  theme = "The Darkspear lost their isles to one of their own, and the hexed who walk there still wear the tribe's faces.",
  title = "The hexed of the Echo Isles",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "Master Gadrin taught Zalazane once, and now Zalazane holds the Echo Isles with trolls he has hexed into puppets. Gadrin says the shame of it keeps him up at night, and he says it as though the shame were his.",
      third = "{name} heard Master Gadrin speak of Zalazane, the student who took the Echo Isles from the Darkspear." },
    unfolding = { first = "Lar Prowltusk watches the isles at dusk and knows some of the hexed by name, and Gar'Thok says Razor Hill leans on Darkspear scouts who lost more than his grunts ever did. The hexed on the isles were Darkspear, and nobody in Sen'jin is quite sure what they are now.",
      third = "{name} heard the Darkspear of Durotar speak of the hexed on the Echo Isles as kin they had not yet stopped mourning." },
    resolved = { first = "I told Vol'jin the hexed are still Darkspear, and that they deserve to be freed and named. He said Sen'jin would say their names at the fire, and that Zalazane would hate every one of them.",
      third = "{name} told Vol'jin that the hexed of the Echo Isles were still Darkspear, and Vol'jin had their names said at Sen'jin's fire." },
    soured = { first = "I told Vol'jin the hexed belong to Zalazane now and should be counted with the enemy. He agreed in the voice of a chief, and then he looked away from me the way a man does when he's agreed to something he hates.",
      third = "{name} told Vol'jin to count the hexed of the Echo Isles among the enemy, and Vol'jin agreed without warmth." },
  },
  npcs = { "gadrin", "larprowltusk", "garthok", "voljin" },
  states = { "dormant", "stirring", "unfolding", "resolved", "soured" },
  endings = {
    resolved = "The player told Vol'jin the hexed are still Darkspear. Sen'jin says their names at the fire.",
    soured = "The player told Vol'jin to count the hexed among the enemy. Vol'jin agreed, and didn't like it.",
  },
  pacing = { minConversations = 3, minSeconds = 1200 },
  reflection = {
    first = "Every Darkspear I've met looks east across the water at some point while they talk, and none of them seem to know they do it.",
    third = "{name} had noticed that the Darkspear of Durotar always looked east toward the Echo Isles while they spoke.",
  },
  beats = {
    {
      id = "b1_gadrin", npc = "gadrin",
      when = { minLevel = 6, faction = "Horde", thread = { id = "darkspear_isles", notBeat = "b1_gadrin" } },
      text = "You see the isles from the shore there, {class}, close enough to swim if a troll be foolish. Zalazane hold them with our own people, hexed so deep they don't know their mothers, and every one of them Gadrin can see from here be a Darkspear who still need to be brought home, one way or another.",
      fx = { thread = { id = "darkspear_isles", beat = "b1_gadrin", state = "stirring" }, learn = { "echo_isles" } },
    },
    {
      id = "b2_larprowltusk", npc = "larprowltusk",
      when = { faction = "Horde", thread = { id = "darkspear_isles", notBeat = "b2_larprowltusk" } },
      text = "I be paid to watch the ridge to the west, but at dusk my eyes go east to the isles, and I can't stop them. My cousin's boy be out there with Zalazane's hex on him, mon, and when the hexed come down to the water I look for his walk before I raise my bow.",
      fx = { thread = { id = "darkspear_isles", beat = "b2_larprowltusk", state = "unfolding" } },
    },
    {
      id = "b3_garthok", npc = "garthok",
      when = { faction = "Horde", any = { { thread = { id = "darkspear_isles", beat = "b1_gadrin" } }, { thread = { id = "darkspear_isles", beat = "b2_larprowltusk" } } },
               ["not"] = { thread = { id = "darkspear_isles", beat = "b3_garthok" } } },
      text = "Half the scouts who watch my roads are Darkspear, and they do it without complaint, though they lost their whole home and I only lost a few grunts to Tiragarde. When a troll asks me for leave to sit on the shore at Sen'jin for a night, I give it, and I don't ask what for.",
      fx = { thread = { id = "darkspear_isles", beat = "b3_garthok", state = "unfolding" } },
    },
    {
      id = "b4_gadrin", npc = "gadrin",
      when = { questDone = TODO_QUEST("Zalazane"), thread = { id = "darkspear_isles", notBeat = "b4_gadrin" } },
      text = "You bring Gadrin his student's head, and the old man thank you for it, but listen to the drums on the isles tonight and tell me if they stop. The hexed still walk out there, {class}, because a curse that deep don't die with the one who cast it, and they still be our people under it.",
      fx = { thread = { id = "darkspear_isles", beat = "b4_gadrin", state = "unfolding" } },
    },
    {
      id = "b5_voljin", npc = "voljin",
      when = { all = { { any = { { thread = { id = "darkspear_isles", beat = "b1_gadrin" } }, { thread = { id = "darkspear_isles", beat = "b4_gadrin" } } } },
                       { any = { { thread = { id = "darkspear_isles", beat = "b2_larprowltusk" } }, { thread = { id = "darkspear_isles", beat = "b3_garthok" } }, { thread = { id = "darkspear_isles", beat = "b4_gadrin" } } } } },
               ["not"] = { thread = { id = "darkspear_isles", beat = "b5_voljin" } } },
      text = "You been talkin' to my people on the shore, mon, I can smell the sea on you. They all want to know the same thing and none of them ask it, so Vol'jin will ask you instead, because you be outside the tribe and see it straighter: the hexed on the isles, what be they to us now?",
      fx = { thread = { id = "darkspear_isles", beat = "b5_voljin", state = "unfolding" } },
    },
  },
}

-- Hakkar's blood priests. The Zandalar came across the sea to Yojamba Isle because the
-- Gurubashi priests of Zul'Gurub are calling their Soulflayer back. Horde and Alliance hear
-- the drums from Grom'gol and the Rebel Camp, and Yeh'kinya in Tanaris studies the god a
-- little too fondly. It resolves when Hakkar falls.
P:Thread {
  id = "blood_god",
  theme = "The Gurubashi priests are calling Hakkar back, and everyone who hears the drums agrees on nothing else.",
  title = "The Soulflayer's priests",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "The Zandalari Emissary in Booty Bay says the priests of Zul'Gurub are calling their Soulflayer back into the world, and that his people sailed from their islands because of it. He said it as calmly as a man reads the weather, and that frightened me more than shouting would.",
      third = "{name} heard the Zandalarian Emissary in Booty Bay say that Zul'Gurub's priests were calling Hakkar back." },
    unfolding = { first = "Mok'thardin feels the jungle's blood running wrong, and Brother Nimetz treats men who wake screaming from drums they heard miles away. In Tanaris, old Yeh'kinya talks about the Soulflayer more warmly than anyone should.",
      third = "{name} heard the drums of Zul'Gurub spoken of at Grom'gol, at the Rebel Camp and by the water in Tanaris." },
    resolved = { first = "Hakkar is cast down, and the Zandalar raised their banner over the coast for it. The Emissary said the Gurubashi have a long memory and few gods left, and I couldn't tell whether that was meant to comfort me.",
      third = "{name} saw Hakkar cast down in Zul'Gurub, and heard the Zandalar give thanks for it on the coast." },
  },
  npcs = { "zandalari_emissary", "mokthardin", "nimetz", "yehkinya" },
  states = { "dormant", "stirring", "unfolding", "resolved" },
  endings = {
    resolved = "Hakkar is cast down in Zul'Gurub, and the Zandalar give thanks on the coast.",
  },
  pacing = { minConversations = 3, minSeconds = 1200 },
  reflection = {
    first = "Orc, human and troll alike, everyone in Stranglethorn says they can hear the drums at night, and nobody says it as though they were joking.",
    third = "{name} had heard the drums of Zul'Gurub spoken of by orcs, humans and trolls alike.",
  },
  beats = {
    {
      id = "b1_emissary", npc = "zandalari_emissary",
      when = { minLevel = 40, thread = { id = "blood_god", notBeat = "b1_emissary" } },
      text = "Listen to de jungle tonight, stranger, and under de birds you will hear drums from Zul'Gurub. Dose are de Soulflayer's priests singing him back into dis world, and de Zandalar do not cross an ocean for small things, so you may take our coming as de measure of it.",
      fx = { thread = { id = "blood_god", beat = "b1_emissary", state = "stirring" } },
    },
    {
      id = "b2_mokthardin", npc = "mokthardin",
      when = { minLevel = 35, faction = "Horde", thread = { id = "blood_god", notBeat = "b2_mokthardin" } },
      text = "The tigers I study have changed this season, {class}, and the blood I draw from them runs darker than it should. Something in the east of this jungle is drinking the old power out of the land faster than the land can make it, and I think we both know where the drums come from.",
      fx = { thread = { id = "blood_god", beat = "b2_mokthardin", state = "unfolding" } },
    },
    {
      id = "b2_nimetz", npc = "nimetz",
      when = { minLevel = 35, faction = "Alliance", thread = { id = "blood_god", notBeat = "b2_nimetz" } },
      text = "Two of the men woke screaming last night, and both of them swore they'd heard drums to the east, though the sentries heard nothing at all. I've stopped telling them it's fever, because I no longer believe it, and a healer who lies to his patients soon has none who'll listen.",
      fx = { thread = { id = "blood_god", beat = "b2_nimetz", state = "unfolding" } },
    },
    {
      id = "b3_yehkinya", npc = "yehkinya",
      when = { minLevel = 45, any = { { thread = { id = "blood_god", beat = "b1_emissary" } }, { thread = { id = "blood_god", beat = "b2_mokthardin" } }, { thread = { id = "blood_god", beat = "b2_nimetz" } } },
               ["not"] = { thread = { id = "blood_god", beat = "b3_yehkinya" } } },
      text = "So the Zandalar have come out of the sea to tell everybody the Soulflayer is waking, have they, mon? They look down their long noses at an old troll who studies the god instead of cursing him, but Yeh'kinya says you can't keep a thing asleep if you don't know how it wakes.",
      fx = { thread = { id = "blood_god", beat = "b3_yehkinya", state = "unfolding" } },
    },
    {
      id = "b4_emissary", npc = "zandalari_emissary",
      when = { any = { { cleared = "Zul'Gurub" }, { questDone = TODO_QUEST("The Heart of Hakkar") } },
               thread = { id = "blood_god", notBeat = "b4_emissary" } },
      text = "De drums are silent, and Molthor has raised de Spirit of Zandalar over dis coast because of what you did in dat city. But de Gurubashi have a long memory and very few gods left to them, stranger, and a people with no gods will go looking for new ones.",
      fx = { thread = { id = "blood_god", beat = "b4_emissary", state = "resolved" } },
    },
  },
}

-- The Hinterlands. Each faction walks its own side of the same troll war: the Wildhammer of
-- Aerie Peak against the Witherbark and Vilebranch, and the Revantusk, forest trolls who
-- keep faith with the Horde, against the same Vilebranch. Faction-gated beats; it resolves on
-- Sharpbeak's rescue for the Alliance or the death of Hexx for the Horde.
P:Thread {
  id = "hinterlands_trolls",
  theme = "The Wildhammer and the Revantusk fight the same Vilebranch on the same hill, and neither will say so.",
  title = "The hills above Jintha'Alor",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "The Vilebranch hold Jintha'Alor and the Witherbark hold the western woods, and whoever I ask in the Hinterlands has a grievance against them. The people I asked call these hills their own, and so do the trolls.",
      third = "{name} learned that the trolls of the Hinterlands held Jintha'Alor and the western woods, and that everyone else had a grievance against them." },
    unfolding = { first = "The Vilebranch spill blood on their altars and keep prisoners at the top of Jintha'Alor, and the people who sent me after them talk about the hill as though it were a wound that won't close. Somewhere on the far side of these hills, other folk are fighting the same trolls, and nobody here wants to hear about them.",
      third = "{name} followed the Vilebranch to Jintha'Alor, and found that more than one people was fighting them." },
    resolved = { first = "I went to the top of Jintha'Alor, and the people who sent me drank to what I did there. The Vilebranch still hold the hill, and nobody in the Hinterlands believes it will stay quiet for long.",
      third = "{name} struck at the summit of Jintha'Alor, though the Vilebranch still held the hill." },
  },
  npcs = { "falstad", "fraggar", "torntusk", "otho" },
  states = { "dormant", "stirring", "unfolding", "resolved" },
  endings = {
    resolved = "Sharpbeak is home at Aerie Peak, or Hexx is dead at the summit; the Vilebranch still hold Jintha'Alor.",
  },
  pacing = { minConversations = 3, minSeconds = 1200 },
  reflection = {
    first = "In the Hinterlands everyone points at Jintha'Alor when they talk about trouble, as though the whole country had one sore tooth.",
    third = "{name} had noticed that everyone in the Hinterlands pointed toward Jintha'Alor when they spoke of trouble.",
  },
  beats = {
    -- Alliance: Aerie Peak
    {
      id = "b1_falstad", npc = "falstad",
      when = { minLevel = 40, faction = "Alliance", thread = { id = "hinterlands_trolls", notBeat = "b1_falstad" } },
      text = "The Witherbark creep at us from the western woods, an' the Vilebranch sit up on Jintha'Alor wi' their altars, an' both o' them call these hills their own. Well, so do we, {class}, an' a Wildhammer on a gryphon has a better view o' the argument than any troll.",
      fx = { thread = { id = "hinterlands_trolls", beat = "b1_falstad", state = "stirring" } },
    },
    {
      id = "b2_fraggar", npc = "fraggar",
      when = { faction = "Alliance", any = { { thread = { id = "hinterlands_trolls", beat = "b1_falstad" } }, { questDone = TODO_QUEST("Troll Necklace Bounty") } },
               ["not"] = { thread = { id = "hinterlands_trolls", beat = "b2_fraggar" } } },
      text = "The spirits tell me there's trolls in the south o' these hills, by the water, that fight the Vilebranch as hard as we do, an' I've no' told the Thane, for he'd no' thank me. The land doesnae care whose axe it is, {class}, only that the blood stops runnin' down that hill.",
      fx = { thread = { id = "hinterlands_trolls", beat = "b2_fraggar", state = "unfolding" } },
    },
    {
      id = "b3_falstad", npc = "falstad",
      when = { faction = "Alliance", questDone = TODO_QUEST("Saving Sharpbeak"), thread = { id = "hinterlands_trolls", notBeat = "b3_falstad" } },
      text = "Sharpbeak's back in the aviary an' the Vilebranch have one less thing tae gloat over, an' I'll drink tae that every night this week. Mind, they've still got their hill an' their altars, so don't go thinkin' we've seen the last o' them.",
      fx = { thread = { id = "hinterlands_trolls", beat = "b3_falstad", state = "resolved" } },
    },
    -- Horde: Revantusk Village
    {
      id = "b1_torntusk", npc = "torntusk",
      when = { minLevel = 40, faction = "Horde", thread = { id = "hinterlands_trolls", notBeat = "b1_torntusk" } },
      text = "The Vilebranch call the Revantusk traitors, mon, because we keep faith with the orcs and they keep faith with nothing but their altars. Up on Jintha'Alor they got my mate, and down on Aerie Peak the dwarves got their birds, and the Revantusk sit in the middle with spears pointed both ways.",
      fx = { thread = { id = "hinterlands_trolls", beat = "b1_torntusk", state = "stirring" } },
    },
    {
      id = "b2_otho", npc = "otho",
      when = { faction = "Horde", any = { { thread = { id = "hinterlands_trolls", beat = "b1_torntusk" } }, { questDone = TODO_QUEST("Message to the Wildhammer") } },
               ["not"] = { thread = { id = "hinterlands_trolls", beat = "b2_otho" } } },
      text = "Primal Torntusk say the Vilebranch first and the Wildhammer after, and Otho listen, mon, because she be the chief. But the dwarves fly over Jintha'Alor every day and never once drop a hammer on it, so Otho think they be happy to let the Vilebranch keep us busy.",
      fx = { thread = { id = "hinterlands_trolls", beat = "b2_otho", state = "unfolding" } },
    },
    {
      id = "b3_torntusk", npc = "torntusk",
      when = { faction = "Horde", questDone = TODO_QUEST("Wanted: Vile Priestess Hexx and Her Minions"), thread = { id = "hinterlands_trolls", notBeat = "b3_torntusk" } },
      text = "Hexx be dead on her own altar, and the whole village drank to your name last night, mon. The Vilebranch still crawl over that hill and they'll find a new priestess soon, but tonight they be afraid of the Revantusk, and Torntusk will take that.",
      fx = { thread = { id = "hinterlands_trolls", beat = "b3_torntusk", state = "resolved" } },
    },
  },
}
