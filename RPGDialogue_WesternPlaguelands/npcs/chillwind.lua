-- Chillwind Camp: Stormwind's foothold at the southern edge of the Plaguelands. Voice: bibles/westernplaguelands.md
local P = RPGDialogueAPI:Pack("rpgd.westernplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "valorfist", id = TODO_NPC("Commander Ashlam Valorfist"), name = "Commander Ashlam Valorfist",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "major",
  communities = { "chillwind_camp" }, temper = { "steady", "proud" }, values = { "dutiful", "brave" },
  likesTone = "blunt",
  prejudice = { class = "WARLOCK", amount = 12, why = "Buried soldiers at Andorhal who trusted a demon-caller; the Cult began with people who thought the dark could be leashed." },
  notices = { "class", "kit", "lock_shadow", "lock_stones" },

  impression = {
    first = "He writes the letters himself when a soldier doesn't come back.",
    third = "{name} met Commander Ashlam Valorfist, who holds Chillwind Camp for Stormwind against the dead of Andorhal.",
  },

  greetings = {
    { id = "g_hu", when = { race = "Human" }, priority = 5,
      text = "Stormwind steel, and on its feet in the Plaguelands. Good. Stormwind sent me north to fight for a kingdom that isn't ours any more, and I'm glad of every countryman who comes to share the honour." },
    { id = "g_hu_north", when = { race = "Human", origin = "human_lordaeron_refugee" }, priority = 6,
      text = "You're Lordaeron's, I can hear it. You've come home, soldier, and I'm sorry for what you're coming home to." },
    { id = "g_prejlock1", when = { prejudiced = true }, text = "I buried good men who trusted a demon-caller at Andorhal. Fight the Scourge if you must, but you'll do it where I can see you." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "You're a warlock, and every soldier in this camp knows it by now. Keep your conjuring outside my palisade, or I'll have you walked out of it." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "You've bled for Chillwind and kept your demons out of my camp, and I've noticed both. I'll still post a guard on you, but he can stand a little further back." },
    { id = "g_camp", text = "On your feet or on your way, soldier, for Chillwind hasn't room for anyone sitting down." },
    { id = "g_back", when = { metBefore = true }, text = "Back in one piece, good. I counted you out of that gate, and I'm glad to count you in again." },
    { id = "g_xhand", when = { origin = "dwarf_silver_hand" }, text = "A Silver Hand initiate out of Ironforge! Your Order held together under the mountain when ours came apart up here, soldier, and Chillwind is glad of anyone who kept the oath." },
    { id = "g_hero", when = { questDone = TODO_QUEST("Mission Accomplished!") }, text = "There's the hero of the cauldrons! Somebody find this soldier a stool, and don't let anyone tell you it isn't earned." },
    { id = "g_away", when = { away = { min = 14, max = 59 } }, text = "I counted you out of that gate {away} ago, and I'm glad to count you back in. Get some food, then report." },
    { id = "g_away_long", when = { away = { min = 30, levels = 5 } }, text = "You've been gone {away} and come back a good deal tougher than you left. Chillwind can use every bit of that, soldier." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've come a long way since we last spoke, soldier, and it shows. I've harder work for you now, if you'll have it." },
    { id = "g_word_scared", when = { word = "intimidated" }, text = "I hear you put the fear into someone in camp. Save it for the Scourge, soldier, because everyone in Chillwind is on your side." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The whole camp's talking about what you did for us. That's the sort of talk I like to hear around my fires." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "Lord Shadowbreaker's sending me paladins again, and good. I asked him for twenty, but I'll gladly take one who doesn't flinch at a ghoul." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your armor's in worse shape than my palisade, {class}. Get it mended before the dead on Sorrow Hill finish the job for you." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "The lamps burn lower when you stand near them, and MacDonnell has already noticed from across the camp. Stand on my side of the fire and let her stare, because Andorhal needs you more than it needs her approval." },
    { id = "n_lock_healthstone", cat = "lock_stones", when = { class = "WARLOCK", carrying = { 5512, 19004, 19005, 5511, 19006, 19007, 5509, 19008, 19009, 5510, 19010, 19011, 9421, 19012, 19013 } },
      text = "Is that a healthstone you're carrying? I've seen a man walk out of Andorhal on one bite of a stone like that, and I'd see a great many more do it if I had a warlock with the time to make them." },
  },

  start = "hello",
  nodes = {
    op_stormwind = {
      big = true,
      lines = {
        { id = "opsw_default", text = "The court, which these days means Highlord Bolvar's seal and Lady Prestor's advice on nearly every letter. I'm a soldier and I don't trade in gossip, but you've been to Stormwind more recently than I have, so what do you make of the court?" },
      },
      choices = {
        { text = "Bolvar's a good man holding a hard throne.", next = "op_stormwind_r1", fx = { align = { order = 1 }, opinion = { stormwind = "trust", bolvar = "trust" } } },
        { text = "Something's wrong in that court. I don't trust Lady Prestor.", next = "op_stormwind_r2", fx = { align = { order = -1 }, trait = { skeptical = 1 }, opinion = { stormwind = "distrust", prestor = "distrust" } } },
        { text = "Ironforge would send you men, Commander, if you asked Magni.", next = "op_stormwind_r3", fx = { affinity = 1, opinion = { stormwind = "mixed", magni = "trust" } }, when = { race = "Dwarf" } },
        { text = "I'll leave the court to you, Commander.", next = "BACK" },
      },
    },
    op_stormwind_r1 = {
      lines = { { id = "opsw_r1", text = "That's what I tell my soldiers, and most days I believe it. A good man can only send what he has, and I'll make do with it." } },
      choices = { { text = "Something else, Commander.", next = "BACK" } },
    },
    op_stormwind_r2 = {
      lines = { { id = "opsw_r2", text = "Careful, now. I've thought much the same reading her letters, but a commander who says so aloud gets posted somewhere even colder than this." } },
      choices = { { text = "Something else, Commander.", next = "BACK" } },
    },
    op_stormwind_r3 = {
      lines = { { id = "opsw_r3", text = "I've asked, and the King sends what he can, more than Stormwind manages some months. Ironforge has its own troubles with the Dark Iron, and I'll not begrudge it." } },
      choices = { { text = "Something else, Commander.", next = "BACK" } },
    },
    xpt_company = {
      big = true,
      lines = { { id = "xpt_company_default", text = "Then I'll tell you what I tell every company: stay together north of the river, don't split to chase a straggler, and burn what you kill, because what you leave lying in the Plaguelands gets up again by morning. The Scourge would sooner take one of you than kill all five, since one of you is a new soldier for them." } },
      choices = {
        { text = "No one gets left behind. We bring back our own.", next = "BACK", reply = "Good. That's the rule I'd have every company swear to, and it's kept more of my soldiers alive than any sword.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If one falls, the rest press on. The fight comes first.", next = "BACK", reply = "I've heard that before, {class}, usually from someone I later wrote a letter about. Press on if you must, but count heads first.", fx = { align = { honor = -1 } } },
        { text = "Why would the Scourge want just one of us?", next = "xpt_company2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpt_company2 = {
      lines = { { id = "xpt_company2_default", text = "Because the Cult of the Damned will raise a fallen hero far more gladly than a fallen farmer, and they're patient about it. I've seen men I trained walking with the Scourge at Andorhal, and I don't mean to see you there too." } },
      choices = {
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xcl_scholo = {
      big = true,
      lines = { { id = "xcl_scholo_default", text = "Then the school that taught Kel'Thuzad's students to raise our dead has lost its headmaster, and I'll write that to Stormwind in my own hand. Most of the necromancers in Andorhal learned their trade on that island, so you've done more for my soldiers than a regiment of reinforcements would have." } },
      choices = {
        { text = "The credit belongs to everyone who went in with me.", next = "BACK", reply = "Spoken like a soldier, and I'll write every one of their names beside yours.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Then make sure Stormwind knows my name, Commander.", next = "BACK", reply = "They'll know it, {class}, and they'll know it from me. You've earned that much.", fx = { align = { honor = -1 } } },
        { text = "Won't the Cult of the Damned just find another headmaster?", next = "xcl_scholo2" },
      },
    },
    xcl_scholo2 = {
      lines = { { id = "xcl_scholo2_default", text = "They'll try, for the Cult has never been short of clever fools who want to live forever. But a school's only as good as its teacher, and Gandling taught them for years, so whoever takes his chair will be younger and greener and easier to kill." } },
      choices = {
        { text = "Then I'll be back for the next one.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "If the earth around Andorhal still has anything to say, I'd like it said to someone on my side, because the Scourge has poisoned every field from here to the Bulwark. MacDonnell says the Light will cleanse it in time, but I've no time, and I'll take a dwarf with a totem if it brings my soldiers home." } },
      choices = {
        { text = "Then I'm yours to command. Point me at Andorhal.", next = "BACK", reply = "Good. Andorhal's a day's march, and I'll want you at the front of it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll help, Commander, but I follow the spirits, not your orders.", next = "BACK", reply = "Follow the spirits, then, so long as they point at the Scourge. I'll not quarrel with anything that does.", fx = { align = { order = -1 } } },
        { text = "Something else, Commander.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Burned, if I had my way, for every field the Scourge holds feeds their plague. But a priestess and a night elf both tell me there's still life under the rot, and I suppose I'd rather be wrong than burn it all." } },
      choices = {
        { text = "Burn it. Nothing living there can be saved.", next = "BACK", reply = "That's my instinct too, and I've been told it's a soldier's answer. Burn what you must.", fx = { align = { light = -1 } } },
        { text = "Reclaim it. There's still life under the rot.", next = "BACK", reply = "Then I'll hold the ground while you prove it, druid. I'd like to be wrong about something for once.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else, Commander.", next = "BACK" },
      },
    },
    hu_val = {
      lines = {
        { id = "huval_default", key = true,
          text = "Because Lordaeron bled for Stormwind first. When the orcs burned our city, Terenas took in every survivor who reached his shores and raised an Alliance to win our home back, and I don't intend to be the generation that forgets it." },
      },
      choices = {
        { text = "There's nothing left here to save, Commander.", next = "hu_val_2" },
        { text = "Who are we fighting for, then? The dead?", next = "hu_val_2" },
      },
    },
    hu_val_2 = {
      big = true,
      narr = "He spreads his gloved hand flat on the map, over Andorhal.",
      lines = {
        { id = "huval2_default",
          text = "In a way, yes. Kel'Thuzad's cult shipped plagued grain out of Andorhal to every village in the north, and the people who ate it are the Scourge we fight today: farmers, millers and their children, raised against their own neighbours. Putting them down is the last service anyone will ever do them." },
      },
      choices = {
        { text = "Stormwind owes this fight. We finish what Lordaeron started.", next = "BACK",
          reply = "That's the spirit of the Alliance, soldier, the one that won the second war. Report to MacDonnell and she'll find you a cauldron.",
          fx = { align = { honor = 1 }, opinion = { lordaeron = "debt" } } },
        { text = "Lordaeron's lost. Hold the south and let the north burn.", next = "BACK",
          reply = "I hear that from the High Command more than I'd like. Maybe it's sense, but I'll not be the one to tell those dead farmers they're on their own.",
          fx = { align = { honor = -1 }, opinion = { lordaeron = "lost" } } },
        { text = "Do the dead remember who they were?", next = "hu_val_3" },
      },
    },
    hu_val_3 = {
      lines = {
        { id = "huval3_default",
          text = "The priests say no, and I choose to believe them, because the other answer would make this work impossible. The Forsaken at the Bulwark say otherwise, and I've found it easiest not to ask them." },
        { id = "huval3_north", when = { origin = "human_lordaeron_refugee" },
          text = "The priests say no, and if you're asking because you've family out there, soldier, then believe the priests. The Forsaken at the Bulwark say otherwise, and I've found it easiest not to ask them." },
      },
      choices = {
        { text = "I'll believe the priests, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Commander.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_hu", when = { race = "Human" },
          text = "Every farm between here and Andorhal belonged to a human family once, and most of those families are walking around out there now. Keep that in mind when you swing, and then swing anyway." },
        { id = "o_fkhate", tags = { "news" }, when = { gossip = { topic = "forsaken", stance = "hate" } }, text = "The High Priestess says you'd put every Forsaken back in the ground. Do it on the far side of the field, if you must, and don't start a war I can't afford." },
        { id = "h_pt_company", tags = { "news" }, when = { party = { size = 4 }, faction = "Alliance" },
          text = "Five of you, and each one looking like they can hold a line, which I can't say of most volunteers Stormwind sends me. The Scourge come at Chillwind in numbers, so I think in numbers too, and you've just made my count a good deal kinder." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman. I've a handful of soldiers to break Andorhal with, {class}, so I'll not be choosy about where my help comes from, and I suspect the earth here could do with someone listening." },
        { id = "h_default", key = true,
          text = "Commander Ashlam Valorfist. Stormwind sent me to hold this camp and break Andorhal with a handful of soldiers, a priestess, an alchemist and whoever walks through that gate, and today that's you." },
        { id = "h_paladin_call", tags = { "news" }, when = { questActive = TODO_QUEST("Chillwind Camp") },
          text = "Lord Shadowbreaker's letter said you'd come, and it also said you'd be steady. We'll find out soon enough which part of his letter was true." },
        { id = "h_clear", tags = { "news" }, when = { questActive = TODO_QUEST("Clear the Way") },
          text = "Andorhal's west and north roads are walls of the dead, but the east road runs through Sorrow Hill, where it's only skeletons and ghouls. Thin them out for me, and we'll have ourselves a door." },
        { id = "h_cleared", when = { questRecent = { TODO_QUEST("Clear the Way"), days = 3 } },
          text = "Sorrow Hill's quieter, though it won't stay that way, since the dead never tire. Still, quieter is a start, and I've learned to be grateful for starts out here." },
        { id = "h_towers", tags = { "news" }, when = { questActive = TODO_QUEST("All Along the Watchtowers") },
          text = "The Scourge moves its troops by four towers in Andorhal, so mark each one with the beacon torch. And bring that torch back to me, mind, as it's the only one we have." },
        { id = "h_araj", tags = { "news" }, when = { questActive = TODO_QUEST("Alas, Andorhal") },
          text = "Araj the Summoner is a lich, and he sits at the heart of the city. Don't go in alone, and I mean that, because I've written enough letters to mothers this year." },
        { id = "h_araj_dead", when = { questDone = TODO_QUEST("Alas, Andorhal") },
          text = "The lich of Andorhal is dust, and I said it aloud three times this morning before I believed it. The dead still walk there, though, and without a master they walk worse." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "At night you can hear Andorhal from here, and it isn't the dead you hear but the bells. Nobody living has rung them in years." },
        { id = "h_back", when = { metBefore = true },
          text = "I count the camp every morning and every night, and most days it's the same number. On the days it isn't, I write the letters myself." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "There's the soldier I'd pick first, if Stormwind ever let me pick anyone. Come in by the fire and tell me what the farms looked like today." },
        { id = "h_cold", when = { disposition = { max = 34 } },
          text = "You again. Say your business and get on the road, because I've no time for anyone I can't count on." },
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "Let's not pretend, warlock. The Cult of the Damned started with folk who thought they could keep the dark on a leash, and I've spent this whole war burning what's left of them in Andorhal. Say your business." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "You again, and the gate guard didn't even send for me this time. Don't make me regret telling him to stand down." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "I'll say it plain: there's a smell of sulphur about you I don't like, {name}. But I like the Scourge less, and I'm short of soldiers by about two hundred." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, good, {class}, for the last time I asked Stormwind for spellcasters they sent me a priestess and an alchemist and told me to make do." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "I've a report from Stormwind on my desk that I never asked for, {class}, and the agent who brought it walked a good deal like you. Sit down, and tell me who sent you." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid of the Cenarion Circle at Chillwind. Andorhal is no place for growing things, but I'll take any help you offer against the dead." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Skeletal", min = 40 } }, text = "My scouts say the bones are lying thicker in the fields around Andorhal and walking thinner, and I know who's been putting them down. Stormwind will hear your name in my next report." },
        { id = "h_cl_scholo", tags = { "news" }, when = { cleared = "Scholomance", faction = "Alliance" },
          text = "The lake round Caer Darrow was quiet last night, and my scouts say the lights in the Scholomance are out for the first time since the plague. I've a feeling you know why, soldier, and I'd like to hear it." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick about it, the dead don't wait on our conversations." },
        { id = "h_again2", text = "Out with it, then, while the scouts are still on the road." },
      },
      choices = {
        { text = "What do you need?", next = "need" },
        { text = "Why is Stormwind fighting here?", next = "why" },
        { text = "Tell me about Andorhal.", next = "andorhal" },
        { text = "You seem to have a small company here.", next = "camp" },
        { text = "Lord Shadowbreaker sent me to you.", next = "paladin", when = { class = "PALADIN" } },
        { text = "I'm a priest. Where do you need me?", next = "priest", when = { class = "PRIEST" } },
        { text = "I was born in Lordaeron, before the plague.", next = "refugee", when = { origin = "human_lordaeron_refugee" } },
        { text = "Put me on the line, Commander.", next = "x_warrior", when = { class = "WARRIOR" } },
        { text = "I can scout the watchtowers for you.", next = "x_hunter", when = { class = "HUNTER" } },
        { text = "Ironforge has a stake in this fight too.", next = "x_dwarf", when = { race = "Dwarf" } },
        { text = "I doubt your soldiers will want me at their backs.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Wouldn't Dalaran send help against Andorhal?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I'm surprised SI:7 operates this far north, Commander.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Should the Scourge's farms be burned, or reclaimed?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Can a shaman be of use against Andorhal, Commander?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Darkmaster Gandling is dead, Commander. The Scholomance has no master.", next = "xcl_scholo", when = { cleared = "Scholomance", faction = "Alliance" } },
        { text = "We're here to fight the Scourge as a company, Commander.", next = "xpt_company", when = { party = { size = 4 }, faction = "Alliance" } },
        { text = "Why should Stormwind bleed for Lordaeron, Commander?", next = "hu_val", when = { race = "Human" } },
        { text = "Point me at the dead.", next = "END", fx = { affinity = 1, standing = { chillwind_camp = 1 }, trait = { brave = 1 } } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "They operate wherever Stormwind has a worry, and Hearthglen, the Crusade's stronghold, worries someone. Kirsta Deepshadow's out in the Northridge Hills testing the Crusade's defenses now, and if she doesn't come back, I'll want somebody quiet to find out why." } },
      choices = {
        { text = "Spies win wars that armies can't.", next = "BACK", reply = "They do, and Kirsta's won more than her share. I'll want her back, all the same.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Spying on the Crusade shames an honest army.", next = "BACK", reply = "Honest armies don't last long out here, {class}. I'll take any edge Stormwind gives me.", fx = { align = { honor = 1 } } },
        { text = "Let's talk about the camp.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Dalaran's still rebuilding and slow to open its gates, and the Kirin Tor are busy deciding whose fault the plague was. Meanwhile Andorhal sits a day's march from my gate, so I'll take any mage who'll stand on the line." } },
      choices = {
        { text = "They should have come. That was their duty.", next = "BACK", reply = "They should, and they didn't, and I've written to say so. You came, and that counts for more.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Duty's cheap. Every city looks after itself first.", next = "BACK", reply = "It is, out here, and Chillwind Camp is all I've got. Thank you for looking after it with me.", fx = { align = { honor = -1 } } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "They'll fight beside anyone who walks back out of Andorhal with them, and they'll mutter about the sulphur on you the whole way. MacDonnell will be harder, for she has a nose for what you carry, and she thinks the Light ought to burn all of it." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "They'll fight beside anyone who walks back out of Andorhal with them, though I can see a few of them making the sign of the Light at your demon already. MacDonnell will be harder, for she thinks every demon is one more thing the Light ought to burn, and she'd want to start with that one." },
      },
      choices = {
        { text = "I'll earn their trust in battle, the hard way.", next = "BACK", reply = "Good. Stand beside them once when the ghouls come over the rise, and the muttering stops.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I don't need their trust. Only their silence.", next = "BACK", reply = "Then you'll get their silence, and their muttering besides. I'll take your fire either way.", fx = { align = { honor = -1 } } },
        { text = "Something else, Commander.", next = "BACK" },
      },
    },
    need = {
      lines = {
        { id = "nd_default", text = "I need soldiers I don't have, and people like you who'll go where soldiers can't. High Priestess MacDonnell has the plague cauldrons in hand, and Arbington the alchemist has the rest, if you can stand him." },
      },
      choices = {
        { text = "I'll find them.", next = "BACK", fx = { affinity = 1 } },
        { text = "Why not more soldiers?", next = "need_men" },
      },
    },
    need_men = {
      lines = {
        { id = "nm_default", text = "Because Stormwind has a great many walls to man and this is the farthest of them. So I hire who I can, I strike where it hurts, and I make every sword count twice." },
      },
      choices = {
        { text = "Do you really expect to take Andorhal with this?", tag = "Persuade", next = "need_truth",
          check = { pass = { any = { { disposition = { min = 65 } }, { questDone = TODO_QUEST("Clear the Way") }, { trait = "brave" } } } },
          fail = { next = "need_shut", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Who decides what Stormwind sends you, Commander?", next = "op_stormwind" },
      },
    },
    why = {
      big = true,
      lines = {
        { id = "w_default", text = "These were Lordaeron's farmers and millers, and now they march in the enemy's army. If the plague isn't stopped here, it walks south to Southshore and the Wetlands, and then home, so I'd rather fight it here." },
      },
      choices = {
        { text = "Then we stop it here.", next = "BACK", reply = "We do. Every mile we hold here is a mile Southshore doesn't have to.", fx = { affinity = 2, align = { honor = 1, order = 1 } } },
        { text = "Lordaeron's lost, so better to hold the line at Southshore.", next = "BACK", reply = "Southshore's a fishing village with a palisade, {class}. If the plague reaches it, it'll reach Stormwind next.", fx = { align = { honor = -1 } } },
        { text = "Stormwind's generous with other people's lands.", next = "why_push", fx = { affinity = -1, trait = { skeptical = 1 } } },
      },
    },
    why_push = {
      lines = {
        { id = "wp_default", text = "Say that to the folk who fled south with nothing but the clothes on their backs, and see how they take it. Lordaeron's people are Stormwind's cousins, and nobody else is coming for them." },
      },
      choices = {
        { text = "Fair. I spoke too quickly.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll fight. I just won't salute.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    andorhal = {
      lines = {
        { id = "a_default", text = "It was the granary of the northern provinces once, which is how Kel'Thuzad's plague got into every village along the roads. Now it's the Scourge's fortress in the west, with a lich at its heart, and it's the reason this camp exists.", fx = { learn = { "andorhal" } } },
      },
      choices = {
        { text = "How do you mean to break it?", next = "andorhal_plan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    andorhal_plan = {
      lines = {
        { id = "ap_default", text = "Piece by piece, the way you'd take down a wall. First we clear the east road past Sorrow Hill, then we mark the towers they command from, and then someone brave and well-armed goes in after Araj the Summoner." },
      },
      choices = {
        { text = "Count me among the brave.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = {
        { id = "c_default", text = "High Priestess MacDonnell is my second, and the best I could ask for. Arbington does our alchemy and complains about his wages, Pureheart keeps the Argent Dawn's people in line, and the gryphon master keeps us in touch with the world." },
      },
      choices = {
        { text = "There's a nobleman camped by the cliff.", next = "camp_barov" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_barov = {
      lines = {
        { id = "cb_default", text = "Weldon Barov is a guest of the kingdom, not of mine, and he'll tell you so himself. Whatever business you have with him is your own affair, so long as it doesn't bring trouble to my gate." },
      },
      choices = { { text = "Understood, Commander.", next = "BACK" } },
    },
    paladin = {
      big = true,
      lines = {
        { id = "pa_default", text = "Then you're one of his best, for he doesn't waste a paladin on a trip this long. Out here the Light isn't a sermon, it's a weapon, and I'll ask you to use it every day you're under my command." },
      },
      choices = {
        { text = "It's what I'm for.", next = "BACK", reply = "Good. I'll keep you busy, then.", fx = { affinity = 2, align = { light = 1, order = 1 }, standing = { chillwind_camp = 1 } } },
        { text = "The Light's no weapon, Commander, whatever your orders say.", next = "BACK", reply = "Then call it a shield, if you'd rather. Out here it does the same work either way.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "And the Silver Hand's teaching?", next = "BACK", fx = { trait = { devout = 1 } } },
      },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "Everywhere, and all at once, I'm afraid. MacDonnell could use another pair of hands that know the Light, and the wounded who come back from Andorhal need more than bandages and a kind word." },
      },
      choices = {
        { text = "Then I'll stay a while and help.", next = "BACK", reply = "Thank you. MacDonnell will be glad of you, and so will the wounded.", fx = { affinity = 2, align = { light = 1 }, standing = { chillwind_camp = 1 } } },
        { text = "I'm more use out in the field.", next = "BACK", reply = "Then go, and fight hard, because every ghoul you put down out there is one less on a stretcher in here. MacDonnell will understand, even if she won't say so.", fx = { trait = { brave = 1 }, align = { light = -1 } } },
      },
    },
    refugee = {
      lines = {
        { id = "rf_default", text = "Then this is your home we're fighting over, and Light knows it's hard to look at. If you've family buried up here, tell me where, and my patrols will mind the place when they pass." },
      },
      choices = {
        { text = "Thank you, Commander.", next = "BACK", fx = { affinity = 3, standing = { chillwind_camp = 1 } } },
        { text = "I'd rather not speak of it.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    need_truth = {
      big = true,
      lines = {
        { id = "nt_default", text = "Between us, and not a word of it past that palisade: Stormwind sent me here to keep the plague off Southshore, not to win. If Andorhal falls, it'll be because people like you walked through my gate, not because the kingdom ever sent me the regiment I asked for." },
        { id = "nt_priest", when = { class = "PRIEST" },
          text = "You'll keep this the way you keep a confession, so I'll say it straight. I don't expect to take Andorhal with what I've got, and I count the camp twice a day because I'm afraid of the morning the number stops making sense." },
      },
      choices = {
        { text = "Then we'll make every sword count twice.", next = "BACK", fx = { affinity = 2, standing = { chillwind_camp = 1 } } },
        { text = "Does MacDonnell know you think that?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    need_shut = {
      lines = {
        { id = "ns_default", text = "I expect to do my duty, soldier, and so should you. Whatever else I think stays in my tent, where it can't frighten anyone." },
      },
      choices = { { text = "Understood, Commander.", next = "BACK" } },
    },
    x_warrior = {
      lines = {
        { id = "xw_default", text = "The line? There's no line out here, soldier, only a camp, a road and a city full of dead men, and I count every one of us twice a day. What I need from a warrior is someone who'll hold a cauldron long enough for MacDonnell's people to do their work, and then walk back." },
        { id = "xw_guard", when = { origin = "human_city_guard" }, text = "City Watch, were you? Then forget what you learned about walls, because out here the dead come from every side, and the only gate is the one you carry with you." },
      },
      choices = {
        { text = "I'll hold until your people are clear, Commander.", next = "BACK", reply = "Good. That's all I ask, and more than most can promise.", fx = { affinity = 2, align = { order = 1 }, standing = { chillwind_camp = 1 } } },
        { text = "I'll hold as long as it makes sense, and no longer.", next = "BACK", reply = "Sense is a fine thing until the plague comes over the hill. I'd ask you to hold a little longer than that.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_hunter = {
      lines = {
        { id = "xh_default", text = "Scouting's worth its weight in gold up here, and I've lost two scouts this month to things that used to be wolves. Mark the towers, count what's in them and come back, because a dead scout's report never reaches my table." },
        { id = "xh_woods", when = { origin = "human_eastvale_woodsman" }, text = "You've the look of an Elwynn woodsman about you. These trees won't hide you the way the Eastvale did, so keep low, and trust nothing that smells of rot." },
      },
      choices = {
        { text = "I'll count every one and come back.", next = "BACK", fx = { affinity = 2, standing = { chillwind_camp = 1 } } },
        { text = "Something else, Commander.", next = "BACK" },
      },
    },
    x_dwarf = {
      lines = {
        { id = "xd_default", text = "Ironforge has a stake in every fight that comes south, and I'd take a company of your mountaineers tomorrow if the King would send them. I'll settle for you, and I'll tell you what I tell every dwarf who comes through: the plague doesn't care how thick your blood is." },
      },
      choices = {
        { text = "Dwarven blood's thicker than most, Commander.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "I'll be careful.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "That's good of you to say, soldier. The men will hear it at muster, because it's them who've earned it, and precious few come up here to tell them so." },
        { id = "s2", text = "Stormwind sends me orders and not much else, so I'll gladly take a kind word in place of the wagons. Thank you, {class}." },
      },
      fail = {
        { id = "f1", text = "I've no time for a silver tongue, soldier, since I've letters to write to families tonight. If you need something from Chillwind, ask it straight." },
        { id = "f2", text = "Praise is cheap this far from the fighting and worth less in it. Go out past the farms and come back, and then I'll listen to what you think of this camp." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha! You'd have fit in well with my old company, who never let an officer get comfortable. A bit of cheek keeps the cold out, so I'll allow it." },
        { id = "s2", text = "You've a mouth on you, and the nerve to use it on a commander. I'd rather have ten like that than a hundred who salute and run." },
      },
      fail = {
        { id = "f1", text = "I counted eleven out of that gate yesterday and nine back in, so I'm in no mood to be made sport of. Watch your tongue in my camp." },
        { id = "f2", text = "There are men buried behind those tents who'd have had words with you for that. Show some respect for the post, or take the road south." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "You've a hard way about you, and I'd guess the Scourge has learned it already. I'll not quarrel with someone I'd rather have beside me, so go on." },
        { id = "s2", text = "Easy, now. I can see you're not someone to be put off, and I've no wish to try it, so you'll have your answer." },
      },
      fail = {
        { id = "f1", text = "I look out at the smoke of Andorhal every morning, soldier, and you're a good deal less frightening than what waits under it. Stand easy, before I have you stood down." },
        { id = "f2", text = "Threatening an officer of Stormwind in his own camp is a flogging offence, and I've a sergeant who'd enjoy it. I'll forget it once, and only once." },
      },
    },
  },
  blurts = {
    { id = "bl1", text = "The lich Araj the Summoner commands Andorhal, and his skeletons will keep rising until he falls. Bring me proof he's dead, and I'll know the town can be taken." },
    { id = "bl2", text = "Weldon Barov is here for his family's deeds, not for Lordaeron, and his brother Alexi wants them just as badly at the Bulwark. The Barovs sold Caer Darrow to the Cult, and neither of them likes to be reminded of it." },
    { id = "bl3", text = "Kel'Thuzad's Cult runs a school of necromancy beneath Caer Darrow, out on Darrowmere Lake. I've lost two scouts trying to see inside, and I'll not send a third." },
  },
  topics = {
    grievance = {
      { id = "gv1", text = "I don't have room in this camp for soldiers I can't rely on, and I can't rely on you. That's the whole of my complaint, and it's enough." },
      { id = "gv_prej", when = { grudge = "prejudice" }, text = "You call on the same dark the Cult used to bring Andorhal down, and you think I should trust you with my soldiers. I buried men who made that mistake." },
      { id = "gv_enemy", when = { grudge = "enemy" }, text = "You wear the Horde's colours in a Stormwind camp, within sight of Andorhal. My soldiers have lost too many friends to forget that." },
      { id = "gv_values", when = { grudge = "values" }, text = "You treat this war like a hunting trip, collecting trophies and leaving the burying to others. I write the letters home, and I don't care for your sort." },
    },
    amends = {
      { id = "am1", text = "Fight beside my soldiers, and bring them home alive when you can. I'll notice, and so will the families I write to." },
      { id = "am_prej", when = { grudge = "prejudice" }, text = "Put that power aside and fight with steel and the Light like the rest of us. Until you do, I'll not trust you near my lines." },
    },
    spite = {
      { id = "sp1", text = "I think you'd step over a wounded soldier to reach a sack of loot. I've written letters to the widows of better people than you." },
      { id = "sp_prej", when = { grudge = "prejudice" }, text = "I think you're one bargain away from becoming the very thing we're fighting. When that day comes, I'll not hesitate, and neither will my soldiers." },
    },
    knows = {
      { id = "tp_knows", text = "A commander hears everything that comes through his gate, whether he wants to or not. Ask me about any of this and you'll get it straight." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "I'll give you what any soldier at this camp would know, and no more. Pick one and be quick." },
    },
    background = { { id = "tp_ba", text = "I'm a soldier of Stormwind, and Stormwind sent me north to fight the Scourge. That's all the story you need, and all I've time to tell." } },
    advice = { { id = "tp_ad", text = "Never go out past the farms alone, and always come back before your water runs out. The wells up here will kill you slower than a ghoul, but they'll kill you." } },
    plague_cauldrons = { { id = "tp_cauldrons", text = "There are eight of them across Lordaeron and four in the west, breathing the plague over the farms. MacDonnell means to make them breathe something worse, and I've stopped asking her what." } },
    andorhal = { { id = "tp_andorhal", text = "It was a city once, and now it's a fortress for the dead with a lich at its heart. It's the whole reason this camp exists.", next = "andorhal" }, { id = "tp_andorhal2", text = "Andorhal's north of here, and nobody goes in without my say-so or a very good reason." } },
    scholomance = { { id = "tp_scholomance", text = "That's the Barovs' old home on Caer Darrow, where the necromancers learn their trade. Arbington knows more about it than any sane man should." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "They're holding Hearthglen and they don't want our help, which is fine by me. They don't get to shoot at my scouts either, though, and they do." } },
    argent_dawn = { { id = "tp_dawn", text = "They're Pureheart's people, and they'll fight beside anyone at all. I don't care for all the company they keep, but I've never turned down a sword." } },
    scourge = { { id = "tp_scourge", text = "The Scourge holds Andorhal and every field from here to the Thondroril, and it doesn't need to sleep or eat or be paid. All I have is soldiers who do, and I spend them carefully." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad sits in a floating necropolis over the east and sends his liches to Andorhal and Caer Darrow. I've never seen him, and I'd like to keep it that way until I've an army big enough to change my mind." } },
    arthas = { { id = "tp_arthas", text = "I never met the prince, but I've buried enough of the men he betrayed. Lordaeron's veterans don't speak his name in this camp, and I don't ask them to." } },
    lordaeron = { { id = "tp_lordaeron", text = "Stormwind sent me north to fight for a kingdom that's already dead, and I've decided that the people still living in it are reason enough. Every farm we take back is a farm someone can go home to." } },
    bolvar = { { id = "tp_bolvar", text = "Lord Bolvar holds Stormwind for the boy king, and he's the one who signed my orders north. I'd ask him for more soldiers, but I know what he'd say, and he'd be right." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken hold the Bulwark, and they fight the same Scourge we do. I don't like them and I don't trust them, but I'll grant they bleed for it, or whatever it is they do." } },
    stratholme = { { id = "tp_stratholme", text = "Stratholme is the Scourge's heart in Lordaeron, and the Crusade throws itself at the gates like a man throwing stones at a mountain. I've no soldiers to spare for that." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Banshee Queen holds the old capital and calls it her kingdom. She hates the Scourge as much as we do, and I'm told that's the only thing we have in common." } },
    _none = { { id = "tp_none", text = "If it isn't a threat to this camp, it isn't on my desk. Try Pureheart, who has more patience than I do." } },
    _gated = {
      { id = "gt1", text = "That's not something I'll discuss with a soldier I've barely counted through the gate. Do some good out in the farms first, and then we'll talk." },
      { id = "gt2", text = "I keep that for those who've stood a watch or two for Chillwind. You've not earned it yet, and I'll say no more." },
    },
  },
}

P:NPC {
  key = "macdonnell", id = TODO_NPC("High Priestess MacDonnell"), name = "High Priestess MacDonnell",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "chillwind_camp" }, temper = { "sharp" }, values = { "devout", "fierce" },
  notices = { "class", "race" },

  impression = {
    first = "Her Light is the kind that burns, and she says so cheerfully.",
    third = "{name} met High Priestess MacDonnell at Chillwind Camp, who means to give the Scourge a dose of its own plague.",
  },

  greetings = {
    { id = "g_hu", when = { race = "Human" }, priority = 5,
      text = "Ah, one of our own! The Light's been short of human faces up here since the Crusade took most of them, so you're doubly welcome." },
    { id = "g_light", text = "The Light keep you, friend, and keep you upwind of the farms while it's at it." },
    { id = "g_xsquire", when = { origin = "human_paladin_squire" }, text = "A squire of the old Order, still keeping the oaths with nobody left to swear them to? The Light keep you, friend, and point you at a cauldron, because that's the finest prayer I know." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Tell me a cauldron coughed and choked out there, and you'll have made my whole day." },
    { id = "g_away", when = { away = 14 }, text = "The Light be thanked, you're back after {away} away! I kept you in my prayers the whole time, and I meant every one." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Someone in camp is hurt and angry after speaking with you. The Light asks us to mend what we break, so perhaps you'll find them before you go." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "I hear you lifted someone's heart in camp today. Out here that's worth as much as a broken cauldron, though do break those too." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "One of the Light's own, good. Out here you'll learn it isn't only for healing. It burns too, if you ask it the right way." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "One of the Banshee's... no, forgive me, that's the old soldier in me talking. The Dawn would have me welcome you and I'll try, but I'd stand clear of the holy water if I were you." },
  },

  start = "hello",
  nodes = {
    op_forsaken = {
      big = true,
      lines = {
        { id = "opfk_default", text = "They dose them from the other side of the field, with brews I'd not touch with tongs. They say they're free of the Lich King, and some of them even pray, so tell me, do you believe them?" },
      },
      choices = {
        { text = "They deserve a chance, if the Light can forgive them.", next = "op_forsaken_r1", fx = { align = { light = 1 }, opinion = { forsaken = "trust" } } },
        { text = "They're dead, Priestess. They belong in the ground.", next = "op_forsaken_r2", fx = { affinity = 1, align = { light = -1 }, trait = { stern = 1 }, opinion = { forsaken = "hate" } } },
        { text = "Some of them still hold the Light. I've heard it.", next = "op_forsaken_r3", fx = { trait = { pious = 1 }, opinion = { forsaken = "pity" } }, when = { class = "PALADIN" } },
        { text = "I'll keep my view to myself, Priestess.", next = "BACK" },
      },
    },
    op_forsaken_r1 = {
      lines = { { id = "opfk_r1", text = "If, you say, and you say it gently. I'll pray on that, though I warn you my prayers tend to come out with a sword in them." } },
      choices = { { text = "Something else, Priestess.", next = "BACK" } },
    },
    op_forsaken_r2 = {
      lines = { { id = "opfk_r2", text = "That's my instinct too, and I'm not proud of how quickly it comes. Still, they burn cauldrons, so I'll leave them be until the cauldrons are gone." } },
      choices = { { text = "Something else, Priestess.", next = "BACK" } },
    },
    op_forsaken_r3 = {
      lines = { { id = "opfk_r3", text = "So I've heard as well, and it troubles me more than any ghoul. If the Light answers the dead, then I have a great many sermons to unwrite." } },
      choices = { { text = "Something else, Priestess.", next = "BACK" } },
    },
    xpt_pala = {
      big = true,
      lines = { { id = "xpt_pala_default", text = "The Silver Hand was broken when Uther fell, and what's left of it is scattered among the Argent Dawn and the Crusade and a few stubborn souls who keep the old oaths alone. I pray every night that someone gathers them again before the Crusade finishes twisting what's left." } },
      choices = {
        { text = "The order should be raised again under one banner.", next = "BACK", reply = "I pray for that too, every night. Perhaps someday, if enough of us live to see it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Light needs no order. Each paladin answers to conscience.", next = "BACK", reply = "That's how the old knights spoke, and I've never been able to argue with it. Answer well, then.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcl_strat = {
      big = true,
      lines = { { id = "xcl_strat_default", text = "Then you've seen what a Scourge city looks like from the inside, and I don't envy you the dreams. Every cauldron in these fields was brewed to a plan drawn up somewhere, and I always suspected Stratholme, so whatever you broke in there, my cauldrons will be the poorer for it." } },
      choices = {
        { text = "The Light burned them out. I only carried it in.", next = "BACK", reply = "Modest of you, and probably wrong. The Light doesn't carry itself in.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It wasn't the Light that did it, but steel and stubbornness.", next = "BACK", reply = "Stubbornness is a gift of the Light too, child, or so I like to think. Well done, whatever did it.", fx = { align = { light = -1 } } },
        { text = "Will that city ever be clean enough to live in?", next = "xcl_strat2" },
      },
    },
    xcl_strat2 = {
      lines = { { id = "xcl_strat2_default", text = "Not in my lifetime, and probably not in yours, because the plague's in the stones and the wells and the bones under the streets. But the Light is patient where I'm not, and if they burn it house by house and pray over every cellar, I'd like to believe someone's grandchildren will sleep there." } },
      choices = {
        { text = "Then I'll pray for those grandchildren, High Priestess.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Offend it? The Light isn't so delicate, and neither am I, whatever the Cathedral's stuffier priests would have you believe. If your fire spirits will help me boil the plague out of those cauldrons, I'll stand beside you and pray loudly while they do it." } },
      choices = {
        { text = "Then we'll burn the cauldrons together, by Light and flame.", next = "BACK", reply = "Splendid! Light and flame, and the Scourge choking on its own soup.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers won't empty a cauldron, priestess. Fire will.", next = "BACK", reply = "Fire and prayer both, then, and we'll see which works faster. I'll put a wager on prayer.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I believe so, though it will take years and more than prayer. Arbington the alchemist's counter agent breaks the cauldrons, but the ground they've soaked will need tending like a sickbed, and that's work your people know better than mine." } },
      choices = {
        { text = "Then let's tend it together, Light and Moon alike.", next = "BACK", reply = "Together, aye, and it'll take all of us. Thank you, druid.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Break the cauldrons first. Cleansing can come after.", next = "BACK", reply = "Agreed, and Arbington will be glad to hear it. Cleansing's for after we've stopped the bleeding.", fx = { align = { order = 1 } } },
        { text = "Something else, Priestess.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Each one has a cauldron lord standing over it and a crowd of the dead around it, and the lords carry the keys. You knock them down and I'll see to the dosing, and between your shield and my prayers we'll make a proper mess of their brewing." } },
      choices = {
        { text = "My shield is yours, Priestess, and the Light guide us both.", next = "BACK", reply = "And yours, {class}. Lift that shield high and I'll do the rest.", fx = { align = { light = 1 } } },
        { text = "Keep your prayers. Out there, my shield does the work.", next = "BACK", reply = "It does, and you'll still get the prayers, whether you like it or not.", fx = { align = { light = -1 } } },
        { text = "Tell me something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Precious little near the fields, though the soldiers swear the deer up in the hills still look healthy. The cauldrons poison everything downwind, so the sooner we dose them, the sooner the beasts can drink without dying of it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Precious little near the fields, though the soldiers swear the deer up in the hills still look healthy. The cauldrons poison everything downwind, so the sooner we dose them, the sooner the beasts can drink without dying of it. Is that {pet}?" },
      },
      choices = {
        { text = "Then I'll put the sick beasts down and pray they rest.", next = "BACK", reply = "Thank you. The Light will take the prayers, and the beasts will take the rest.", fx = { align = { light = 1 } } },
        { text = "Prayer won't cure a wolf, Priestess. An arrow ends it.", next = "BACK", reply = "It won't, and an arrow will. I'll pray anyway; it costs me nothing.", fx = { align = { light = -1 } } },
        { text = "Something else, Priestess.", next = "BACK" },
      },
    },
    dd_termites = {
      lines = {
        { id = "dd_termites_1",
          text = "I approve of the result, which is a Scarlet lumber yard that won't be building any more gallows. The method was plague, child, carried in a jar, and I spend my days burning plague out of cauldrons, so you'll forgive me if it sits a little crooked." },
        { id = "dd_termites_2",
          text = "Still, the Crusade hung two of our scouts last spring, and Nathaniel's father's mill was the last thing that family had. The Light keeps its own accounts, and I suspect this one balances." },
      },
      choices = {
        { text = "A weapon's a weapon. I'd use it again.", next = "BACK", fx = { align = { light = -1, order = -1 } } },
        { text = "You're right. It felt wrong even as I did it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_mac = {
      lines = {
        { id = "humac_default", key = true,
          text = "I'd like to think so, though I'll not live to see it. These were Lordaeron's granaries, the fields that fed the whole north, and the cult chose them on purpose; they knew that if you poison a human kingdom's bread, you poison its heart." },
      },
      choices = {
        { text = "Then the cauldrons are a kind of revenge for you.", next = "hu_mac_2" },
        { text = "Who were the families on these farms?", next = "hu_mac_2" },
      },
    },
    hu_mac_2 = {
      big = true,
      lines = {
        { id = "humac2_default",
          text = "Ordinary folk, the Dalsons and their neighbours, who went to chapel and paid their tithes and never once thought the Light would let this happen. Turning the Scourge's own plague back on it is the nearest I'll come to giving them justice, and I confess I enjoy it more than a priestess should." },
      },
      choices = {
        { text = "The Light can heal even this, given time.", next = "BACK",
          reply = "That's the faith I was taught in Lordaeron's chapels, and I'll hold to it, even if all I can do today is break a cauldron.",
          fx = { align = { light = 1 }, opinion = { the_light = "faith" } } },
        { text = "Salt it and leave it. Nothing good will grow here again.", next = "BACK",
          reply = "You may be right, and some mornings I think it myself. But I'll not tell the dead that their fields were good for nothing but salt.",
          fx = { align = { light = -1 }, opinion = { the_light = "doubt" } } },
        { text = "Something else, High Priestess.", next = "BACK" },
      },
    },
    hu_mac_x = {
      lines = {
        { id = "humacx_default", key = true,
          text = "Because it's where our dead are, and humans can't bear to leave their dead behind; we'd sooner fight over a graveyard than move to a safer one. It's sentimental, I'll grant you, but it's also why we're here at all, holding a camp in a dead kingdom." },
      },
      choices = {
        { text = "My people understand that more than you'd think.", next = "BACK", fx = { affinity = 1 },
          reply = "I thought you might, and I'm glad of it. Grief's easier when it's shared, even across a border." },
        { text = "Something else, High Priestess.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_hu", when = { race = "Human" },
          text = "This was the best farmland in Lordaeron, you know, the breadbasket of the whole north. Now it grows plague, and I grow very cross about it." },
        { id = "h_dd_termites", when = { questDone = TODO_QUEST("A Plague Upon Thee") },
          text = "Nathaniel tells me you set his termites loose on the Scarlet mill at Northridge. I can't say I approve of the method, but I watched the smoke from the hill and I didn't pray for it to stop." },
        { id = "o_swdistrust", tags = { "news" }, when = { gossip = { topic = "prestor", stance = "distrust" } }, text = "The Commander says you've doubts about Lady Prestor. Pray on them, by all means, but keep them out of his letters home." },
        { id = "h_pt_pala", tags = { "news" }, when = { party = { class = "PALADIN" }, faction = "Alliance" },
          text = "You've brought {companion} to Chillwind, and I'd know a paladin's bearing anywhere, for I've buried enough of them. It does me good to see the Light still carried in armour after everything Lordaeron has seen." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, and an Ironforge dwarf! The Light burns the Scourge out of the land, {class}, and I'm told your elements burn it too, so I'll not quibble over which fire does the work." },
        { id = "h_default", key = true,
          text = "I'm High Priestess MacDonnell. The commander handles the war and I handle the cauldrons, those great pots breathing plague on every farm in the west, and I mean to give the Scourge a dose of its own brew." },
        { id = "h_brief", tags = { "news" }, when = { questActive = TODO_QUEST("The Scourge Cauldrons") },
          text = "There are four cauldrons, each one guarded by a cauldron lord who keeps the key on his belt. Kill him, take the key, fill a bottle with the muck, and I'll do the rest." },
        { id = "h_felstone", tags = { "news" }, when = { questActive = TODO_QUEST("Target: Felstone Field") },
          text = "Felstone Field comes first, and the farm's crawling with skeletons, with something worse sitting by the cauldron with the key. Bring me a sample, and the fouler it is, the better." },
        { id = "h_dalson", tags = { "news" }, when = { questActive = TODO_QUEST("Target: Dalson's Tears") },
          text = "Next is Dalson's Tears, named for the family who wept there, and I don't much care to learn why. Just get me that sample." },
        { id = "h_haunt", tags = { "news" }, when = { questActive = TODO_QUEST("Target: Writhing Haunt") },
          text = "The Writhing Haunt has a tauren in the house there, they tell me, a druid, and he's dying. Be kind to him if you pass, and then get me my sample." },
        { id = "h_gahrron", tags = { "news" }, when = { questActive = TODO_QUEST("Target: Gahrron's Withering") },
          text = "Gahrron's Withering is the last of the four and the worst of them, full of ghosts and wraiths. You'll want the Light close by when you go." },
        { id = "h_cl_strat", tags = { "news" }, when = { cleared = "Stratholme", faction = "Alliance" },
          text = "I hear Stratholme has lost its masters, and Officer Pureheart of the Argent Dawn can't stop smiling about it. If you were the one who went in, {class}, the Light's been busy with you, and I'd like to shake your hand." },
        { id = "h_returned", when = { questRecent = { TODO_QUEST("Return to Chillwind Camp"), days = 2 } },
          text = "Arbington, our alchemist, has been up all night with your sample, and he smells like a crypt, but he's happier than I've seen him in months. Well done, friend." },
        { id = "h_jars", when = { metBefore = true },
          text = "I label every sample jar myself, Felstone and Dalson's and the Haunt and Gahrron's. Arbington says my handwriting's worse than the plague, and Arbington is welcome to write his own labels." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! Can you boil a cauldron dry, {class}? I've wanted to see one of those foul pots burst for months, and my prayers don't seem to manage it." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You've a quiet step, {class}, and I've learned not to ask the commander's quiet visitors what they've been up to. The Light sees it anyway, so I needn't." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior! The cauldrons are well guarded, {class}, and I've been praying for someone with a shield to stand in front of me while I work." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter. Keep that bow handy, {class}, because the wildlife near the cauldrons drinks from the same wells as the farms, and none of it is fit to eat any more." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A night elf druid! I've been praying to the Light for a cure for this land, and perhaps the Light sent me one with antlers." },
      },
      again = {
        { id = "h_again", text = "Something else on your mind? Ask away, I've a jar or two to label while you talk." },
        { id = "h_again2", text = "Go on, I'm listening, so long as you don't mind me working." },
      },
      choices = {
        { text = "You don't approve of the termites, High Priestess?", next = "dd_termites", when = { questDone = TODO_QUEST("A Plague Upon Thee") } },
        { text = "What happens when you dose a cauldron?", next = "dose" },
        { text = "Where are the cauldrons?", next = "cauldrons" },
        { text = "The commander seems a hard man to serve under.", next = "commander" },
        { text = "Teach me how the Light burns.", next = "priest", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Poisoning the poisoners? That's my kind of work.", next = "x_warlock", when = { class = "WARLOCK" } },
        { text = "Fire would spread the plague. That's a risk.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Does the Light judge what's done in shadow?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What guards the cauldrons, High Priestess?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "I doubt any of the wildlife here is still clean.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Can the cauldrons' plague be cleansed from the soil?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Does a shaman's fire offend the Light, High Priestess?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I've been to the bottom of Stratholme, High Priestess.", next = "xcl_strat", when = { cleared = "Stratholme", faction = "Alliance" } },
        { text = "My companion is a paladin. What became of the Silver Hand?", next = "xpt_pala", when = { party = { class = "PALADIN" }, faction = "Alliance" } },
        { text = "Can this land ever be healed, High Priestess?", next = "hu_mac", when = { race = "Human" } },
        { text = "Why do humans fight so hard for dead land?", next = "hu_mac_x", when = { race = { "Dwarf", "Gnome", "NightElf" } } },
        { text = "I'll get your samples.", next = "END", fx = { affinity = 1, standing = { chillwind_camp = 1 }, learn = { "plague_cauldrons" } } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The Light judges what's done for the wrong reasons, and the dark has nothing to do with it. Stab a cultist in the back on his way to a cauldron and I'll pray for you myself, for I think the Light likes that sort of thing better than people imagine." } },
      choices = {
        { text = "Intent matters more than method. I agree.", next = "BACK", reply = "Good. The Light knows the difference, and so do I.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Light can judge what it likes. I don't answer to it.", next = "BACK", reply = "Then I'll answer to it for both of us. Mind the cultists, {class}.", fx = { align = { light = -1 } } },
        { text = "Something else, priestess.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Arbington says the same, and he's right, curse him, so we brew the counter agent first. But once the plague's dead in the pot, I want you to melt the thing to slag, and I'll stand there and pray over the puddle." } },
      choices = {
        { text = "Do it properly. Counter agent first, then fire.", next = "BACK", reply = "That's the right order, and I'm glad you see it. Counter agent, then fire, then prayers.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd burn it now and pray the wind is kind.", next = "BACK", reply = "The wind's never kind out here, and the Bulwark would breathe it by dawn. Wait for the agent.", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    dose = {
      lines = {
        { id = "d_default", text = "We change the brew, so the plague from the pot eats the Scourge instead of the farmers. It lasts a day or two before someone has to do it all again, and that's the war out here, I'm afraid.", fx = { learn = { "plague_cauldrons" } } },
      },
      choices = {
        { text = "Poison against poison.", next = "BACK", reply = "Poison against poison, and may the Scourge choke on it.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "It's a tidy answer, and it keeps the farmers alive.", next = "BACK", reply = "It does, and that's the whole of my sermon this morning.", fx = { align = { order = 1 } } },
        { text = "That hardly seems the Light's way.", next = "light" },
      },
    },
    light = {
      big = true,
      lines = {
        { id = "l_default", text = "The Light's way is to protect the living, and if that means stirring a necromancer's soup until it chokes him, then I'll stir. I'll pray first, though, and stir after." },
      },
      choices = {
        { text = "Pray first, stir after. I'll remember that.", next = "BACK", reply = "Good. Say it over the cauldron, not after, or you'll be breathing fumes while you pray.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I'd rather it burned clean.", next = "BACK", reply = "So would I, child, so would I. But the cauldrons won't burn clean, and the plague rides the smoke.", fx = { affinity = 1, align = { light = 1, order = 1 } } },
      },
    },
    cauldrons = {
      lines = {
        { id = "ca_default", text = "Four farms in the west, each with a pot of its own: Felstone Field, Dalson's Tears, the Writhing Haunt and Gahrron's Withering. They're good farms, or they were, and the people who worked them deserved better." },
      },
      choices = {
        { text = "Which is the worst?", next = "worst" },
        { text = "Do the Forsaken work the cauldrons too?", next = "op_forsaken" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worst = {
      lines = {
        { id = "wo_default", text = "Gahrron's Withering, without a doubt, where the dead aren't content to stay in their bones. Go to that one last, when you know the work, and take a friend who can heal." },
      },
      choices = {
        { text = "I'll remember that.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "I'll go there first, then.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    commander = {
      lines = {
        { id = "co_default", text = "He's hard, and he's fair, and he writes every letter home himself, when most commanders leave that to a clerk. I'd follow him into Andorhal, and I may yet have to." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "You ask it the way you'd ask for healing, but you hold the dead in your mind instead of the wounded. The Light knows the difference, and it answers hard when it finds something that oughtn't to be walking." },
      },
      choices = {
        { text = "I'll try it at the first cauldron.", next = "BACK", reply = "Good. Hold the dead in your mind, and hold on tight when it answers.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "That sounds like anger, not faith.", next = "BACK", reply = "Call it anger if you like, and maybe it is, but anger can be faithful too. The Light was never meant only for soft hands, and the dead of Andorhal have earned a hard answer.", fx = { trait = { skeptical = 1 }, align = { light = -1 } } },
        { text = "Does the burning ever frighten you, Priestess?", tag = "Persuade", next = "priest_fear",
          check = { pass = { any = { { disposition = { min = 60 } }, { trait = "pious" }, { questDone = TODO_QUEST("Target: Felstone Field") } } } },
          fail = { next = "priest_brush", fx = { affinity = -1 } } },
      },
    },
    priest_fear = {
      lines = {
        { id = "pf_default", text = "Since you ask me as one of the Light's own, I'll tell you what I don't tell the soldiers. When I curse the dead, the Light answers me hot and quick, and when I pray for the living it comes soft as a whisper, and some nights I'm not sure I like what that says about me." },
      },
      choices = {
        { text = "It says the dead need burning more than the living need you.", next = "BACK", fx = { affinity = 2 } },
        { text = "I'll pray for you, Priestess.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest_brush = {
      lines = {
        { id = "pb_default", text = "Frighten me? Bless you, I've no time to be frightened, not with four cauldrons to spoil. Ask me again when the pots are cold." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_warlock = {
      lines = {
        { id = "xw_default", text = "Is it, now? I'll take any hand that turns the Scourge's poison back on them, but don't mistake us for the same sort: I ask the Light for strength, and I've a feeling you ask something else entirely. Bring me the samples, and keep whatever rides in that satchel well away from my jars." },
      },
      choices = {
        { text = "The dead fall either way, Priestess. Does it matter how?", next = "BACK", reply = "They do, and I'll grant you that much. Just keep whatever you carry away from my cauldrons.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Understood. What I carry stays well away from your jars.", next = "BACK", reply = "Thank you, and keep it there. I'll not have anything sniffing at the counter agent.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Between the commander's reports and Arbington's grumbling, I hear most of what goes on in this camp. Ask me about any of these, friend." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "For you I'll put the jars down a moment, and that's a rare honour. Here's what I can tell you about, and gladly." },
    },
    background = { { id = "tp_ba", text = "I'm a priestess of the Light and the commander's second, and between the two I haven't had a full night's sleep since Stratholme." } },
    advice = { { id = "tp_ad", text = "Keep a clean cloth over your mouth near the cauldrons, and say a prayer before you open any jar I give you." } },
    plague_cauldrons = { { id = "tp_cauldrons", text = "They're Kel'Thuzad's work, or his servants', eight pots across Lordaeron keeping the land sick. We can't break them, but we can spoil the recipe." } },
    andorhal = { { id = "tp_andorhal", text = "Andorhal's dead were people once, and I keep that in my prayers. I keep the rest of me for burning them." } },
    holy_light = {
      { id = "tp_holy_light", text = "The Light burns in me, and I mean it to burn the Scourge to ash, every last cauldron and corpse of it. That's my faith, and I've never once doubted it." },
      { id = "tp_holy_light2", when = { class = "PALADIN" }, text = "You feel it too, don't you, the fire in your hands when you face the dead? Hold on to that, because the Scourge has no answer to it." },
    },
    scourge = { { id = "tp_scourge", text = "The Scourge breathes its plague over our farms through those wretched cauldrons, and I take each one as a personal insult. I'll see them all turned to our purpose before the year's out." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad is the father of the plague, and I pray every night that the Light lets me see him burn. I'm not a patient woman, but I'll wait for that." } },
    stratholme = { { id = "tp_stratholme", text = "Stratholme fell to the plague before any other city of note, and the Scourge still holds it. I'd march there tomorrow if Valorfist would let me." } },
    _none = { { id = "tp_none", text = "Unless it's in a jar, I'm afraid I don't know it. Try the commander." } },
  },
}

P:NPC {
  key = "arbington", id = TODO_NPC("Alchemist Arbington"), name = "Alchemist Arbington",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "chillwind_camp" }, temper = { "cowardly" }, values = { "curious", "honest" },
  notices = { "craft", "greenness", "lock_shards" },

  impression = {
    first = "Frightened as he is, he keeps working, and I respect that.",
    third = "{name} met Alchemist Arbington, Chillwind Camp's nervous alchemist and reluctant student of the Scholomance.",
  },

  greetings = {
    { id = "g_busy", text = "Mind the cauldron, and mind the bottles, and actually, if you'd just stand right there and not move, I'd be ever so grateful." },
    { id = "g_back", when = { metBefore = true }, text = "You again! You're a terrible influence, you know. Every time you visit I end up doing something brave by proxy." },
    { id = "g_away", when = { away = 14 }, text = "Oh, you're back! It's been {away}, and I've done nothing brave at all in the meantime, which I'm rather ashamed of." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I hear you talked someone round to your way of thinking. Please don't do it to me, because I'm very easily talked round, and I'd end up in Andorhal." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist, how wonderful! Please don't touch the quickener, though, because it's thirty minutes from useless and about thirty seconds from my eyebrows." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 50 },
      text = "You're rather young for the Plaguelands, aren't you? I'm not judging, mind, since I'm rather old for them, and look how that's going." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 10 } },
      text = "The Scholomance books describe that chill, the cold that comes off a bag of soul shards, and I had hoped I would only ever read about it. Do keep them away from my reagents, because I am never quite sure what will react." },
  },

  start = "hello",
  nodes = {
    xcl_scholo = {
      big = true,
      lines = { { id = "xcl_scholo_default", text = "Oh, thank goodness, and do sit down, but not on the notes, those are the notes. I've read what the Dawn could find of Gandling's lessons, and he wrote about his students the way I write about reagents, so I'm not sorry, not even academically." } },
      choices = {
        { text = "Burn every book he left behind. None of it is safe.", next = "BACK", reply = "Burn them, then, and I'll strike the match, though part of me will weep for the bibliography.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "His books should be studied. Knowledge is never wasted.", next = "BACK", reply = "Studied, yes, by somebody braver than me. I'd rather not sleep near them.", fx = { align = { light = -1 } } },
        { text = "What did you read, that frightened you so?", next = "xcl_scholo2" },
      },
    },
    xcl_scholo2 = {
      lines = { { id = "xcl_scholo2_default", text = "Lesson plans, mostly, with marks in the margin where a student had done well, and a student doing well meant a body that got up and walked. That's what I can't shake, you see, that it was a school, with timetables and prizes and a headmaster who expected punctuality." } },
      choices = {
        { text = "Then I'm glad that school won't open its doors again.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I really don't know, and that's what worries me, because nothing I've read says what happens when a shaman stands next to a vial of plague. I'd like to keep it that way, if you don't mind, so if you feel a spirit coming on, please step outside first." } },
      choices = {
        { text = "Of course. Your work matters more than my curiosity.", next = "BACK", reply = "Oh, thank you, thank you. I'll keep the vials well away from the lightning.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your work could use a little chaos. Let's find out.", next = "BACK", reply = "Please don't. The last chaos in here cost me a month's work and an eyebrow.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I'd like to say no, but the counter agent is strong, and I've seen grass die where it's spilled. I tell myself the plague would have killed it anyway, though I'm not certain that's true." } },
      choices = {
        { text = "Weaken the brew, then. Spare what can be spared.", next = "BACK", reply = "I've tried, and it doesn't hold. But I'll try again, for the grass.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Use it at full strength. A weak cure only wastes the batch.", next = "BACK", reply = "Full strength it is, and I'll try not to look at the grass.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "One of the commander's soldiers turned round to wave goodbye and swept a month's work off the bench with his pauldron. I don't blame him, not really, but I keep the delicate things on the top shelf now, and I flinch whenever anyone shrugs." } },
      choices = {
        { text = "I'll mind my armour. Your work matters more than my swagger.", next = "BACK", reply = "Thank you! Elbows in, please, and we'll all get along.", fx = { align = { order = 1 } } },
        { text = "Glass breaks in a war camp. Keep it somewhere safer.", next = "BACK", reply = "Somewhere safer? This is the safest place in the Plaguelands. That's the trouble.", fx = { align = { order = -1 } } },
        { text = "Something else, Arbington.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "If my books are right, the Scholomance stinks of necromancy to anything with a good nose, so even the plagued wolves give the island a wide berth. I'd trust a wolf's nose over a book, frankly, but the wolves won't sit still to be questioned." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "If my books are right, the Scholomance stinks of necromancy to anything with a good nose, so even the plagued wolves give the island a wide berth. I'd trust a wolf's nose over a book, frankly, but the wolves won't sit still to be questioned. Does {pet} bristle when the wind comes off Darrowmere, {class}?" },
      },
      choices = {
        { text = "Trust the beasts. They know evil better than any book.", next = "BACK", reply = "So would I. The books were written by people who never had a nose for anything.", fx = { align = { order = -1 } } },
        { text = "Books first, Arbington. A beast's nose is only guesswork.", next = "BACK", reply = "Books first, but I'll keep a wolf in mind. They're surprisingly good at reading.", fx = { align = { order = 1 } } },
        { text = "Let us speak of something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "That the Barovs gave Caer Darrow to the Cult of the Damned, and that the cult teaches necromancy there the way Dalaran once taught arithmetic. They raise the dead as homework, and some of the dead they practise on were knights of your order." } },
      choices = {
        { text = "Then the place must be cleansed, whatever it costs.", next = "BACK", reply = "It must, and I'd like to be very far away when it happens. Do go carefully.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Knowing their methods matters more than cleansing their halls.", next = "BACK", reply = "Their methods matter, yes, but so does sleeping at night. I'd cleanse it first and study the ashes.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Please don't call any lightning in here, {class}, because most of what's on this table would explode at once, and the rest would explode a little later." },
        { id = "h_default", key = true,
          text = "Arbington, alchemist, at your service. I brew the counter agent High Priestess MacDonnell pours into the plague cauldrons, among other things, and I've done more reading about the Scholomance than anyone ever should, so please don't ask me what I've read." },
        { id = "h_fragments", tags = { "news" }, when = { questActive = TODO_QUEST("Skeletal Fragments") },
          text = "A skeleton key made from skeletons, yes, everyone makes that joke. Just bring me the bone fragments, and the ones from Andorhal hold up best." },
        { id = "h_mold", tags = { "news" }, when = { questActive = TODO_QUEST("Mold Rhymes With...") },
          text = "Krinkle Goodsteel in Gadgetzan makes molds for nasty things and charges accordingly. I'd pay him myself, but if I had any gold of my own, would I be living here?" },
        { id = "h_scarab", tags = { "news" }, when = { questActive = TODO_QUEST("Araj's Scarab") },
          text = "The key needs a head, and that's Araj's scarab, his signet. He ran the Scholomance before he took Andorhal, so it ought to open his old door, and I'm fairly confident of that, or at least moderately." },
        { id = "h_cl_scholo", tags = { "news" }, when = { cleared = "Scholomance", faction = "Alliance" },
          text = "You went into the Scholomance, didn't you, and you came back out, and Gandling didn't. That is precisely the opposite of how I pictured it every night for a month." },
        { id = "h_key", when = { questDone = TODO_QUEST("The Key to Scholomance") },
          text = "You have the key, and you'll go in, won't you? I'd ask you to write and tell me what's inside, but I already know, and I couldn't bear to read it in your handwriting." },
        { id = "h_pay", when = { metBefore = true },
          text = "Stormwind pays me in coin, mud and the occasional ghoul through the tent wall. I did the sums once, and then I stopped doing sums altogether." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Please don't conjure anything, {name}, not here, not near the vials. There's a sulphur smell on your sleeves, and this glassware came all the way from Stormwind." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Oh, you startled me! Please, {class}, cough or something when you come in, for I've reagents on this table that won't forgive a jogged elbow." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Oh, thank goodness, because every time I open one of these Scholomance texts I feel I ought to have someone holy standing behind me, and the soldiers keep laughing when I ask." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "Oh, you're wearing a lot of metal, {class}, so please turn very slowly, because my glassware is on both sides of you and there's no more coming from Stormwind." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter! I don't suppose you've ever tracked anything onto Caer Darrow, {class}? I've read that the beasts won't go near the island, and I'd love to know if it's true." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! I've read about your people's herbalism, though only in very old books, and I'd love to compare notes with you." },
      },
      again = {
        { id = "h_again", text = "Was there something else? I don't mind, really, it's nice to talk to someone who isn't a bone." },
        { id = "h_again2", text = "Yes, yes, ask away, only keep your elbows in." },
      },
      choices = {
        { text = "Tell me about the Scholomance.", next = "scholo" },
        { text = "What else are you working on?", next = "key" },
        { text = "The pay must be poor out here.", next = "pay" },
        { text = "The Light could help with your work.", next = "priest", when = { class = "PRIEST" } },
        { text = "How do you collect what you need from the dead?", next = "alch", when = { profession = "Alchemy" } },
        { text = "You must have studied in Dalaran, Arbington.", next = "x_mage", when = { class = "MAGE" } },
        { text = "The Scourge's alchemy and mine aren't so far apart.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Need anything fetched quietly from the Scholomance?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Would the elements upset your work, Arbington?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "The Scholomance is finished, Arbington. Gandling is dead.", next = "xcl_scholo", when = { cleared = "Scholomance", faction = "Alliance" } },
        { text = "I'll get what you need.", next = "END", fx = { affinity = 1 } },
        { text = "What have you read about the Scholomance that frightens you?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I'd guess warriors break a lot of your glassware, Arbington.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Why wouldn't the beasts go near Caer Darrow?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do your brews harm the land as well as the Scourge?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Need? Everything there is guarded by dead students and worse teachers, and anything worth having is locked. I'm building a key out of bones so we can walk in the front door, but if you'd rather go round the back, I won't stop you, and I won't watch either." } },
      choices = {
        { text = "Your key is the right way. I'll wait for it.", next = "BACK", reply = "Thank you! It won't be long now, a few more bones and a lot of patience.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The front door is too slow. I'll find another way.", next = "BACK", reply = "Then good luck, and don't touch anything in there that looks like it might be a key. Or anything at all.", fx = { align = { order = -1 } } },
        { text = "Let's talk of other things, alchemist.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "That's precisely what frightens me, for the Scourge's cauldrons are alchemy too, alchemy gone wrong in ambitious hands. I read the Scholomance's books for my work, and I stopped sleeping well somewhere around the second chapter." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "That's precisely what frightens me, and your demon staring into my alembics doesn't help. The Scourge's cauldrons are alchemy gone wrong in ambitious hands, so please call it back before it learns anything, because I stopped sleeping well somewhere around the second chapter." },
      },
      choices = {
        { text = "Some books should stay closed, alchemist. I've opened a few.", next = "BACK", reply = "Some should, and I've read most of them anyway. I'll close the next one, I promise.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Every book is worth reading once. Even theirs.", next = "BACK", reply = "Once, and then you'll never sleep again. I'd not recommend it.", fx = { align = { light = -1 } } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    scholo = {
      lines = {
        { id = "s_default", text = "It was the Barovs' keep on Caer Darrow, and they gave it to Kel'Thuzad, who made it a school for necromancers. Its door doesn't open for the likes of us, hence the key, and hence my nightmares.", fx = { learn = { "scholomance" } } },
      },
      choices = {
        { text = "You know a lot about it.", next = "know" },
        { text = "Something else.", next = "BACK" },
      },
    },
    know = {
      lines = {
        { id = "k_default", text = "Somebody had to study it, and better me, who'll never set foot inside, than someone who might. I read and I take notes, and afterwards I wash my hands for a very long time." },
      },
      choices = {
        { text = "That sounds hard.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    key = {
      lines = {
        { id = "ke_default", text = "A key to the Scholomance, and a skeleton key in the most literal sense, I'm sorry to say. Bone fragments for the body, a mold to shape it, a fire hot enough to set it, and Araj's scarab for the head, and every one of those is somebody else's errand, which is to say yours." },
      },
      choices = {
        { text = "Why a mold from Gadgetzan?", next = "key_krinkle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    key_krinkle = {
      lines = {
        { id = "kk_default", text = "Because Krinkle Goodsteel will make a mold for anything if the gold is right, and nobody this side of the sea will touch the job. I don't ask how he sleeps at night, and I expect he doesn't ask how I do." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pay = {
      lines = {
        { id = "pa_default", text = "It's not that it's bad, exactly, only that it's the same as it would be in a nice warm shop in Stormwind, and nobody in Stormwind has ever had a ghoul come through the tent wall." },
      },
      choices = {
        { text = "You could always go home.", next = "BACK", fx = { trait = { blunt = 1 } } },
        { text = "The camp's lucky to have you.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "Oh, I'd love it to, but the Light and alchemy don't mix in a bottle, I've tried. Bless the people carrying my potions instead, and that'll do more good than blessing the potions." },
      },
      choices = {
        { text = "Then I'll bless the carriers.", next = "BACK", reply = "Thank you. They'll carry the potions further for it, I think.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "A good potion does more than any blessing.", next = "BACK", reply = "It does, but don't tell MacDonnell I agreed. She has a very heavy hand.", fx = { align = { light = -1 } } },
      },
    },
    alch = {
      lines = {
        { id = "al_default", text = "You carry my focuser with you while you fight, and it catches what the creatures leave behind when they come apart. Leave it in your tent and you'll be bringing me plain bones, and I'll have to be polite about it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } } },
    },
    x_mage = {
      lines = {
        { id = "xm_default", text = "I wish I had, but no, I learned from books, and half of those burned with Dalaran, so mostly I learned from what was left. You'd know the arcane side of my quickener brew better than I do, frankly, and if you could look at my measures without laughing I'd be ever so grateful." },
        { id = "xm_gnome", when = { origin = "gnome_last_student" }, text = "You studied in Gnomeregan, before it fell? Then you and I both learned from books that don't exist anymore, and I think that makes us colleagues of a sort." },
      },
      choices = {
        { text = "Show me your measures.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "I'll try very hard not to laugh.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I know far more than anyone ought to about some very unpleasant subjects. These, specifically, if you can bear to hear about them." },
    },
    background = { { id = "tp_ba", text = "I'm an alchemist who studied the wrong school for too many years, and now Stormwind finds that useful, which I suppose is a sort of compliment." } },
    advice = { { id = "tp_ad", text = "Use the quickener the moment you get it, since it spoils in half an hour, and don't carry it in a pocket you're fond of." } },
    scholomance = { { id = "tp_scholomance", text = "Don't go in without a key and don't go in without friends, and if you can possibly manage it, don't go in at all." } },
    plague_cauldrons = { { id = "tp_cauldrons", text = "The counter agent that spoils the cauldrons is brewed from what the dead leave behind, bone and ectoplasm and worse. It sounds terribly grand, but I promise you it isn't." } },
    scourge = { { id = "tp_scourge", text = "The Scourge's necromancers learn their craft at Scholomance, and I've spent years studying how they do it. I wash my hands after every chapter and still don't feel clean." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad founded the Cult of the Damned and taught the Barovs to bargain away their own island. Every horror in Scholomance traces back to him, and I try not to say his name too often." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran had the finest libraries in the world, and some of what they kept would have helped us here. They're rebuilding behind closed gates, and they don't answer my letters." } },
    stratholme = { { id = "tp_stratholme", text = "Stratholme is a dead city full of Scourge and Crusaders, and both would kill me on sight. I'll study it from a very great distance, thank you." } },
    _none = { { id = "tp_none", text = "That's out of my field, I'm afraid, as most things are out here. My field is very small and rather full of bones." } },
  },
}

P:NPC {
  key = "weldon", id = TODO_NPC("Weldon Barov"), name = "Weldon Barov",
  bible = "bibles/westernplaguelands.md", role = "noble", tier = "quest",
  communities = { "chillwind_camp" }, temper = { "cowardly", "proud" }, values = { "greedy", "vengeful" },
  notices = { "race", "kit", "lock_soulstone" },

  impression = {
    first = "Fear and greed have been sharing his face for a long time.",
    third = "{name} met Weldon Barov, the last living Barov, hiding from his brother's assassins at Chillwind Camp.",
  },

  greetings = {
    { id = "g_who", text = "Who sent you, and what's your business? Say it slowly, and keep your hands where I can see them." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, the hired help returns. Any news of my brother? Good news, I mean, the kind where he's finally dead." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, which in my experience means you were either working or bought. Which was it?" },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "Someone in camp was swindled, I'm told, and the description sounded rather like you. I know the trade well enough, so mind your hands." },
  },

  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "Guards! Oh, a Forsaken, here in an Alliance camp? How you got past the sentries I don't care to know, so stay right there." },
    { id = "n_fine", cat = "kit", when = { durability = { max = 0.3 } },
      text = "You look dreadful, all rags and dents. Find the family fortune for me and you'll never have to dress like a peasant again." },
    { id = "n_lock_soulstone", cat = "lock_soulstone", when = { carrying = { 5232, 16892, 16893, 16895, 16896 } },
      text = "Is that a soulstone? I know one when I see one, believe me. I'd give a great deal for a way back from death that doesn't end the way my brother's did, though I don't suppose you'd part with it." },
  },

  start = "hello",
  nodes = {
    op_barov = {
      big = true,
      lines = {
        { id = "opbv_default", text = "Deserve them? I'm the only Barov left with a pulse, which ought to settle it. But you seem the judging sort, so go on and tell me: does House Barov deserve its lands back, after everything?" },
      },
      choices = {
        { text = "Your parents sold Lordaeron to Kel'Thuzad. You forfeited everything.", next = "op_barov_r1", fx = { affinity = -2, align = { honor = 1 }, opinion = { barov = "forfeit" } } },
        { text = "A deed's a deed. If the paper's good, the land's yours.", next = "op_barov_r2", fx = { affinity = 1, align = { honor = -1 }, trait = { greedy = 1 }, opinion = { barov = "deserve" } } },
        { text = "Stormwind should decide who holds Lordaeron's lands now.", next = "op_barov_r3", fx = { trait = { practical = 1 }, opinion = { barov = "crown" } }, when = { race = "Human" } },
        { text = "I'll not judge your family, Weldon.", next = "BACK" },
      },
    },
    op_barov_r1 = {
      lines = { { id = "opbv_r1", text = "Forfeited! My parents did the selling, not me, and I'll thank you not to say that word anywhere near the Commander." } },
      choices = { { text = "Something else, Barov.", next = "BACK" } },
    },
    op_barov_r2 = {
      lines = { { id = "opbv_r2", text = "Exactly! A sensible person at last. Bring me my brother's half of the paper, and you'll see how grateful a Barov can be." } },
      choices = { { text = "Something else, Barov.", next = "BACK" } },
    },
    op_barov_r3 = {
      lines = { { id = "opbv_r3", text = "Stormwind can barely decide who holds Westfall. I'd rather trust a good lawyer and a better deed, thank you." } },
      choices = { { text = "Something else, Barov.", next = "BACK" } },
    },
    xpt_company = {
      big = true,
      lines = { { id = "xpt_company_default", text = "Anyone with land in Lordaeron and the deeds to prove it, which these days means me, my brother Alexi, and a few desperate barons hiding in Southshore. Caer Darrow was ours before Kel'Thuzad's lot took it, and the family that clears it will keep it." } },
      choices = {
        { text = "The family that pays best will have our swords.", next = "BACK", reply = "Splendid! Then you'll want to stay on my good side, because Alexi pays in promises.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "We fight the Scourge, not for anyone's deeds.", next = "BACK", reply = "Noble, and dreadfully unprofitable. Still, the Scourge is in my house, so we're aligned.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcl_scholo = {
      big = true,
      lines = { { id = "xcl_scholo_default", text = "Quiet's a mercy, and more than they ever gave the servants. Father and Mother are still in there, I suppose, in whatever state Kel'Thuzad left them, and my sister Jandice too, and I'll confess I didn't send you in to bring any of them home." } },
      choices = {
        { text = "They were your family. You owe them a proper burial.", next = "BACK", reply = "A proper burial? I'll see to it when the deeds are settled. They'd want the paperwork done first.", fx = { align = { honor = 1 } } },
        { text = "They chose Kel'Thuzad. They don't deserve your grief.", next = "BACK", reply = "They didn't, and I'll confess I agree with you. Still, they were Barovs, and Barovs were never easy to love.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Did you ever love them, Weldon?", next = "xcl_scholo2" },
      },
    },
    xcl_scholo2 = {
      lines = { { id = "xcl_scholo2_default", text = "I loved the house, which I realise is a terrible thing to say, but it was a beautiful house and they were not beautiful people. Jandice taught me to read, though, so if you saw her in there, I'd rather not know what she's become." } },
      choices = {
        { text = "I'll keep what I saw to myself, then.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I'd have you speak to anyone who'll confirm my claim, whether they're living, dead or merely elemental. Alexi has the Forsaken behind him, and I have a sword under my blanket and now you, so we'll see whose spirits win out." } },
      choices = {
        { text = "The dead deserve rest, Weldon, not your quarrels.", next = "BACK", reply = "Rest is a fine thing, but rest doesn't pay the rents. I'll settle the quarrel, and then they can rest.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Dead brothers have no claims. Take your inheritance.", next = "BACK", reply = "Exactly my position, and I'm glad an honest shaman agrees. Spread the word.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Left on their own? They'd go to weeds and wolves, druid, and then who would pay the rents? No, Caer Darrow needs a Barov to run it, and it'll have one, once my brother stops being so tiresome about being dead." } },
      choices = {
        { text = "The land needs healing, not a landlord.", next = "BACK", reply = "Healing is all very well, but someone has to sign the papers. Caer Darrow needs a lord.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "A lord who rebuilds is better than wild ruin.", next = "BACK", reply = "Spoken like a sensible person. I'll remember you when the rents come in.", fx = { align = { order = 1 } } },
        { text = "Something else, Barov.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I'd hire a dozen if Valorfist would let me keep them in camp, but the commander says his soldiers aren't for private use. So I keep my own sword under the blanket and sleep with one eye open and both boots on." } },
      choices = {
        { text = "I'll guard the camp, Barov, not a frightened man's bedroom.", next = "BACK", reply = "Frightened? I'm cautious, and there's a difference. Guard the camp, then, and I'll sleep with the sword.", fx = { align = { honor = 1 } } },
        { text = "For the right fee, I'll stand wherever you like, Barov.", next = "BACK", reply = "Splendid, a professional! We'll discuss the fee when Alexi is dead.", fx = { align = { honor = -1 } } },
        { text = "Something else, Weldon.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "So the rumour goes, and I believe every unpleasant rumour about that island. If you happen to put down one of the Barov hounds, do bring me the collar, because the silver alone was worth a small fortune." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "So the rumour goes, and I believe every unpleasant rumour about that island. If you happen to put down one of the Barov hounds, do bring me the collar, because the silver alone was worth a small fortune. Keep {pet} well away from my tent, would you?" },
      },
      choices = {
        { text = "I'll put the hounds to rest. The silver can stay with them.", next = "BACK", reply = "Rest them with the silver, then. It's a terrible waste, but I suppose it's noble.", fx = { align = { light = 1 } } },
        { text = "Silver's silver. I'll bring you every collar I find.", next = "BACK", reply = "Splendid! Every collar, mind, and I'll pay a fair finder's fee.", fx = { align = { light = -1 } } },
        { text = "Let us talk of something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Caer Darrow, its people and a school full of necromancers, if you must keep accounts. The Barovs were far from blameless, but I'll not claim I could have stopped my father's dealings with a sword I barely knew how to hold." } },
      choices = {
        { text = "A man of honour would have tried anyway.", next = "BACK", reply = "Perhaps, and perhaps he'd be dead too. I'd rather be cowardly and alive.", fx = { align = { honor = 1 } } },
        { text = "No man can answer for his father's sins.", next = "BACK", reply = "Exactly, and I'm glad someone sees it. Father's sins are Father's, and his deeds are mine.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "My father did, and Alexi says we were promised immortality for it, while I say we were promised nothing worth having. I left before the bargain was sealed, and I'll thank you to remember that I left." } },
      choices = {
        { text = "Leaving isn't atonement. You owe the Light more than that.", next = "BACK", reply = "More, is it? The Light can send me a bill. I've a few others in front of it.", fx = { align = { light = 1 } } },
        { text = "You chose to live. The Light can't fault you for that.", next = "BACK", reply = "It can't, and I'll thank you to tell the priests so. I chose to live, and that's that.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_company", tags = { "news" }, when = { party = { size = 4 }, faction = "Alliance" },
          text = "A full company of hardened adventurers, and here I am without a contract to offer you, which is a tragedy for us both. My brother at the Bulwark would hire you in a heartbeat, so do remember which Barov spoke to you first." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf who talks to spirits? Then perhaps you can tell my brother's spirit to stop walking about and accept that Caer Darrow is mine, {class}, because he certainly isn't listening to me." },
        { id = "h_default", key = true,
          text = "I am Weldon Barov, the last living Barov and the rightful heir to Caer Darrow, Brill, Tarren Mill and Southshore. My brother Alexi disagrees, but he's also dead; he simply refuses to lie down.",
          fx = { hear = "barov_heir" } },
        { id = "h_fortune", tags = { "news" }, when = { questActive = TODO_QUEST("Barov Family Fortune") },
          text = "There are four deeds somewhere in the Scholomance, and you must find them before Alexi's hired cutthroats do. I spared Alexi once, because his corpse still wore my brother's face, and I won't make that mistake again." },
        { id = "h_last", tags = { "news" }, when = { questActive = TODO_QUEST("The Last Barov") },
          text = "The deeds are mine, and now only my brother Alexi stands between me and the fortune, sitting at the Bulwark like a vulture on a fence. End him for me." },
        { id = "h_cl_scholo", tags = { "news" }, when = { cleared = "Scholomance", faction = "Alliance" },
          text = "So the Darkmaster's dead, and someone finally had the decency to finish what my family started when they let him in. I'd like to say I feel something about it, and I do, and the something is mostly relief." },
        { id = "h_done", when = { questDone = TODO_QUEST("The Last Barov") },
          text = "So Alexi's gone, properly gone at last. I thought I'd feel something about it, but I find I mostly feel rich, and that will have to do." },
        { id = "h_sleep", when = { metBefore = true },
          text = "I sleep with my back to the cliff and a sword under my blanket, because of the assassins, you understand. My brother Alexi sends them, and in his place I'd do the same." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "You're not one of Alexi's, are you? You've the same cold about you, and he keeps unpleasant company now that he's dead. I sleep with a sword under the blanket for good reason." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! My family once kept a Kirin Tor tutor, {class}, and I'm told I was his most promising pupil, whatever Alexi may say about it." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest. If you've come to pray for my brother's soul, don't trouble yourself, because Alexi sold it to the Cult of the Damned along with the family silver." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, and you'll be looking down your nose at a Barov, I expect. Save yourself the trouble, because Valorfist has already done it twice today." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior! Splendid, for you're exactly the sort I'd want about if my dead brother came calling, {class}, though I'd want you at the door, not by the bed." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter. We kept a fine kennel at Caer Darrow, {class}, and I'm told the hounds still prowl the island, though whose hounds they are now I'd rather not guess." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A druid of the kaldorei. I suppose you'll be wanting to plant trees on my family's lands once this is over, but I'll be wanting my rents first." },
      },
      again = {
        { id = "h_again", text = "Well? You're still here, so you must want something else." },
        { id = "h_again2", text = "Go on, then, but keep your voice down, the soldiers listen." },
      },
      choices = {
        { text = "What happened at Caer Darrow?", next = "darrow" },
        { text = "Your brother has a claim too.", next = "claim" },
        { text = "What exactly are you heir to?", next = "deeds" },
        { text = "My family lost everything in Lordaeron too.", next = "refugee", when = { origin = "human_lordaeron_refugee" } },
        { text = "I doubt it was worth it, now he's gone.", next = "worth", when = { questDone = TODO_QUEST("The Last Barov") } },
        { text = "Your brother might hire someone like me, you know.", next = "x_rogue", when = { class = "ROGUE" } },
        { text = "If I were Alexi's, you'd already be dead.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "The Barovs must have known Kel'Thuzad well.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Would you have me speak to your brother's spirit, Weldon?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I've been through Caer Darrow, Weldon. Your family's house is quiet.", next = "xcl_scholo", when = { cleared = "Scholomance", faction = "Alliance" } },
        { text = "Who would hire a company like ours out here?", next = "xpt_company", when = { party = { size = 4 }, faction = "Alliance" } },
        { text = "I'll see what I can find.", next = "END", reply = "Splendid. Do hurry, though, because Alexi has a terrible habit of getting there first.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I won't help a man who'd murder his own brother.", next = "END", reply = "Murder? It's an inheritance dispute, {class}, with very sharp edges. Off you go, then, and do mind the ghouls.", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Did your family really give Caer Darrow to the Cult?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What did your family's fall cost Lordaeron, Weldon?", next = "xapala", when = { class = "PALADIN" } },
        { text = "You'd hire a sword against your own brother.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "I hear your family's hounds still roam Caer Darrow.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Should Caer Darrow's lands be left to heal on their own?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Too well, I'm afraid, for he was a guest at Caer Darrow more often than I care to remember, and my parents were charmed by every word. I got out with my life and Alexi didn't, and somehow he still claims to be the clever one." } },
      choices = {
        { text = "Your family sold out its people. That's unforgivable.", next = "BACK", reply = "It is, and I've said so in every tavern from here to Southshore. Not that anyone listens to a Barov.", fx = { align = { honor = 1 } } },
        { text = "Plenty were fooled. Your parents were only unlucky.", next = "BACK", reply = "Unlucky, yes, and greedy, and very fond of a flattering guest. I'll take unlucky, if you're offering.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Let's speak of something else, Barov.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "That's not nearly as reassuring as you think it is. Still, if whatever follows you about could stand guard outside my tent, I'd not object, for the Argent folk here don't take my fears at all seriously." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "That's not nearly as reassuring as you think it is, and less so with your demon looking at me like that. Still, since it's standing about anyway, I'd not object to it standing guard outside my tent, for the Argent folk here don't take my fears at all seriously." },
      },
      choices = {
        { text = "Your fear is sensible, Weldon. Keep the sword close.", next = "BACK", reply = "Thank you! At last, someone who takes me seriously. The sword stays exactly where it is.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A coward's fears are no business of mine.", next = "BACK", reply = "Coward? I'm alive, which is more than the brave Barovs can say. Do mind the tent on your way out.", fx = { align = { light = -1 } } },
        { text = "Let's talk of other things.", next = "BACK" },
      },
    },
    darrow = {
      big = true,
      lines = {
        { id = "d_default", text = "My father bargained with Kel'Thuzad for immortality, and the whole house got it, after a fashion. I ran, being the only one of us with the sense to run." },
      },
      choices = {
        { text = "I'm sorry.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "You ran and left your family to it.", next = "darrow_ran", fx = { affinity = -2, align = { honor = 1 } } },
        { text = "Running was the sensible thing to do.", next = "BACK", reply = "It was, and the only sensible thing any Barov has done in a generation. I'm rather proud of it.", fx = { affinity = 1, align = { honor = -1 } } },
      },
    },
    darrow_ran = {
      lines = {
        { id = "dr_default", text = "Left them to what, a wedding? They'd already signed, and there was nothing to save but my own neck, so I saved it. Judge me from inside a Barov's house some evening and see how brave you feel." },
      },
      choices = {
        { text = "I'll not judge you, then.", next = "BACK" },
        { text = "I'd have stayed.", next = "BACK", fx = { affinity = -1, trait = { brave = 1 } } },
      },
    },
    claim = {
      lines = {
        { id = "c_default", text = "A claim? He's a corpse, and corpses don't inherit, they get buried. I'd have done him the courtesy myself, if I'd had a shovel and a little more spine." },
      },
      choices = {
        { text = "You had your chance once, then?", next = "claim_spared" },
        { text = "Whose name is on those deeds, Weldon? Don't lie to me.", tag = "Intimidate", next = "claim_truth",
          check = { pass = { any = { { power = { "above", "far_above" } }, { trait = "stern" }, { class = { "WARRIOR", "PALADIN" } } } } },
          fail = { next = "claim_guards", fx = { affinity = -1 } } },
        { text = "Noted.", next = "BACK" },
      },
    },
    claim_spared = {
      lines = {
        { id = "cs_default", text = "I had him at my mercy and he looked at me with my brother's eyes, and I couldn't do it. It's the greatest regret of my life, and I've a long list to choose from." },
      },
      choices = {
        { text = "That was mercy, not weakness.", next = "BACK", reply = "That's kind, and it's what I tell myself at night. It doesn't help much, but it's kind.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then let's correct it.", next = "BACK", reply = "Yes, let's. I'll see it done properly this time, with you holding the other end.", fx = { affinity = 2, align = { honor = -1 } } },
      },
    },
    deeds = {
      lines = {
        { id = "de_default", text = "The family's deeds to Caer Darrow, to Brill, to Tarren Mill and to Southshore. Half of those places are full of the dead or of the Horde now, but paper outlasts armies, and I intend to be holding it when the armies are gone." },
      },
      choices = {
        { text = "Southshore's people may disagree.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Do you think you deserve those lands, Weldon?", next = "op_barov" },
        { text = "Something else.", next = "BACK" },
      },
    },
    refugee = {
      lines = {
        { id = "rf_default", text = "Did you, now? Then you know what it is to lose a house, though I doubt yours had a ballroom. I'll say this much, it's rare I meet anyone up here who understands what was taken from us." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    worth = {
      big = true,
      lines = {
        { id = "wo_default", text = "Worth it? I have my deeds and my brother is ash, so by any honest accounting, yes. Ask me again in a year, when I've had time to miss him, and I'll tell you the same thing." },
      },
      choices = {
        { text = "I hope you find some peace.", next = "BACK", reply = "Peace? How very kind, and how very unlike anyone else in my family. I'll settle for comfort, I think, which is easier to buy and doesn't ask awkward questions.", fx = { affinity = 1, trait = { kind = 1 }, align = { honor = 1 } } },
        { text = "Enjoy the money.", next = "END", reply = "Oh, I shall, every last copper. It's the only family legacy worth having.", fx = { align = { honor = -1 } } },
      },
    },
    claim_truth = {
      big = true,
      lines = {
        { id = "ct_default", text = "Keep your voice down! Nobody's read those deeds since the Scourge came to the keep, so I don't know whose name is on them, and that's exactly why I need them before he does. He'll swear Father meant it all for him, I'll swear the opposite, and Father is in no state to settle it." },
      },
      choices = {
        { text = "So your claim is only as good as his.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Then whoever holds the paper wins.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    claim_guards = {
      lines = {
        { id = "cg_default", text = "Don't you dare raise your voice to me, I am a Barov and there are soldiers within shouting distance! The deeds are mine, and that's all you need to know, hireling." },
      },
      choices = {
        { text = "Calm down, Weldon.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_rogue = {
      lines = {
        { id = "xr_default", text = "Don't say such things, not where the soldiers can hear! If Alexi had any sense he'd have sent someone already, and I've slept with a sword under my blanket since the day he crawled out of that keep, so if you're thinking of it, I'll pay double." },
      },
      choices = {
        { text = "Double, then. I'll remember that.", next = "BACK", reply = "Double it is, and I'll pay it gladly. It's cheaper than being murdered.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I don't take that kind of work, Barov.", next = "BACK", reply = "Then don't take it, and don't tell Alexi I offered. I'll find someone less principled.", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I know my family's business better than anyone living, which isn't a large field these days. Ask me about any of this, quietly." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "I'll tell you only what anyone in this mud camp could, and keep your hands where I can see them while I do." },
    },
    background = { { id = "tp_ba", text = "I'm a Barov of Caer Darrow, and the only one of us still breathing. Whatever else you've heard was put about by my brother.", next = "darrow" } },
    advice = { { id = "tp_ad", text = "Never sign anything a necromancer hands you, however good the terms look. It's the only family wisdom I have left." } },
    scholomance = { { id = "tp_scholomance", text = "It was my home, and a beautiful one once. Now they teach the dead to walk in my mother's ballroom." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "My father made a bargain with Kel'Thuzad, and I escaped the massacre that followed. I've slept with a sword under my blanket ever since." } },
    lordaeron = { { id = "tp_lordaeron", text = "The Barovs were a great house of Lordaeron, with lands that stretched further than you can see from here. Those lands are mine now, by right, whatever my brother says." } },
    forsaken = { { id = "tp_forsaken", text = "My brother serves the Forsaken now, and he'd see me dead to claim the inheritance. The Forsaken are welcome to him." } },
    scourge = { { id = "tp_scourge", text = "The Scourge took Caer Darrow and everything my family built. I'll have it back, one way or another, and the Scourge can find somewhere else to live." } },
    _none = { { id = "tp_none", text = "Does it concern my inheritance? If not, it doesn't concern me." } },
  },
}

P:NPC {
  key = "pureheart", id = TODO_NPC("Argent Officer Pureheart"), name = "Argent Officer Pureheart",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "chillwind_camp", "argent_dawn" }, temper = { "steady" }, values = { "devout", "fair" },
  notices = { "race", "class", "lock_pact" },

  impression = {
    first = "Nobody draws steel at her table, whatever colors they wear.",
    third = "{name} met Argent Officer Pureheart, who speaks for the Argent Dawn at Chillwind Camp.",
  },

  greetings = {
    { id = "g_dawn", text = "For the Dawn, friend, and whatever else you fight for, add that to it." },
    { id = "g_xknight", when = { origin = "forsaken_risen_knight" }, text = "You took the oath once, I think, back in Uther's day, and the Light still answers you. The Dawn doesn't ask what you are now, friend, only what you fight." },
    { id = "g_back", when = { metBefore = true }, text = "Well met again. Have you any scourgestones in your pack? The Dawn will always take them off your hands." },
  },

  notice = {
    { id = "n_horde", cat = "race", when = { faction = "Horde" },
      text = "Horde, in an Alliance camp, so easy, everyone, because nobody draws steel at my table. The Dawn doesn't ask what colors you wear, only whether you'll fight the dead." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "Silver Hand? I was too, until Mograine fell and the order went red. Lord Tyrosus and I walked out the same day, and the Light walked out with us, whatever the Crusade says." },
    { id = "n_lock_pact", cat = "lock_pact", when = { aura = { 6307, 7804, 7805, 11766, 11767 } },
      text = "You've a fevered look about you, and in the plaguelands that makes me reach for a cure, but this heat is an imp's pact, isn't it? Good, because that's one less soul I have to worry over today." },
  },

  start = "hello",
  nodes = {
    op_silver_hand = {
      big = true,
      lines = {
        { id = "opsh_default", text = "I ask myself that most mornings. The Crusade wears the order's tabards and the Dawn tries to keep its vows, and the name belongs to neither of us now. You've heard the stories, so what do you think: can the Silver Hand rise again?" },
      },
      choices = {
        { text = "Yes, if people like you keep its vows.", next = "op_silver_hand_r1", fx = { align = { order = 1 }, opinion = { silver_hand = "hope" } } },
        { text = "It died with Uther. Let the name go.", next = "op_silver_hand_r2", fx = { align = { order = -1 }, opinion = { silver_hand = "dead" } } },
        { text = "I carry its teachings, whatever the order calls itself.", next = "op_silver_hand_r3", fx = { affinity = 1, trait = { pious = 1 }, opinion = { silver_hand = "faith" } }, when = { class = "PALADIN" } },
        { text = "I'll leave that to paladins, officer.", next = "BACK" },
      },
    },
    op_silver_hand_r1 = {
      lines = { { id = "opsh_r1", text = "That's kind of you, and heavier than it sounds. I'll try to be worth it, though some days the vows are all I have left of it." } },
      choices = { { text = "Something else, officer.", next = "BACK" } },
    },
    op_silver_hand_r2 = {
      lines = { { id = "opsh_r2", text = "Maybe it did, and maybe that's why the Crusade fights so hard over its corpse. The work goes on whatever we call it." } },
      choices = { { text = "Something else, officer.", next = "BACK" } },
    },
    op_silver_hand_r3 = {
      lines = { { id = "opsh_r3", text = "Then the Silver Hand isn't dead while you're standing, and I'm glad to hear it said. Uther taught that the order was its people, not its banner." } },
      choices = { { text = "Something else, officer.", next = "BACK" } },
    },
    xpt_priest = {
      big = true,
      lines = { { id = "xpt_priest_default", text = "Rarer than it should be, because the bold young things who come north think a sharp blade is all they need, and the plague teaches them otherwise within a day or two. The Dawn will take any soul willing to fight the Scourge, but I'll always think a little better of the ones who plan on coming back." } },
      choices = {
        { text = "Every company should travel with a healer. It's only sense.", next = "BACK", reply = "It is, and I wish more of them knew it before they came north. Welcome, healer.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A quick blade ends the fight before healing ever matters.", next = "BACK", reply = "Ends it, aye, until the plague gets in through a scratch. Carry a bandage, at least.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcl_strat = {
      big = true,
      lines = { { id = "xcl_strat_default", text = "Then you've seen what Arthas left behind, and what moved into the rooms after him. The Dawn lost good people trying to map those streets, living and Forsaken both, and I'll be writing to whoever they left behind that the city has answered for them at last." } },
      choices = {
        { text = "Write their names first. They paid more than I did.", next = "BACK", reply = "I will, and I'm glad you asked. They'd have liked to know someone came back.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Write mine first. I'm the one who came back.", next = "BACK", reply = "I'll write you, {class}, and then I'll write them, and they'll still be dead. Mind that.", fx = { align = { honor = -1 } } },
        { text = "Who were they, the ones you lost there?", next = "xcl_strat2" },
      },
    },
    xcl_strat2 = {
      lines = { { id = "xcl_strat2_default", text = "A Forsaken scout who said he'd forgotten his own name, and two brothers from Stormwind who argued over every map we ever drew. They died together on the same street, and I've always thought they'd find that funny." } },
      choices = {
        { text = "I'd like to think they would.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "There is, though you have to dig to find it. I've seen seeds sprout by the camp's well, tiny and pale, and I've stood watch over them like they were my own children. Don't laugh; it's the only thing growing here." } },
      choices = {
        { text = "I won't laugh. Anything green out here is worth a smile.", next = "BACK", reply = "Thank you. Three came up this week, and I've named every one of them.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Seedlings won't stop the Scourge. Watch the gate instead.", next = "BACK", reply = "I watch both, as it happens. The gate keeps them safe, and they keep me sane.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because an Alliance blade and a Horde blade look the same to me but not to each other, and one quick hand on a hilt can undo a month of trust. At the door steel is only steel, and at the table we're only people who fight the dead." } },
      choices = {
        { text = "Then I'll leave it there gladly. Your table, your rules.", next = "BACK", reply = "Thank you. You'll find the company friendlier for it, and the stew no worse.", fx = { align = { honor = 1 } } },
        { text = "A soldier who disarms in the Plaguelands is a fool, officer.", next = "BACK", reply = "A fool, perhaps, but a living one, and the table's had no blood on it yet. Leave the steel at the door.", fx = { align = { honor = -1 } } },
        { text = "Tell me something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Quite a lot, because the plague doesn't care which kingdom a wolf belongs to. I've seen a dwarf and a troll share a fire and argue happily all night about tracking, and neither of them reached for a knife once." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "{pet} is welcome here, {class}. The beasts were the first to make peace at this table, for they never cared what colours their masters wore." },
      },
      choices = {
        { text = "A hunt shared is a hunt doubled. I'd welcome the company.", next = "BACK", reply = "Good. They'll argue with you, but they'll share the fire.", fx = { align = { order = 1 } } },
        { text = "I hunt alone, officer, and I mean to keep it that way.", next = "BACK", reply = "As you like. The fire's here if you ever want it.", fx = { align = { order = -1 } } },
        { text = "Something else, officer.", next = "BACK" },
      },
    },
    dd_honor = {
      lines = {
        { id = "dd_honor_1",
          text = "It doesn't bother me so much as it tires me. Officer Garush at the Bulwark is an orc, and I write to him every week, and somewhere out there someone is counting his kin, or mine, as a number on a list." },
        { id = "dd_honor_2",
          text = "I'm not asking you to stop, mind. I'm asking you to remember, when you come up here, that the Scourge doesn't care which banner you were killed under." },
      },
      choices = {
        { text = "They started this war. I'll finish it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "You're right. Up here we have one enemy.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else, Officer.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_honor", when = { honorKills = { min = 100 } },
          text = "You've the look of someone who's been fighting the other banner in the fields and valleys, {class}. That's your business out there, but at this table we keep our blades for the Scourge, so leave the tally at the gate." },
        { id = "h_dd_rank", when = { pvpRank = 6 },
          text = "I see you wear a rank your own side's war council gave you, and a good deal of blood went into earning it. You'll find no one at Chillwind who'll salute it, I'm afraid, but you'll find a seat." },
        { id = "h_pt_priest", tags = { "news" }, when = { party = { class = "PRIEST" }, faction = "Alliance" },
          text = "You keep a priest by your side in {companion}, and that's the wisest thing I've seen a party do this week. The Plaguelands kill through sickness as often as through the sword, and the ones who come back are the ones who brought someone to cleanse it." },
        { id = "h_default", key = true,
          text = "Argent Officer Pureheart, of the Argent Dawn. We're no kingdom, only people who fight the Scourge, and anyone who fights it is our friend. Alliance and Horde are all one to the dead." },
        { id = "h_commission", tags = { "news" }, when = { questActive = TODO_QUEST("Argent Dawn Commission") },
          text = "Wear the commission, and you'll find the Scourge carry stones, the dark power that binds them made solid. Bring those stones to me, and the Dawn will remember who helped." },
        { id = "h_everlook", tags = { "news" }, when = { questActive = TODO_QUEST("The Everlook Report") },
          text = "Gregor Greystone's report? He's a good man, and I sent him to Everlook to keep the Dawn's ear among the goblins. Let me read it while it's still warm." },
        { id = "h_cl_strat", tags = { "news" }, when = { cleared = "Stratholme" },
          text = "The word from Light's Hope is that Stratholme's masters have fallen, and the officers there are toasting with water because nobody remembered the wine. If you were in that city, sit at my table, and you needn't wear anyone's colours to do it." },
        { id = "h_gregor", when = { heardLine = "gregor.h_default" },
          text = "You've been to Everlook, then, and met Gregor Greystone, who's one of mine. Tell me he's eating properly, because he forgets." },
        { id = "h_tyrosus", when = { heardLine = "tyrosus.h_default" },
          text = "You've spoken with Lord Tyrosus? Then you've had more of his time than I have this year. Is he well? He'd never say if he wasn't." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "I'll not pretend the others at this table like the look of you, {name}. But the Dawn turns away no one who fights the Scourge, and I meant that when I said it." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage at my table! Alliance or Horde, {class}, your fire burns the dead just the same, and the Dawn is grateful for it." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "No knives at this table, {class}, whoever you work for. I keep one place in the Plaguelands where nobody draws steel, and I'd like it to stay that way." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. Lay your weapon by the door if you'll sit at my table, {class}, and you'll have it back the moment you stand." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter, and your beast is welcome at my table too, {class}, so long as it doesn't take a side either." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! The Argent Dawn has need of anyone who can coax life back into this ground, and I've seen your kind do it." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you? The Dawn has no secrets worth keeping from a friend." },
        { id = "h_again2", text = "Ask what you like, friend; the Dawn's work keeps till you're done." },
      },
      choices = {
        { text = "Does it bother you, how many of the enemy I've killed?", next = "dd_honor", when = { honorKills = { min = 100 } } },
        { text = "Where did the Argent Dawn come from?", next = "left" },
        { text = "What does the Dawn ask of me?", next = "commission" },
        { text = "Does the Dawn keep people beyond the Plaguelands?", next = "gregor" },
        { text = "I serve the Light too. Where do priests stand?", next = "priest", when = { class = "PRIEST" } },
        { text = "I was raised in the Silver Hand's teachings.", next = "paladin", when = { class = "PALADIN" } },
        { text = "Your soldiers don't look pleased to see me.", next = "horde", when = { faction = "Horde" } },
        { text = "Is there room in the Dawn for the spirits too?", next = "x_shaman", when = { class = "SHAMAN" } },
        { text = "Does that hold even for the darker arts, officer?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "I'm surprised mages of both sides work together here.", next = "xmage", when = { class = "MAGE" } },
        { text = "Does the Dawn ever need something done quietly?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why must a soldier's weapon stay by the door?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "I doubt Horde and Alliance hunters really work together here.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "There must be life left under the Plaguelands' rot.", next = "xdruid", when = { class = "DRUID" } },
        { text = "I fought my way through Stratholme, Officer.", next = "xcl_strat", when = { cleared = "Stratholme" } },
        { text = "Our healer keeps the plague off us. Is that rare out here?", next = "xpt_priest", when = { party = { class = "PRIEST" }, faction = "Alliance" } },
        { text = "I'll bring you stones.", next = "END", fx = { affinity = 1, learn = { "argent_dawn" } } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Sometimes, and I don't care to hear about it, for the Dawn's good name opens doors in Stormwind and the Undercity both. Work against the Scourge however you must, but don't wear our colours while you do the ugly parts." } },
      choices = {
        { text = "I won't do anything I'd hide from the Dawn.", next = "BACK", reply = "Thank you. The Dawn's name is all some of us have.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Some ugly work has to be done. I'll do it.", next = "BACK", reply = "Then do it, but don't do it in our tabard. I mean that.", fx = { align = { honor = -1 } } },
        { text = "Let's talk of other things, officer.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They do, though they argue over Dalaran's history the whole time. I've seen a gnome and a Forsaken trade spells over a burning ghoul, and if that's possible, I think almost anything is." } },
      choices = {
        { text = "Old hatreds don't matter against the Scourge.", next = "BACK", reply = "They don't, not out here, and I'm glad to hear someone say so. Sit with us sometime.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some hatreds are earned. A truce isn't friendship.", next = "BACK", reply = "It isn't, not yet, but a truce is a start, and a start is more than most get. I'll take it.", fx = { align = { light = -1 } } },
        { text = "That's good to hear. Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "It holds for anyone who keeps their power aimed at the dead. Officer Garush at the Bulwark watches your sort closely, and he has his reasons, but give him time and you'll find he's fair." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "It holds for anyone who keeps their power aimed at the dead, and I'll judge your {pet} by the same rule, though my hand did go to my sword when it came in. Officer Garush at the Bulwark watches warlocks closely and he'll watch that one closer, but give him time and you'll find he's fair." },
      },
      choices = {
        { text = "I'll prove my power serves the living.", next = "BACK", reply = "Good. Garush will see it, given time, and so will I.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll aim it wherever I please, officer.", next = "BACK", reply = "Then aim it well away from this table. The Dawn has no room for surprises.", fx = { align = { light = -1 } } },
        { text = "Understood. Something else.", next = "BACK" },
      },
    },
    left = {
      big = true,
      lines = {
        { id = "l_default", text = "When Mograine died, the Silver Hand's grief turned to hate, and the hateful part became the Scarlet Crusade. Those of us who wanted to fight the plague, not every face that looked different, left and became the Dawn.", fx = { learn = { "argent_dawn", "scarlet_crusade" } } },
      },
      choices = {
        { text = "You chose rightly.", next = "BACK", reply = "I like to think so. It was the hardest thing I've ever done, and the easiest.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Hate or not, the Crusade gets results against the dead.", next = "BACK", reply = "It does, and it kills plenty of the living too. I'll not count that as a result.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "The Crusade still fights the Scourge.", next = "crusade" },
        { text = "Can the Silver Hand ever be what it was?", next = "op_silver_hand" },
      },
    },
    crusade = {
      lines = {
        { id = "c_default", text = "They do, and bravely, but they'd also burn a good many people in this camp for being the wrong sort of alive. I'll pray for them gladly, but I won't march with them." },
      },
      choices = { { text = "Understood.", next = "BACK", fx = { affinity = 1 } } },
    },
    commission = {
      lines = {
        { id = "cm_default", text = "Carry the Dawn's commission and fight the dead, and bring me the scourgestones they drop. That's the whole of it, and it's honest work, whoever you are." },
      },
      choices = {
        { text = "What becomes of the stones?", next = "stones" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stones = {
      lines = {
        { id = "st_default", text = "Every stone is a binding that won't hold a corpse upright again, and the Dawn keeps careful count of who brings them in. Bring enough and you'll find our quartermasters know your name." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "argent_dawn" } } } },
    },
    gregor = {
      lines = {
        { id = "gr_default", text = "Gregor Greystone keeps the Dawn's post in Everlook, up in Winterspring, where every traveler bound for the north passes through. He writes a fine report and forgets to eat, and I worry about the second more than the first." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "Right beside the paladins, and some days in front of them. A wounded defender who walks home is worth three who don't. If you've the Light in your hands, the Dawn has more use for it than you can imagine." },
      },
      choices = {
        { text = "Then put me to work.", next = "BACK", reply = "Gladly. There's always someone hurt, and always someone who needs a steady hand.", fx = { affinity = 2, align = { light = 1 }, standing = { chillwind_camp = 1 } } },
        { text = "I'll keep my Light for my own fights, thank you.", next = "BACK", reply = "That's your right, and I'll not argue. The door's open if you change your mind.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    paladin = {
      lines = {
        { id = "pa_default", text = "Then hold on to the teaching and let go of the banner, which hangs in Hearthglen now, and it's gone red. The Light was never in the cloth, and the Dawn can show you that." },
      },
      choices = {
        { text = "I'll think on it.", next = "BACK", reply = "Good. That's all I did, at first, and the thinking led me here.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The banner meant something, and I won't let go of it.", next = "BACK", reply = "Then keep it, and keep the meaning with it. Just don't follow it to Hearthglen.", fx = { align = { order = 1 } } },
      },
    },
    horde = {
      lines = {
        { id = "ho_default", text = "Some of them fought the Horde in the last war, or lost family to it, so give them time, and give them no excuse. If anyone here lays a hand on you, it'll be me they answer to." },
      },
      choices = { { text = "Fair. I'll keep my head down.", next = "BACK", fx = { affinity = 1 } } },
    },
    x_shaman = {
      lines = {
        { id = "xs_default", text = "The Dawn has room for anyone who stands against the Scourge, and I've watched Horde shamans lay the dead to rest as surely as any priest of mine. I don't understand your spirits, but I've seen what they do to a ghoul, and I'll stand beside anyone who does that." },
      },
      choices = {
        { text = "The spirits and the Light want the same thing here.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else, Officer.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The Dawn keeps careful records, and a good few of them cross my table. Ask me about any of these, friend." },
    },
    background = { { id = "tp_ba", text = "I was a paladin of the Silver Hand, and now I'm an officer of the Argent Dawn. The second was the harder choice, and the better one.", next = "left" } },
    advice = { { id = "tp_ad", text = "Fight beside whoever's fighting the dead, and argue about the rest when the dead are gone." } },
    argent_dawn = { { id = "tp_dawn", text = "Lord Tyrosus leads us from Light's Hope, but out here it's me, a few defenders and whoever answers the call, and more answer every month." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "They were my brothers and sisters, and I miss who they were, but I'm afraid of who they've become." } },
    silver_hand = { { id = "tp_silver_hand", text = "I was a paladin of the Silver Hand, and when the order turned Scarlet, I left it with Tyrosus. I still wear the Light, but I don't wear their colors." } },
    holy_light = { { id = "tp_holy_light", text = "The Light doesn't belong to the Crusade, whatever they say, and it doesn't care which kingdom you serve. It cares whether you'll stand against the dark." } },
    scourge = { { id = "tp_scourge", text = "The Scourge is the enemy of every living thing, and some of the dead besides. That's why the Dawn has no politics, because the Scourge has none either." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken are dead, and some of them are cruel, and some of them fight the Scourge harder than any knight I've known. I judge them by what they do, which is all any of us can ask." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad rules the Scourge in the east, and the Dawn keeps watch on his necropolis from Light's Hope. Someday we'll bring it down, and I'd like to be there." } },
    _none = { { id = "tp_none", text = "I couldn't say, friend. If it has to do with the Scourge, ask me again, and for anything else, try the commander." } },
  },
}

P:NPC {
  key = "dumah", id = TODO_NPC("Nathaniel Dumah"), name = "Nathaniel Dumah",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "chillwind_camp" }, temper = { "steady" }, values = { "loyal", "stubborn" },
  notices = { "race", "craft", "lock_steed" },

  impression = {
    first = "He asks after Northridge like a man asking after family.",
    third = "{name} met Nathaniel Dumah at Chillwind Camp, who wants his family's Northridge mill back from the Scarlet Crusade.",
  },

  greetings = {
    { id = "g_mill", text = "Good afternoon, or whatever this is, since the sky never seems to decide up here." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Any word from Northridge? Bad news counts too, for I'd rather know than wonder." },
  },

  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "You've a northern look about you, from Lordaeron before the war, maybe? Don't tell me if it hurts, because most of us who got out don't talk about it." },
    { id = "n_lumber", cat = "craft", when = { profession = { "Engineering", "Blacksmithing" } },
      text = "You work with your hands, I can tell, and my father would have liked you for it. He always judged a man by his calluses." },
    { id = "n_lock_steed", cat = "lock_steed", when = { class = "WARLOCK", aura = { 5784, 23161 } },
      text = "Your horse leaves burning hoofprints, and the Crusaders at the mill will follow that trail right back to me. Ride it somewhere else, I'd beg you, because my father's mill was built of timber and it can't take a fire." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "That they'd stood longer than any kingdom and would outlast this one, which turned out truer than he'd have liked. The Scarlet Crusade is cutting them now, and if those trees have spirits, I'd hate to know what they think of us." } },
      choices = {
        { text = "The mill's yours, but the forest deserves respect, Nathaniel.", next = "BACK", reply = "It does, and my father would agree. He always said the trees were older than the deed.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Trees are timber. Take back the mill and cut freely.", next = "BACK", reply = "Freely, perhaps, but not foolishly. My father planted two for every one he cut.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Too many to count from the treeline, and they're well armed, because the Crusade feeds its soldiers before it feeds anyone else. My father built that mill to last, so if you fight your way in, mind the support beams, because I'd like something left to come home to." } },
      choices = {
        { text = "I'll fight carefully and leave your father's beams standing.", next = "BACK", reply = "Thank you. He'd have liked that, and so will I.", fx = { align = { order = 1 } } },
        { text = "If the mill comes down on them, so much the better.", next = "BACK", reply = "Better a ruin than a Scarlet mill, I suppose. Mind the wheel, at least.", fx = { align = { order = -1 } } },
        { text = "Something else, Nathaniel.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Gone south with the rest of us, or gone under with the plague, and I never learned which. The woods are full of sick wolves now, so if you're out that way, it won't be deer you find." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Gone south with the rest of us, or gone under with the plague, and I never learned which. The woods are full of sick wolves now, so if you're out that way, it won't be deer you find. {pet} would have loved the mill yard when I was a boy, {class}, with sawdust to roll in and the dogs to chase." },
      },
      choices = {
        { text = "The woods will come back, Nathaniel. I'll help clear the way.", next = "BACK", reply = "Thank you. I'd like to see deer in them again, before I'm old.", fx = { align = { light = 1 } } },
        { text = "Those woods are dead. Better to burn them and start over.", next = "BACK", reply = "Burn them? My father would come back to haunt you, and he'd do it thoroughly. Clear, don't burn.", fx = { align = { light = -1 } } },
        { text = "Let us talk of something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Some of them were knights once, and some were farmers who picked up a sword when the plague came, and I'd be glad to share a fire with either sort. But they took the mill from the family that built it and called it purging, and I can't call that anything but theft." } },
      choices = {
        { text = "The law of the land says the mill is yours.", next = "BACK", reply = "It does, and it's nice to hear someone still believes in the law. Thank you.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Lordaeron's law died with its king. The strong hold what they take.", next = "BACK", reply = "Then I'll be strong and take it back. I'd rather the law did, though.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I would, though the Crusade will tell you they've blessed it already, every beam of it, twice a day with a lot of shouting. Their Light doesn't feel much like the one my mother prayed to, and that's a good part of why I want them out." } },
      choices = {
        { text = "The Light is mercy, not shouting. I'll bless it gladly.", next = "BACK", reply = "Thank you. I think my mother would have liked your sort of blessing.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Crusade at least fights the Scourge. Bless it as they do.", next = "BACK", reply = "I'll pass, thank you. The shouting kind isn't one I want on my father's beams.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "They'd burn anything they think the shadow's touched, and they'd sing hymns while they did it. My father built that mill with his own hands and two hired men from Hearthglen, and I'd sooner see it standing with Crusaders in it than ashes with none, so whatever you do there, keep your fire off the timber." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "They'd burn anything they think the shadow's touched, and if they saw your demon they'd burn the mill and sing hymns over the ashes. My father built it with his own hands, so whatever you do there, keep that creature well away from the timber, because I'd sooner see it standing with Crusaders in it than ashes with none." },
      },
      choices = {
        { text = "Your father's mill will stand. You have my word.", next = "BACK", reply = "Thank you. I'll hold you to it, and so will he.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If burning it clears the Crusade out, so be it.", next = "BACK", reply = "It might, and I'd rather it didn't. Find another way, if you can.", fx = { align = { honor = -1 } } },
        { text = "Something else, Nathaniel.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! My father used to say the trees around Northridge had spirits of their own, {class}, and I always thought he was joking, but now I'm not so sure." },
        { id = "h_default", key = true,
          text = "Nathaniel Dumah. My father ran the Northridge Lumber Mill before the plague, and we fled to Stormwind with what we could carry, but now the Scarlet Crusade's sitting in our mill, so I've come back." },
        { id = "h_termites", tags = { "news" }, when = { questActive = TODO_QUEST("A Plague Upon Thee") },
          text = "Swords didn't work, so I'm trying termites, a Plaguewood breed that lived through the plague and the Scourge both. Fill this jar for me, and let's see the Crusade hold a mill that's being eaten out from under them." },
        { id = "h_done", when = { questDone = TODO_QUEST("A Plague Upon Thee") },
          text = "I almost feel sorry for them, sitting in a mill that's falling down around their ears. Almost, but it was never their mill to begin with." },
        { id = "h_father", when = { metBefore = true },
          text = "Father used to say a mill's only as good as its river, and the river's still there, sick as it is. Most of Northridge has nothing left at all." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! My father used to say a Dalaran wizard once fixed the mill's waterwheel with a single word, {class}, though I suspect he embellished." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You look like someone who could walk into Northridge without the Crusade noticing, {class}, and my father's mill could use a visitor like that." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! My mother would have asked you to bless the mill before I set foot in it again, and I think I'd like that, if we ever get it back." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! I'll say it before you do, I've no quarrel with the Light, only with the Crusade sitting in my father's mill and calling it holy ground." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior! The Crusade's got a dozen guards at my father's mill, {class}, and I was hoping someone like you might walk in the front door while the termites see to the back." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter. There used to be good deer in the woods round Northridge, {class}, and my father traded planks for venison with the trappers every winter." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "I'll take your help against the Crusade gladly, but there's a smell of brimstone on you, and they've a long memory for it. They'll burn the mill down around us before they let that walk in." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Scarlet", min = 30 } }, text = "Word is the Crusade's losing men at Northridge faster than Hearthglen can send them. I'd like my father's mill back with a roof on it, so mind the timber while you're about it." },
      },
      again = {
        { id = "h_again", text = "Something else you wanted to ask? Go ahead, I don't mind talking." },
        { id = "h_again2", text = "Still here? Good, it's nice to have someone to talk to who isn't a soldier." },
      },
      choices = {
        { text = "Your family must have suffered in the plague.", next = "family" },
        { text = "Why termites?", next = "termites" },
        { text = "Tell me about the mill.", next = "mill" },
        { text = "I fled Lordaeron too, when I was young.", next = "refugee", when = { origin = "human_lordaeron_refugee" } },
        { text = "Termites in a mill? Nature can be cruel.", next = "x_druid", when = { class = "DRUID" } },
        { text = "Would the mill still run, if you got it back?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "The Crusade must be using your father's mill for something.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "The Crusade would burn your father's mill to spite someone like me?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What did your father say about the Northridge trees, Nathaniel?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll help you take it back.", next = "END", fx = { affinity = 2, standing = { chillwind_camp = 1 } } },
        { text = "Would you want the mill blessed after the Crusade leaves?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Are the Crusaders in Northridge still knights, or only squatters?", next = "xapala", when = { class = "PALADIN" } },
        { text = "There must be a good many Crusaders at the Northridge mill.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What became of the Northridge trappers?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Cutting lumber for Hearthglen's walls, from what I hear, with my father's saws and my father's sweat still in the timbers. Walk in quiet and count how many there are, and I'll know whether to hope or to give up on it." } },
      choices = {
        { text = "The mill is yours by right. Take it back.", next = "BACK", reply = "I mean to, with your help. Count them for me first.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Deeds mean little now. Let the Crusade keep it.", next = "BACK", reply = "They mean little, but this one means something to me. I'll take it back with or without you.", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The wheel's sound as far as I know, and the river doesn't care who won the war. It's the land around it that worries me, for the plague's in the soil, and you can't build homes on poisoned ground with any spell I've heard of." } },
      choices = {
        { text = "The land will heal. It always does, in time.", next = "BACK", reply = "It does, given time and care. I saw clover by the mill race last week, and I nearly wept.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Better to burn it all and start fresh.", next = "BACK", reply = "Fresh, maybe, but my father's wheel turned on that river for thirty years. I'll heal what's left.", fx = { align = { light = -1 } } },
        { text = "Let's talk of other things.", next = "BACK" },
      },
    },
    family = {
      lines = {
        { id = "f_default", text = "We lost friends and cousins, some we buried and some we never got the chance to. Father made it to Stormwind and never stopped talking about the mill, so you see, I'm not really here for the wood." },
      },
      choices = {
        { text = "You're here for him.", next = "BACK", reply = "Aye, I am, and I suppose I always knew it. If I can bring back one good plank from the old mill, he'll have something of home to hold onto before the end.", fx = { affinity = 3, trait = { kind = 1 }, align = { light = 1 } } },
        { text = "Revenge, then.", next = "revenge", fx = { affinity = 1, align = { light = -1 } } },
      },
    },
    revenge = {
      lines = {
        { id = "rv_default", text = "Call it what you like, I won't argue with you. I only know I couldn't sit in Stormwind any longer while men in red tabards sat in my father's mill and called it theirs." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    termites = {
      lines = {
        { id = "te_default", text = "Because I'm one man with a jar and they're a whole garrison with swords. A mill is wood from top to bottom, and the Plaguewood termites will eat through it faster than any carpenter could mend it." },
      },
      choices = {
        { text = "You'd ruin your own mill, then.", next = "termites_ruin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    termites_ruin = {
      lines = {
        { id = "tr_default", text = "I'd rather it fell down than stood up for them. We can always build another mill on the same river, but we can't build it while the Crusade's living in it." },
      },
      choices = {
        { text = "That's a hard choice.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "That's clever, and cruel, and I like it.", next = "BACK", reply = "Cruel, perhaps, but the Crusade started the cruelty. I'll sleep well enough.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'd rather we took the mill back whole, and properly.", next = "BACK", reply = "So would I, truly, but they won't leave politely. If you find another way, I'm listening.", fx = { align = { order = 1 } } },
      },
    },
    mill = {
      lines = {
        { id = "mi_default", text = "It's up in Northridge, north of the farms, and it was my father's pride. The Crusade holds it now and works it for their own, and I'd wager they've never once thanked the river." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    refugee = {
      lines = {
        { id = "rf_default", text = "Then you know, and I don't need to explain anything to you. It's strange coming back, isn't it, seeing the roads you walked as a child and nobody left on them to say hello to." },
      },
      choices = {
        { text = "It is. I'm glad you came back.", next = "BACK", fx = { affinity = 3 } },
        { text = "I try not to look.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    x_druid = {
      lines = {
        { id = "xd_default", text = "Cruel? It was never their mill to take, and if the Crusade won't leave, the termites can show them the door one plank at a time. I'd rather it were my father's saw that did it, but he's in Stormwind and the termites are here." },
      },
      choices = {
        { text = "Turning the wild on people sits ill with me.", next = "BACK", reply = "Fair enough, and I'll not ask you to do it. I'll find someone with a stronger stomach.", fx = { affinity = -1, align = { light = 1 } } },
        { text = "The Crusade has earned every last termite.", next = "BACK", reply = "They have, and every one of them is a little gift from the forest. Thank you.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've not been back long, but I've asked about everything that touches my father's mill. Ask me about any of these and I'll tell you what I've learned." },
    },
    background = { { id = "tp_ba", text = "I'm a miller's son from Northridge who grew up in Stormwind, and now I've come home to a place that doesn't want me back.", next = "family" } },
    advice = { { id = "tp_ad", text = "Don't drink from the rivers up here, however clear they look. The plague's in the water as much as the soil." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "They fight the Scourge, and I'll grant them that, but they also took a family's home and called it holy work." } },
    lordaeron = { { id = "tp_lordaeron", text = "My father ran the Northridge Lumber Mill, and I grew up with sawdust in my hair and the whole of Lordaeron's forests outside the door. We fled south when the plague came, and I've come back to see what's left." } },
    scourge = { { id = "tp_scourge", text = "The Scourge took most of my friends and half my family, and I still can't quite believe it. I came back because somebody has to remember them." } },
    stratholme = { { id = "tp_stratholme", text = "My mother had cousins in Stratholme, and I've never learned what happened to them. I suppose I already know." } },
    forsaken = { { id = "tp_forsaken", text = "Some of the Forsaken might have been people I knew, once. I try not to think about it, and I don't always manage." } },
    _none = { { id = "tp_none", text = "I don't know anything about that, I'm afraid. I know timber, and I know grief, so pick one of those." } },
  },
}

P:NPC {
  key = "bibilfaz", id = TODO_NPC("Bibilfaz Featherwhistle"), name = "Bibilfaz Featherwhistle", title = "Gryphon Master",
  bible = "bibles/westernplaguelands.md", role = "flightmaster", tier = "service",
  communities = { "chillwind_camp" }, temper = { "jovial" }, values = { "cheerful" },
  notices = { "race", "lock_armor" },

  impression = {
    first = "I suspect he works very hard at being so cheery.",
    third = "{name} met Bibilfaz Featherwhistle, the gnomish gryphon master at Chillwind Camp.",
  },

  greetings = {
    { id = "g_fly", text = "Wings ready! Well, their wings are ready, anyway, since mine are purely theoretical." },
    { id = "g_back", when = { metBefore = true }, text = "Back for a ride? Good timing, too, since Snowtail's in a mood today, so I'll give you the nice one." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A fellow gnome, out here, of all places! I've been talking to gryphons for weeks, and they're lovely creatures, but they really aren't much for conversation." },
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "Phew, that demon-hide ward of yours smells like a singed boot, and the gryphons have noticed too! I'll crank the bellows up a notch, so hold your breath and pray the wind cooperates." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They hate them, poor dears, and they won't fly over Andorhal unless I bribe them with something from Ironforge's bakeries. I've always thought a shaman might calm them better than a pastry, though I'd keep the pastries handy, just in case." } },
      choices = {
        { text = "A bird should fly where it's told, wind or no wind.", next = "BACK", reply = "They're not soldiers, they're gryphons, and gryphons have opinions! Still, I'll keep them flying, with pastries.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them follow the wind's will. It knows the safe paths.", next = "BACK", reply = "Oh, I like that, I like that very much. Would you whisper it to them before you go?", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Hate it! They fly high and fast and they don't land unless they absolutely must. I can't blame them, but I've got to keep them flying, because the camp needs supplies and Ironforge needs its letters." } },
      choices = {
        { text = "Keep them flying. The camp needs those supplies.", next = "BACK", reply = "I will, I will, though it breaks my heart a little every time. The camp comes first.", fx = { align = { order = 1 } } },
        { text = "Give them rest between runs. They've earned it.", next = "BACK", reply = "I try, truly I do, but the letters keep coming. I'll give them an extra fish tonight.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They mind it terribly, and they tell me so all the way to Aerie Peak, but they've never once dropped anyone. I give the big grey one an extra fish whenever he carries a knight, and I think he's started to look forward to it." } },
      choices = {
        { text = "I'll thank him properly before I climb aboard, then.", next = "BACK", reply = "Oh, splendid! He'll like that, and you'll get a smoother ride for it.", fx = { align = { light = 1 } } },
        { text = "It's a mount, Bibilfaz. It carries what it's told.", next = "BACK", reply = "It carries what it likes, and it likes being thanked. You'll have a bumpy ride, I'm afraid.", fx = { align = { light = -1 } } },
        { text = "Something else, Bibilfaz.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Mostly, though they think every cat is a chick they've misplaced and every wolf is a rude neighbour. The plague air makes them cross, so I keep pets well away from the roost until the birds have had their breakfast." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Mostly, though they think every cat is a chick they've misplaced and every wolf is a rude neighbour. The plague air makes them cross, so I keep pets well away from the roost until the birds have had their breakfast. Oh, and that's {pet}!" },
      },
      choices = {
        { text = "Rules first, then. I'll keep my beast on this side of the post.", next = "BACK", reply = "Thank you! The birds will be ever so grateful, and so will your beast.", fx = { align = { order = 1 } } },
        { text = "My beast goes where I go, and the birds can lump it.", next = "BACK", reply = "Then you'll have a roost full of angry gryphons and very few feathers. Please, the post.", fx = { align = { order = -1 } } },
        { text = "Something else, Bibilfaz.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Safe enough, though the birds won't land there and I don't make them. The Scourge keep clear of the tomb too, which is the best thing anyone's ever said about a grave, I think, and I'd like to think Uther would be pleased." } },
      choices = {
        { text = "Uther's grave should be guarded, not just flown over.", next = "BACK", reply = "It should, and I'd guard it myself if the birds would let me. Talk to Thel'danis.", fx = { align = { honor = 1 } } },
        { text = "Let the dead knight rest. The living need the birds.", next = "BACK", reply = "He'd like that, I think. Uther was always for the living.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I think they feel something, because Thundermane, my oldest bird, won't fly over Uther's tomb at all, he just circles wide and goes quiet. I asked a dwarf about it once and he said a gryphon knows a holy place better than a priest does, and then he told me I owed him an ale." } },
      choices = {
        { text = "Every creature knows holy ground. The Light is in all things.", next = "BACK", reply = "I think so too! Thundermane certainly does, at any rate.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They're animals, Bibilfaz. They just don't like the smell.", next = "BACK", reply = "The smell! Oh, I'd never thought of that. No, I still think it's holy.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Biscuits, mostly, and a little gnomish ingenuity, for I've a bellows here that blows the sulphur smell downwind before the birds catch it. It works nine times in ten, and the tenth time you land in Aerie Peak a bit faster than you meant to, but nobody's fallen off yet." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Biscuits, mostly, and a bellows that blows the sulphur smell downwind, though with your demon standing right at the perch I'd need a bigger bellows and a great many more biscuits. Send it off before you mount, and you'll land in Aerie Peak at the speed you meant to." },
      },
      choices = {
        { text = "Clever work, Bibilfaz. I'll be gentle with the birds.", next = "BACK", reply = "Thank you! The birds will be gentle with you in return, mostly.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Nine in ten? I'll take those odds. Strap me in.", next = "BACK", reply = "Splendid, an adventurous sort! Strap in tight and hold on to your hat.", fx = { align = { order = -1 } } },
        { text = "Something else, Bibilfaz.", next = "BACK" },
      },
    },
    dd_towers = {
      lines = {
        { id = "dd_towers_1",
          text = "Trouble them? The skeletons on those towers throw anything that isn't nailed down, and a gryphon's wing is a big, slow target on the way into Andorhal. Since you marked them for Commander Valorfist, I've been routing the birds well wide, and I haven't lost a feather this week." },
      },
      choices = {
        { text = "Glad to help your birds fly safe.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I did it for the camp. The gryphons were a bonus.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Bibilfaz.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_towers", tags = { "news" }, when = { questDone = TODO_QUEST("All Along the Watchtowers") },
          text = "The scouts tell me you marked every one of those Scourge towers for the commander! My gryphons fly a good deal happier now that we know where the bone-throwers sit, and so do I." },
        { id = "h_dd_fall", when = { deathCause = "falling" },
          text = "Now, I heard you came down from somewhere high without a gryphon under you. Next time you want to see the ground that fast, come and see me first, and I'll at least make it a nice view." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! Oh, wonderful, {class}, the birds have been fussing about the air up here for weeks, and I'd love for someone to tell me what the wind's been saying to them!" },
        { id = "h_default", key = true,
          text = "Bibilfaz Featherwhistle, gryphon master! I can take you to Ironforge, or Aerie Peak, or Light's Hope if you're feeling brave, and the birds hate the smell up here as much as you do, so they fly fast." },
        { id = "h_home", when = { metBefore = true },
          text = "I tell the gryphons about Ironforge at night, the forges and the tram and the pastries in the Commons. I think they're homesick too, or possibly just hungry, it's hard to tell with gryphons." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! You could teleport to Ironforge in a blink, {class}, so you must be here for the company, and I'm very flattered." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Ooh, sneaky! You walked right past the big grey gryphon and he didn't even blink, {class}, and he blinks at everything, poor thing." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Do you think the Light minds gryphons? Only I've noticed the birds settle down when the chaplains walk past, and I don't think it's just the biscuits they carry." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Light's Hope is the only place up here my gryphons don't mind landing, and the knights there say it's because the ground is holy, which I find very reassuring." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior! Oh, the gryphons do grumble about plate, {class}, but they're very brave birds, and they'd carry an anvil if you asked them nicely." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter! The gryphons like your sort, {class}, because you smell of the woods rather than the plague, and that's a real treat for them up here." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A night elf druid! You'll want to fly as a bird, I'd wager, but the gryphons are faster, and they don't mind the smell as much as you'd think." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Oh dear, the gryphons won't like that smell, no, not one bit, but they'll fly you anyway, because I've told them you're on our side, and I'm very persuasive." },
      },
      again = { { id = "h_again", text = "Anything else? The birds aren't going anywhere without me, so take your time; I've measured their patience at about eleven minutes, give or take a feather." } },
      choices = {
        { text = "Do the towers really trouble your gryphons?", next = "dd_towers", when = { questDone = TODO_QUEST("All Along the Watchtowers") } },
        { text = "Where's safest to fly?", next = "routes" },
        { text = "The gryphons can't like it up here.", next = "gryphons" },
        { text = "Let's fly.", next = "BUSINESS" },
        { text = "Do your gryphons know Wildhammer riders?", next = "x_dwarf", when = { race = "Dwarf" } },
        { text = "Teleport can't bring me to the Plaguelands, though.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Could I hitch a ride without signing your ledger?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do gryphons feel the Light, do you think?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is it safe to fly over Uther's tomb, Bibilfaz?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Your gryphons must mind carrying heavy armour.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do your gryphons get along with hunters' beasts?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "The gryphons must hate flying over the Plaguelands.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "How do you persuade a gryphon to carry someone who smells like me?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What do your gryphons think of the plague winds, Bibilfaz?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Absolutely not, the ledger's sacred, and so is the Ironforge pastry fund it helps pay for! Besides, a gryphon won't take off with a stranger who hasn't been introduced properly, so you'd only end up sitting on a very confused bird." } },
      choices = {
        { text = "Rules are rules. I'll sign the ledger.", next = "BACK", reply = "Thank you! The pastry fund thanks you too.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Rules are made to be slipped, Bibilfaz.", next = "BACK", reply = "Not my rules, and not my gryphons. You'd be stuck on the ground with a very cross bird.", fx = { align = { order = -1 } } },
        { text = "Fair. Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "No, and that's why I'm still in business, though I'd rather be in Tinker Town eating cake. Some places are only reached the long way, and my birds don't mind it half as much as the people riding them." } },
      choices = {
        { text = "Some places should stay hard to reach.", next = "BACK", reply = "They should, and my birds agree. The long way's the best view.", fx = { align = { order = 1 } } },
        { text = "Every place should be one spell away.", next = "BACK", reply = "Then you'd put me out of business! The birds would miss you, though.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    routes = {
      lines = {
        { id = "r_default", text = "Aerie Peak, every time, since the Wildhammer keep their skies clean and their ale cold. Light's Hope is the brave one, as you fly right over the worst of the Plaguelands to get there, so hold on tight and don't look down." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Let's fly.", next = "BUSINESS" },
      },
    },
    gryphons = {
      lines = {
        { id = "gy_default", text = "Well enough, though they won't land anywhere near Andorhal however nicely I ask. I give them extra feed when the wind blows from the north, and they forgive me for bringing them here." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { affinity = 1 } },
        { text = "Let's fly.", next = "BUSINESS" },
      },
    },
    x_dwarf = {
      lines = {
        { id = "xd_default", text = "Know them? They'd fly off with one in a heartbeat, the traitors, because a gryphon loves a Wildhammer better than its own keeper. Ironforge birds are steadier, mind, and Snowtail here thinks you smell like home, which from her is a compliment." },
        { id = "xd_wild", when = { origin = "dwarf_wildhammer_kin" }, text = "Wildhammer kin! Then please don't whistle at them, or I'll be chasing birds across Hillsbrad all afternoon." },
      },
      choices = {
        { text = "I'll keep my whistling to myself.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Never feed a gryphon from your hand unless you're fond of only having nine fingers!" } },
    gnomeregan = { { id = "tp_gnomeregan", text = "Gnomeregan's lost to the troggs and the radiation, and I haven't seen home in a long while. I talk to my gryphons about Tinker Town pastries, and they listen very politely." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I saw the Darkmoon Faire once, all lights and music and gnomes being fired out of cannons on purpose. I mean to go again when this war gives me a day off, which may be some time." } },
    scourge = { { id = "tp_scourge", text = "The Scourge is the gloomiest thing I've ever seen, and I've seen a gnome's face when his invention blows up. I keep cheerful because somebody has to." } },
    magni = { { id = "tp_magni", text = "King Magni keeps a fine hall and a finer table, and he's never once made a gnome feel small, which is hard when you're my height. I'd raise a pint to him if I had one." } },
    _none = { { id = "tp_none", text = "No idea at all, I'm afraid! But I can fly you to someone who might know, at a very respectable forty miles an hour with a tailwind." } },
  },
}
