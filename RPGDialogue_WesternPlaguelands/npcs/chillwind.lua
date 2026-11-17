-- Chillwind Camp: Stormwind's foothold at the southern edge of the Plaguelands. Voice: bibles/westernplaguelands.md
local P = RPGDialogueAPI:Pack("rpgd.westernplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "valorfist", id = TODO_NPC("Commander Ashlam Valorfist"), name = "Commander Ashlam Valorfist",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "major",
  communities = { "chillwind_camp" }, temper = { "steady", "proud" }, values = { "dutiful", "brave" },
  notices = { "class", "kit" },

  impression = {
    first = "Commander Valorfist counts his soldiers out of the gate and counts them back in, and he writes the letters himself on days the numbers don't match. He has very little, and spends it carefully.",
    third = "{name} met Commander Ashlam Valorfist, who holds Chillwind Camp for Stormwind against the dead of Andorhal.",
  },

  greetings = {
    { id = "g_camp", text = "On your feet or on your way, soldier, for Chillwind hasn't room for anyone sitting down." },
    { id = "g_back", when = { metBefore = true }, text = "Back in one piece, good. I counted you out of that gate, and I'm glad to count you in again." },
    { id = "g_hero", when = { questDone = TODO_QUEST("Mission Accomplished!") }, text = "There's the hero of the cauldrons! Somebody find this soldier a stool, and don't let anyone tell you it isn't earned." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "Shadowbreaker's sending me paladins again, and good. I asked him for twenty, but I'll gladly take one who doesn't flinch at a ghoul." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your armor's in worse shape than my palisade, {class}. Get it mended before Sorrow Hill finishes the job for you." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "If the earth around Andorhal still has anything to say, I'd like it said to someone on my side, because the Scourge has poisoned every field from here to the Bulwark. MacDonnell says the Light will cleanse it in time, but I've no time, and I'll take a dwarf with a totem if it brings my soldiers home." } },
      choices = {
        { text = "Then I'm yours to command. Point me at Andorhal.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll help, Commander, but I follow the spirits, not your orders.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Commander.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Burned, if I had my way, for every field the Scourge holds feeds their plague. But a priestess and a night elf both tell me there's still life under the rot, and I suppose I'd rather be wrong than burn it all." } },
      choices = {
        { text = "Burn it. Nothing living there can be saved.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Reclaim it. There's still life under the rot.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else, Commander.", next = "BACK" },
      },
    },
    hello = {
      lines = {
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
          text = "The Scourge moves its troops by four towers in Andorhal, so mark every one of them with the beacon torch. And bring that torch back to me, mind, as it's the only one we have." },
        { id = "h_araj", tags = { "news" }, when = { questActive = TODO_QUEST("Alas, Andorhal") },
          text = "Araj the Summoner is a lich, and he sits at the heart of the city. Don't go in alone, and I mean that, because I've written enough letters to mothers this year." },
        { id = "h_araj_dead", when = { questDone = TODO_QUEST("Alas, Andorhal") },
          text = "The lich of Andorhal is dust, and I said it aloud three times this morning before I believed it. The dead still walk there, mind you, and without a master they walk worse." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "At night you can hear Andorhal from here, and it isn't the dead you hear but the bells. Nobody living has rung them in years." },
        { id = "h_back", when = { metBefore = true },
          text = "I count the camp every morning and every night, and most days it's the same number. On the days it isn't, I write the letters myself." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "There's the soldier I'd pick first, if Stormwind ever let me pick anyone. Come in by the fire and tell me what the farms looked like today." },
        { id = "h_cold", when = { disposition = { max = 34 } },
          text = "You again. Say your business and get on the road, because I've no time for anyone I can't count on." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "I'll be honest with you, {class}, I don't like warlocks, but I like the Scourge less, and I'm short of soldiers by about two hundred." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, good, {class}, for the last time I asked Stormwind for spellcasters they sent me a priestess and an alchemist and told me to make do." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "I've a report from Stormwind on my desk that I never asked for, {class}, and the agent who brought it walked a good deal like you. Sit down, and tell me who sent you." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid of the Cenarion Circle at Chillwind. Andorhal is no place for growing things, but I'll take any help you offer against the dead." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Skeletal", min = 40 } }, text = "My scouts say the bones are lying thicker in the fields around Andorhal and walking thinner, and I know who's been putting them down. Stormwind will hear your name in my next report." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick about it, the dead don't wait on our conversations." },
        { id = "h_again2", text = "Out with it, then, while the scouts are still on the road." },
      },
      choices = {
        { text = "What do you need?", next = "need" },
        { text = "Why is Stormwind fighting here?", next = "why" },
        { text = "Tell me about Andorhal.", next = "andorhal" },
        { text = "Who serves here with you?", next = "camp" },
        { text = "Lord Shadowbreaker sent me to you.", next = "paladin", when = { class = "PALADIN" } },
        { text = "I'm a priest. Where do you need me?", next = "priest", when = { class = "PRIEST" } },
        { text = "I was born in Lordaeron, before the plague.", next = "refugee", when = { origin = "human_lordaeron_refugee" } },
        { text = "Put me on the line, Commander.", next = "x_warrior", when = { class = "WARRIOR" } },
        { text = "I can scout the watchtowers for you.", next = "x_hunter", when = { class = "HUNTER" } },
        { text = "Ironforge has a stake in this fight too.", next = "x_dwarf", when = { race = "Dwarf" } },
        { text = "Will your soldiers fight beside a warlock?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Wouldn't Dalaran send help against Andorhal?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Does SI:7 really operate this far north, Commander?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Should the Scourge's farms be burned, or reclaimed?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Can a shaman be of use against Andorhal, Commander?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Point me at the dead.", next = "END", fx = { affinity = 1, standing = { chillwind_camp = 1 }, trait = { brave = 1 } } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "They operate wherever Stormwind has a worry, and Hearthglen worries someone. Kirsta Deepshadow's out in the Northridge Hills testing the Crusade's defenses now, and if she doesn't come back, I'll want somebody quiet to find out why." } },
      choices = {
        { text = "Spies win wars that armies can't.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Spying on the Crusade shames an honest army.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let's talk about the camp.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Dalaran's behind its dome, and the Kirin Tor are busy deciding whose fault the plague was. Meanwhile Andorhal sits a day's march from my gate, so I'll take any mage who'll stand on the line." } },
      choices = {
        { text = "They should have come. That was their duty.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Duty's cheap. Every city looks after itself first.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "They'll fight beside anyone who walks back out of Andorhal with them, and they'll talk about you behind your back the whole way. MacDonnell will be harder, for she thinks every demon is one more thing the Light ought to burn." } },
      choices = {
        { text = "I'll earn their trust in battle.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I don't need their trust, only their silence.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Commander.", next = "BACK" },
      },
    },
    need = {
      lines = {
        { id = "nd_default", text = "I need soldiers I don't have, and people like you who'll go where soldiers can't. MacDonnell has the cauldrons in hand, and Arbington has the rest, if you can stand him." },
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
        { text = "Do you honestly expect to take Andorhal with this?", tag = "Persuade", next = "need_truth",
          check = { pass = { any = { { disposition = { min = 65 } }, { questDone = TODO_QUEST("Clear the Way") }, { trait = "brave" } } } },
          fail = { next = "need_shut", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK", fx = { trait = { practical = 1 } } },
      },
    },
    why = {
      big = true,
      lines = {
        { id = "w_default", text = "These were Lordaeron's farmers and millers, and now they march in the enemy's army. If the plague isn't stopped here, it walks south to Southshore and the Wetlands, and then home, so I'd rather fight it here." },
      },
      choices = {
        { text = "Then we stop it here.", next = "BACK", fx = { affinity = 2, align = { honor = 1, order = 1 } } },
        { text = "Lordaeron's lost, so better to hold the line at Southshore.", next = "BACK", fx = { align = { honor = -1 } } },
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
        { text = "And the nobleman by the cliff?", next = "camp_barov" },
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
        { text = "It's what I'm for.", next = "BACK", fx = { affinity = 2, align = { light = 1, order = 1 }, standing = { chillwind_camp = 1 } } },
        { text = "The Light's no weapon, Commander, whatever your orders say.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "And the Silver Hand's teaching?", next = "BACK", fx = { trait = { devout = 1 } } },
      },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "Everywhere, and all at once, I'm afraid. MacDonnell could use another pair of hands that know the Light, and the wounded who come back from Andorhal need more than bandages and a kind word." },
      },
      choices = {
        { text = "Then I'll stay a while and help.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, standing = { chillwind_camp = 1 } } },
        { text = "I'm more use out in the field.", next = "BACK", fx = { trait = { brave = 1 }, align = { light = -1 } } },
      },
    },
    refugee = {
      lines = {
        { id = "rf_default", text = "Then this is your home we're fighting over, and I won't pretend it isn't hard to look at. If you've family buried up here, tell me where, and my patrols will mind the place when they pass." },
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
        { text = "I'll hold until your people are clear, Commander.", next = "BACK", fx = { affinity = 2, align = { order = 1 }, standing = { chillwind_camp = 1 } } },
        { text = "I'll hold as long as it makes sense, and no longer.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
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

  topics = {
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
    _none = { { id = "tp_none", text = "If it isn't a threat to this camp, it isn't on my desk. Try Pureheart, who has more patience than I do." } },
  },
}

P:NPC {
  key = "macdonnell", id = TODO_NPC("High Priestess MacDonnell"), name = "High Priestess MacDonnell",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "chillwind_camp" }, temper = { "sharp" }, values = { "devout", "fierce" },
  notices = { "class", "race" },

  impression = {
    first = "High Priestess MacDonnell speaks of the plague cauldrons with real appetite, as if each one were a personal insult. Her Light is the kind that burns, and she said so cheerfully.",
    third = "{name} met High Priestess MacDonnell at Chillwind Camp, who means to give the Scourge a dose of its own plague.",
  },

  greetings = {
    { id = "g_light", text = "The Light keep you, friend, and keep you upwind of the farms while it's at it." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Tell me a cauldron coughed and choked out there, and you'll have made my whole day." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "One of the Light's own, good. Out here you'll learn it isn't only for healing. It burns too, if you ask it the right way." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "One of the Banshee's... no, forgive me, that's the old soldier in me talking. The Dawn would have me welcome you and I'll try, but I'd stand clear of the holy water if I were you." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Offend it? The Light isn't so delicate, and neither am I, whatever the Cathedral's stuffier priests would have you believe. If your fire spirits will help me boil the plague out of those cauldrons, I'll stand beside you and pray loudly while they do it." } },
      choices = {
        { text = "Then we'll burn the cauldrons together, by Light and flame.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers won't empty a cauldron, priestess. Fire will.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I believe so, though it will take years and more than prayer. Arbington's counter agent breaks the cauldrons, but the ground they've soaked will need tending like a sickbed, and that's work your people know better than mine." } },
      choices = {
        { text = "Then let's tend it together, Light and Moon alike.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Break the cauldrons first. Cleansing can come after.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else, Priestess.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Each one has a cauldron lord standing over it and a crowd of the dead around it, and the lords carry the keys. You knock them down and I'll see to the dosing, and between your shield and my prayers we'll make a proper mess of their brewing." } },
      choices = {
        { text = "My shield is yours, Priestess, and the Light guide us both.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Keep your prayers. Out there, my shield does the work.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Tell me something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Precious little near the fields, though the soldiers swear the deer up in the hills still look healthy. The cauldrons poison everything downwind, so the sooner we dose them, the sooner the beasts can drink without dying of it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Is that {pet}? Don't let it drink from any trough between here and Andorhal, {class}, for I've buried more than one good dog this year and I've no wish to bury yours." },
      },
      choices = {
        { text = "Then I'll put the sick beasts down and pray they rest.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Prayer won't cure a wolf, Priestess. An arrow ends it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Priestess.", next = "BACK" },
      },
    },
    hello = {
      lines = {
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
        { id = "h_returned", when = { questRecent = { TODO_QUEST("Return to Chillwind Camp"), days = 2 } },
          text = "Arbington's been up all night with your sample, and he smells like a crypt, but he's happier than I've seen him in months. Well done, friend." },
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
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf druid! I've been praying to the Light for a cure for this land, and perhaps the Light sent me one with antlers." },
      },
      again = {
        { id = "h_again", text = "Something else on your mind? Ask away, I've a jar or two to label while you talk." },
        { id = "h_again2", text = "Go on, I'm listening, so long as you don't mind me working." },
      },
      choices = {
        { text = "What happens when you dose a cauldron?", next = "dose" },
        { text = "Where are the cauldrons?", next = "cauldrons" },
        { text = "What's the commander like to serve under?", next = "commander" },
        { text = "Teach me how the Light burns.", next = "priest", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Poisoning the poisoners? That's my kind of work.", next = "x_warlock", when = { class = "WARLOCK" } },
        { text = "Fire would spread the plague. Isn't that a risk?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Does the Light judge what's done in shadow?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What guards the cauldrons, High Priestess?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Is any of the wildlife here still clean?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Can the cauldrons' plague be cleansed from the soil?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Does a shaman's fire offend the Light, High Priestess?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll get your samples.", next = "END", fx = { affinity = 1, standing = { chillwind_camp = 1 }, learn = { "plague_cauldrons" } } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The Light judges what's done for the wrong reasons, and the dark has nothing to do with it. Stab a cultist in the back on his way to a cauldron and I'll pray for you myself, for I think the Light likes that sort of thing better than people imagine." } },
      choices = {
        { text = "Intent matters more than method. I agree.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Light can judge what it likes. I don't answer to it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, priestess.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Arbington says the same, and he's right, curse him, which is why we brew the counter agent first. But once the plague's dead in the pot, I want you to melt the thing to slag, and I'll stand there and pray over the puddle." } },
      choices = {
        { text = "Do it properly. Counter agent first, then fire.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd burn it now and pray the wind is kind.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    dose = {
      lines = {
        { id = "d_default", text = "We change the brew, so the plague from the pot eats the Scourge instead of the farmers. It lasts a day or two before someone has to do it all again, and that's the war out here, I'm afraid.", fx = { learn = { "plague_cauldrons" } } },
      },
      choices = {
        { text = "Poison against poison.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "It's a tidy answer, and it keeps the farmers alive.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Is that the Light's way?", next = "light" },
      },
    },
    light = {
      big = true,
      lines = {
        { id = "l_default", text = "The Light's way is to protect the living, and if that means stirring a necromancer's soup until it chokes him, then I'll stir. I'll pray first, mind you, and stir after." },
      },
      choices = {
        { text = "Fair enough.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I'd rather it burned clean.", next = "BACK", fx = { affinity = 1, align = { light = 1, order = 1 } } },
      },
    },
    cauldrons = {
      lines = {
        { id = "ca_default", text = "Four farms in the west, each with a pot of its own: Felstone Field, Dalson's Tears, the Writhing Haunt and Gahrron's Withering. They're good farms, or they were, and the people who worked them deserved better." },
      },
      choices = {
        { text = "Which is the worst?", next = "worst" },
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
        { id = "co_default", text = "He's hard, and he's fair, and he writes every letter home himself, which is more than most commanders bother with. I'd follow him into Andorhal, and I may yet have to." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "You ask it the way you'd ask for healing, but you hold the dead in your mind instead of the wounded. The Light knows the difference, and it answers hard when it finds something that oughtn't to be walking." },
      },
      choices = {
        { text = "I'll try it at Felstone Field.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "That sounds like anger, not faith.", next = "BACK", fx = { trait = { skeptical = 1 }, align = { light = -1 } } },
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
        { id = "xw_default", text = "Is it, now? I'll take any hand that turns the Scourge's poison back on them, but don't mistake us for the same sort: I ask the Light for the strength to do it, and you ask something else entirely. Bring me the samples, and keep whatever you've got on a leash near my jars." },
      },
      choices = {
        { text = "The dead fall either way, Priestess.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Fair enough. My arts stay well away from your jars.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Between the commander's reports and Arbington's grumbling, I hear most of what goes on in this camp. Ask me about any of these, friend." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "For you I'll put the jars down a moment, and that's a rare honour. Here's what I can tell you about, and gladly." },
    },
    background = { { id = "tp_ba", text = "I'm a priestess of the Light and the commander's second, and that's enough of a life for anybody up here." } },
    advice = { { id = "tp_ad", text = "Keep a clean cloth over your mouth near the cauldrons, and say a prayer before you open any jar I give you." } },
    plague_cauldrons = { { id = "tp_cauldrons", text = "They're Kel'Thuzad's work, or his servants', eight pots across Lordaeron keeping the land sick. We can't break them, but we can spoil the recipe." } },
    andorhal = { { id = "tp_andorhal", text = "Andorhal's dead were people once, and I keep that in my prayers. I keep the rest of me for burning them." } },
    _none = { { id = "tp_none", text = "Unless it's in a jar, I'm afraid I don't know it. Try the commander." } },
  },
}

P:NPC {
  key = "arbington", id = TODO_NPC("Alchemist Arbington"), name = "Alchemist Arbington",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "chillwind_camp" }, temper = { "cowardly" }, values = { "curious", "honest" },
  notices = { "craft", "greenness" },

  impression = {
    first = "Alchemist Arbington asked me to stand still, keep my elbows in and touch nothing, all in one anxious breath. Frightened as he is, he keeps working, and I respect that more than I expected.",
    third = "{name} met Alchemist Arbington, Chillwind Camp's nervous alchemist and reluctant student of the Scholomance.",
  },

  greetings = {
    { id = "g_busy", text = "Mind the cauldron, and mind the bottles, and actually, if you'd just stand right there and not move, I'd be ever so grateful." },
    { id = "g_back", when = { metBefore = true }, text = "You again! You're a terrible influence, you know. Every time you visit I end up doing something brave by proxy." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist, how wonderful! Please don't touch the quickener, though, because it's thirty minutes from useless and about thirty seconds from my eyebrows." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 50 },
      text = "You're rather young for the Plaguelands, aren't you? I'm not judging, mind, since I'm rather old for them, and look how that's going." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I honestly don't know, and that's what worries me, because nothing I've read says what happens when a shaman stands next to a vial of plague. I'd like to keep it that way, if you don't mind, so if you feel a spirit coming on, please step outside first." } },
      choices = {
        { text = "Of course. Your work matters more than my curiosity.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your work could use a little chaos. Let's find out.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I'd like to say no, but the counter agent is strong, and I've seen grass die where it's spilled. I tell myself the plague would have killed it anyway, though I'm not certain that's true." } },
      choices = {
        { text = "Weaken the brew, then. Spare what can be spared.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Use it at full strength. Half a cure is no cure.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "One of the commander's soldiers turned round to wave goodbye and swept a month's work off the bench with his pauldron. I don't blame him, not really, but I keep the delicate things on the top shelf now, and I flinch whenever anyone shrugs." } },
      choices = {
        { text = "I'll mind my armour. Your work matters more than my swagger.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Glass breaks in a war camp. Keep it somewhere safer.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Arbington.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "If my books are right, the Scholomance stinks of necromancy to anything with a good nose, so even the plagued wolves give the island a wide berth. I'd trust a wolf's nose over a book, frankly, but the wolves won't sit still to be questioned." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Does {pet} bristle when the wind comes off Darrowmere, {class}? If it does, please write it down for me, because that's precisely the sort of thing I can't learn from a book." },
      },
      choices = {
        { text = "Trust the beasts. They know evil better than any book.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Books first, Arbington. A beast's nose is only guesswork.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let us speak of something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "That the Barovs gave Caer Darrow to the Cult of the Damned, and that the cult teaches necromancy there the way Dalaran once taught arithmetic. They raise the dead as homework, and some of the dead they practise on were knights of your order." } },
      choices = {
        { text = "Then the place must be cleansed, whatever it costs.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Knowing their methods matters more than cleansing their halls.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Please don't call any lightning in here, {class}, because half of what's on this table would explode, and the other half would explode a little later." },
        { id = "h_default", key = true,
          text = "Arbington, alchemist, at your service. I make the counter agent for MacDonnell's cauldrons and the quickener, and I've done more reading about the Scholomance than anyone ever should, so please don't ask me what I've read." },
        { id = "h_fragments", tags = { "news" }, when = { questActive = TODO_QUEST("Skeletal Fragments") },
          text = "Yes, a skeleton key made from skeletons, I hear it, and everyone says it. Just bring me the fragments, and the ones from Andorhal hold up best." },
        { id = "h_mold", tags = { "news" }, when = { questActive = TODO_QUEST("Mold Rhymes With...") },
          text = "Krinkle Goodsteel in Gadgetzan makes molds for nasty things and charges accordingly. I'd pay him myself, but if I had any gold of my own, would I be living here?" },
        { id = "h_scarab", tags = { "news" }, when = { questActive = TODO_QUEST("Araj's Scarab") },
          text = "The key needs a head, and that's Araj's scarab, his signet. He ran the Scholomance before he took Andorhal, so it ought to open his old door, and I'm fairly confident of that, or at least moderately." },
        { id = "h_key", when = { questDone = TODO_QUEST("The Key to Scholomance") },
          text = "You have the key, and you'll go in, won't you? I'd ask you to write and tell me what's inside, but I already know, and I'd rather not read it in your handwriting." },
        { id = "h_pay", when = { metBefore = true },
          text = "Stormwind pays me in coin, mud and the occasional ghoul through the tent wall. I did the sums once, and then I stopped doing sums altogether." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Please don't summon anything, {class}, not here, not near the vials. I'm sure your demon's very well behaved, but this glassware came all the way from Stormwind." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Oh, you startled me! Please, {class}, cough or something when you come in, for I've reagents on this table that won't forgive a jogged elbow." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Oh, thank goodness, because every time I open one of these Scholomance texts I feel I ought to have someone holy standing behind me, and the soldiers keep laughing when I ask." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "Oh, you're wearing a great deal of metal, {class}, so please turn very slowly, because my glassware is on both sides of you and there's no more coming from Stormwind." },
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
        { text = "What's this key you're making?", next = "key" },
        { text = "Is the pay really that bad?", next = "pay" },
        { text = "Could the Light help with your work?", next = "priest", when = { class = "PRIEST" } },
        { text = "How does the focuser work?", next = "alch", when = { profession = "Alchemy" } },
        { text = "Did you study in Dalaran, Arbington?", next = "x_mage", when = { class = "MAGE" } },
        { text = "Fel and alchemy have more in common than you think.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Need anything fetched quietly from Caer Darrow?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Would the elements upset your work, Arbington?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll get what you need.", next = "END", fx = { affinity = 1 } },
        { text = "What have you read about the Scholomance that frightens you?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do warriors break much of your glassware, Arbington?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Why wouldn't the beasts go near Caer Darrow?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do your brews harm the land as well as the Scourge?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Need? Everything there is guarded by dead students and worse teachers, and anything worth having is locked. I'm building a key out of bones so we can walk in the front door, but if you'd rather go round the back, I won't stop you, and I won't watch either." } },
      choices = {
        { text = "Your key is the right way. I'll wait for it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The front door is too slow. I'll find another way.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's talk of other things, alchemist.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "That's precisely what frightens me, for the Scourge's cauldrons are alchemy too, alchemy gone wrong in ambitious hands. I read the Scholomance's books for my work, and I stopped sleeping well somewhere around the second chapter." } },
      choices = {
        { text = "Some books should stay closed, alchemist.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Every book is worth reading once, even theirs.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    scholo = {
      lines = {
        { id = "s_default", text = "It was the Barovs' keep on Caer Darrow, and they gave it to Kel'Thuzad, who made it a school for necromancers. Its door doesn't open for the likes of us, hence the key, and hence my nightmares.", fx = { learn = { "scholomance" } } },
      },
      choices = {
        { text = "How do you know so much?", next = "know" },
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
        { id = "ke_default", text = "It's a skeleton key in the most literal sense, I'm sorry to say. Bone fragments for the body, a mold to shape it, a fire hot enough to set it, and Araj's scarab for the head, and every one of those is somebody else's errand, which is to say yours." },
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
        { text = "Then I'll bless the carriers.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "A good potion does more than any blessing.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    alch = {
      lines = {
        { id = "al_default", text = "You carry it with you while you fight, and it catches what the creatures leave behind when they come apart. Leave it in your tent and you'll be bringing me plain bones, and I'll have to be polite about it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } } },
    },
    x_mage = {
      lines = {
        { id = "xm_default", text = "I wish I had, but no, I learned from books, and half of those burned with Dalaran, so mostly I learned from what was left. You'd know the arcane quickener better than I do, frankly, and if you could look at my measures without laughing I'd be ever so grateful." },
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
      { id = "tp_knows", text = "I know a great deal more than anyone ought to about some very unpleasant subjects. These, specifically, if you can bear to hear about them." },
    },
    background = { { id = "tp_ba", text = "I'm an alchemist who studied the wrong school for too many years, and now Stormwind finds that useful, which I suppose is a sort of compliment." } },
    advice = { { id = "tp_ad", text = "Use the quickener the moment you get it, since it spoils in half an hour, and don't carry it in a pocket you're fond of." } },
    scholomance = { { id = "tp_scholomance", text = "Don't go in without a key and don't go in without friends, and if you can possibly manage it, don't go in at all." } },
    plague_cauldrons = { { id = "tp_cauldrons", text = "Bring me what the creatures carry, with the focuser on you, or it's just bones. Osseous, somatic and ectoplasmic sound terribly grand, but I promise you they aren't." } },
    _none = { { id = "tp_none", text = "That's out of my field, I'm afraid, as most things are out here. My field is very small and rather full of bones." } },
  },
}

P:NPC {
  key = "weldon", id = TODO_NPC("Weldon Barov"), name = "Weldon Barov",
  bible = "bibles/westernplaguelands.md", role = "noble", tier = "quest",
  communities = { "chillwind_camp" }, temper = { "cowardly", "proud" }, values = { "greedy", "vengeful" },
  notices = { "race", "kit" },

  impression = {
    first = "Weldon Barov sleeps with a sword under his blanket and talks about his brother's death as an inheritance matter. Fear and greed have been sharing his face for a long time.",
    third = "{name} met Weldon Barov, the last living Barov, hiding from his brother's assassins at Chillwind Camp.",
  },

  greetings = {
    { id = "g_who", text = "Who sent you, and what's your business? Say it slowly, and keep your hands where I can see them." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, the hired help returns. Any news of my brother? Good news, I mean, the kind where he's finally dead." },
  },

  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "Stay back, guards, guards! Oh, a Forsaken, wearing the Alliance's colors? No, you're not, are you, and how you got past the sentries I don't care to know, so stay right there." },
    { id = "n_fine", cat = "kit", when = { durability = { max = 0.3 } },
      text = "You look dreadful, all rags and dents. Find the family fortune for me and you'll never have to dress like a peasant again." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I'd have you speak to anyone who'll confirm my claim, whether they're living, dead or merely elemental. Alexi has the Forsaken behind him, and I have a sword under my blanket and now you, so we'll see whose spirits win out." } },
      choices = {
        { text = "The dead deserve rest, Weldon, not your quarrels.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Dead brothers have no claims. Take your inheritance.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Left on their own? They'd go to weeds and wolves, druid, and then who would pay the rents? No, Caer Darrow needs a Barov to run it, and it'll have one, once my brother stops being so tiresome about being dead." } },
      choices = {
        { text = "The land needs healing, not a landlord.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "A lord who rebuilds is better than wild ruin.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else, Barov.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I'd hire a dozen if Valorfist would let me keep them in camp, but the commander says his soldiers aren't for private use. So I keep my own sword under the blanket and sleep very lightly indeed." } },
      choices = {
        { text = "I'll guard the camp, Barov, not a frightened man's bedroom.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "For the right fee, I'll stand wherever you like, Barov.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Weldon.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "So the rumour goes, and I believe every unpleasant rumour about that island. If you happen to put down one of the Barov hounds, do bring me the collar, because the silver alone was worth a small fortune." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep {pet} well away from my tent, would you? I've nothing against beasts, {class}, I simply can't sleep with anything in camp that bites." },
      },
      choices = {
        { text = "I'll put the hounds to rest. The silver can stay with them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Silver's silver. I'll bring you every collar I find.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let us talk of something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Caer Darrow, its people and a school full of necromancers, if you must keep accounts. I won't pretend the Barovs were blameless, but neither will I pretend I could have stopped my father's dealings with a sword I barely knew how to hold." } },
      choices = {
        { text = "A man of honour would have tried anyway.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "No man can answer for his father's sins.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Alexi says we were promised immortality, and I say we were promised nothing worth having, and the truth is somewhere between, as it always is with family. I left before the bargain was sealed, and I'll thank you to remember that I left." } },
      choices = {
        { text = "Leaving isn't atonement. You owe the Light more than that.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "You chose to live. The Light can't fault you for that.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf who talks to spirits? Then perhaps you can tell my brother's spirit to stop walking about and accept that Caer Darrow is mine, {class}, because he certainly isn't listening to me." },
        { id = "h_default", key = true,
          text = "I am Weldon Barov, the last living Barov and the rightful heir to Caer Darrow, Brill, Tarren Mill and Southshore. My brother disagrees, but my brother is also dead, he simply refuses to lie down.",
          fx = { hear = "barov_heir" } },
        { id = "h_fortune", tags = { "news" }, when = { questActive = TODO_QUEST("Barov Family Fortune") },
          text = "There are four deeds somewhere in the Scholomance, and you must find them before Alexi's hired cutthroats do. I spared his life once, because that corpse wore my brother's face, and I won't make that mistake again." },
        { id = "h_last", tags = { "news" }, when = { questActive = TODO_QUEST("The Last Barov") },
          text = "The deeds are mine, and now only one thing stands between me and the fortune, sitting at the Bulwark like a vulture on a fence. End him for me." },
        { id = "h_done", when = { questDone = TODO_QUEST("The Last Barov") },
          text = "So Alexi's gone, truly gone at last. I thought I'd feel something about it, but I find I mostly feel rich, and that will have to do." },
        { id = "h_sleep", when = { metBefore = true },
          text = "I sleep with my back to the cliff and a sword under my blanket, because of the assassins, you understand. He sends them, and in his place I'd do the same." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock. You're not one of Alexi's, are you, {class}? He keeps unpleasant company now that he's dead, and I sleep with a sword under the blanket for good reason." },
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
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid of the kaldorei. I suppose you'll be wanting to plant trees on my family's lands once this is over, but I'll be wanting my rents first." },
      },
      again = {
        { id = "h_again", text = "Well? You're still here, so you must want something else." },
        { id = "h_again2", text = "Go on, then, but keep your voice down, the soldiers listen." },
      },
      choices = {
        { text = "What happened at Caer Darrow?", next = "darrow" },
        { text = "Your brother has a claim too.", next = "claim" },
        { text = "What's in these deeds?", next = "deeds" },
        { text = "My family lost everything in Lordaeron too.", next = "refugee", when = { origin = "human_lordaeron_refugee" } },
        { text = "Was it worth it, now he's gone?", next = "worth", when = { questDone = TODO_QUEST("The Last Barov") } },
        { text = "Your brother might hire someone like me, you know.", next = "x_rogue", when = { class = "ROGUE" } },
        { text = "If I were Alexi's, you'd already be dead.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Did the Barovs know Kel'Thuzad well?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Would you have me speak to your brother's spirit, Weldon?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll see what I can find.", next = "END", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I won't help a man who'd murder his own brother.", next = "END", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Did your family really give Caer Darrow to the Cult?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What did your family's bargain cost Lordaeron, Weldon?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would you really hire a sword against Alexi?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Your family's hounds still roam Caer Darrow?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Should Caer Darrow's lands be left to heal on their own?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Too well, I'm afraid, for he was a guest at Caer Darrow more often than I care to remember, and my parents were charmed by every word. I got out with my life and Alexi didn't, and somehow he still claims to be the clever one." } },
      choices = {
        { text = "Your family sold out its people. That's unforgivable.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Plenty were fooled. Your parents were only unlucky.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Let's speak of something else, Barov.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "That's not nearly as reassuring as you think it is. Still, if you've a demon to spare, I'd not object to one standing guard outside my tent, for the Argent folk here don't take my fears at all seriously." } },
      choices = {
        { text = "Your fear is sensible. Keep the sword close.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A coward's fears are no business of mine.", next = "BACK", fx = { align = { light = -1 } } },
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
        { text = "Running was the sensible thing to do.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
      },
    },
    darrow_ran = {
      lines = {
        { id = "dr_default", text = "Left them to what, a wedding? They'd already signed, and there was nothing to save but my own neck, so I saved it. Judge me from inside a Barov's house some evening and see how brave you feel." },
      },
      choices = {
        { text = "Fair enough.", next = "BACK" },
        { text = "I'd have stayed.", next = "BACK", fx = { affinity = -1, trait = { brave = 1 } } },
      },
    },
    claim = {
      lines = {
        { id = "c_default", text = "A claim? He's a corpse, and corpses don't inherit, they get buried. I'd have done him the courtesy myself, if I'd had a shovel and a little more spine." },
      },
      choices = {
        { text = "You spared him once, though.", next = "claim_spared" },
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
        { text = "That was mercy, not weakness.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then let's correct it.", next = "BACK", fx = { affinity = 2, align = { honor = -1 } } },
      },
    },
    deeds = {
      lines = {
        { id = "de_default", text = "The family's deeds to Caer Darrow, to Brill, to Tarren Mill and to Southshore. Half of those places are full of the dead or of the Horde now, but paper outlasts armies, and I intend to be holding it when the armies are gone." },
      },
      choices = {
        { text = "Southshore's people may disagree.", next = "BACK", fx = { trait = { skeptical = 1 } } },
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
        { text = "I hope you find some peace.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 }, align = { honor = 1 } } },
        { text = "Enjoy the money.", next = "END", fx = { align = { honor = -1 } } },
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
        { text = "Double, then. I'll remember that.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I don't take that kind of work, Barov.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
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
    _none = { { id = "tp_none", text = "Does it concern my inheritance? If not, it doesn't concern me." } },
  },
}

P:NPC {
  key = "pureheart", id = TODO_NPC("Argent Officer Pureheart"), name = "Argent Officer Pureheart",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "chillwind_camp", "argent_dawn" }, temper = { "steady" }, values = { "devout", "fair" },
  notices = { "race", "class" },

  impression = {
    first = "Argent Officer Pureheart keeps a table where nobody draws steel, whatever colors they wear. There's an easy warmth to her that seems to have been earned the hard way.",
    third = "{name} met Argent Officer Pureheart, who speaks for the Argent Dawn at Chillwind Camp.",
  },

  greetings = {
    { id = "g_dawn", text = "For the Dawn, friend, and whatever else you fight for, add that to it." },
    { id = "g_back", when = { metBefore = true }, text = "Well met again. Have you any scourgestones in your pack? The Dawn will always take them off your hands." },
  },

  notice = {
    { id = "n_horde", cat = "race", when = { faction = "Horde" },
      text = "Horde, in an Alliance camp, so easy, everyone, because nobody draws steel at my table. The Dawn doesn't ask what colors you wear, only whether you'll fight the dead." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "Silver Hand? I was too, until Mograine fell and the order went red. Tyrosus and I walked out the same day, and don't let anyone tell you which side the Light chose." },
  },

  start = "hello",
  nodes = {
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "There is, though you have to dig to find it. I've seen seeds sprout by the camp's well, tiny and pale, and I've stood watch over them like they were my own children. Don't laugh; it's the only thing growing here." } },
      choices = {
        { text = "I won't laugh. Every sprout is a victory.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Seedlings won't stop the Scourge. Watch the gate instead.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because an Alliance blade and a Horde blade look the same to me but not to each other, and one quick hand on a hilt can undo a month of trust. At the door steel is only steel, and at the table we're only people who fight the dead." } },
      choices = {
        { text = "Then I'll leave it there gladly. Trust is worth that much.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A soldier who disarms in the Plaguelands is a fool, officer.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Tell me something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "More than you'd think, because the plague doesn't care which kingdom a wolf belongs to. I've seen a dwarf and a troll share a fire and argue happily all night about tracking, and neither of them reached for a knife once." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "{pet} is welcome here, {class}. The beasts were the first to make peace at this table, for they never cared what colours their masters wore." },
      },
      choices = {
        { text = "A hunt shared is a hunt doubled. I'd welcome the company.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I hunt alone, officer, and I mean to keep it that way.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, officer.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Argent Officer Pureheart, of the Argent Dawn. We're no kingdom, only people who fight the Scourge, and anyone who fights it is our friend. Alliance and Horde are all one to the dead." },
        { id = "h_commission", tags = { "news" }, when = { questActive = TODO_QUEST("Argent Dawn Commission") },
          text = "Wear the commission, and you'll find the Scourge carry stones, the dark power that binds them made solid. Bring those stones to me, and the Dawn will remember who helped." },
        { id = "h_everlook", tags = { "news" }, when = { questActive = TODO_QUEST("The Everlook Report") },
          text = "Gregor's report? He's a good man, and I sent him to Everlook to keep the Dawn's ear among the goblins. Let me read it while it's still warm." },
        { id = "h_gregor", when = { heardLine = "gregor.h_default" },
          text = "You've been to Everlook, then you've met Gregor Greystone, who's one of mine. Tell me he's eating properly, because he forgets." },
        { id = "h_tyrosus", when = { heardLine = "tyrosus.h_default" },
          text = "You've spoken with Lord Tyrosus? Then you've had more of his time than I have this year. Is he well? He'd never say if he wasn't." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock, and I'll not pretend the others at this table like it, {class}. But the Dawn turns away no one who fights the Scourge, and I meant that when I said it." },
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
        { text = "Why did you leave the Silver Hand?", next = "left" },
        { text = "What does the Dawn ask of me?", next = "commission" },
        { text = "Who is Gregor, in Everlook?", next = "gregor" },
        { text = "I serve the Light too. Where do priests stand?", next = "priest", when = { class = "PRIEST" } },
        { text = "I was raised in the Silver Hand's teachings.", next = "paladin", when = { class = "PALADIN" } },
        { text = "Your soldiers don't look pleased to see me.", next = "horde", when = { faction = "Horde" } },
        { text = "Is there room in the Dawn for the spirits too?", next = "x_shaman", when = { class = "SHAMAN" } },
        { text = "Does that hold even for fel magic?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do mages of both sides really work together here?", next = "xmage", when = { class = "MAGE" } },
        { text = "Does the Dawn ever need something done quietly?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why must a soldier's weapon stay by the door?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do Horde and Alliance hunters really work together here?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Is there life left under the Plaguelands' rot?", next = "xdruid", when = { class = "DRUID" } },
        { text = "I'll bring you stones.", next = "END", fx = { affinity = 1, learn = { "argent_dawn" } } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Sometimes, and I'd rather not know about it, for the Dawn's good name opens doors in Stormwind and the Undercity both. Work against the Scourge however you must, but don't wear our colours while you do the ugly parts." } },
      choices = {
        { text = "I won't do anything I'd hide from the Dawn.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Some ugly work has to be done. I'll do it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let's talk of other things, officer.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They do, though they argue over Dalaran's history the whole time. I've seen a gnome and a Forsaken trade spells over a burning ghoul, and if that's possible, I think almost anything is." } },
      choices = {
        { text = "Old hatreds don't matter against the Scourge.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some hatreds are earned. A truce isn't friendship.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "That's good to hear. Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "It holds for anyone who keeps their power aimed at the dead. Officer Garush at the Bulwark watches warlocks closely, and he has his reasons, but give him time and you'll find he's fair." } },
      choices = {
        { text = "I'll prove my power serves the living.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll aim it wherever I please, officer.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Understood. Something else.", next = "BACK" },
      },
    },
    left = {
      big = true,
      lines = {
        { id = "l_default", text = "When Mograine died, the order's grief turned to hate, and the hate turned on anyone who wasn't them, and that's the Scarlet Crusade. Some of us wanted to fight the plague, not every face that looked different.", fx = { learn = { "argent_dawn", "scarlet_crusade" } } },
      },
      choices = {
        { text = "You chose rightly.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Hate or not, the Crusade gets results against the dead.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "The Crusade still fights the Scourge.", next = "crusade" },
      },
    },
    crusade = {
      lines = {
        { id = "c_default", text = "They do, and bravely, but they'd also burn half the people in this camp for being the wrong sort of alive. I'll pray for them gladly, but I won't march with them." },
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
        { text = "Then put me to work.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, standing = { chillwind_camp = 1 } } },
        { text = "I'll keep my Light for my own fights, thank you.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    paladin = {
      lines = {
        { id = "pa_default", text = "Then hold on to the teaching and let go of the banner, which hangs in Hearthglen now, and it's gone red. The Light was never in the cloth, and the Dawn can show you that." },
      },
      choices = {
        { text = "I'll think on it.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The banner meant something, and I won't let go of it.", next = "BACK", fx = { align = { order = 1 } } },
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
        { id = "xs_default", text = "The Dawn has room for anyone who stands against the Scourge, and I've watched Horde shamans lay the dead to rest as surely as any priest of mine. I don't understand your spirits, but I understand what they do to a ghoul, and that's enough for me." },
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
    _none = { { id = "tp_none", text = "I couldn't say, friend. If it has to do with the Scourge, ask me again, and for anything else, try the commander." } },
  },
}

P:NPC {
  key = "dumah", id = TODO_NPC("Nathaniel Dumah"), name = "Nathaniel Dumah",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "chillwind_camp" }, temper = { "steady" }, values = { "loyal", "stubborn" },
  notices = { "race", "craft" },

  impression = {
    first = "Nathaniel Dumah came back to the Plaguelands for his father's mill, which says a good deal about him. He talks easily, and asks after Northridge like a man asking after family.",
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
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "That they'd stood longer than any kingdom and would outlast this one, which turned out truer than he'd have liked. The Scarlet Crusade is cutting them now, and if those trees have spirits, I'd hate to know what they think of us." } },
      choices = {
        { text = "The mill's yours, but the forest deserves respect, Nathaniel.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Trees are timber. Take back the mill and cut freely.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Too many to count from the treeline, and they're well armed, because the Crusade feeds its soldiers before it feeds anyone else. My father built that mill to last, so if you fight your way in, mind the support beams, because I'd like something left to come home to." } },
      choices = {
        { text = "I'll fight carefully and leave your father's beams standing.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If the mill comes down on them, so much the better.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Nathaniel.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Gone south with the rest of us, or gone under with the plague, and I never learned which. The woods are full of sick wolves now, so if you're out that way, it won't be deer you find." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "{pet} would have loved the mill yard when I was a boy, {class}, with sawdust to roll in and the dogs to chase. I hope it's that kind of place again one day." },
      },
      choices = {
        { text = "The woods will come back, Nathaniel. I'll help clear the way.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Those woods are dead. Better to burn them and start over.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let us talk of something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Some of them were knights once, and some were farmers who picked up a sword when the plague came, and I'd be glad to share a fire with either sort. But they took the mill from the family that built it and called it purging, and I can't call that anything but theft." } },
      choices = {
        { text = "The law of the land says the mill is yours.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Lordaeron's law died with its king. The strong hold what they take.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I would, though the Crusade will tell you they've blessed it already, every beam of it, twice a day with a great deal of shouting. Their Light doesn't feel much like the one my mother prayed to, and that's half the reason I want them out." } },
      choices = {
        { text = "The Light is mercy, not shouting. I'll bless it gladly.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Crusade at least fights the Scourge. Bless it as they do.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "They'd burn anything they think the shadow's touched, and they'd sing hymns while they did it. My father built that mill with his own hands and two hired men from Hearthglen, and I'd sooner see it standing with Crusaders in it than ashes with none, so whatever you do there, keep your fire off the timber." } },
      choices = {
        { text = "Your father's mill will stand. You have my word.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If burning it clears the Crusade out, so be it.", next = "BACK", fx = { align = { honor = -1 } } },
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
          text = "Father used to say a mill's only as good as its river, and the river's still there, sick as it is. That's more than I can say for most of Northridge." },
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
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. I'll take your help against the Crusade gladly, {class}, but they've a long memory for your kind, and they'll burn the mill down around us before they let a demon walk in." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Scarlet", min = 30 } }, text = "Word is the Crusade's losing men at Northridge faster than Hearthglen can send them. I'd like my father's mill back with a roof on it, so mind the timber while you're about it." },
      },
      again = {
        { id = "h_again", text = "Something else you wanted to ask? Go ahead, I don't mind talking." },
        { id = "h_again2", text = "Still here? Good, it's nice to have someone to talk to who isn't a soldier." },
      },
      choices = {
        { text = "What happened to your family?", next = "family" },
        { text = "Why termites?", next = "termites" },
        { text = "Tell me about the mill.", next = "mill" },
        { text = "I fled Lordaeron too, when I was young.", next = "refugee", when = { origin = "human_lordaeron_refugee" } },
        { text = "Termites in a mill? Nature can be cruel.", next = "x_druid", when = { class = "DRUID" } },
        { text = "Would the mill still run, if you got it back?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What's the Crusade doing in your father's mill?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Would the Crusade really burn your father's mill, Nathaniel?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What did your father say about the Northridge trees, Nathaniel?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll help you take it back.", next = "END", fx = { affinity = 2, standing = { chillwind_camp = 1 } } },
        { text = "Would you want the mill blessed after the Crusade leaves?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Are the Crusaders in Northridge still knights, or only squatters?", next = "xapala", when = { class = "PALADIN" } },
        { text = "How many Crusaders hold the Northridge mill?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What became of the Northridge trappers?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Cutting lumber for Hearthglen's walls, from what I hear, with my father's saws and my father's sweat still in the timbers. Walk in quiet and count how many there are, and I'll know whether to hope or to give up on it." } },
      choices = {
        { text = "The mill is yours by right. Take it back.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Deeds mean little now. Let the Crusade keep it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The wheel's sound as far as I know, and the river doesn't care who won the war. It's the land around it that worries me, for the plague's in the soil, and you can't build homes on poisoned ground with any spell I've heard of." } },
      choices = {
        { text = "The land will heal. It always does, in time.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Better to burn it all and start fresh.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk of other things.", next = "BACK" },
      },
    },
    family = {
      lines = {
        { id = "f_default", text = "We lost friends and cousins, some we buried and some we never got the chance to. Father made it to Stormwind and never stopped talking about the mill, so you see, I'm not really here for the wood." },
      },
      choices = {
        { text = "You're here for him.", next = "BACK", fx = { affinity = 3, trait = { kind = 1 }, align = { light = 1 } } },
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
        { text = "You'd ruin your own mill?", next = "termites_ruin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    termites_ruin = {
      lines = {
        { id = "tr_default", text = "I'd rather it fell down than stood up for them. We can always build another mill on the same river, but we can't build it while the Crusade's living in it." },
      },
      choices = {
        { text = "That's a hard choice.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Clever. Cruel, but clever.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'd rather we took the mill back whole, and properly.", next = "BACK", fx = { align = { order = 1 } } },
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
        { text = "Turning the wild on people sits ill with me.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "The Crusade has earned every last termite.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
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
    _none = { { id = "tp_none", text = "I don't know anything about that, I'm afraid. I know timber, and I know grief, so pick one of those." } },
  },
}

P:NPC {
  key = "bibilfaz", id = TODO_NPC("Bibilfaz Featherwhistle"), name = "Bibilfaz Featherwhistle", title = "Gryphon Master",
  bible = "bibles/westernplaguelands.md", role = "flightmaster", tier = "service",
  communities = { "chillwind_camp" }, temper = { "jovial" }, values = { "cheerful" },
  notices = { "race" },

  impression = {
    first = "Bibilfaz Featherwhistle chatters to his gryphons at night about Ironforge pastries. He is the cheeriest thing in the Plaguelands, and I suspect he's working very hard at it.",
    third = "{name} met Bibilfaz Featherwhistle, the gnomish gryphon master at Chillwind Camp.",
  },

  greetings = {
    { id = "g_fly", text = "Wings ready! Well, their wings are ready, anyway, since mine are purely theoretical." },
    { id = "g_back", when = { metBefore = true }, text = "Back for a ride? Good timing, too, since Snowtail's in a mood today, so I'll give you the nice one." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A fellow gnome, out here, of all places! I've been talking to gryphons for weeks, and they're lovely creatures, but they really aren't much for conversation." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They hate them, poor dears, and they won't fly over Andorhal unless I bribe them with something from Ironforge's bakeries. I've always thought a shaman might calm them better than a pastry, though I'd keep the pastries handy, just in case." } },
      choices = {
        { text = "A bird should fly where it's told, wind or no wind.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them follow the wind's will. It knows the safe paths.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Hate it! They fly high and fast and they don't land unless they absolutely must. I can't blame them, but I've got to keep them flying, because the camp needs supplies and Ironforge needs its letters." } },
      choices = {
        { text = "Keep them flying. The camp needs those supplies.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Give them rest between runs. They've earned it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They mind it terribly, and they tell me so all the way to Aerie Peak, but they've never once dropped anyone. I give the big grey one an extra fish whenever he carries a knight, and I think he's started to look forward to it." } },
      choices = {
        { text = "I'll thank him properly before I climb aboard, then.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "It's a mount, Bibilfaz. It carries what it's told.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Bibilfaz.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Mostly, though they think every cat is a chick they've misplaced and every wolf is a rude neighbour. The plague air makes them cross, so I keep pets well away from the roost until the birds have had their breakfast." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Oh, and that's {pet}! The grey gryphon's watching it very closely, {class}, so keep it this side of the post until they've been properly introduced." },
      },
      choices = {
        { text = "Rules first, then. I'll keep my beast on this side of the post.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My beast goes where I go, and the birds can lump it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Bibilfaz.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Safe enough, though the birds won't land there and I don't make them. The Scourge keep clear of the tomb too, which is the best thing anyone's ever said about a grave, I think, and I'd like to think Uther would be pleased." } },
      choices = {
        { text = "Uther's grave should be guarded, not just flown over.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let the dead knight rest. The living need the birds.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I think they feel something, because Thundermane won't fly over Uther's tomb at all, he just circles wide and goes quiet. I asked a dwarf about it once and he said a gryphon knows a holy place better than a priest does, and then he told me I owed him an ale." } },
      choices = {
        { text = "Every creature knows holy ground. The Light is in all things.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They're animals, Bibilfaz. They just don't like the smell.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Biscuits, mostly, and a little gnomish ingenuity, for I've a bellows here that blows the sulphur smell downwind before the birds catch it. It works nine times in ten, and the tenth time you land in Aerie Peak a bit faster than you meant to, but nobody's fallen off yet." } },
      choices = {
        { text = "Clever work, Bibilfaz. I'll be gentle with the birds.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Nine in ten? I'll risk it. Strap me in.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Bibilfaz.", next = "BACK" },
      },
    },
    hello = {
      lines = {
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
          text = "A warrior! Oh, the gryphons do grumble about the weight of plate, {class}, but they're very brave birds, and they'd carry an anvil if you asked them nicely." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter! The gryphons like your sort, {class}, because you smell of the woods rather than the plague, and that's a real treat for them up here." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf druid! You'll want to fly as a bird, I'd wager, but the gryphons are faster, and they don't mind the smell as much as you'd think." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock! Oh, the gryphons won't like that, no, not one bit, {class}, but they'll fly you anyway, because I've told them you're on our side, and I'm very persuasive." },
      },
      again = { { id = "h_again", text = "Anything else? The birds aren't going anywhere without me, so take your time." } },
      choices = {
        { text = "Where's safest to fly?", next = "routes" },
        { text = "How do the gryphons cope up here?", next = "gryphons" },
        { text = "Let's fly.", next = "BUSINESS" },
        { text = "Do your gryphons know Wildhammer riders?", next = "x_dwarf", when = { race = "Dwarf" } },
        { text = "Teleport can't bring me to the Plaguelands, though.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Could I hitch a ride without signing your ledger?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do gryphons feel the Light, do you think?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is it safe to fly over Uther's tomb, Bibilfaz?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do your gryphons mind carrying heavy armour?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do your gryphons get along with hunters' beasts?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the gryphons hate flying over the Plaguelands?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "How do you persuade a gryphon to carry a warlock, Bibilfaz?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What do your gryphons think of the plague winds, Bibilfaz?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Absolutely not, the ledger's sacred, and so is the Ironforge pastry fund it helps pay for! Besides, a gryphon won't take off with a stranger who hasn't been introduced properly, so you'd only end up sitting on a very confused bird." } },
      choices = {
        { text = "Rules are rules. I'll sign the ledger.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Rules are made to be slipped, Bibilfaz.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Fair. Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "No, and that's why I'm still in business, though I'd rather be in Tinker Town eating cake. Some places are only reached the long way, and my birds don't mind it half as much as the people riding them." } },
      choices = {
        { text = "Some places should stay hard to reach.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Every place should be one spell away.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
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
        { id = "gy_default", text = "Better than you'd think, honestly, though they won't land anywhere near Andorhal however nicely I ask. I give them extra feed when the wind blows from the north, and they forgive me for bringing them here." },
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
    _none = { { id = "tp_none", text = "No idea at all, I'm afraid! But I can fly you to someone who might know." } },
  },
}
