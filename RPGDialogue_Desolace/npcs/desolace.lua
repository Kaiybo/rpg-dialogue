-- Desolace: Nijel's Point (Alliance, with a neutral Cenarion keeper) and Ghost Walker Post (Horde). Voice: bibles/desolace.md
local P = RPGDialogueAPI:Pack("rpgd.desolace")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "pentigast", id = TODO_NPC("Captain Pentigast"), name = "Captain Pentigast",
  bible = "bibles/desolace.md", role = "soldier", tier = "major",
  communities = { "nijels_point" }, temper = { "calculating" }, values = { "dutiful", "cunning" },
  notices = { "kit", "status" },

  impression = {
    first = "Captain Pentigast plays the centaur clans against each other the way other men play cards, and he doesn't pretend it's pretty. He has more ground than soldiers and knows exactly how thin he's stretched.",
    third = "{name} met Captain Pentigast, who commands the Stormwind Army's thin garrison at Nijel's Point.",
  },

  greetings = {
    { id = "g_post", text = "Another sword for Nijel's Point, good. I've more ground to hold than men to hold it." },
    { id = "g_back", when = { metBefore = true }, text = "Back from the valley? Which clan did you run into this time?" },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You look like you got between two centaur clans. It's an easy mistake, so get patched." },
    { id = "n_stormwind", cat = "status", when = { race = "Human" },
      text = "A face from home. Tell me Stormwind still remembers we're out here." },
  },

  start = "hello",
  nodes = {
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Which clan is moving and which way, mostly, because the Kolkar, the Gelkis and the Magram spend more time watching each other than watching us. If any of their war parties turn our way, I want to hear about it a day before the Point does." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep {pet} low in the scrub. Centaur scouts know a wild animal from a trained one, and they'll come looking for whoever's holding the leash." },
      },
      choices = {
        { text = "I'll scout them, but I won't help set clan against clan.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll find their weak point, and you can use it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warrior_pg = {
      lines = {
        { id = "wpg_default", text = "Welcome, and don't get comfortable, because there's no line here to hold, only a ridge and a great deal of centaur on either side of it. My best warriors are the ones who learned to count before they learned to charge." },
        { id = "wpg_guard", when = { origin = "human_city_guard" },
          text = "City Watch, aren't you? I can tell by the way you check the gate before you check the view. Stormwind sends me plenty of those, and they're the only ones who ever remember to lock anything." },
      },
      choices = {
        { text = "Point me at the Kolkar and I'll charge.", next = "BACK", fx = { align = { honor = 1 }, trait = { brave = 1 } } },
        { text = "I can count. Tell me the numbers.", next = "clans", fx = { align = { honor = -1 } } },
      },
    },
    paladin_pg = {
      big = true,
      lines = {
        { id = "ppg_default", text = "I'm sure it does, and I'm sure the Light would rather I had three hundred more men. I don't, so I make the Kolkar and the Gelkis bleed each other, and I pray about it afterwards, when there's time." },
      },
      choices = {
        { text = "Then I'll keep your men alive and leave the scheming to you.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "I won't help betray anyone, Captain.", next = "BACK", fx = { align = { honor = 1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    nelf_pg = {
      lines = {
        { id = "npg_default", text = "They do, and your Sentinels make very sure we know whose trees they are. The Circle's keepers share this ridge with us, and we get on, mostly because they ignore me and I'm careful not to cut anything down." },
      },
      choices = {
        { text = "That's wise of you, Captain.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "I could stand here with a handful of soldiers and wait for the clans to notice us, I suppose. The Kolkar and the Magram and the Gelkis hate each other more than they hate us, and I mean to keep it that way." } },
      choices = {
        { text = "There's no honor in playing them like cards.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let them bleed each other. It saves our soldiers.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "More than you'd think, because a single fireball dropped between the Kolkar and the Gelkis at the right moment starts a feud that lasts all season. I'd rather the clans blamed each other's shamans than came looking for us, and a little well-placed flame helps them along." } },
      choices = {
        { text = "I'll start no feuds. I fight in the open, Captain.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Point me at the right camp and I'll light it.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I trust results, and I keep a close eye on how they're got. Thunder Axe Fortress is full of cultists who thought they had their masters on a leash, so if you go down there, mind that yours doesn't slip while you're watching theirs." } },
      choices = {
        { text = "My demons answer to me. Judge me by what I bring back.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll keep the imp leashed and follow your orders, Captain.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter. Good, because I need eyes on the centaur camps more than I need another sword, and the Kolkar can smell a soldier a mile off." },
        { id = "h_default", key = true,
          text = "Captain Pentigast, of the Stormwind Army. We're spread thin out here, and the centaur outnumber us, but luckily they hate each other more." },
        { id = "h_alliance", tags = { "news" }, when = { questActive = TODO_QUEST("Strange Alliance") },
          text = "One of the clans will deal with us, for a price. Pick your partner and earn their trust. We can sort out what we owe them later." },
        { id = "h_politics", when = { questActive = TODO_QUEST("Brutal Politics") },
          text = "Politics out here are brutal: make friends with one clan, then remind them they were never ours. It's ugly work, but necessary." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid of the Circle at Nijel's Point. Keeper Marandis has his own business in Desolace, and I'd be obliged if one of you told me what it is." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage, and from the look of you, one who can throw fire farther than my archers can shoot. I won't ask where you studied, so long as you're willing to do it from my ridge." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock at Nijel's Point. I'll be plain with you: the last people out here who trafficked with demons were the Burning Blade, and I've buried soldiers they sent to me in pieces." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Kolkar", min = 40 } }, text = "The Kolkar have been licking their wounds since you went through their camps, and the other clans have noticed. I'd call that a useful kind of message." },
      },
      again = { { id = "h_again", text = "Anything else? Make it count; the drums are starting." } },
      choices = {
        { text = "Must you set the centaur clans against each other, Captain?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Playing the clans against each other?", next = "clans" },
        { text = "Why is Stormwind even out here?", next = "stakes" },
        { text = "Who's who at the Point?", next = "point" },
        { text = "Stormwind remembers you, Captain.", next = "home", when = { race = "Human" } },
        { text = "I could handle the betraying part.", next = "rogue", when = { class = "ROGUE" } },
        { text = "What do you make of Brother Anton?", next = "anton", when = { heardLine = "anton.h_default" } },
        { text = "Your men need a chaplain, Captain.", next = "priest_chaplain", when = { class = "PRIEST" } },
        { text = "Another blade for the Point, Captain.", next = "warrior_pg", when = { class = "WARRIOR" } },
        { text = "Betraying a clan sits ill with the Light.", next = "paladin_pg", when = { class = "PALADIN" } },
        { text = "Stormwind's soldiers march through our forests to get here.", next = "nelf_pg", when = { race = "NightElf" } },
        { text = "What use does Nijel's Point have for a mage, Captain?", next = "xmage", when = { class = "MAGE" } },
        { text = "Will you trust a warlock on your ridge, Captain?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What do you need scouted among the centaur, Captain?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I'll help hold the Point.", next = "END", fx = { affinity = 1, standing = { nijels_point = 1 } } },
      },
    },
    clans = {
      big = true,
      lines = {
        { id = "c_default", text = "Kolkar, Magram, Gelkis: three clans, three grudges, one valley. If they spend their arrows on each other, they don't spend them on us, and I'd rather that than a war I can't win." },
      },
      choices = {
        { text = "Clever.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Turning them on each other is a coward's way to win.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "And when they find out?", next = "clans_after" },
      },
    },
    clans_after = {
      lines = { { id = "ca_default", text = "Then I'll be the most hated man in Desolace, and still alive. I've been both of those before, separately." } },
      choices = {
        { text = "There has to be an honest way.", next = "BACK", fx = { affinity = -1, align = { honor = 2 } } },
        { text = "Honesty won't keep your men alive out here.", next = "BACK", fx = { align = { honor = -2 } } },
        { text = "You don't like it any more than I do, Captain.", tag = "Persuade", next = "arithmetic",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "PRIEST" }, { trait = "cautious" } } } },
          fail = { next = "arithmetic_no", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stakes = {
      lines = { { id = "s_default", text = "Because if we're not, someone else is. A foothold in Desolace is a road between Stonetalon and Feralas, and roads matter, even ones through dust." } },
      choices = {
        { text = "Does Stormwind send you what you need?", next = "stakes_help" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stakes_help = {
      lines = { { id = "sh_default", text = "Stormwind sends orders. Supplies come when the road's clear and the sea's calm, which is rarely both, so we make do, and making do is most of soldiering." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    point = {
      lines = { { id = "p_default", text = "The keeper and his sisters, on the Circle's business; Kreldig, on the Reclaimers'; Brother Anton, on the Crusade's. And me, on everyone's." } },
      choices = {
        { text = "What's the keeper's business, really?", next = "point_keeper" },
        { text = "Something else.", next = "BACK" },
      },
    },
    point_keeper = {
      lines = { { id = "pk_default", text = "Something under the earth, south of here. He won't say more to me, and I've stopped asking. A man who brings his own dryads doesn't need my help." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } } },
    },
    home = {
      lines = { { id = "h2_default", text = "Do they? Then tell them we've had dust for supper three nights running and nobody's deserted. Tell them it's a miracle, because it is." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    rogue = {
      lines = { { id = "r_default", text = "I don't doubt it, and that's exactly why I'll be watching you while you do it. No offence; it's the job." } },
      choices = {
        { text = "None taken.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Watch all you like, because I've nothing to hide.", next = "BACK", fx = { align = { honor = 1 } } },
      },
    },
    anton = {
      lines = { { id = "a_default", text = "Earnest, brave, and very sure of things a long way from here. I don't argue with him; I'd rather he kept his faith than lost it in my camp." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_crusade" } } } },
    },
    priest_chaplain = {
      lines = { { id = "pch_default", text = "They need a chaplain, a cook and forty more swords, and I'll take the chaplain. Brother Anton prays, but only for the Crusade. My men would like someone to pray for them." } },
      choices = {
        { text = "I'll pray for them.", next = "BACK", fx = { affinity = 3, standing = { nijels_point = 2 }, align = { light = 1 } } },
        { text = "Your men need swords more than they need prayers.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    arithmetic = {
      lines = {
        { id = "ar_default", text = "No, I don't, and I'll thank you not to tell the men. I call it arithmetic, forty soldiers against three clans, and the arithmetic is right, but I don't sleep the night after I break faith with a clan, and I've stopped expecting to." },
        { id = "ar_priest", when = { class = "PRIEST" },
          text = "You'd make a decent chaplain, getting that out of me. I call it arithmetic, forty soldiers against three clans, and the sums are right, but the night after I break faith with a clan I don't sleep, and I've stopped expecting to." },
      },
      choices = {
        { text = "That's what keeps you honest.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    arithmetic_no = {
      lines = {
        { id = "ano_default", text = "What I like doesn't come into it; the orders and the odds do. Ask me something useful." },
        { id = "ano_rogue", when = { class = "ROGUE" },
          text = "Looking for a soft spot, are you? I did say I'd be watching you, so ask me something useful." },
      },
      choices = {
        { text = "Fair enough, Captain.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Keeping three clans at each other's throats means knowing what each one is up to. Ask, and I'll tell you what's safe to tell." },
    },
    background = { { id = "tp_ba", text = "Stormwind Army, and a long string of postings nobody else wanted. This is the dustiest, though it isn't the worst." } },
    advice = { { id = "tp_ad", text = "Never let a centaur clan see you leaving another clan's camp. Leave by the back; there's always a back." } },
    cenarion_circle = { { id = "tp_circle", text = "The keeper's on his own errand. I don't ask and he doesn't explain, and we get along." } },
    _none = { { id = "tp_none", text = "Not in my orders. Ask Kreldig; the Reclaimers poke into everything." } },
  },
}

P:NPC {
  key = "marandis", id = TODO_NPC("Keeper Marandis"), name = "Keeper Marandis",
  bible = "bibles/desolace.md", role = "noble", tier = "quest",
  communities = { "nijels_point" }, temper = { "formal" }, values = { "proud", "devout" },
  notices = { "class", "form" },

  impression = {
    first = "Keeper Marandis speaks as though every word were borrowed from the Cenarion Circle and must be returned in good condition. Whatever errand brought him down from Stonetalon, he considers it far from small.",
    third = "{name} met Keeper Marandis of the Cenarion Circle, who keeps the grove at Nijel's Point.",
  },

  greetings = {
    { id = "g_keeper", text = "You stand before a keeper of the grove. Speak carefully; my time is the Circle's, not mine." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. Then you know what the Circle asks of its servants, and perhaps one day it will ask more of you." },
  },

  react = {
    { id = "r_bear", on = "form", when = { form = "bear" }, text = "You wear the bear with some dignity, which is good. Keep it when you take your own shape again." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The Circle would tell you that nature defends itself, and in a greener place I would agree. Here the satyrs foul the land faster than we can cleanse it, and I will not pretend that the Circle's patience has kept a single one of my sisters safe." } },
      choices = {
        { text = "Then I'll guard your sisters while the Circle does its work.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Patience cleanses nothing. I'll cut the satyrs out myself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunter_md = {
      lines = {
        { id = "hmd_default", text = "Wrong is a kind word for it. The earth here is poisoned from below, and what grazes on it sickens, and what hunts what grazes sickens after; you may be the first to notice, because you are the last link in that chain." },
      },
      choices = {
        { text = "Then I'll hunt only what's already dying.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "A hunter eats what's there, sick or not.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "We distrust carelessness, and arcane power has always invited it, as the Well of Eternity taught us at a terrible price. The earth of Desolace was poisoned long ago, and I would not have a young mage add a new wound while the old ones are still weeping." } },
      choices = {
        { text = "Magic is a tool like any other. The fault is in the hand.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Then I'll tread lightly and wield my power with care.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "May I ask about something else?", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because I have walked the corrupted ground around the Mannoroc Coven, where the earth itself still remembers what fell there, and nothing grows true. Whatever pact you have made, the land pays for it in the end, even if you never see the bill." } },
      choices = {
        { text = "I'll turn the fel against the demons. It's a weapon.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "You're right to be wary. I'll keep my pacts away from the green.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let us speak of something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The Light mends what lives, and very little lives here, so I would not ask it to mend the ground itself. The Circle believes Desolace is not dead but sleeping badly, and that its healing will be slow, patient work that outlasts us both." } },
      choices = {
        { text = "The Light can reach even here, Keeper. I'll prove it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Some places are past saving. Spend the effort where it counts.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Keeper.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "There is corruption, certainly, among the demons of Mannoroc Coven and the Burning Blade at Thunder Axe Fortress. The Circle would ask you to judge each thing you meet with care, because not everything frightening in Desolace is wicked." } },
      choices = {
        { text = "Evil hiding in the wilds must be rooted out by force.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The wild has its own balance. I'll tread carefully.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Perhaps. The Gelkis and the Magram both send scouts close to our camp, and I would know which clan watches us, and why, before either decides we are worth the trouble. A druid in the shape of a cat can do it, but my sisters are few and Desolace is wide." } },
      choices = {
        { text = "I'll watch them for you, and tell you only the truth.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll watch them, but I'll decide what you need to know.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. The Circle has little need of blades, though in Desolace I have learned that need and preference are seldom the same thing." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest of the Light, so far from the cathedrals. The Circle does not pray as you do, but we tend the same wounded world, and Desolace has more wounds than either of us can count." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin of the Silver Hand, here among the centaur and the dust. I hope you have come to protect this land and not only to fight upon it, because Desolace has had more than enough of fighting." },
        { id = "h_default", key = true,
          text = "Keeper Marandis, of the Cenarion Circle. My sisters and I came down from Stonetalon on the Circle's business, and it is not small business." },
        { id = "h_corruption", tags = { "news" }, when = { questActive = TODO_QUEST("Corruption of Earth and Seed") },
          text = "The earth here is sick at its root. Bring me proof of what's poisoning it, for the Circle must know." },
        { id = "h_strong", when = { minLevel = 45 },
          text = "You've grown strong, so hear it: a princess of the earth, Theradras, holds the body of one dear to the Circle, and we mean to take it back." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "You carry the scent of the arcane, and my people remember where that scent led the Highborne. Still, you came to the Circle's camp openly, so I will speak with you." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "The fel clings to you as smoke clings to cloth, and I can smell it from across the clearing. Say what you have come to say, and do not call anything here." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You came into the clearing without a sound, and the birds did not stir. That is a gift the Circle respects, though I would know what you meant to do with it." },
      },
      again = { { id = "h_again", text = "You have another question; ask it plainly." } },
      choices = {
        { text = "What mission?", next = "mission" },
        { text = "What's wrong with the earth here?", next = "earth" },
        { text = "Your sisters?", next = "sisters" },
        { text = "The Circle asks more of me. How do I answer?", next = "druid", when = { class = "DRUID" } },
        { text = "Tell me of Theradras.", next = "theradras", when = { minLevel = 45 } },
        { text = "I hunt these lands. The beasts are wrong here.", next = "hunter_md", when = { class = "HUNTER" } },
        { text = "Do the keepers distrust all mages, Keeper?", next = "xmage", when = { class = "MAGE" } },
        { text = "Why does the fel trouble you so much, Keeper?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Can the Light do anything for a land this broken?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is there evil here a paladin should root out, Keeper?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does the Cenarion Circle ever need a warrior, Keeper?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Has the Circle any use for someone who walks unseen, Keeper?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    mission = {
      lines = { { id = "m_default", text = "Ask me again when you've grown, for the Circle's business is not for apprentices. No offense is meant." } },
      choices = {
        { text = "Some taken.", next = "BACK", fx = { affinity = -1 } },
        { text = "I understand.", next = "BACK", fx = { affinity = 1, learn = { "cenarion_circle" } } },
      },
    },
    earth = {
      lines = { { id = "e_default", text = "Something below sours it. The roots go grey, the water goes bitter, and the valley remembers nothing green. It has been so a long time, but it need not stay so." } },
      choices = {
        { text = "Can it be healed?", next = "earth_heal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    earth_heal = {
      lines = { { id = "eh_default", text = "Everything can be healed, given time, and the Circle has time. It is the people of Desolace who do not." } },
      choices = {
        { text = "Then the land comes first, and the people must wait.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "The people can't wait, so heal them first and the land after.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sisters = {
      lines = { { id = "s_default", text = "The dryads of my grove. They walk where I cannot and see what I would rather not. Do not stare at them; they find it tiresome." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    druid = {
      lines = { { id = "d_default", text = "Patiently. The Circle asks slowly, and expects you to answer slowly. Those who hurry are the ones it stops asking." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } } },
    },
    theradras = {
      big = true,
      lines = { { id = "t_default", text = "A daughter of the earth, and its shame. She dwells below, in Maraudon, and what she holds there is not hers to keep. When you are ready, the Circle will ask." } },
      choices = { { text = "I'll be ready.", next = "BACK", fx = { affinity = 2, learn = { "cenarion_circle" } } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The Circle's business is mine to know, and some of it I may share. Ask, and I will answer as I am able." },
    },
    background = { { id = "tp_ba", text = "A keeper of the grove, sworn to the Circle. What I was before that does not matter to the work." } },
    advice = { { id = "tp_ad", text = "Watch where the grass will not grow. The land is telling you where not to sleep." } },
    cenarion_circle = { { id = "tp_circle", text = "The Circle sees further than any one keeper. I see as far as Desolace, and it is far enough to worry." } },
    _none = { { id = "tp_none", text = "That does not concern the Circle, so it does not concern me." } },
  },
}

P:NPC {
  key = "kreldig", id = TODO_NPC("Kreldig Ungor"), name = "Kreldig Ungor",
  bible = "bibles/desolace.md", role = "questgiver", tier = "quest",
  communities = { "nijels_point" }, temper = { "busy" }, values = { "practical", "friendly" },
  notices = { "craft" },

  impression = {
    first = "Kreldig Ungor is up to his beard in salvage and reagents and still found time to be friendly. He patched a kettle with an arrow hole in it and seemed prouder of that than of anything else.",
    third = "{name} met Kreldig Ungor, the busy dwarf who runs Reclaimers Inc.'s business out of Nijel's Point.",
  },

  greetings = {
    { id = "g_busy", text = "Got a lot on out here, friend. Wrecks to pick, reagents to fetch, an' only the one of me." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = { "Engineering", "Mining" } },
      text = "Good with yer hands, are ye? The Reclaimers are always hirin' folk who know salvage from scrap." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Centaur spears, ogre clubs as long as I am, an' once a dwarven axe frae afore the Second War, still sharp under the rust. I cleaned it up an' hung it above the stall, because some things ye don't sell, no matter what the Reclaimers' ledger says." } },
      choices = {
        { text = "Right. A fallen warrior's axe deserves a wall, not a price.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A good axe should be swung, not hung up for show.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Belt buckles, arrowheads, a centaur's earring, an' once the whole brass compass off a wagon, which I'll swear blind is true. The Scorpashi dig deep in the sand, an' a hunter who knew where they nest could tell me a great deal about what Desolace has lost." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep {pet} out o' the nests, though, because Scorpashi venom'll lay a beast low faster than a dwarf after a cask o' stout." },
      },
      choices = {
        { text = "What the dead dropped belongs to their kin, not your ledger.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Lost is lost. If I find it, I'll sell it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarf_kr = {
      lines = {
        { id = "dkr_default", text = "Aye, an' they'd say it wi' a pickaxe in one hand an' a bit o' Titan pottery in the other! The League puts things in glass cases in Ironforge; Reclaimers put 'em back to work, an' I know which one's more use to a hungry dwarf." },
      },
      choices = {
        { text = "History belongs in a hall, not a market.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Fair enough. Salvage feeds people.", next = "BACK", fx = { align = { order = -1 }, affinity = 2 } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "We find what others lost, friend, an' there's a fine line between lost an' taken that I'd rather not walk. Bring me salvage from the Karnitol wreck or the old ruins an' I'll not ask twice, but bring me a man's purse an' ye'll be talkin' to the Captain." } },
      choices = {
        { text = "Lost or taken, it's all salvage once it's in Desolace.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Fair enough. I'll stick to wrecks and ruins, then.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Odds an' ends from the night elves' time, mostly, an' bits from the Karnitol's hold that some noble wanted kept dry. Half o' them hum when ye hold 'em, an' I've learned to set the hummin' ones down gently an' walk away." } },
      choices = {
        { text = "Leave anything that hums sealed. Some things should stay lost.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Crack them open. Knowledge is worth the risk of a burn.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Soul shards I'll not touch, an' I'll thank ye not to leave any lyin' about, but I've candles, chalk an' good thick string, which is more than ye'll find down in the valley. The Burning Blade at Thunder Axe have their own suppliers, an' I'd like to keep it that way." } },
      choices = {
        { text = "I'll buy honestly and keep my business tidy.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My business is mine. Sell me the chalk and ask nothing.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More often than I'd like, aye, out by the Kodo Graveyard an' along the old roads where the centaur caught a caravan. I take what's useful an' I bury what's left, though I'll admit I'm no hand at the prayin' part." } },
      choices = {
        { text = "Bury them properly, and I'll say the words with you.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The dead don't need their gear. Take it and don't look back.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Kreldig.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Honest enough, I'd say, because what lies in the sand helps nobody, an' what I bring back keeps Nijel's Point in nails an' kettles. Still, I'll no' pretend there's never a night I wonder whose pack I'm carryin'." } },
      choices = {
        { text = "Return what you can to the families. That's the honest way.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Nobody's coming to claim it. Use it and stop fretting.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Some o' it does, aye. There's stones out by Maraudon that hum when ye hold 'em, an' Keeper Marandis told me tae leave 'em be, so I did, though I'll confess it near broke me heart tae walk away from a find like that." } },
      choices = {
        { text = "He was right. Some things should stay buried.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If it hums, it's worth studying. Sell it to someone careful.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior! Ye'll be wantin' tae know if I've any old arms out o' the wreckage, an' the answer's aye, though most o' it's rusted tae its scabbard." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter, eh? If ye're headed down past the Kodo Graveyard, keep an eye out for anythin' shiny, because I'd swear the scorpids drag all sorts back tae their holes." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, eh? Good, because half o' what I salvage out o' this waste was left behind by folk who didnae make it home, an' it'd sit easier wi' me if someone said a word over them." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin o' the Silver Hand, out among the dust an' the demon-lovers! Reclaimers Inc. could use a strong back an' a stronger conscience, an' ye look like ye've brought both." },
        { id = "h_default", key = true,
          text = "Kreldig Ungor, o' Reclaimers Inc., an' we find what others lost an' put it back to use. Desolace has lost a great deal." },
        { id = "h_karnitol", tags = { "news" }, when = { questActive = TODO_QUEST("The Karnitol Shipwreck") },
          text = "The Karnitol went down off the coast with her cargo, an' the Reclaimers want what's left aboard. Fetch what ye can." },
        { id = "h_reagents", when = { questActive = TODO_QUEST("Reagents for Reclaimers Inc.") },
          text = "Reagents, from the beasts an' the ruins. The Reclaimers pay fair, an' mostly on time." },
        { id = "h_business", when = { questActive = TODO_QUEST("Reclaimers' Business in Desolace") },
          text = "Ye came all this way on Reclaimers' business? Good, then pull up a crate." },
        { id = "h_salvage", when = { metBefore = true }, text = "Found a perfectly good kettle in the dust yesterday, wi' a centaur arrow through it. I patched it, an' it makes tea fine; that's Reclaimers' work in one kettle." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Light-fingered sort, are ye? I can tell by how ye looked at me crates afore ye looked at me, an' I'll ask ye to keep yer hands where Reclaimers Inc. can see 'em." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Grand, because I've a crate o' scrolls an' trinkets from the old ruins that might be priceless or might explode, an' I've no way o' tellin' which." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock, is it? Ye're welcome to warm yer hands, but if anythin' o' yours gets into me reagents, ye'll be payin' for the lot." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Now dinnae give me that look, because everythin' I dig up out o' this dust was dead long afore Reclaimers Inc. came along." },
      },
      again = { { id = "h_again", text = "Anythin' else? Mind the crates." } },
      choices = {
        { text = "What are the Reclaimers?", next = "reclaimers" },
        { text = "What happened to the Karnitol?", next = "karnitol" },
        { text = "How do you get on with the Explorers' League?", next = "league" },
        { text = "I know salvage from scrap.", next = "salvage", when = { profession = "Mining" } },
        { text = "The Explorers' League would call you looters.", next = "dwarf_kr", when = { race = "Dwarf" } },
        { text = "Does Reclaimers Inc. ever buy things that are quietly recovered?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What sort of relics are you pulling out of Desolace, Kreldig?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do you stock anything a warlock might need, Kreldig?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do you ever find the dead along with their belongings?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is salvage from the fallen honest work, Kreldig?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What arms have the Reclaimers pulled from Desolace, Kreldig?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What do the scorpids drag back to their holes, Kreldig?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Does nothing you dig up here trouble you, Kreldig?", next = "xdruid", when = { class = "DRUID" } },
        { text = "I'll help.", next = "END", fx = { affinity = 1 } },
      },
    },
    reclaimers = {
      lines = { { id = "r_default", text = "Dwarves with shovels an' a head fer business. Somethin' lost is somethin' found, if ye're stubborn enough, an' we're very stubborn." } },
      choices = {
        { text = "Is it profitable?", next = "reclaimers_profit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    reclaimers_profit = {
      lines = { { id = "rp_default", text = "Some years. Other years we're very rich in kettles." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    karnitol = {
      lines = { { id = "k_default", text = "Rocks, weather, or somebody wantin' her cargo more than her crew did. The sea doesnae say, an' neither does what's left aboard, but it's worth askin'." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    league = {
      lines = { { id = "l_default", text = "Fine! They want the past, an' we want what still works. If they find a ruin, we'll take the hinges, an' everybody's happy, mostly." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } } },
    },
    salvage = {
      lines = { { id = "sv_default", text = "Do ye now? Then ye'll know a cracked casing's still good fer parts, an' a good casing's never good fer long. Reclaimers could use ye." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "We Reclaimers poke our noses intae everythin', so I know a bit o' all of it. Ask away." },
    },
    background = { { id = "tp_ba", text = "Ironforge lad, Reclaimer by trade, salvager by nature. Never met a broken thing I didnae want tae look inside." } },
    advice = { { id = "tp_ad", text = "Never throw anythin' away in Desolace. Ye'll need it a week later, an' there's no shop for a hundred miles." } },
    explorers_league = { { id = "tp_league", text = "The League digs fer history, an' we dig fer things that still work. Friendly rivals, ye might say." } },
    _none = { { id = "tp_none", text = "Never salvaged one o' those. Ask the Captain." } },
  },
}

P:NPC {
  key = "anton", id = TODO_NPC("Brother Anton"), name = "Brother Anton",
  bible = "bibles/desolace.md", role = "priest", tier = "quest",
  communities = { "nijels_point" }, temper = { "zealous" }, values = { "devout", "brave" },
  notices = { "class", "race" },

  impression = {
    first = "Brother Anton is earnest, brave and wholly certain of the Scarlet Crusade. He looked at me as a recruit he hadn't signed up yet.",
    third = "{name} met Brother Anton, an emissary of the Scarlet Crusade who seeks the faithful at Nijel's Point.",
  },

  greetings = {
    { id = "g_light", text = "The Light be with you, friend. Have you come to take up the Crusade's cause? There's work for the faithful here." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = { "PALADIN", "PRIEST" } },
      text = "A servant of the Light! Then you'll want to see the Valley of Bones. The dead walk there, and the Crusade means to stop them." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Obedience, courage and a heart that will not hesitate when the dead wear the faces of people you knew. Brother Crowley says hesitation has cost more lives in Lordaeron than any plague, and I've no reason to doubt him." } },
      choices = {
        { text = "Obedience and courage, then. I'd stand against the Scourge.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I don't follow orders blindly, not even the Crusade's.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Follow the silence, the brothers say, because no bird sings where the dead walk and no fox will den near a plague pit. The Valley of Bones down there is just as quiet, and I've asked more than once who is stirring the dead in it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} will know them before you do. A beast's hackles rise at the dead long before any of us can smell the rot." },
      },
      choices = {
        { text = "Then I'll hunt the dead wherever they walk.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I hunt beasts, Brother. Your crusade isn't my trail.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warlock_an = {
      big = true,
      lines = {
        { id = "wan_default", text = "Take one? Friend, the Crusade would take one to the pyre, and I'd have to stand by and watch it done. Put that craft away while you're near me, and pray to the Light that it isn't too late for you." },
      },
      choices = {
        { text = "I fight the undead too, with what I have.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Maybe it isn't too late. Pray for me.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Eyes in the dark, mostly, because the Scourge hide in ruins and cellars where an honest soldier makes far too much noise. Brother Crowley values those who can find the plague's servants before they find us, and he asks few questions about where they learned it." } },
      choices = {
        { text = "I'd hunt the Scourge for you, but I keep my own counsel.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "If the cause is just, I'd serve the Crusade gladly.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Perhaps something else, Brother.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The Crusade trusts any arm that strikes at the undead, and fire purifies better than steel ever could. Some of the brothers say that magic opened the door to the plague, but I say the Lich King would have come no matter what Dalaran did." } },
      choices = {
        { text = "The Crusade's zeal frightens me more than the Scourge.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Fire against the Scourge is a fine use for my craft.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else, Brother.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The Crusade welcomes anyone who will put the dead back in their graves, friend. I'll be honest, though: there are brothers in Lordaeron who would call your moon goddess a heresy, and I pray you never have to meet them." } },
      choices = {
        { text = "Then I'll fight the Scourge, but never under your banner.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "The dead are a common enemy. I'll stand with you.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior! The Crusade has a place for a strong arm and a sound heart, and the Scourge have never once been turned back by anything softer." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter. The Crusade could use someone who reads tracks, because the Scourge leave a trail of their own, if you know where to look." },
        { id = "h_default", key = true,
          text = "Brother Anton, an emissary of the Scarlet Crusade. We fight the undead wherever they rise. Brother Crowley in Stormwind sends me the willing." },
        { id = "h_path", tags = { "news" }, when = { questActive = TODO_QUEST("Down the Scarlet Path") },
          text = "The Valley of Bones, to the south, where the dead walk. Destroy them, and the Crusade will welcome you." },
        { id = "h_crowley", when = { questActive = TODO_QUEST("Brother Anton") },
          text = "Brother Crowley sent you! Good, then you're ready to prove yourself to the Crusade." },
        { id = "h_letter", tags = { "news" }, when = { questDone = TODO_QUEST("Down the Scarlet Path"), ["not"] = { questDone = TODO_QUEST("In the Name of the Light") } },
          text = "You've proven yourself in the valley, but the true fight is in Lordaeron. Take my letter to Raleigh the Devout, in Southshore; he'll see you to the Monastery." },
        { id = "h_resolved", key = true, when = { thread = { id = "scarlet_path", state = "resolved" } },
          text = "I've been praying on what you told me about Raleigh, and I haven't finished. I'm starting to think I'm not meant to." },
        { id = "h_soured", when = { thread = { id = "scarlet_path", state = "soured" } },
          text = "Raleigh sends his blessing, you said. I think of it every night when the valley goes quiet, and it helps." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You move like someone who has slipped through a few doors, friend. The Crusade has use for such skills, though we'd ask you to use them only against the Scourge." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage, and still among the living, praise the Light. Dalaran's fall cost us so many of your kind, and the Crusade would welcome your fire against the Scourge." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid of the night elves. You don't kneel to the Light, I know, but the Scourge hate every living thing alike, and that makes us allies whether you like it or not." },
      },
      again = { { id = "h_again", text = "Yes, friend? The Light hears every question." } },
      choices = {
        { text = "I've heard troubling things about the Crusade.", next = "troubling" },
        { text = "What's in the Valley of Bones?", next = "valley" },
        { text = "Who is Brother Crowley?", next = "crowley" },
        { text = "Pray with me, Brother.", next = "pray", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "Raleigh read your letter, Brother.", next = "raleigh",
          when = { thread = { id = "scarlet_path", beat = "b3_raleigh", state = { "stirring", "unfolding" } } } },
        { text = "Does the Crusade truly welcome those who don't follow the Light?", next = "xdruid", when = { class = "DRUID" } },
        { text = "I'll go to the valley.", next = "END", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Would the Crusade take a warlock, Brother?", next = "warlock_an", when = { class = "WARLOCK" } },
        { text = "What would the Crusade want with someone like me, Brother?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Does the Crusade trust mages after Dalaran, Brother?", next = "xmage", when = { class = "MAGE" } },
        { text = "What does the Crusade ask of its warriors, Brother?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "How would a hunter track the Scourge, Brother?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I won't fight for the Crusade, Brother.", next = "END", fx = { align = { order = -1 } } },
      },
    },
    troubling = {
      big = true,
      lines = {
        { id = "t_default", text = "Rumors. There are always rumors about anyone who fights hard, but the Crusade's cause is just; I'm sure of it. I've been in Desolace a long while, I admit." },
      },
      choices = {
        { text = "Maybe you should go back and see.", next = "troubling_go", fx = { affinity = -1, trait = { skeptical = 1 } } },
        { text = "I'm sure you're right.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    troubling_go = {
      lines = { { id = "tg_default", text = "And leave the valley to the dead? No. If the Crusade has lost its way, it'll need men who kept to the path, and I'll be one. Ask me something else." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    valley = {
      lines = { { id = "v_default", text = "Bones, more than you can count, and things that won't stay down. The Crusade's sworn to put them down, every one. It's honest work, whatever else you've heard." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    crowley = {
      lines = { { id = "c_default", text = "Our brother in Stormwind. He finds the brave and sends them to me, and I've never met a better judge of courage." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    raleigh = {
      big = true,
      lines = { { id = "r_default", text = "Raleigh! How is he? He hasn't written since I came west. Did he take you north, to the Monastery?" } },
      choices = {
        { text = "He left the Crusade. He told me why.", next = "raleigh_truth" },
        { text = "He's well. He sends his blessing.", next = "raleigh_lie",
          fx = { thread = { id = "scarlet_path", state = "soured" }, trait = { kind = 1 } } },
      },
    },
    raleigh_truth = {
      lines = { { id = "rt_default", text = "Left? Raleigh? He was the most devout of us. What could make a man like that walk away?" } },
      choices = {
        { text = "I've been to the Monastery. He was right.", next = "raleigh_told", when = { questDone = TODO_QUEST("In the Name of the Light") },
          fx = { thread = { id = "scarlet_path", state = "resolved" }, align = { honor = 1, light = 1 } } },
        { text = "They torture innocents and call them plagued.", next = "raleigh_told",
          fx = { thread = { id = "scarlet_path", state = "resolved" }, align = { honor = 1 } } },
        { text = "I shouldn't have said anything.", next = "raleigh_lie",
          fx = { thread = { id = "scarlet_path", state = "soured" }, trait = { cautious = 1 } } },
      },
    },
    raleigh_told = {
      lines = {
        { id = "rto_default", key = true, text = "I told you the rumors were only rumors. I've been saying it a long time, out here where it was easy. Pray with me; I don't know yet what for." },
      },
      choices = {
        { text = "I'll pray with you.", next = "BACK", fx = { affinity = 3, align = { light = 2 }, trait = { pious = 1 } } },
        { text = "Take off the tabard, Brother.", next = "BACK", fx = { affinity = -1, align = { honor = 1 }, trait = { stern = 1 } } },
      },
    },
    raleigh_lie = {
      lines = { { id = "rl_default", text = "Good, good, I knew he would be. Go with the Light, then; the valley won't empty itself." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pray = {
      lines = { { id = "p_default", text = "Gladly. Out here, prayer's the only thing that isn't covered in dust. For the fallen, then, and for the Crusade's good name." } },
      choices = {
        { text = "For the fallen.", next = "BACK", fx = { affinity = 2, align = { light = 2 } } },
        { text = "For the Crusade's good name.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The Light has shown me a good deal out here, friend, and I'm glad to share it. Ask." },
    },
    background = { { id = "tp_ba", text = "A brother of the Light who took up the Crusade's cause. I came west to hold back the dead where I'm sent.", next = "troubling" } },
    advice = { { id = "tp_ad", text = "Bless your blade before the Valley of Bones. The dead there don't stay down for steel alone." } },
    scarlet_crusade = { { id = "tp_crusade", text = "Brave men and women, fighting the plague where no one else will. Whatever you've heard, that's the heart of it." } },
    _none = { { id = "tp_none", text = "I couldn't say, but pray on it." } },
  },
}

P:NPC {
  key = "lyshaerya", id = TODO_NPC("Innkeeper Lyshaerya"), name = "Innkeeper Lyshaerya",
  bible = "bibles/desolace.md", role = "innkeeper", tier = "service",
  communities = { "nijels_point" }, temper = { "calm" }, values = { "kind" },
  notices = { "weary" },

  impression = {
    first = "Innkeeper Lyshaerya sweeps the Desolace dust while she talks and has given up winning against it. Her calm is the kind people come a long way to sit beside.",
    third = "{name} met Innkeeper Lyshaerya, who keeps the only warm hearth at Nijel's Point.",
  },

  greetings = {
    { id = "g_inn", text = "Rest here. There's little enough comfort in Desolace; take what this roof can give." },
    { id = "g_home", when = { homeInn = { "Nijel's Point" } }, text = "You've come back to the Point. Your bed's made, though the dust got in anyway." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You've walked back from the spirit healer across a dead land. Sit; nothing here will ask anything of you for an hour." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Most who go down into Desolace stop here first, and the warriors sleep soundest, because they've stopped worrying about what they can't fight. It's the ones who come back up that I watch, because the centaur and the Burning Blade leave marks you can't see." } },
      choices = {
        { text = "I'll rest while I can. The fight will wait.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I don't rest before a fight. Sleep comes after.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Thunder lizards on the open plain, scorpids in the sand and the hyenas that trail the old kodos toward the Graveyard. The hunters who stay here say the hyenas are the worst, because they never fight fair and they never give up." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "{pet} can lie by the fire with the others, if it doesn't mind the dust. There's no keeping it out of anything here, so the beasts and I have made our peace with it." },
      },
      choices = {
        { text = "I'll hunt the hyenas and leave the old kodos in peace.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll hunt whatever pays, kodo or not.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "I'd like to think so, though I've swept this floor every morning and the dust never seems to mind. Keeper Marandis says the sickness rises from deep under Maraudon, and if he's right, no broom of mine will help." } },
      choices = {
        { text = "It will heal. Every wasteland was green once.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Some places are meant to die. Let it go.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Everyone passes through eventually, because there is no other roof between Stonetalon and Feralas. I've fed Reclaimers, Crusaders, Sentinels and a few who gave three names in one night, and I've found that a full plate keeps most of them honest while they're under mine." } },
      choices = {
        { text = "Then I'll be honest under your roof, at least.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Three names is careful, not shady. Desolace is a hard road.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Twice, on the worst storm nights, when the wind came up from the Kodo Graveyard and filled the chimney with grit. I sat everyone round a single lamp and told stories until morning, and I'd rather that than any spell, though I'm glad to see a mage all the same." } },
      choices = {
        { text = "A good story warms better than any fire I could conjure.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Next storm, let a mage keep the hearth lit. Power is for using.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Grief, mostly, and the kind of silence that follows a person to bed. Some have lost companions to the centaur and some have only stared too long at the bones in the Kodo Graveyard, but they all sit closer to the fire than they need to." } },
      choices = {
        { text = "Then I'll sit with them tonight. No one should carry that alone.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Grief passes. They need rest and a hot meal, not sermons.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Most come back thinner and quieter, and some don't come back at all. The soldiers lose friends to the Kolkar and the Magram, and Brother Anton tells them the Light is with them, though I've noticed he never sits by the fire long enough to hear what they say back." } },
      choices = {
        { text = "I'll sit by the fire with them, then, and listen.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Soldiers need orders and steel, not someone to talk to.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Vahlarriel came up from Thunder Axe Fortress with stories that kept the whole Point awake for a week, and Dalinda Malem was taken by the same cult. A warlock walking in here reminds them of all that, however polite you are about it." } },
      choices = {
        { text = "I'll keep my demon out of sight, for their sake.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "They'll have to get used to me. I've earned my place.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior, and dusty to the knees, like everyone who climbs up from below. Leave your boots by the door, and the floor and I will both thank you." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter. The game is poor down in Desolace, but what's left is hard and hungry, and I'd ask you to come back to this hearth before you're as thin as it is." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest of the Light, here at the edge of the dust. Sit by the hearth a while, because the people who come up from Desolace often carry more than dust home with them, and I think you would know what to say to them." },
        { id = "h_default", key = true,
          text = "Innkeeper Lyshaerya. I keep the only warm hearth between Stonetalon and Feralas, and travelers find their way to it eventually." },
        { id = "h_dust", when = { metBefore = true }, text = "Desolace dust gets into everything: the bread, the beds, my hair. I've stopped fighting it, and now I just sweep while I talk." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The centaur drums carry a long way at night. You stop hearing them after a week, though I haven't stopped yet." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, come down to Desolace. Most of your kind take one look at the dust and go straight back to Feralas, and I can't say I blame them." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Walk as softly as you like, but my floorboards have learned every trick, and they'll tell me if you come down for a midnight snack. Sit, and I'll bring you something honestly." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Could you warm the hearth a little? I'm only joking, though the dust does make the fire sulk, and I'd not say no." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin of the Silver Hand, at the edge of Desolace. Sit, and let me feed you before you go down, because I've seen what that dust does to armour, and to the people inside it." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. You're welcome at my hearth like anyone else, but leave your companion outside, please, because the soldiers here have seen what the Burning Blade do with theirs." },
      },
      again = { { id = "h_again", text = "Something else? I'll keep sweeping." } },
      choices = {
        { text = "Can this land ever heal, Lyshaerya?", next = "druid_q", when = { class = "DRUID" } },
        { text = "I'd like a room.", next = "BUSINESS" },
        { text = "What do the drums mean?", next = "drums" },
        { text = "Why keep an inn in Desolace?", next = "why" },
        { text = "Do many shady folk pass through your inn, Lyshaerya?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Has the dust ever beaten your hearth, Lyshaerya?", next = "xmage", when = { class = "MAGE" } },
        { text = "What do travelers bring back up from Desolace?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do many warriors rest here before going down, Lyshaerya?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What beasts still live down in Desolace, Lyshaerya?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What becomes of the folk who go down there, Lyshaerya?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why do the soldiers fear warlocks so much, Lyshaerya?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Just a room, thank you.", next = "END" },
      },
    },
    drums = {
      lines = { { id = "d_default", text = "One clan telling another it's still there. Louder means angrier, and tonight is loud." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "w_default", text = "Because a hearth matters most where there's nothing else. Anyone can keep an inn in Darnassus." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Travelers bring news from both ends of the valley to this hearth. Ask, and I'll tell you what I've heard." },
    },
    background = { { id = "tp_ba", text = "A hearth, a broom, and travellers who need both. I don't need more of a story than that." } },
    advice = { { id = "tp_ad", text = "Shake out your boots every morning. Desolace has scorpions, and scorpions like boots." } },
    _none = { { id = "tp_none", text = "I keep the hearth; ask the Captain for news." } },
  },
}

-- Ghost Walker Post: the Horde's camp in Desolace.
P:NPC {
  key = "takata", id = TODO_NPC("Takata Steelblade"), name = "Takata Steelblade",
  bible = "bibles/desolace.md", role = "soldier", tier = "major",
  communities = { "ghost_walker" }, temper = { "hard" }, values = { "loyal", "stern" },
  notices = { "class", "kit" },

  impression = {
    first = "Takata Steelblade hunts the Burning Blade and every satyr who shelters them, and nothing about him invites small talk. He measures people by whether they will fight.",
    third = "{name} met Takata Steelblade, the hard-bitten orc who hunts the Burning Blade from Ghost Walker Post.",
  },

  greetings = {
    { id = "g_post", text = "You're in Desolace now, and the demons' servants are thick here. Are you here to fight them?" },
  },

  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock. I've killed a great many who walked your road too far, so don't make me add you to the count." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Satyr claws, by the look of it. They fight dirty, so learn to fight dirtier." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I'd take anyone who fights. The cultists in Thunder Axe Fortress call on demons, and if your Light burns them, then I don't care whose corpse it lives in." } },
      choices = {
        { text = "I'll face them openly and burn them with the Light.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll take them from behind before they summon anything.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They take the satyrs' paths and the satyrs' caves, and the satyrs take their coin and their demons in return. Follow the hoofprints into the hills and you'll find robed orcs where you expected beasts, and that's where I want arrows." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep {pet} downwind of the camps. Satyrs smell beasts better than they smell men, and one warning growl costs us the whole ambush." },
      },
      choices = {
        { text = "I'll hunt the cultists, but satyrs who keep away can live.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Every satyr dies. They chose their company.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shaman_tk = {
      lines = {
        { id = "stk_default", text = "Sick, yes, and the Burning Blade made them so, the same way the demons sickened our blood. Thrall's shamans are the only ones I've seen make a fel-touched place breathe again, so if you can, do it while I kill what's poisoning it." },
        { id = "stk_thrall", when = { origin = "orc_thrall_shaman" },
          text = "You learned at Thrall's side, I hear it in how you speak of them. Then you know what this land feels like; it's the same thing we felt in the camps, when the bloodlust left us." },
      },
      choices = {
        { text = "Heal first. Killing won't clean the land.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Kill first. The spirits can wait for quiet.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
      },
    },
    warrior_tk = {
      lines = {
        { id = "wtk_default", text = "Good, and don't stop to talk to them, because the Blade hides among the satyrs and the satyrs lie for sport. Thunder Axe Fortress is full of them, and every one you leave alive tells the next one you're coming." },
        { id = "wtk_grunt", when = { origin = "orc_razor_hill_grunt" },
          text = "Razor Hill sends its grunts a long way these days. The Blade was in Durotar too, you'll remember, in the Skull Rock caves; this is the same rot, only older." },
      },
      choices = {
        { text = "None of them will walk away.", next = "BACK", fx = { align = { honor = 1 }, trait = { stern = 1 } } },
        { text = "I'll leave one alive, to follow home.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Everywhere they camp, the ground goes black and the water turns bitter. The Burning Blade feeds them and they feed the rot, and I don't care which came first." } },
      choices = {
        { text = "Strike the satyrs, but spare the land your fire.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Burn their camps and everything around them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Quietly, from the inside, until they no longer trust their own brothers. Their cultists in Thunder Axe sleep beside the demons they serve, and a cultist who wakes up next to a dead brother starts wondering which of them sold the other." } },
      choices = {
        { text = "I'll make them doubt each other. That's how cults fall.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll kill them face to face. Even cultists deserve that.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They fear what they remember, and orcs once filled the sky with fel fire before Thrall freed us of it. Burn the satyrs of Sargeron with clean flame and let the tauren see the difference with their own eyes, because that will do more than any talking." } },
      choices = {
        { text = "My magic answers to me alone. Let them think what they like.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll fight where the tauren can see me. Trust is earned.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "They rot from the edges inward, and no poultice we brought from Orgrimmar slows it. Maurin says it's fel, and he would know, so I need healers who will close a wound first and ask whose fault it was afterward." } },
      choices = {
        { text = "I'll heal anyone who bleeds for the Horde here.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll heal those who pull their weight. The careless can wait.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter. Can you track a satyr through broken ground, or only deer through grass? I need the first." },
        { id = "h_default", key = true,
          text = "Takata Steelblade. Keldran sent me from Orgrimmar to hunt the Burning Blade here. They hide among the satyrs, so the satyrs die too." },
        { id = "h_satyr", tags = { "news" }, when = { questActive = TODO_QUEST("Befouled by Satyr") },
          text = "The satyrs foul everything they touch, so thin them. The Blade loses its friends one horn at a time." },
        { id = "h_corrupter", when = { questActive = TODO_QUEST("The Corrupter") },
          text = "I saw what that demon lord's shadow did to Maurin, and it was only a shadow. Find Lord Azrethoc and his warlock servant at the Mannoroc Coven, and end them both." },
        { id = "h_relations", when = { questActive = TODO_QUEST("Alliance Relations") },
          text = "So Keldran sent you with news from Orgrimmar, good. Maurin Bonesplitter handles the Blade's warlocks for us, so speak to him, and he'll tell you his designs." },
        { id = "h_corrupter_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Corrupter"), days = 3 } },
          text = "Azrethoc is dead, and the Blade has lost its newest master. For the first time since I came here, I think we may one day call some place safe again." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid. You'll feel the satyrs' rot in the soil long before you see their horns, and that's reason enough to help me thin them." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. Good, because the Burning Blade fear knives in the dark more than axes in daylight, and I want them afraid." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage of the Horde. Your fire is not fel, so I have no quarrel with it, but do not let anyone at Ghost Walker Post mistake you for the Blade." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. The warriors here take wounds from satyr claws that fester, and I'll take any healer who can stand the smell of Desolace." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Burning Blade", min = 30 } }, text = "The Blade's cultists are fewer at Thunder Axe this week, and I hear it was your doing. Keep at it, because a cult this size breaks once enough of its knees do." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. The Burning Blade bow to demons, and I hear demons hate the Light, so come and prove it." },
      },
      again = {
        { id = "h_again", text = "Something else? Say it and be done." },
        { id = "h_again2", text = "Speak. The satyrs won't wait while we talk, so neither will I for long." },
      },
      choices = {
        { text = "Do the satyrs poison the land, Takata?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Who are the Burning Blade?", next = "blade" },
        { text = "Why kill every satyr?", next = "satyrs" },
        { text = "Why does Orgrimmar worry about the Alliance?", next = "relations" },
        { text = "Do you miss home?", next = "home" },
        { text = "What did the demon lord do to Maurin?", next = "corrupter", when = { any = { { questActive = TODO_QUEST("The Corrupter") }, { questDone = TODO_QUEST("The Corrupter") } } } },
        { text = "Not every warlock is the Blade.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "Maurin is Forsaken, like me. Do you trust him?", next = "forsaken", when = { race = "Scourge" } },
        { text = "I'm an orc mage, not a warlock.", next = "orc_mage", when = { race = "Orc", class = "MAGE" } },
        { text = "The spirits here are sick with demon taint.", next = "shaman_tk", when = { class = "SHAMAN" } },
        { text = "Give me a satyr camp. I'll clear it.", next = "warrior_tk", when = { class = "WARRIOR" } },
        { text = "How do you want the Blade hunted, Takata?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do the tauren here fear mages, Takata?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "How do the Burning Blade hide among the satyrs, Takata?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What do the satyrs' wounds do to your warriors, Takata?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Would you take a paladin against the Burning Blade, Takata?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll hunt with you.", next = "END", fx = { affinity = 2, learn = { "burning_blade" } } },
      },
    },

    blade = {
      big = true,
      lines = {
        { id = "b_default", text = "Members of the Horde who gave their loyalty to the demons and kept practicing their dark magic. They care nothing for the Warchief's vision of our future in Kalimdor, and that is the threat Thrall most wants dealt with." },
      },
      choices = {
        { text = "Who hunts them with you?", next = "blade_maurin" },
        { text = "Something else.", next = "BACK", fx = { learn = { "burning_blade" } } },
      },
    },
    blade_maurin = {
      lines = {
        { id = "bm_default", text = "Maurin Bonesplitter, a Forsaken whom Keldran sent because he knows the Blade and their warlock ways. He plots against them, and I deal with every other demonic thing in Desolace, and it does not please me to need a warlock's help, but I do my duty." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "burning_blade" } } } },
    },

    satyrs = {
      lines = {
        { id = "s_default", text = "The Hatefury satyrs to the northeast have ties to the Blade, and the Warchief would have them slain. A satyr is what a night elf becomes when the demons are finished with him, and I don't leave those standing." },
      },
      choices = {
        { text = "How does a demon get a foothold?", next = "satyrs_pain" },
        { text = "Something else.", next = "BACK" },
      },
    },
    satyrs_pain = {
      lines = {
        { id = "sp_default", text = "Never without help. A weak spirit, a hunger for power, a thirst for revenge or even for justice, and when we're in pain, evil comes and offers to ease it." },
      },
      choices = {
        { text = "You sound like you've seen it happen.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Then I'll guard my spirit.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Power is power, whoever offers it.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },

    relations = {
      lines = {
        { id = "r_default", text = "As the Alliance pushes deeper into Kalimdor, they see the Blade and the satyrs and conclude the Horde has made pacts with the Legion. Keldran won't allow that, and with the Warchief's blessing, neither will I." },
      },
      choices = {
        { text = "Why care what the Alliance thinks?", next = "relations_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    relations_why = {
      lines = {
        { id = "rw_default", text = "Because Thrall wants peace with them, and a war started over a lie is still a war. Even helping the centaur, which this does in its way, is better than that, though I'll not pretend I like it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { opinion = { peace = "for" } } } },
    },

    home = {
      lines = {
        { id = "h2_default", text = "I hoped the Warchief would let us go home before the seasons turned. Every new demon that crawls up out of this land pushes that hope a little further off, and some days I wish it were only the centaur we had to fight." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },

    corrupter = {
      lines = {
        { id = "c_default", text = "An apparition of a demon lord called Azrethoc came against him, and even as a shadow it had more power than my warlock companion. I wonder if Maurin is equal to the task, though I'd never say so to his face." },
      },
      choices = {
        { text = "Why not fight it yourself?", next = "corrupter_honor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    corrupter_honor = {
      lines = {
        { id = "ch_default", text = "It would serve the Warchief better if I went, and my blade itches for it. But I hold this post, and I would disgrace my clan if I left it to chase glory for my own honor, so I'll trust you to gather a party in my place." },
      },
      choices = {
        { text = "I'll do it.", next = "BACK", fx = { affinity = 3, align = { honor = 1 } } },
        { text = "Glory's worth more than a post, and I'd have gone myself.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },

    warlock = {
      lines = {
        { id = "w_default", text = "Maybe not, and Maurin is proof of it, but every one of the Blade said the same thing once. Show me with deeds, and I'll stop counting you." },
      },
      choices = {
        { text = "Then watch me.", next = "BACK", fx = { affinity = 1, trait = { proud = 1 } } },
        { text = "Fair enough.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    forsaken = {
      lines = {
        { id = "fo_default", text = "I trust that he hates the Blade as much as I do, and I trust his knowledge of them. What he does with the rest of his studies is his business, as long as it isn't done near my post." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    orc_mage = {
      lines = {
        { id = "om_default", text = "From across a battlefield, I can't tell your fire from theirs, and neither can the Alliance. Keep your magic clean and your loyalty plain, and we'll have no quarrel." },
      },
      choices = {
        { text = "Understood.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My magic's my own business, and I'll use it how I like.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I know what my hunt has taught me. Ask, and I'll answer if it serves the Horde." },
    },
    burning_blade = { { id = "tp_blade", text = "Orcs who still kneel to the old fire. In Durotar they hide in caves and here they hide behind satyrs, but I find them either way.", next = "blade" } },
    background = { { id = "tp_ba", text = "A soldier sent by Keldran to clear demons out of Desolace. I'll tell you more about myself when the job is done, which means not soon." } },
    advice = { { id = "tp_ad", text = "Hit a satyr before it speaks. Whatever it says, you'll wish you hadn't heard it." } },
    _none = { { id = "tp_none", text = "Not my hunt." } },
  },
}

P:NPC {
  key = "nataka", id = TODO_NPC("Nataka Longhorn"), name = "Nataka Longhorn",
  bible = "bibles/desolace.md", role = "questgiver", tier = "quest",
  communities = { "ghost_walker" }, temper = { "easygoing" }, values = { "patient", "practical" },
  notices = { "craft", "race" },

  impression = {
    first = "Nataka Longhorn has grown fond of Desolace and asked me not to tell anyone. He's the most unhurried soul I've met out here, and a fisherman at heart.",
    third = "{name} met Nataka Longhorn of Thunder Bluff, an easygoing tauren posted at Ghost Walker Post.",
  },

  greetings = {
    { id = "g_post", text = "Desolace isn't such a bad place, once you stop expecting it to grow anything. Sit down." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Are the centaur still out there? They always are." },
  },

  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "You fish, out here? Good, because there's a catch off the coast I'd like to see before I'm too old to eat it." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of the herd, in this grey place. It does me good to see horns that aren't centaur bows." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Much the same as I make of Desolace: strange, harder than it looks, and somehow still worth caring about. The Earth Mother does not explain herself, and I suspect the Light doesn't either, so I'll not ask you to." } },
      choices = {
        { text = "The Light gave me back. That's a gift, not a curse.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The Light gave me a weapon, Nataka, nothing more.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Some do, if they stay long enough to stop listening for centaur hooves. I fought the Kolkar when I first came to Desolace, and now I fish, and I'm not sure which of the two takes more patience." } },
      choices = {
        { text = "Patience is a warrior's strength too. I'll sit awhile.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A warrior who sits too long goes soft.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The thunder lizards on the plains, if you have the stomach for it, and the kodo herds if you have the patience. My people don't hunt the old kodos that walk toward the Graveyard, though, and I'd ask the same of you." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "{pet} has the look of a beast that knows the land it's walking on. That's more than I can say for most hunters who come through Shadowprey." },
      },
      choices = {
        { text = "The old kodos walk in peace. I'll leave them be.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A kodo is meat. Old or young, I hunt what's there.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunter_nt = {
      lines = {
        { id = "hnt_default", text = "Then you'll weep at the kodo graveyard, as I did. The old kodo come all the way out here to die, and the centaur pick at their bones, and I've never once heard a good reason why they walk so far." },
        { id = "hnt_run", when = { origin = "tauren_plains_runner" },
          text = "A plains runner! You'll find no grass to run in here, cousin, only sand and bones. Your legs will hate it for a week, and then you'll love it like I do." },
      },
      choices = {
        { text = "They come home to the earth. That's reason enough.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else, Nataka.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Because it fights, I think. The centaur fight, the land fights, even the fish fight harder here than anywhere in Mulgore, and there's something to love in a place that won't lie down." } },
      choices = {
        { text = "Then help it fight. The Earth Mother hasn't left it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "It's a dying land. Fondness won't save it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The water off Shadowprey is clean and cold and full of fish that have learned to be patient, and I've learned to be more patient than they are. You might try your fire on the centaurs if you need to burn something, because the sea has done nothing to deserve it." } },
      choices = {
        { text = "Patience is its own magic. I'll sit with you a while.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A frost bolt into the shallows would fill your net faster.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Ground where nothing grows, and kodos that will not walk past the fortress walls even when I lead them by the horn. My elders say the land remembers wounds, and Desolace has more of them than any place I know, so I ask you to add no new ones." } },
      choices = {
        { text = "The fel is a tool. I don't answer to the Legion.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll leave the land as I found it. You have my word.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else, Nataka.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior. Sit, if you like, and set that weapon down for a while, because the fish don't bite for anyone who looks ready to fight." },
        { id = "h_huntcl", when = { class = "HUNTER", race = { "Orc", "Troll" }, faction = "Horde" },
          text = "A hunter of the Horde. Mind the shore when you hunt near Shadowprey, because the surf is rougher than it looks and the things in it don't care what you came for." },
        { id = "h_default", key = true,
          text = "Nataka Longhorn, of Thunder Bluff. The centaur harass us, the land gives nothing, and still I've grown fond of it. Don't tell anyone." },
        { id = "h_family", tags = { "news" }, when = { questActive = TODO_QUEST("Family Tree") },
          text = "A letter, from my brother at Freewind? I'd given up waiting. Let me sit down before I read it." },
        { id = "h_brother", when = { heardLine = "longhorn.h_default" },
          text = "You've been to Freewind Post? Then you've met my brother. Does he still stand on the edge of the mesa like he's holding it up?" },
        { id = "h_catch", when = { questActive = TODO_QUEST("Catch of the Day") },
          text = "There's a fish off this coast worth the trouble. Bring me one, and we'll both eat better than Desolace deserves." },
        { id = "h_catch_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Catch of the Day"), days = 2 } },
          text = "My hoof still tingles from that Bloodbelly fish, and the whole post smelled of frying for an evening. That's the best thing to happen here all season." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, here at Shadowprey? Sit down, sit down. The sea is the only thing in Desolace that hasn't given up, and I suspect you'll like it." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, out here in Desolace? The spirits of this place are tired, so be gentle with them." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, come all the way out to Desolace. The land here could use a prayer, though I think it would be content just to be left alone for a while." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "You came up so quietly the fish didn't even notice, which is more than I can manage. Sit, if you like, and tell me what you're really doing in Desolace." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage, out here with the fishermen. If you could conjure a fish that bites, I'd call it the greatest magic I've ever seen." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. You'll forgive me if I keep my line between us, because I've seen what the Burning Blade leave behind at Thunder Axe, and it doesn't sit well with me." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken who carries the Light. The Earth Mother sends us all kinds of surprises, and I think you might be the strangest one I've seen in Desolace." },
      },
      again = {
        { id = "h_again", text = "Something else? Sit; nothing out here is in a hurry except the centaur." },
      },
      choices = {
        { text = "Why have you grown fond of Desolace, Nataka?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What's to like about Desolace?", next = "fond" },
        { text = "Tell me about your brother.", next = "brother" },
        { text = "What's this about a fish?", next = "fish" },
        { text = "Which centaur are giving you trouble?", next = "centaur" },
        { text = "It's good to see another tauren out here.", next = "tauren", when = { race = "Tauren" } },
        { text = "I fish. What should I know about these waters?", next = "fisher", when = { profession = "Fishing" } },
        { text = "I met your brother. He seemed well.", next = "brother_met", when = { heardLine = "longhorn.h_default" } },
        { text = "I've run the plains with my kodo since I was a calf.", next = "hunter_nt", when = { race = "Tauren", class = "HUNTER" } },
        { text = "Why are the spirits of Desolace so tired, Nataka?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What should a spellcaster know about Desolace?", next = "xhcast", when = { class = "PRIEST", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Who should I watch out for in Desolace?", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Is fishing in Desolace really so hard, Nataka?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What have you seen the Burning Blade leave behind, Nataka?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do warriors ever find peace out here, Nataka?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What's worth hunting near Shadowprey, Nataka?", next = "xhuntcl", when = { class = "HUNTER", race = { "Orc", "Troll" }, faction = "Horde" } },
        { text = "What does a tauren make of a Forsaken paladin, Nataka?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll help.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },

    fond = {
      lines = {
        { id = "f_default", text = "The quiet, mostly, when the centaur let us have it, and the sky, which is as wide as Mulgore's. And the graveyard next to the post, where the kodo come to rest, which is a sad place and a holy one." },
      },
      choices = {
        { text = "Tell me about the Kodo Graveyard.", next = "fond_kodo" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fond_kodo = {
      lines = {
        { id = "fk_default", text = "Bones as big as huts, as far as you can see, and at night something of the old beasts walks among them. We leave them be, and they leave us be, and that's the best arrangement in Desolace." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    brother = {
      lines = {
        { id = "b_default", text = "Cliffwatcher Longhorn, at Freewind Post in Thousand Needles. He writes when there's something to worry about, which is why a whole year can go by between letters." },
      },
      choices = {
        { text = "What did he write about this time?", next = "brother_worry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brother_worry = {
      lines = {
        { id = "bw_default", text = "Centaur, stirring around the Needles more than usual, as if I didn't have enough centaur of my own. He always worried more than me, and I always told him he'd go grey early." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    fish = {
      lines = {
        { id = "fi_default", text = "Bloodbelly fish, my favourite, and the trolls at Shadowprey Village are the only ones who know how to catch them. The post hasn't smelled of cooked fish in far too long, and the centaur keep me too busy to go and ask." },
      },
      choices = {
        { text = "Who should I ask at Shadowprey?", next = "fish_jinar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fish_jinar = {
      lines = {
        { id = "fj_default", text = "Jinar'Zillen, their fisherman; follow the road south and then west to the coast. Tell him a hungry tauren sent you, and he'll know exactly which one." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    centaur = {
      lines = {
        { id = "c_default", text = "All of them, one way or another, since the tribes here fight each other as hard as they fight us. The Magram and the Gelkis are the nearest, and they don't much care which of us they're shooting at." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    tauren = {
      lines = {
        { id = "t_default", text = "And for me, to see you. Mulgore feels a long way off from this grey place, but horns and a good laugh bring it a little closer." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    fisher = {
      lines = {
        { id = "fs_default", text = "That the best catch here is the one somebody else already caught. Talk to the trolls at Shadowprey; they've been fishing this coast longer than any of us has been in Desolace." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    brother_met = {
      lines = {
        { id = "bm_default", text = "Good, good; that's all I needed to hear. If you pass through Freewind again, tell him his brother is eating well, even if it isn't quite true yet." },
      },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    xhcast = {
      big = true,
      lines = {
        { id = "xhcast_default", text = "That the land remembers whatever is done to it, and a great deal has been done. The Burning Blade foul the ground near Thunder Axe, and the Kodo Graveyard has a weight to it that no spell could lift, so walk softly and you'll do better than most." },
      },
      choices = {
        { text = "I'll walk softly and leave the land as I found it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The Burning Blade need burning, whatever it costs the ground.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "The Kolkar and the Magram, who'll kill each other or you without much preference. The Burning Blade watch the roads too, and they're cleverer than the centaur, so don't trust an orc on the road just because he's an orc." } },
      choices = {
        { text = "I'll scout their camps and bring the elders word.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the centaur bleed each other. I'll pick the bones.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The Kodo Graveyard is full of ancient bones, the Burning Blade foul the ground around Thunder Axe Fortress, and the centaur clans spill blood over every spring. I fish and I let the land be, because I think it's done enough for one age." } },
      choices = {
        { text = "Then we should help it rest, and heal what we can.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Tired land is still land, and the Horde should take what it gives.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've spent a long time in this dusty land, and I've learned more than I expected to. Ask, and I'll tell you." },
    },
    grimtotem = { { id = "tp_grimtotem", text = "My brother writes about them, when he writes. He worries; he always worried more than me." } },
    background = { { id = "tp_ba", text = "A tauren of Thunder Bluff, posted to Desolace, and the brother of a tauren who worries too much. That's about all of it.", next = "brother" } },
    advice = { { id = "tp_ad", text = "Travel the roads in the daytime here. The centaur ride at night, and a lone traveler on a dark road is the easiest prey there is." } },
    _none = { { id = "tp_none", text = "Couldn't say; Desolace doesn't bring much news." } },
  },
}
