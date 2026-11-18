-- Bloodhoof Village: Cairne's tribe on the plains below the bluffs. Voice: bibles/mulgore.md
local P = RPGDialogueAPI:Pack("rpgd.mulgore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "baine", id = TODO_NPC("Baine Bloodhoof"), name = "Baine Bloodhoof",
  bible = "bibles/mulgore.md", role = "noble", tier = "major",
  communities = { "bloodhoof" }, temper = { "calm" }, values = { "wise", "loyal", "kind" },
  likesTone = "polite",
  notices = { "race", "form" },
  impression = {
    first = "Baine Bloodhoof would rather talk the goblins, gnolls and dwarves down than fight them, and he means it. He walks the village every evening and admits he is still learning a few of its faces.",
    third = "{name} met Baine Bloodhoof, Cairne's son, who keeps Bloodhoof Village and the plains below the bluffs.",
  },

  greetings = {
    { id = "o_dw_shame", when = { gossip = { topic = "dwarves", stance = "shame" } }, text = "Morin Cloudstalker tells me a dwarf apologised to him for Bael'dun, and I believe it was you. That's a word spoken well, friend, and I'll remember it." },
    { id = "g_tent", text = "Be welcome in Bloodhoof Village. My father keeps the bluffs; I keep the plains below them." },
    { id = "g_back", when = { metBefore = true }, text = "Friend, sit with me a moment; the village can spare me, and the grass will grow without my watching it." },
    { id = "g_away", when = { away = 14 }, text = "You've been away from the plains {away}, friend, and the village asked after you more than once. Sit with me a moment and tell me where the road took you." },
    { id = "g_away_long", when = { away = { min = 60, levels = 5 } }, text = "It has been {away} since you walked these plains, and you come back carrying yourself like a seasoned warrior. My father will want to hear of it, and so do I." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The village has been telling me of the help you've given us, and I'm grateful for every bit of it. Bloodhoof does not forget its friends." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I heard that someone here was left angry after speaking with you. I would rather we settled our quarrels with patience, so I hope it can be mended." },
  },

  notice = {
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "One of the Windshapers. My father welcomed your people, and I'll do no less. Ask if you need anything of Mulgore." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc, so far from the red city. Your Warchief helped bring my people here, and we remember that." },
  },

  react = {
    { id = "r_bear", on = "form", when = { form = "bear" }, text = "A bear in my tent, and a polite one. The Earth Mother has a sense of humor." },
  },

  start = "hello",
  nodes = {
    xalt_baine = {
      lines = {
        { id = "xalt_baine_default", text = "Many pass through Bloodhoof on their way to the Barrens, and I try to learn something from each of them. The one you mean listened more than they spoke, which my father says is the best way to learn anything." },
        { id = "xalt_baine_kin", when = { alt = { kin = true } }, text = "{alt} asked me why I'd sooner talk with the goblins digging to the east than burn them out. I didn't have a good answer then and I'm not certain I have one now, but I liked being asked." },
      },
      choices = {
        { text = "Talk first. Most fights never need to happen.", next = "BACK", reply = "My father would say the same, and he's seen more fights than I ever will. I try to live by it, though the Palemane test me every season.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some only listen once they're bleeding, Baine.", next = "BACK", reply = "Some do, I'll grant you, and I've met a few of them. But I'd rather give them the chance to listen before the bleeding, not after.", fx = { align = { light = -1 } } },
        { text = "Something else, Baine.", next = "BACK" },
      },
    },
    op_peace = {
      lines = {
        { id = "opp_q", text = "Lady Proudmoore and the Warchief keep a peace across the water at Theramore, and some of our braves call it weakness. I've my own thoughts, but I'd like yours first: should the Horde keep that peace?" },
      },
      choices = {
        { text = "Yes. A peace kept is worth more than any battle won.", next = "op_peace_r1", fx = { affinity = 2, align = { honor = 1 }, opinion = { peace = "peace" } } },
        { text = "Keep it until the Horde is strong enough to break it.", next = "op_peace_r2", fx = { affinity = -1, align = { honor = -1 }, trait = { practical = 1 }, opinion = { peace = "necessary" } } },
        { text = "The humans penned the orcs in camps. No peace with them.", next = "op_peace_r3", fx = { affinity = -1, trait = { stern = 1 }, opinion = { peace = "war" } }, when = { faction = "Horde" } },
        { text = "Most of the Alliance wants that peace too, Baine.", next = "op_peace_r4", fx = { affinity = 2, opinion = { peace = "peace" } }, when = { faction = "Alliance" } },
        { text = "I'm not wise enough to answer that, Baine.", next = "BACK" },
      },
    },
    op_peace_r1 = {
      lines = {
        { id = "op_peace_r1", text = "My father would say the same, and he'd say it slower. I'm glad to hear it from someone who's walked further than Mulgore." },
      },
      choices = {
        { text = "Something else, Baine.", next = "BACK" },
      },
    },
    op_peace_r2 = {
      lines = {
        { id = "op_peace_r2", text = "A peace kept with one hand on the axe isn't much of a peace, friend. I hope you'll think on that before you say it to my father." },
      },
      choices = {
        { text = "Something else, Baine.", next = "BACK" },
      },
    },
    op_peace_r3 = {
      lines = {
        { id = "op_peace_r3", text = "I've heard Mull say the same, and I understand the anger in it. But the humans of Theramore aren't the ones who built those camps." },
      },
      choices = {
        { text = "Something else, Baine.", next = "BACK" },
      },
    },
    op_peace_r4 = {
      lines = {
        { id = "op_peace_r4", text = "Then I'm glad you came to Bloodhoof to tell me so, because it's a thing my braves need to hear more often than they do." },
      },
      choices = {
        { text = "Something else, Baine.", next = "BACK" },
      },
    },
    xcl_rfk = {
      big = true,
      lines = { { id = "xcl_rfk_default", text = "Then you've seen that the quilboar are not only raiders, whatever the young braves say. They have a holy place and elders and a crone who speaks for them, which means there is someone who could be spoken to, if she weren't so set on war. I'd rather have had a word with Charlga than a fight, though I know she'd never have allowed it." } },
      choices = {
        { text = "There's always someone to speak with, Baine. You're right to try.", next = "BACK", reply = "Thank you, that means more to me than you'd think. I'll keep sending runners, then, whatever answer they bring back.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Talk wouldn't have stopped her, Baine. Only steel would.", next = "BACK", reply = "Maybe not, and I'll not pretend I know her heart. Still, I'd rather have tried and failed than never tried at all.", fx = { align = { honor = -1 } } },
        { text = "Your father must have tried to make peace with them.", next = "xcl_rfk2" },
      },
    },
    xcl_rfk2 = {
      lines = { { id = "xcl_rfk2_default", text = "He tried, when the tribes first came to Mulgore, and the Razormane answered with spears. My father says a hand offered once and refused is still a hand worth offering, so I keep offering mine, and someday one of them may take it." } },
      choices = { { text = "I hope one of them does, Baine.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Every honest strength has a place here. The tauren never needed the Light, but I would rather talk the gnolls and the goblins down than fight them, and I suspect a paladin knows something about choosing mercy when a hammer would be easier." } },
      choices = {
        { text = "Mercy first, Baine, and the hammer only when needed.", next = "BACK", reply = "Then we understand each other, paladin. Bloodhoof has buried enough of its young without adding strangers to the count.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The hammer is quicker. Mercy can wait.", next = "BACK", reply = "It is quicker, and the graves come quicker too. I'd ask you to try mercy first while you're in Bloodhoof, for my father's sake.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "With curiosity, mostly, and a little caution, because we have only known the Earth Mother and the spirits of our ancestors. But my father says the Horde is stronger for every way its people have of healing, and I have seen trolls mend braves our own shaman could not." } },
      choices = {
        { text = "Then let me prove your father right, Baine.", next = "BACK", reply = "I'd like that, and I think you will. My father is right more often than he lets on.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Caution is wise. Some of us pray to darker things.", next = "BACK", reply = "Then I'm glad you told me plainly. Be careful with those darker things here, because my people won't know what they're seeing.", fx = { align = { light = -1 } } },
        { text = "Something else, Baine.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Now and then, when a brave follows a kodo too far west and the Palemane gnolls take offence, or a hunter strays onto the goblins' claims. Most quarrels start with a hunt that went one step too far, so I ask our hunters to know where the borders lie." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Now and then, when a brave follows a kodo too far west and the Palemane gnolls take offence, or a hunter strays onto the goblins' claims. Your {pet} has a calm way about it. I find that the beasts of a peaceful hunter are always calm, and the restless ones belong to the restless." },
      },
      choices = {
        { text = "I'll respect the borders, Baine, and avoid quarrels.", next = "BACK", reply = "Thank you, that eases my mind more than you know. A hunt that stays on our side of the line keeps the peace for everyone.", fx = { align = { order = 1 } } },
        { text = "A hunt goes where the prey goes, borders or not.", next = "BACK", reply = "The prey may not care, but the gnolls and the goblins will. Follow it if you must, but be ready for what follows you home.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "You may be right, and I'll admit I've wished to know what the Venture Company tells its foremen. But a tauren caught listening at a goblin's tent can never sit across a fire from him again, so if you go, go knowing that my father's name goes with you." },
      },
      choices = {
        { text = "Secrets win more peace than open talk ever has.", next = "BACK", reply = "Perhaps they have, in places I've never been. But secrets kept from a neighbour make the next talk harder, and I'd rather keep that door open.", fx = { align = { honor = -1 } } },
        { text = "Then I'll go openly and speak your words plainly.", next = "BACK", reply = "Thank you, that's what I'd hoped to hear. My father's name is better carried in the open, where everyone can see it.", fx = { align = { honor = 1 } } },
        { text = "What troubles the plains most?", next = "troubles" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Perhaps it could, but my people's oldest stories tell of a time when magic broke the world apart. I'll take your help gladly against the gnolls and the goblins, though I'd ask you to keep your fire away from the grain fields." },
      },
      choices = {
        { text = "I'll respect the fields. Your village, your rules.", next = "BACK", reply = "Thank you, the farmers will be grateful, and so will I. The gnolls are yours, but the grain is ours.", fx = { align = { order = 1 } } },
        { text = "Fire is fire, and I'll use it where it works.", next = "BACK", reply = "It is, and it burns grain as well as gnolls. Use it where it works, then, but keep it far from the fields.", fx = { align = { order = -1 } } },
        { text = "Why talk, if they won't listen?", next = "talk" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They will bear it because my father asks them to, but don't mistake that for welcome. Our hunters have heard what the Burning Blade did in Durotar, and a tauren who sees your imp will reach for a spear before he remembers we are allies, so keep it close and keep it quiet." },
      },
      choices = {
        { text = "I'll keep it leashed. Your people's peace matters.", next = "BACK", reply = "Thank you, that will make it easier on everyone. My father's word holds, but my people's nerves are another matter.", fx = { align = { light = 1 } } },
        { text = "Let them stare. My power protects the Horde too.", next = "BACK", reply = "They will stare, and some will reach for spears before they think. Protect the Horde, then, but be patient with those who don't yet know you do.", fx = { align = { light = -1 } } },
        { text = "How did the tauren come to Mulgore?", next = "coming" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_kin", tags = { "news" }, when = { alt = { kin = true } },
          text = "You have the look of {alt}, who stopped in Bloodhoof Village and helped my people with the wolves on the plains. If you're family, then Mulgore owes your family a little already, and I mean to remember it." },
        { id = "h_alt_higher", tags = { "news" }, when = { alt = { higher = true } },
          text = "{alt} came through here a while back, and I've heard since that the {altclass} has gone on to dangerous places. My father says the young ones grow up faster every year, and I'm beginning to think he's right." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken who carries the Light. My father says the Horde is made of peoples who were each cast out by someone. I think you were cast out twice." },
        { id = "h_default", key = true,
          text = "Baine Bloodhoof, Cairne's son. Goblins dig to the east, gnolls raid from the west, and dwarves blast the earth at Bael'dun. I'd rather talk them all down than fight them." },
        { id = "h_cairne", when = { heardLine = "cairne.h_default" },
          text = "You've met my father on the bluffs, so he'll have told you about the land. He tells everyone; he never tires of it." },
        { id = "h_rounds", when = { metBefore = true }, text = "I walk the village each evening, every tent and every fire. A leader should know every face, and I'm still learning a few." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Stars over Stonebull Lake, and on nights like this I can almost hear the old songs from when we wandered." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "You carry totems, and the grass seems to lean toward you as you walk. My father calls the shamans the oldest memory of our people, so I'm glad to see one more." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. The plains feed Bloodhoof, and those who hunt them well keep the peace better than any treaty I could make." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. My people do not pray as yours do, but anyone who mends the hurt is welcome in Bloodhoof, whatever voice answers them." },
        { id = "h_cl_rfk", tags = { "news" }, when = { cleared = "Razorfen Kraul", faction = "Horde" }, text = "You've been to Razorfen Kraul, I'm told. The quilboar raided our herds when the tribes crossed the Barrens, and I'm not sorry their crone has been humbled." },
        { id = "h_venture_resolved", tags = { "news" }, when = { thread = { id = "venture_mulgore", state = "resolved" } },
          text = "My father heard your counsel from my mouth, friend, and he nodded the way he does when he has already decided. The Venture Company's foremen will have one warning from Bloodhoof, as the dwarves did, and no more after it." },
        { id = "h_venture_soured", when = { thread = { id = "venture_mulgore", state = "soured" } },
          text = "Friend. I've turned over what you told me about the goblins more than once, and I still don't like the shape of it, though I can't say you were wrong." },
        { id = "h_walk", when = { origin = "tauren_long_migration" }, text = "You walked it too, didn't you, the long road out of the Barrens with the centaur at our heels? You were a calf and I was barely grown, and I remember the orcs' axes better than I remember my own feet, because I never once looked down." },
        { id = "h_dd_venture", tags = { "news" }, when = { killed = { name = "Venture", min = 30 } }, text = "The braves tell me the Venture Company has pulled its crews back from the woods, and that their camps are emptier because of you. I would rather have talked them down first, but I won't pretend I'm sorry the trees are still standing." },
        { id = "h_dd_mazz", tags = { "news" }, when = { questDone = TODO_QUEST("Mazzranache") }, text = "Maur Raincaller came to my fire with the tale of the great beast at last, and he gave you the credit before I could ask. That creature took more calves from our herds than any raider, so the herds will sleep easier now." },
      },
      choices = {
        { text = "You've met someone close to me, Baine.", next = "xalt_baine", when = { alt = true } },
        { text = "How did the tauren come to Mulgore?", next = "coming" },
        { text = "Do you remember the walk, Baine? I still dream of it.", next = "xwalk", when = { origin = "tauren_long_migration" } },
        { text = "What troubles the plains?", next = "troubles" },
        { text = "Why talk, if they won't listen?", next = "talk" },
        { text = "Your father must miss living on the plains.", tag = "Persuade", next = "baine_father",
          check = { pass = { any = { { disposition = { min = 65 } }, { heardLine = "cairne.h_default" }, { race = "Tauren" } } } },
          fail = { next = "baine_father_no", fx = { affinity = -1 } } },
        { text = "A warrior settles quarrels too, Baine.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Your father stood up for my people. Why?", next = "forsaken", when = { race = "Scourge" } },
        { text = "I've begun to walk the druid's path.", next = "druid", when = { race = "Tauren", class = "DRUID" } },
        { text = "The Windshapers seem like good neighbours.", next = "skyborne", when = { race = "Skyborne" } },
        { text = "Do the spirits favor talking the Venture Company down, Baine?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Talking works better when you know their secrets first, Baine.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "The arcane could help defend Bloodhoof, Baine.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "I'd guess the hunters cause you quarrels, Baine.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "I bring a demon to Mulgore. Will your people bear it?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "How do the tauren see a priest like me, Baine?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Does the Light have a place in Mulgore, Baine?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I've been to the heart of Razorfen Kraul, Baine.", next = "xcl_rfk", when = { cleared = "Razorfen Kraul", faction = "Horde" } },
        { text = "I've followed the Venture Company from the wells to Stonetalon.", next = "venture_word",
          when = { thread = { id = "venture_mulgore", beat = "b5_baine", state = { "stirring", "unfolding" } } } },
        { text = "I stood with your braves against the Venture machines, Baine.", next = "xorig_brave", when = { origin = "tauren_bloodhoof_brave" } },
        { text = "The Venture Company has fewer hands in Mulgore now, Baine.", next = "dd_venture", when = { killed = { name = "Venture", min = 30 } } },
        { text = "Earth Mother guide you.", next = "END", fx = { affinity = 1 } },
      },
      again = {
        { id = "h_again", text = "What else, friend? The village is quiet for now, and An'she is still high, so ask." },
        { id = "h_again2", text = "Go on. I'd rather hear it from you than from the gossip round the cookfires, where every plainstrider grows a foot in the telling." },
      },
    },
    dd_venture = {
      big = true,
      lines = {
        { id = "dd_venture_1", text = "So I've heard, and I've heard how. The goblins came for the trees and the ore with saws and powder, and I sent them word three times that the land was not theirs to cut. They never answered, and now you've answered for me, and I'm still deciding how I feel about it." },
      },
      choices = {
        { text = "They came with saws and guns. Steel was the only answer.", next = "BACK", reply = "Perhaps it was, with those foremen. My father would tell you the same, and then he'd tell you to grieve for it anyway, which is what I mean to do.", fx = { align = { light = -1 } } },
        { text = "I'd have talked first, if any of them had listened.", next = "BACK", reply = "Then you and I have the same regret, friend. Keep that in you, and the next time a goblin listens, you'll be ready for him.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Will the Venture Company come back, Baine?", next = "dd_venture2" },
      },
    },
    dd_venture2 = {
      lines = {
        { id = "dd_venture2_1", text = "They always come back, because the trade princes count their losses in coin and coin can be replaced. What they can't replace is the fear their crews carry now, and that may keep them out of Mulgore longer than any treaty I could have offered." },
      },
      choices = {
        { text = "Then I'll keep reminding them. Something else, Baine.", next = "BACK" },
      },
    },
    xorig_brave = {
      lines = {
        { id = "xbr_default", text = "I remember. You struck when I gave the word and stopped when I gave it again, and the stopping is the harder half. My father asks us to strike only when we must, so tell me plainly, as one hunter to another: did we strike enough?" },
      },
      choices = {
        { text = "We did. Every goblin we spared was our choice, not theirs.", next = "BACK", reply = "I think so too, and I'm glad you said it. Sparing them was our choice, and it may be the one that brings them to talk.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "No. They came back, so we should have struck harder.", next = "BACK", reply = "Maybe, and I've wondered that on bad nights. But harder would have meant more graves, and I'm not sure they'd have stayed away even then.", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "I'm not sure, Baine. I still think about it.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    warrior = {
      big = true,
      lines = {
        { id = "wa_default", text = "It does, and I've carried a weapon for my people and will again. But a warrior who only knows how to end a quarrel will start a great many of them, and the plains have had enough of that." },
        { id = "wa_tauren", when = { race = "Tauren" },
          text = "You'll stand with the braves at Bael'dun or against the Palemane one day, and I'll be glad of you. Only remember that the best fight is the one you were strong enough not to need." },
      },
      choices = {
        { text = "Strength is what makes them listen, Baine.", next = "BACK", reply = "Sometimes it is, and I'll not pretend otherwise. But the Palemane have plenty of strength, and see how little listening it's taught them.", fx = { align = { honor = -1 } } },
        { text = "Then I'll talk first and fight only if I must.", next = "BACK", reply = "That's what my father taught me, and it's good to hear it in someone else's voice. Bloodhoof could use more like you.", fx = { affinity = 2, align = { honor = 1 } } },
      },
    },
    forsaken = {
      lines = { { id = "fk_default", text = "Because you came to us asking for help, and the tauren remember what it is to be lost. My father believes your people can be cured of what was done to you, and that hope is why he spoke for you before the Warchief." },
        { id = "fk_farmer", when = { origin = "forsaken_brill_farmer" },
          text = "You farmed once, near Brill? Then you'll know what my father means when he speaks of the land, and I hope our fields remind you of yours more kindly than they hurt." } },
      choices = {
        { text = "I'm grateful to him.", next = "BACK", fx = { affinity = 2 } },
        { text = "There may be a cure someday.", next = "forsaken_cure" },
      },
    },
    forsaken_cure = {
      lines = { { id = "fc_default", text = "I don't know, friend, and I'll not guess. But I've watched my father refuse to give up on things far longer than anyone thought sensible, and he's been right more often than not." } },
      choices = { { text = "Then I'll hope as long as he does.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    druid = {
      lines = { { id = "dr_default", text = "Then you'll go up to the Elder Rise and Hamuul will teach you to listen to the land, which my father says is the hardest thing a tauren ever learns. Come back and tell me what it says about Bael'dun; I'd like to know if I'm right to be worried." } },
      choices = { { text = "I'll come back and tell you.", next = "BACK", fx = { affinity = 2, standing = { bloodhoof = 1 } } } },
    },
    skyborne = {
      lines = { { id = "sk_default", text = "Quiet ones, and respectful of the land, which is all a tauren asks. They watch the sky the way old Harken Windtotem does, as if they're waiting for it to call them home, and I haven't the heart to ask whether it will." } },
      choices = {
        { text = "Some of us are waiting for that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Mulgore is home enough now.", next = "BACK", fx = { affinity = 2, standing = { bloodhoof = 1 } } },
      },
    },
    baine_father = {
      lines = {
        { id = "bf_default", text = "Every season. He tells me the High Rise is a fine place to see the land from and a poor place to stand on it. He'd rather walk with the herds, I think, and he stays up there because the tribes need one place to look to. I've never told him I noticed." },
        { id = "bf_heard", when = { heardLine = "cairne.h_default" },
          text = "You've heard him speak of the land, so you know already. He talks about the plains the way old warriors talk about a battle they miss. I keep the village well so that he can at least look down and see it kept." },
      },
      choices = {
        { text = "He's lucky in his son.", next = "BACK", fx = { affinity = 2 } },
        { text = "I won't mention it to him.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    venture_word = {
      big = true,
      lines = { { id = "vw_default", text = "Then you've seen more of their work than I have, and I would hear it before my father asks me. Do I send their foremen one more warning, as I did the dwarves at Bael'dun, or do I stop speaking and let it be?" } },
      again = { { id = "vw_again", text = "So, friend, what shall I tell my father about the Venture Company?" } },
      choices = {
        { text = "Warn them once, as at Bael'dun. If they keep digging, break their tools.", next = "venture_hold",
          fx = { thread = { id = "venture_mulgore", state = "resolved" }, affinity = 3, align = { honor = 1 }, standing = { bloodhoof = 2 } },
          journal = { first = "Told Baine to warn the Venture Company once, as he warned the dwarves, and then to stop asking. He said his father would hear it from him by nightfall.",
                      third = "{name} counselled Baine Bloodhoof to warn the Venture Company once and then stop asking." } },
        { text = "Leave them be, Baine. They have more coin than you have braves.", next = "venture_doubt",
          fx = { thread = { id = "venture_mulgore", state = "soured" }, affinity = -2, align = { honor = -1 }, trait = { skeptical = 1 } },
          journal = { first = "Told Baine the Venture Company has more coin than he has braves. He thanked me, and didn't mean it.",
                      third = "{name} told Baine Bloodhoof the Venture Company had more coin than he had braves." } },
        { text = "What does your father say?", next = "venture_cairne" },
      },
    },
    venture_cairne = {
      lines = { { id = "vc_default", text = "He says the land was not for sale, and that the goblins are learning it slowly. He also says a chieftain's son should come to him with an answer and not a question, and so I am asking you." } },
      choices = { { text = "Then I'll give you an answer.", next = "venture_word" } },
    },
    venture_hold = {
      lines = { { id = "vh_default", text = "That is what I hoped to hear, and what I was afraid to say first. I'll tell my father tonight, and it will sound better coming from me than from Mull, who would rather say it with a spear." } },
      choices = { { text = "Earth Mother guide you, Baine.", next = "END" } },
    },
    venture_doubt = {
      lines = { { id = "vd_default", text = "Perhaps you're right, and that is what troubles me. I'll tell my father the goblins can't be talked down, and I'll hope he doesn't ask who taught me to think so." } },
      choices = { { text = "...", next = "END" } },
    },
    baine_father_no = {
      lines = {
        { id = "bn_default", text = "My father's heart is his own to speak of, friend." },
        { id = "bn_ask", text = "Ask him yourself, on the High Rise. He'll tell you more than I should." },
      },
      choices = { { text = "Of course.", next = "BACK" } },
    },
    troubles = {
      big = true,
      lines = {
        { id = "t_default", text = "The Venture Company cuts the land in the east, and the Palemane gnolls raid from the west. At Bael'dun, the dwarves blast the ground until the earth's spirits cry out. I warned them, and they kept digging." },
      },
      choices = {
        { text = "I'll help.", next = "BACK", reply = "Then you have a good heart, and my father will hear of it. Start where the need is sharpest, for the Earth Mother feels every wound in this land, and so do the people who live on it.", fx = { affinity = 2, standing = { bloodhoof = 1 }, align = { honor = 1 } } },
        { text = "The Venture Company pays well, and I won't cross them for a few hills.", next = "BACK", reply = "Then I'm sorry to hear it, and sorrier that the hills don't get a say. Take their coin, but don't be surprised if Mulgore remembers whose side you stood on.", fx = { align = { honor = -1 } } },
      },
    },
    talk = {
      lines = {
        { id = "tk_default", text = "Because sometimes they do. A spear settles one quarrel, but a word, spoken well, can settle a hundred." },
      },
      choices = {
        { text = "Could words settle things with the Alliance, too?", next = "op_peace" },
        { text = "Wise words.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    coming = {
      lines = {
        { id = "c_default", text = "We wandered for longer than any elder remembers. My father met Thrall's orcs, and with them beside us we drove the centaur from these plains. Mulgore is the first home our people have held in centuries." },
      },
      choices = { { text = "A home worth guarding.", next = "BACK", fx = { affinity = 2, standing = { bloodhoof = 1 } } } },
    },
    xwalk = {
      big = true,
      lines = {
        { id = "xwk_default", text = "Every night for a year after we came here, and some nights still. The dream is always the same: we're walking, and the grass never ends, and I wake up and remember we stopped. My father says the walk taught us to share what little we carried, so tell me, friend, has the plains' plenty made us forget that?" },
      },
      choices = {
        { text = "Not me. I still share what I carry.", next = "BACK", reply = "Then the walk taught you well, friend. I'm glad there are still some who carry it with them.", fx = { affinity = 3, align = { honor = 1 }, trait = { generous = 1 } } },
        { text = "A little. We've earned a full belly, Baine.", next = "BACK", reply = "We have, and I'll not begrudge anyone a meal. Just don't let a full belly make you forget the empty ones on the road behind us.", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "You must remember the orcs who fought for us.", next = "xwalk_orcs" },
      },
    },
    xwalk_orcs = {
      lines = {
        { id = "xwo_default", text = "I do, and I remember that they were as hungry as we were and fought anyway. That's why I'll hear an orc out in this village even when he's being a fool, because I owe the ones on that road more than patience, and patience is the cheapest thing I can give." },
      },
      choices = {
        { text = "Then I'll owe them patience too.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The earth spirits are furious with the goblins at the mine, and I can't blame them. But a furious spirit beside a furious tauren would leave nothing standing in the east, so I ask the shamans to calm the one while I try to calm the other." } },
      choices = {
        { text = "Calm first. Mulgore has seen enough fire.", next = "BACK", reply = "Then you understand what I'm trying to do, and I'm grateful. The east has burned enough already.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let the earth swallow their mine, and the goblins with it.", next = "BACK", reply = "The earth may do it without our asking, and I'll not weep for the mine. But I'd rather not see the plains torn open to settle it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "That's generously said, and I'll try to deserve it. My father taught me that praise is a debt, so I'll repay it in how I keep these plains." },
        { id = "s2", text = "You honor me, and through me the village, and I thank you for both. May the Earth Mother smile on a generous tongue." },
      },
      fail = {
        { id = "f1", text = "I'm the High Chieftain's son, so I've been flattered since I was a calf, and I learned early what it's worth. Speak to me as you would to any brave." },
        { id = "f2", text = "Those words are bigger than anything I've yet done. Keep them until I've earned them, and tell me honestly what you need." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha! The braves here are too mindful of whose son I am to speak to me like that, and I've missed it. You're welcome at my fire." },
        { id = "s2", text = "You've a quick tongue and a brave heart to aim it at me. My father says a chief who can't be teased can't be trusted, and I think he's right." },
      },
      fail = {
        { id = "f1", text = "I'll bear a jest gladly, but that one had a barb in it and no warmth. I'd ask you to show the village more respect than that." },
        { id = "f2", text = "Mock me if you must, but don't expect me to think better of you for it. There are Bristleback in the ravines who'd make a worthier target." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "I see the strength in you, and I'll not pretend it doesn't give me pause. I'd far rather have it beside my people than set against them." },
        { id = "s2", text = "My father taught me to know when a greater weight has entered the tent, and I feel it now. Speak freely, and I'll hear you out." },
      },
      fail = {
        { id = "f1", text = "I was raised on stories of the centaur wars, and I've stood my own watches against the Palemane since. You'll need more than a hard word to move a Bloodhoof." },
        { id = "f2", text = "This is a peaceful village, and I mean to keep it so, even from our own guests. Lower your voice, friend." },
      },
    },
  },
  topics = {
    _gated = {
      { id = "gt1", text = "That's something I'd share with a friend of the village, and I hope you'll become one. For now I'll keep it to myself." },
      { id = "gt2", text = "Forgive me, but I'll not speak of that yet. I owe my people some care in what I tell to those I've only just met." },
    },
    knows = {
      { id = "tp_knows", text = "The plains bring news to Bloodhoof from every road, and I try to hear all of it. Ask me about these, and I'll tell you what I know." },
      { id = "tp_knows_warm", when = { disposition = { min = 65 } }, text = "Sit with me, friend; you've earned the long answers, and the village can spare me a while." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "I'll answer, as I'd answer anyone who asks in good faith, and I hope that is how you ask." },
    },
    cenarion_circle = { { id = "tp_circle", text = "Hamuul studies with them. My father trusts them, and so do I. The land needs friends who listen to it." } },
    grimtotem = { { id = "tp_grimtotem", text = "They're tauren, whatever else they are. I'd rather reason with them than fight them, for as long as reason works." } },
    cairne = { { id = "tp_cairne", text = "My father carried our people out of the wandering and onto these plains, and he did it without ever once raising his voice to us. I try to walk the village the way he walks the bluff, and I have many seasons of learning still ahead of me." } },
    thrall = { { id = "tp_thrall", text = "Thrall came to my father's aid when the centaur were hounding us across the Barrens, and he asked nothing in return. The tauren repay that kind of debt with a long memory, and we joined his Horde gladly." } },
    forsaken = {
      { id = "tp_forsaken", text = "My father and Hamuul spoke for the Forsaken when they asked to join the Horde, because Hamuul believes their curse might be lifted. I hope he is right, though I find their apothecaries hard to like." },
      { id = "tp_forsaken2", when = { race = "Undead" }, text = "You are welcome in Bloodhoof, and I mean that, whatever looks the farmers give you. Their fear is old, and it will fade faster if you are patient with it." },
    },
    centaur = { { id = "tp_centaur", text = "The centaur drove us from one grazing land to the next for generations, until we came here. Some of the young braves still dream of revenge, and I tell them a herd that has its home should guard it, not go looking for old fights." } },
    quilboar = { { id = "tp_quilboar", text = "The Bristleback have pushed north from the Barrens into the south of Mulgore, and they have killed our elders at Narache. I would talk with them if they would let me, but so far they have only answered with spears." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother gave us these plains when we had walked so long we had almost forgotten what home meant. Every morning I thank her for the grass, and every evening for the people who walk on it." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "When the Darkmoon Faire comes to Mulgore, its tents go up below the bluff, and every calf in the village stops sleeping. Silas Darkmoon is a strange host, but he has always paid his respects to my father." } },
    onyxia = { { id = "tp_onyxia", text = "I know only what the Horde's runners tell me, that a black dragon nests in Dustwallow Marsh and the Brackenwall grunts fear her. Mulgore is far from her, and I would like it to stay that way." } },
    _none = { { id = "tp_none", text = "I don't know, but I'll ask, and I'll remember you asked first. May the Earth Mother guide you to someone who does." } },
    venture_company = { { id = "tp_venture", text = "We refused them the right to mine, and they poisoned our wells anyway. I'd still rather they sat down and talked, though I'm starting to doubt they know how." } },
  },
}

P:NPC {
  key = "zarlman", id = TODO_NPC("Zarlman Two-Moons"), name = "Zarlman Two-Moons",
  bible = "bibles/mulgore.md", role = "priest", tier = "quest",
  communities = { "bloodhoof" }, temper = { "serene" }, values = { "wise", "patient" },
  notices = { "class", "affliction" },
  impression = {
    first = "As Baine tends the people of Bloodhoof, Zarlman Two-Moons tends its spirits. He speaks of them as if they were restless children, which may be exactly what they are.",
    third = "{name} met Zarlman Two-Moons, spiritual leader of Bloodhoof Village and keeper of the rite of vision.",
  },

  greetings = {
    { id = "g_spirit", text = "Peace, young one. Baine tends the village in this world. I tend it in the other." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back to the spirit lodge. The spirits remember your step." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, young one, and the spirits noticed your absence before I did. They are quieter now that your step is back on the plain." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "The village says one of your words was found to be false. The spirits hear what is spoken in this lodge, so I would speak plainly here." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Someone in the village was warmed by what you said to them, and the spirits are restless children who like a kind word too. Come, sit a while." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "DRUID" } },
      text = "You walk close to the spirits already; I can see it. Don't be afraid of what they show you." },
    { id = "n_ghostly", cat = "affliction", place = "before", when = { resSick = true },
      text = "You've come back from the spirit's road not long ago, and it leaves a mark. Rest, and it fades." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "They do not fear you; they only do not know what to make of you: something that died and was not laid to rest, yet carries a warmth the dead should not have. I would like to know whether that warmth is yours or only borrowed." } },
      choices = {
        { text = "It's mine, earned in pain. I'll keep it.", next = "BACK", reply = "Then keep it, and may it keep you. The spirits will learn to know it, given time.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Borrowed or not, it serves me well.", next = "BACK", reply = "Then it serves you, and the spirits will watch to see what you serve with it. That is all they ever watch for, child.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "The spirits mind very little, so long as they are not ignored, and a prayer is half listening anyway. Your shadow and your loa are strange to them, but they are patient, and they have heard stranger things since the Horde came to Mulgore." } },
      choices = {
        { text = "I'll honour your spirits as I would my own.", next = "BACK", reply = "Then you'll find them patient, and kind in their way. Leave a pinch of tobacco at the stones when you pass; they like that.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My prayers answer to me, not to your spirits.", next = "BACK", reply = "They may, but the spirits will still hear them. Pray as you like, child, and let the dead listen as they will.", fx = { align = { light = -1 } } },
        { text = "Something else, Zarlman.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They do, and they ask only that you fight for something worth their watching. The braves who fell to the centaur in the long years of wandering rest easier now that the tauren have a home, and a warrior who guards that home walks with their blessing." } },
      choices = {
        { text = "I'll fight to guard this home, as they did.", next = "BACK", reply = "Then they'll walk beside you, and some cold morning out on the plains you'll feel them at your back.", fx = { align = { honor = 1 } } },
        { text = "The dead can watch. My fight is my own.", next = "BACK", reply = "It is, and they'll watch it all the same. Fight well, and give them something worth their watching.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Every hunter carries a few, and they stay as long as you remember them. The tauren give thanks for every plainstrider and every kodo so that their spirits return to the Earth Mother in peace, and I'd ask the same of you while you hunt these plains." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Every hunter carries a few, and they stay as long as you remember them. Your {pet} has a living spirit among all those departed ones. It keeps them company, I think, and they seem to like it." },
      },
      choices = {
        { text = "I'll give thanks for every life I take.", next = "BACK", reply = "Then the spirits will return in peace, and the plains will be full for the next hunt. That is all I ask.", fx = { align = { light = 1 } } },
        { text = "The dead don't need my thanks, Zarlman.", next = "BACK", reply = "They don't, perhaps, but the Earth Mother does, and she's the one who sends the next herd. Thank her, at least.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They mind it the way a herd minds a stranger at the waterhole, child. The arcane does not belong to the land, and the spirits of Bloodhoof feel it pass like a cold draft, so they will not trouble you, but neither will they speak to you." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "The spirits are uneasy around the restless dead already, and the arcane only adds a cold draft to it. They will not trouble you, child, but neither will they speak to you, and I am sorry for it." },
      },
      choices = {
        { text = "Then I'll respect their silence, elder.", next = "BACK", reply = "Then they'll respect yours, child, and leave you in peace. Silence is not hostility, not here.", fx = { align = { order = 1 } } },
        { text = "I don't need the spirits' approval to study.", next = "BACK", reply = "No, you don't, and they'll not give it. Study, then, but don't expect them to speak to you.", fx = { align = { order = -1 } } },
        { text = "What are the spirits saying?", next = "spirits" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They sensed it before you crested the hill, and all of them have gone quiet and watchful. Fel magic is a wound, not a power, and I fear the spirits will never forgive what walks beside you." },
      },
      choices = {
        { text = "Then I'll keep it far from the village, elder.", next = "BACK", reply = "Thank you, child, and the spirits will be quieter for it. They have long memories, and short tempers for fel.", fx = { align = { light = 1 } } },
        { text = "The spirits' forgiveness means nothing to me.", next = "BACK", reply = "Then you'll walk among them and never hear a word. That is a lonely thing, warlock, and I'd not wish it on anyone.", fx = { align = { light = -1 } } },
        { text = "What are the spirits saying lately?", next = "spirits" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "They mind deceit more than shadows, because a shadow is only a place the sun hasn't reached yet. Walk where you like, but don't lie to the spirits of this village, because they remember every word, and some of them still have tempers." },
      },
      choices = {
        { text = "I'll walk honestly, even in the shadows.", next = "BACK", reply = "Then the spirits will let you pass, shadows and all. Honesty is the only thing they truly ask.", fx = { align = { honor = 1 } } },
        { text = "The spirits can't hear what I don't say.", next = "BACK", reply = "They hear more than you'd think, child, and they remember every word unspoken too. Walk carefully.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken who calls the Light. The spirits of this village are restless around you, as children are around a stranger. I am only curious." },
        { id = "h_default", key = true,
          text = "Zarlman Two-Moons is my name, and I look after the spirits of this village, and of the young ones passing through it." },
        { id = "h_vision", tags = { "news" }, when = { questActive = TODO_QUEST("Rite of Vision") },
          text = "The rite of vision asks you to see with more than your eyes. Drink, follow, and don't fight what you're shown." },
        { id = "h_young", when = { metBefore = true }, text = "The young ones come down from Narache shaking, from their first death or their first vision. At that age they look much the same." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The spirits are louder after dark, not angrier, only louder, like children who won't sleep." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. The spirits of Bloodhoof's fallen braves watch the young ones who carry their weapons now, and they watch you as well." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, and the spirits of the beasts you've taken walk close behind you. Don't worry; they seem content." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. The spirits of this village have gone quiet around you, which means either they respect you or they are afraid, and I would like to know which." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue in Bloodhoof. The spirits notice even the quietest feet, young one, so walk respectfully among them." },
        { id = "h_dd_deaths", when = { deaths = { min = 10 } }, text = "The spirits know your name by now, I think, for you have walked back from the spirit healer more often than most young ones walk to Narache. The Earth Mother leaves that door open for you, but don't lean on it too hard." },
      },
      choices = {
        { text = "What are the spirits saying?", next = "spirits" },
        { text = "What do you show the young ones, elder?", next = "vision" },
        { text = "The spirits answer me now, elder. What should I ask them?", next = "shaman", when = { class = "SHAMAN" } },
        { text = "The spirits must mind what I am, elder.", next = "forsaken", when = { race = "Scourge" } },
        { text = "Do the spirits mind the arcane, elder?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "The spirits of fallen braves must watch over warriors.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do the spirits of my kills follow me, Zarlman?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "The spirits can surely sense my demon, elder.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do the spirits here mind a stranger's prayers, Zarlman?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "The spirits can't think much of a rogue, Zarlman.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do your spirits fear a Forsaken paladin, Zarlman?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I've died more often than I'd like, elder.", next = "dd_deaths", when = { deaths = { min = 10 } } },
        { text = "Thank you, elder.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Is there more? The Earth Mother hears every question, and I will hear yours." },
      },
    },
    dd_deaths = {
      lines = {
        { id = "dd_deaths_1", text = "I know, because it shows in the eyes, the way a long drought shows in the grass. Each time you come back, a little of that grey road comes with you, and a wise traveler learns from it instead of growing used to it." },
      },
      choices = {
        { text = "Death doesn't frighten me anymore. I'll keep charging in.", next = "BACK", reply = "Then you're braver than I am, or more foolish, and the spirits can't always tell the difference either. Walk carefully all the same.", fx = { align = { order = -1 } } },
        { text = "I'll be more careful. The ancestors can wait for me.", next = "BACK", reply = "They can, and they will, patiently. That's a wise answer, and I hope you remember it the next time the Bristleback outnumber you.", fx = { align = { order = 1 } } },
        { text = "Something else, elder.", next = "BACK" },
      },
    },
    shaman = {
      lines = {
        { id = "sh_default", text = "Ask them nothing at first. Sit by the water and let them ask you, because the elements are tired of being commanded, and they remember who listens." },
        { id = "sh_rise", when = { origin = "tauren_spirit_rise" },
          text = "The seers on the Spirit Rise taught you well, I can tell; you already lower your voice near the water. Go and sit at the wells with Mull, and tell him what they say to you." },
      },
      choices = { { text = "I'll let them ask first.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } } },
    },
    forsaken = {
      lines = { { id = "fk_default", text = "They notice it, as a wind notices a stone. You walk where the dead should be resting and you are not, and the spirits here aren't sure what to make of that. They aren't angry, little one, only puzzled, as I am." } },
      choices = { { text = "So am I, elder.", next = "BACK", fx = { affinity = 2 } } },
    },
    vision = {
      lines = { { id = "v_default", text = "Something different for everyone: a path, usually, and sometimes the end of one. The spirits choose; I only open the door." } },
      choices = {
        { text = "I'm ready.", next = "BACK", reply = "Then sit, and breathe, and let the smoke carry you. I will be here when you come back.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I'd rather walk my own path than one the spirits pick for me.", next = "BACK", reply = "The spirits don't pick your path, child, they only show it. Walk it or don't, but at least see it first.", fx = { align = { light = -1 } } },
      },
    },
    spirits = {
      lines = {
        { id = "s_wells", text = "They're restless near the wells, because the water's spirits don't understand why it tastes of oil. Mull Thunderhorn is trying to explain it to them." },
        { id = "s_quiet", text = "Quiet, today, and quiet is good. Quiet means nobody is grieving." },
      },
      choices = { { text = "Thank you, elder.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "The spirits haven't spoken of that, and the ancestors keep their own counsel. I won't speak for them." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother is the land itself, and the spirits are her children, the restless ones who never quite sit still. I keep them calm, and they keep Bloodhoof safe." } },
    the_elements = { { id = "tp_the_elements", text = "The spirits of earth and wind and water speak to me in Bloodhoof, and they speak more kindly now than when we wandered. They like having a home as much as we do." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken's spirits are bound to bodies that should have let them go. I pity them, and I hope Hamuul finds a way to set them free." } },
    cairne = { { id = "tp_cairne", text = "Cairne listens to the spirits as well as any shaman, though he would never call himself one. He has a chieftain's ear, and the spirits respect him for it." } },
  },
}

P:NPC {
  key = "harken", id = TODO_NPC("Harken Windtotem"), name = "Harken Windtotem",
  prejudice = { race = "Scourge", amount = 8, why = "The Earth Mother's cycle ends in rest; he finds the walking dead an offence against it, though he is too kind to say so loudly." },
  bible = "bibles/mulgore.md", role = "questgiver", tier = "quest",
  communities = { "bloodhoof" }, temper = { "steady" }, values = { "practical" },
  notices = { "class" },
  impression = {
    first = "Harken Windtotem watches the sky over Mulgore out of a habit left from the wandering years. He reads the weather from his aching knees and calls it progress with a perfectly straight face.",
    third = "{name} met Harken Windtotem, who keeps watch over what flies above Mulgore, which lately means far too many swoops.",
  },

  greetings = {
    { id = "g_prej", when = { prejudiced = true }, text = "Ah, one of the Forsaken. Forgive an old herder if he stands upwind of you; my people believe the dead should rest in the Earth Mother's arms, and seeing you walk about troubles the part of me that was taught it." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "It's good to see you, friend, and I mean it more than I did the first time. Whatever you are, you've the manners of the living, and that's more than I can say for some of the living." },
    { id = "g_plains", text = "Watch the sky over Mulgore for a while, the way the hawks do, and you'll see how many swoops there are this year." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the sky over Mulgore has changed its mind a dozen times since. My knees could have told you it would." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I hear you talked someone in the village round to your way of thinking. That's a rarer thing among tauren than you'd guess, because we're stubborn as old kodo." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter? Then you'll have a better eye for birds than most, so use it." },
  },

  start = "hello",
  nodes = {
    prej_harken = {
      big = true,
      lines = { { id = "prej_harken_default", text = "I suppose I do, and that's not fair to you, but it's honest. To my people, a death is the end of a long walk, and the Earth Mother takes the body back to feed the grass. You were robbed of that, and I can't look at you without thinking of the grass going hungry." } },
      choices = {
        { text = "I didn't choose to rise. Pity the robbery, not the one robbed.", next = "BACK", reply = "That's fair, and I'll try to remember it. You're not the thief, only the one who was stolen from, and I'm sorry.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Your Earth Mother never came for me. I'll walk where I like.", next = "BACK", reply = "Perhaps she didn't, and that's the sorrow of it. Walk where you like, then, but don't be surprised if the grass grows quiet as you pass.", fx = { align = { light = -1 }, affinity = -1 } },
        { text = "Then let me walk Mulgore gently, and you can judge me by it.", next = "prej_harken_calm", fx = { affinity = 1 } },
        { text = "Do the tauren bury their dead, then?", next = "prej_harken_why" },
      },
    },
    prej_harken_why = {
      lines = { { id = "prej_harken_why_default", text = "We do, under the open sky, with a song for the walk and a stone so the wind knows the spot. When I heard the Scourge dug up the dead of Lordaeron, I didn't sleep for a week, and then Thrall sent us the Forsaken as friends." } },
      choices = { { text = "I see. Let me answer you, then.", next = "prej_harken" }, { text = "Something else.", next = "BACK" } },
    },
    prej_harken_calm = {
      lines = { { id = "prej_harken_calm_default", text = "That I can do, and gladly. The plains have room for a quiet walker, whatever's beating or not beating inside them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "We wandered for generations without it, and the Earth Mother kept us. But I've watched the sky long enough to know there are many lights in it, and I don't see why yours can't be one of them, even if it does look odd on a Forsaken." } },
      choices = {
        { text = "There's room for the Light under your sky.", next = "BACK", reply = "I think there is, and the stars agree with me. Shine where you like, and I'll watch you from my rise.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Light is mine alone, not the sky's.", next = "BACK", reply = "Then keep it, and keep it well. Still, it looks a little lonely, all on its own.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "You can try, but they've ached since the centaur chased us across the Barrens, and I've grown fond of them as a weather vane. Say a word over the swoops instead, if you like, because there are far too many of them this year and something has made them bold." } },
      choices = {
        { text = "Pain isn't a keepsake, Harken. Let me ease it.", next = "BACK", reply = "Ha, you're kind, but these knees have told me about every storm for forty winters. Leave them be, and bless the swoops instead.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Keep your aching knees, then. I'll save my prayers.", next = "BACK", reply = "Fair enough, they're old friends now, and they'd miss me. Save your prayers for the swoops, then.", fx = { align = { light = -1 } } },
        { text = "Something else, Harken.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "To a grown warrior, no, but to the young ones out in the fields, very much so. There are too many of them this year and they've grown bold, so thin them where they nest, and the farmers of Bloodhoof will sleep easier for it." } },
      choices = {
        { text = "I'll thin them where they nest, for the farmers.", next = "BACK", reply = "Thank you, the farmers will sleep easier for it, and so will I. Mind their beaks; the big ones aim for the eyes.", fx = { align = { honor = 1 } } },
        { text = "Swoops aren't worth a warrior's time, Harken.", next = "BACK", reply = "Perhaps not, but they're worth a farmer's crop, and the farmers are worth your time. Think on it, warrior.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Then between us we'd see the whole plain, from the lake to the western ridge. The Palemane gnolls creep in from the west at dusk, so if you have quiet feet and sharp eyes, watch the western road and tell the braves what you see." },
      },
      choices = {
        { text = "Better they never see me. Then they can't fight back.", next = "BACK", reply = "That's one way, I suppose, and the gnolls would do the same. Still, the braves would rather know what they're fighting.", fx = { align = { honor = -1 } } },
        { text = "I'll watch, then meet them openly with the braves.", next = "BACK", reply = "Good, that's how the braves like it, and how I like it too. Watch the western road, and tell them what you see.", fx = { align = { honor = 1 } } },
        { text = "Why do you watch the sky?", next = "sky" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "You could, and the young hunters would never forgive you for stealing their practice. Swoops are a nuisance, not a war, and the youngsters must learn to drop them with an arrow, not watch a stranger freeze them out of the sky." },
      },
      choices = {
        { text = "Then the young hunters can have them, and the bruised thumbs.", next = "BACK", reply = "Ha, they'll thank you for that, eventually. Bruised thumbs make for steady hands in the end.", fx = { align = { order = 1 } } },
        { text = "A pest is a pest, and I'll clear them anyway.", next = "BACK", reply = "Clear them, then, but leave a few for the youngsters. They'll need something to practice on.", fx = { align = { order = -1 } } },
        { text = "Why keep watch on the sky?", next = "sky" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "You could ask, but I suspect they'd blame the Windfury harpies, the same as I do, because the harpies have pushed every swoop off their ridge and down onto our fields. The druids tell me the plains keep their own balance, and I'm an old sky-watcher who isn't sure the plains have heard about harpies." } },
      choices = {
        { text = "Bloodhoof's fields come first, so we keep the swoops in check.", next = "BACK", reply = "That's what the farmers say, and they're usually right. Bring me the quills when you're done, because nothing goes to waste here.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The plains will find their own balance without our hand on it.", next = "BACK", reply = "Maybe they will, and maybe the druids are right. But the plains' balance doesn't feed the farmers this year.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "My knees ache whenever a storm is coming, and they've ached since you walked up, so you can draw your own conclusions. The orcs have told us what the Burning Legion made of them once, and nobody in Bloodhoof wants its servants anywhere near our sky." },
      },
      choices = {
        { text = "I'll keep it leashed, elder. Mulgore deserves that.", next = "BACK", reply = "Thank you, and my old knees thank you too. Mulgore's sky has had enough trouble this year without that.", fx = { align = { order = 1 } } },
        { text = "Your knees aren't my concern, Harken.", next = "BACK", reply = "They aren't, but the storm they're warning of might be. Keep your demon close, warlock.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin in Mulgore. My knees told me something strange was coming today, and they're seldom wrong." },
        { id = "h_default", key = true,
          text = "I'm Harken Windtotem, and I keep an eye on what flies over Mulgore. Lately it's mostly swoops, and too many of them." },
        { id = "h_swoop", tags = { "news" }, when = { questActive = TODO_QUEST("Swoop Hunting") },
          text = "The swoops are thick this season. Thin them, and bring me their quills. Nothing goes to waste in this village." },
        { id = "h_knees", when = { metBefore = true }, text = "My grandfather read the weather from how the birds flew. I read it from how my knees ache. The tribe calls that progress." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Even the swoops sleep at this hour, but I don't, much; it's an old habit from the wandering years." },
        { id = "h_walk", when = { origin = "tauren_long_migration" }, text = "You came out of the Barrens on the long walk, same as me. I spent that whole road watching the sky for vultures, because vultures meant the centaur had caught someone behind us, and I suppose I never really stopped." },
        { id = "h_maur", when = { heardLine = "maur.h_default" }, text = "Maur Raincaller's after that beast again? He's tracked it longer than some of our braves have been alive." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, is it? Then you'll know the wind is turning before my knees do, and I'd thank you to tell me when." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, and a tall one. Watch the skies, because the swoops dive at anything that stands still long enough on the plains." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! My knees say rain is coming, and my eyes say a priest of the Horde has come, and I'm only certain about the knees." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, is it? Hamuul's students say they can hear what the birds are saying, so ask the swoops for me why there are so many of them this year." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. The sky's been quiet over Mulgore, and I'd like it to stay that way, so keep your demon on the ground." },
        { id = "h_dd_mazz", tags = { "news" }, when = { questDone = TODO_QUEST("Mazzranache") }, text = "Maur finally has his beast, and with your help, from what he tells everyone who'll sit still long enough. I'd say my knees felt it coming, but the truth is I'm just glad the old hunter will sleep again." },
        { id = "h_dd_fall", when = { deathCause = "falling" }, text = "You've fallen off something tall and died of it, I'd wager, by the way you keep clear of the cliff path. The swoops ride the wind off those ledges because they have wings, friend, and you don't." },
      },
      choices = {
        { text = "You look at me like I'm a broken thing, Windtotem.", next = "prej_harken", when = { prejudiced = true } },
        { text = "You spend a lot of time watching the sky.", next = "sky" },
        { text = "The swoops must come down at a hunter's beast sometimes.", next = "hunter", when = { class = "HUNTER" } },
        { text = "The air over Mulgore feels uneasy. Have you noticed, Harken?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I watch the ground the way you watch the sky.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "I could bring down those swoops with frost.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "The swoops don't look like much danger, Harken.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Shall I see to those aching knees, Harken?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Could a druid ask the swoops why they've grown so bold?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Are you worried about my demon, Harken?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What do the tauren think of the Light, Harken?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll see to it.", next = "END", fx = { affinity = 1 } },
      },
      again = {
        { id = "h_again", text = "Something else? Ask away, and I'll keep one eye on the swoops while you do." },
      },
    },
    hunter = {
      lines = {
        { id = "hu_default", text = "Not at a grown one, but they'll take a kodo calf or a careless pup. Watch how they circle: two turns wide and one turn tight, and then they drop, so loose your arrow on the tight turn." },
        { id = "hu_pet", when = { pet = { type = "Beast" } },
          text = "Not at a grown one, but they'll take a kodo calf or a careless pup, so watch how they circle: two turns wide and one turn tight, and then they drop. {pet} has been watching them since you got here, and a good beast reads the sky as well as I do." },
      },
      choices = { { text = "Two wide, one tight. I'll remember.", next = "BACK", fx = { affinity = 2 } } },
    },
    sky = {
      lines = {
        { id = "s_map", text = "When we wandered, the sky was the only map we had. Now we've a home with walls of grass, and I still can't stop looking up." },
      },
      choices = { { text = "Keep watching for us.", next = "BACK", fx = { affinity = 1 } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Noticed it? The Windfury harpies have the swoops flying crooked over the whole plain, and the winds off their ridge smell of trouble. In the wandering years we'd simply have moved on, but we have a home now, so the wind will have to get used to us." } },
      choices = {
        { text = "We have a home now, so we hold it against the harpies.", next = "BACK", reply = "That's how I see it, and so do the braves. We've wandered long enough.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The wind can't be owned. Maybe we should still move with it.", next = "BACK", reply = "Maybe, and some nights I miss the wandering. But we have a home now, and I'd not trade it for the wind.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Couldn't say. Ask Baine; he hears more than I do, and he listens like the Earth Mother listens, all the way through." } },
    cairne = { { id = "tp_cairne", text = "Cairne led us here through storm and drought, and I followed him the whole way with my knees complaining. They complain still, but the sky above Mulgore is worth it." } },
    centaur = { { id = "tp_centaur", text = "The centaur chased us across the plains for longer than I can remember, and I watched the sky for their dust clouds every morning. I still do, out of habit, and I still see nothing but clouds." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother speaks through the weather, and I have spent my life listening. She is in a good mood this season, which pleases me." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire's wagons come up the road from the south, and I can always tell a week before, because the wind smells of sugar and gunpowder. My knees never warn me about that." } },
  },
}

P:NPC {
  key = "maur", id = TODO_NPC("Maur Raincaller"), name = "Maur Raincaller",
  bible = "bibles/mulgore.md", role = "questgiver", tier = "quest",
  communities = { "bloodhoof" }, temper = { "solemn" }, values = { "brave" },
  notices = { "kit" },
  impression = {
    first = "Rain followed every camp Maur Raincaller made on the long walk to Mulgore, and the name stuck. He tracks a beast the young hunters only whisper about, and he means to see its hide.",
    third = "{name} met Maur Raincaller, a solemn tauren hunter on the trail of the great beast Mazzranache.",
  },

  greetings = {
    { id = "g_rain", text = "Rain's coming; I can smell it on the wind. It's good for the grass, and bad for tracking." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and the rain has come and gone a few times while you were gone. The tracks are fresh now, if you've a mind to hunt." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown stronger since we last spoke, and you walk like a hunter now instead of a calf. Perhaps one day you'll see that hide before I do." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Something out in the grass had a go at you. Get mended before you go after anything bigger." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I'd hunt beside anyone with patience. The beast I track is clever, and it won't be fooled by a glow. But I'm curious what the Light does to a creature like that, so if you see it, I'd like to hear about it." } },
      choices = {
        { text = "I'll hunt it with patience, as you would.", next = "BACK", reply = "Good, then you'll be welcome on the trail. Patience is the only weapon that's ever worked on that beast.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll hunt it my own way, Maur.", next = "BACK", reply = "Your own way, then, and I'll watch to see what it is. That beast has outsmarted many who said the same.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "A blessing would not hurt, though Mazzranache has walked these plains longer than most prayers I know. If I bring back its hide, I would want someone to speak for its spirit, because a beast that old deserves more than a skinning knife." } },
      choices = {
        { text = "I'll speak for its spirit when the hunt is done.", next = "BACK", reply = "Thank you, that means more than you know. A beast that old deserves to be remembered.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A beast is a beast. Bring back the hide and be done.", next = "BACK", reply = "A hide, yes, and a spirit too, whether you speak for it or not. I'll speak for it myself, then.", fx = { align = { light = -1 } } },
        { text = "Something else, Maur.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The young hunters call it Mazzranache, and it's bigger than any prairie wolf or cougar I've seen, with tracks that cross the plains and vanish into the hills. If it comes at you, don't run, because nothing that size has ever been outrun on open ground." } },
      choices = {
        { text = "I'll stand my ground if it comes, Maur.", next = "BACK", reply = "Good. It charges anything that turns its back, so you'll live longer facing it.", fx = { align = { honor = 1 } } },
        { text = "If it comes, I'll run. There's no shame in living.", next = "BACK", reply = "No shame at all, and I'd rather you lived. But it's faster than you, so run toward the trees.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Then you'll be the first, because that beast has winded every hunter who's gone after it. It hunts by smell more than sight, so rub yourself in sage and keep downwind, and you might get close enough to see its eyes." },
      },
      choices = {
        { text = "I'll strike before it knows I'm there.", next = "BACK", reply = "Then you'll be the first, and I'll want to hear every detail. Mind the wind, rogue.", fx = { align = { honor = -1 } } },
        { text = "I want it to see me. Let it be a fair hunt.", next = "BACK", reply = "Then you're a hunter after my own heart, and I'll want the whole story at Kauth's fire.", fx = { align = { honor = 1 } } },
        { text = "How did you come by your name?", next = "name" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "You could, but the hide would come back scorched, and I want that hide to hang in Bloodhoof. A hunt is a conversation between the hunter and the hunted, and fire is no kind of conversation at all." },
      },
      choices = {
        { text = "You're right. The beast deserves an honest hunt.", next = "BACK", reply = "It does, and I'm glad you see it. I've followed that beast for years, and I'd hate to see it end as a pile of ash.", fx = { align = { light = 1 } } },
        { text = "Hunting isn't a conversation. It's a kill.", next = "BACK", reply = "For some, perhaps, but not for that beast, and not for me. Leave Mazzranache to me, mage.", fx = { align = { light = -1 } } },
        { text = "How did you get your name?", next = "name" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Help me find it and I'll be glad of you, because no tracker in Bloodhoof has ever seen it twice in the same place. But a druid might also tell me that a beast so old belongs to the plains more than to my skinning knife, and I'm not certain I want to hear that." } },
      choices = {
        { text = "A beast that old has earned a fair hunt, face to face.", next = "BACK", reply = "It has, and I'd want it no other way. Let it see who has come for it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Old or not, it's a danger. Take it however you can.", next = "BACK", reply = "It is a danger, I'll not argue. But I'd still rather meet it honestly than take it like a thief.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "No, because the beasts smell it and run, and Mazzranache is cunning enough to hide without any help from you. If you want to be useful, hunt the swoops and prairie wolves along the trail while I watch for its tracks, and keep your demon close beside you." },
      },
      choices = {
        { text = "I'll send it away while you hunt, Maur.", next = "BACK", reply = "Thank you, the trail will be quieter for it. Hunt the swoops, and I'll watch for tracks.", fx = { align = { honor = 1 } } },
        { text = "My demon could drive the beast straight to you.", next = "BACK", reply = "Or straight away, and I'd never see it again. Keep your demon close, warlock, as I asked.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken carrying the Light. Rain followed me to Mulgore, and now strange company does too." },
        { id = "h_default", key = true,
          text = "I'm Maur Raincaller. There's a beast in Mulgore the young hunters call Mazzranache, and I've seen its tracks. I'd like to see its hide." },
        { id = "h_mazz", tags = { "news" }, when = { questActive = TODO_QUEST("Mazzranache") },
          text = "The beast is called Mazzranache. Find it, end it, and bring me proof, and the young ones will stop whispering and start bragging." },
        { id = "h_slow", when = { metBefore = true }, text = "The young braves ask me how to track. I tell them: walk slower than you want to. Not one of them listens." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Something big moves out in the dark grass. I've heard it more than I've seen it, and that's the part I don't like." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "You walk like a shaman, light on the grass, and that's a gift on a hunt. The beast I'm tracking would hear anyone else coming a mile off." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! You won't track the beast I'm after, but if it ever turns on you, I'd like to know you can stand your ground." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Rain followed me all the way to Mulgore, and now a priest has followed the rain, so perhaps the spirits have a sense of humour." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. They say your kind learns to walk as the cat walks, and I'd give a good deal to move through the tall grass as quietly as you will." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. Your demon frightens the game for a mile around, so keep it away from me while I'm tracking." },
        { id = "h_dd_swoop", tags = { "news" }, when = { questDone = TODO_QUEST("Swoop Hunting") }, text = "Harken tells me you brought him a satchel of swoop quills, and that his sky has been quieter since. He talks about you the way he talks about weather he likes, which is the highest praise that old bird has." },
      },
      choices = {
        { text = "There must be a story behind your name.", next = "name" },
        { text = "I'm a tracker too. What have its tracks told you?", next = "hunter", when = { class = "HUNTER" } },
        { text = "The spirits might frown on hunting Mazzranache, Maur.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Your beast won't see me coming, Maur.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "A mage could simply blast the beast from afar.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What is this beast you're after, Maur?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Will you want a blessing before you hunt Mazzranache, Maur?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Should a druid help you hunt Mazzranache, Maur?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Could my demon help you track, Maur?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Would you hunt beside a paladin, Maur?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Harken says the swoops are quieter now.", next = "dd_swoop", when = { questDone = TODO_QUEST("Swoop Hunting") } },
        { text = "I'll find it.", next = "END", fx = { affinity = 1, trait = { brave = 1 } } },
      },
      again = {
        { id = "h_again", text = "Anything else? Speak softly; voices carry out on the grass, and the Earth Mother's beasts have long ears." },
      },
    },
    dd_swoop = {
      lines = {
        { id = "dd_swoop_1", text = "They are, and the calves can graze the slopes again without a swoop dropping on them out of the sun. Harken and I hunt different things, but we both know a hunt is only good if it leaves the plains better than it found them." },
      },
      choices = {
        { text = "Hunting a bird for its quills is a poor sort of hunt.", next = "BACK", reply = "Spoken like someone who never watched a swoop take a calf's eye. Still, I'd sooner you said it than not, because a hunter should always ask himself that question.", fx = { align = { light = 1 } } },
        { text = "The swoops were taking calves. They had it coming.", next = "BACK", reply = "They were, and they did. You think like a herder, and on these plains that's no insult.", fx = { align = { light = -1 } } },
        { text = "Something else, Maur.", next = "BACK" },
      },
    },
    hunter = {
      lines = {
        { id = "hu_default", text = "That it's heavy at the front and drags its left hind a little, so it's been hurt before and it lived. A beast that has survived a hunter is a beast that's learned, and that's why I go slowly." },
        { id = "hu_narache", when = { origin = "tauren_narache_hunter" },
          text = "Your mother or father hunted out of Narache, didn't they? Then you were raised on the same tracks I was. Look for where it drinks, and wait there; it's thirsty after a kill." },
      },
      choices = {
        { text = "Then we'll wait for it, and be patient.", next = "BACK", reply = "That's what I hoped to hear. Find where it drinks, and I'll bring the jerky.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "I'd rather drive it out and finish it fast.", next = "BACK", reply = "Then you'll drive it into the hills, and it'll learn another lesson. Go slowly, friend, as I do.", fx = { align = { order = -1 } } },
      },
    },
    name = {
      lines = {
        { id = "n_rain", text = "It rained on every camp I made, the whole long walk to Mulgore. My mother said the clouds had adopted me, and the name stuck, and so did the clouds." },
      },
      choices = { { text = "It's a good name.", next = "BACK", fx = { affinity = 1 } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I asked an elder that once, and she told me the spirits don't frown on a hunt, only on a waste. If I take its hide, I'll honor every part of it, and I'll thank the earth for letting us meet." } },
      choices = {
        { text = "A clean hunt, honestly given. The spirits can't ask more.", next = "BACK", reply = "It can't, and I'm glad to hear you say it. Say the words over it afterward, and its spirit will run easy.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A trap works better than a chase, and nobody's the wiser.", next = "BACK", reply = "Nobody but the beast, and the spirits, and me. A trap is a coward's hunt, and I'll not set one.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "That's not something I've tracked, friend, not in all my seasons on the plains." } },
    centaur = { { id = "tp_centaur", text = "The centaur were the beasts I hunted most when we wandered, and they were clever prey. The beasts of Mulgore are simpler, but the one I hunt now is not." } },
    quilboar = { { id = "tp_quilboar", text = "The Bristleback are cunning, and they hunt in packs like wolves. I have tracked them across the south of Mulgore, and they always know when I am coming." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother sends the rain to follow me, and I have stopped complaining about it. A wet hunter is a quiet hunter." } },
    cairne = { { id = "tp_cairne", text = "Cairne hunted with me once, when he was younger, and he moved through the grass like a ghost. I have never seen a tauren so big move so quietly." } },
  },
}

P:NPC {
  key = "mull", id = TODO_NPC("Mull Thunderhorn"), name = "Mull Thunderhorn",
  bible = "bibles/mulgore.md", role = "priest", tier = "quest",
  communities = { "bloodhoof" }, temper = { "worried" }, values = { "devout", "protective" },
  notices = { "race" },
  impression = {
    first = "Mull Thunderhorn walks to every sacred well each morning and finds the water no better each time. His worry is plain, but so is his stubbornness, and he will walk again tomorrow.",
    third = "{name} met Mull Thunderhorn, who grieves for the sacred wells of Mulgore poisoned by the Venture Company's machines.",
  },

  greetings = {
    { id = "o_peace_peace", when = { gossip = { topic = "peace", stance = "peace" } }, text = "I hear you told young Baine the peace is worth keeping. Peace is a fine thing until the wells run dry, traveller, so keep your spear sharp anyway." },
    { id = "g_wells", text = "Forgive me, my mind is on the wells. It's always on the wells lately, for the Earth Mother's water is sick." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. Tell me the water runs clean somewhere, please." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You're of the plains, so the wells are yours too. Help me cleanse them." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I don't know, and I'd welcome anything that tried. The goblins poisoned them, and the Earth Mother is patient, but patience doesn't help the herd drink today. If your Light can heal, I'd ask you to try it here." } },
      choices = {
        { text = "I'll try. The wells deserve healing.", next = "BACK", reply = "Thank you, friend, and the herd will thank you too. The wells need all the help they can get.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The goblins need a hammer more than the wells need prayer.", next = "BACK", reply = "They might, and I'll not stop you. But the wells will still be sick after the goblins are gone.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "I have asked myself that every morning on the walk to the wells, and every morning the water tastes the same. Perhaps your prayers reach further than mine, but the Venture Company keeps digging, and no blessing holds while their machines are still pumping." } },
      choices = {
        { text = "I'll pray at the wells with you each morning, Mull.", next = "BACK", reply = "I'd like that, more than I can say. It's a lonely walk, and a little company would ease it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayer is too slow. Wreck their pumps instead.", next = "BACK", reply = "It is slow, and I'm tired of waiting. Wreck them, then, and I'll pray for the wells after.", fx = { align = { light = -1 } } },
        { text = "Something else, Mull.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Venture Company thugs, mostly, with clubs and too much confidence. They've set up at the sacred wells and won't leave for any words of mine, so if they won't listen to reason, perhaps they'll listen to an axe, though I'd rather it didn't come to that." } },
      choices = {
        { text = "I'll drive them off, but only if words fail.", next = "BACK", reply = "That's how I'd want it. Goblins can be talked round, if you mention their profits early enough.", fx = { align = { honor = 1 } } },
        { text = "Words always fail with goblins. I'll start with the axe.", next = "BACK", reply = "Maybe they do, and maybe I'm a fool for trying. Still, try once, for my sake, before you swing.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The plainstriders drink from the wells and sicken, and the wolves that eat them sicken in turn, and so the poison spreads across the plains. Bring down the sick ones mercifully when you find them, and help me cleanse the wells so the next ones drink clean." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "The plainstriders drink from the wells and sicken, and the wolves that eat them sicken in turn, and so the poison spreads across the plains. Keep your {pet} away from the wells near the goblin camps. I couldn't bear to see a hunter's companion fall to that poison too." },
      },
      choices = {
        { text = "I'll put the sick beasts down mercifully, Mull.", next = "BACK", reply = "Thank you, that's a kindness to them and to the plains. The poison has hurt enough already.", fx = { align = { light = 1 } } },
        { text = "Sick beasts are easy kills. I'll take them for hides.", next = "BACK", reply = "Then you'd carry poisoned hides, friend, and I'd not want them anywhere near the village. Put them down, and burn what's left.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Would you? The goblins swear it's only water from their drills, but I've tasted the wells and I know better, so find out what they're pouring and where, and I'll know which well to save first." },
      },
      choices = {
        { text = "I'll wreck their drills while I'm in there.", next = "BACK", reply = "Then you'll be doing me two favours, and I'll not ask how. Just come back and tell me what they're pouring.", fx = { align = { honor = -1 } } },
        { text = "I'll find the truth and let the elders confront them.", next = "BACK", reply = "That's wiser, and the elders will thank you for it. Find out what they're pouring, and we'll take it from there.", fx = { align = { honor = 1 } } },
        { text = "Who poisoned the wells?", next = "who" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "I've asked myself that, because I'd take help from almost anywhere now. But the wells are alive in a way your magic doesn't understand, and I would see them healed slowly by the Earth Mother before I'd see them healed quickly by something that doesn't know what it's healing." },
      },
      choices = {
        { text = "Then I'll leave the healing to the Earth Mother.", next = "BACK", reply = "Thank you, and I know how hard that is to hear. Slow is better than wrong, with something this old.", fx = { align = { order = 1 } } },
        { text = "Slow healing means more poisoned water. Let me try.", next = "BACK", reply = "It does, and every day I wonder if I'm wrong to wait. Try, then, but gently, and stop if the water changes.", fx = { align = { order = -1 } } },
        { text = "Who's poisoning the wells?", next = "who" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "No, the goblins did it with their machines and their oil, I'm sure of that much. But I've learned to fear any power that takes more than it gives, and I'd ask you to think of the wells when you call on yours." },
      },
      choices = {
        { text = "I'll take only what I need, Mull.", next = "BACK", reply = "Then I'll trust you, and the wells will too. That's all I'd ask of anyone.", fx = { align = { light = 1 } } },
        { text = "Power is power. I'll take whatever serves me.", next = "BACK", reply = "Then think of the wells, as I said, because that's what the goblins said too. Take carefully, warlock.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. The sacred wells are sick, and I don't suppose the Light can make the water clean again?" },
        { id = "h_default", key = true,
          text = "I'm Mull Thunderhorn, and the sacred wells of Mulgore are sick. Goblins set up beside them, and now the water tastes of oil and worse." },
        { id = "h_poison", tags = { "news" }, when = { questActive = TODO_QUEST("Poison Water") },
          text = "The creatures that drink from the wells are sickening too. Bring me proof of it, so I know how deep the poison runs." },
        { id = "h_cleanse", when = { any = { { questActive = TODO_QUEST("Winterhoof Cleansing") }, { questActive = TODO_QUEST("Thunderhorn Cleansing") }, { questActive = TODO_QUEST("Wildmane Cleansing") } } },
          text = "Take the totem to the well and let it work. The earth remembers clean water; we only have to remind it." },
        { id = "h_totem", when = { any = { { questActive = TODO_QUEST("Thunderhorn Totem") }, { questActive = TODO_QUEST("Wildmane Totem") } } },
          text = "A totem must be made before a well can be cleansed. Gather what it needs, and I'll do the rest." },
        { id = "h_walk", when = { metBefore = true }, text = "I walked to every well this morning, and my hooves ache, and the water's no better. Tomorrow I'll walk again." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. The goblins by the wells hire bruisers to guard their drills, and I'd sooner a warrior of the Horde dealt with them than any of my braves." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll have seen what the goblins' oil has done to the beasts near the wells, then, and I wish I hadn't." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. If you can bless water, the sacred wells of Mulgore need it more than anyone in this village, though I fear the goblins' oil runs deeper than any prayer." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. The wells are sick enough already, so please don't let your demon drink from them." },
        { id = "h_dd_venture", tags = { "news" }, when = { killed = { name = "Venture", min = 20 } }, text = "The water at the eastern wells runs a little cleaner since the Venture Company lost so many of its hands, and I hear yours were among the ones that did it. I take no joy in killing, friend, but I'll take a little in clean water." },
      },
      choices = {
        { text = "Someone must have poisoned them.", next = "who" },
        { text = "I could slip into the goblin camp and see what they're dumping.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Could a mage purify the water, Mull?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Who guards the goblin drills, Mull?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What has the oil done to the beasts, Mull?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "I'll help cleanse them.", next = "END", reply = "Thank you, friend, from me and from the herd that drinks there. Walk with the Earth Mother, and come back to the wells soon.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Could prayer cleanse the sacred wells, Mull?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Warlock magic could have sickened the wells, Mull.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Could the Light cleanse the wells, Mull?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Goblin oil means goblin coin, and I won't stand in its way.", next = "END", reply = "Then go your way, and I'll go mine, toward the wells, as I always do. The Earth Mother sees who stands where.", fx = { align = { light = -1 } } },
        { text = "The water spirits are frightened. I can hear them.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "A druid could help the land heal the wells.", next = "druid", when = { class = "DRUID" } },
      },
      again = {
        { id = "h_again", text = "Something more? Forgive me; half my mind is still at the wells, where the earth is weeping oil." },
      },
    },
    shaman = {
      lines = {
        { id = "sh_default", text = "You can? Then tell me what they're saying, because I only feel the wrongness through the totem, and you hear it plainly. Do they blame us, for letting the goblins near?" },
      },
      choices = {
        { text = "They don't blame you. They're only confused.", next = "BACK", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "They blame anyone who did nothing.", next = "shaman_blame" },
      },
    },
    shaman_blame = {
      lines = { { id = "sb_default", text = "Then they're right, and I'll do more than walk to the wells and worry. Carry the totems for me, and let them see that someone is doing something." } },
      choices = { { text = "I'll carry them.", next = "BACK", fx = { affinity = 2 } } },
    },
    druid = {
      lines = { { id = "dr_default", text = "The land under the wells is healthy still; it's the water that's been fouled from above. A druid can tend the grass around them while the totems do their work, and I'd be grateful for it." } },
      choices = { { text = "I'll tend the grass.", next = "BACK", fx = { affinity = 2 } } },
    },
    who = {
      lines = { { id = "w_default", text = "The Venture Company, with their machines and their spills. They don't mean it, I think; they simply don't care, and somehow that's worse." } },
      choices = { { text = "It is.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I'm sorry, my thoughts are with the water and the land that drinks it. Ask Baine." } },
    venture_company = { { id = "tp_venture", text = "They wanted to mine our mountains, and we said no, so they took the wells instead. That is how they listen." } },
    the_elements = { { id = "tp_the_elements", text = "The water spirits in the wells have gone quiet, and a quiet spirit is a sick one. Zarlman says they will speak again, and I want very much to believe him." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother's wells were sweet when we came to Mulgore, and they are bitter now. I walk to them every morning because I believe she will listen, if I keep asking." } },
    quilboar = { { id = "tp_quilboar", text = "The Bristleback have fouled the southern wells with their filth, and the gnolls have fouled the northern ones. I would like to know which is worse, and I would like it never to happen again." } },
    cairne = { { id = "tp_cairne", text = "Cairne sent me to watch the wells, and I have not given him good news in weeks. He listens patiently each time, and that makes it harder." } },
  },
}

P:NPC {
  key = "ahab", id = TODO_NPC("Ahab Wheathoof"), name = "Ahab Wheathoof",
  bible = "bibles/mulgore.md", role = "farmer", tier = "quest",
  communities = { "bloodhoof" }, temper = { "anxious" }, values = { "kind" },
  notices = { "pet" },
  impression = {
    first = "Ahab Wheathoof cannot go two sentences without asking after his dog Kyle. It is plain the scruffy creature is his best friend in all the world.",
    third = "{name} met Ahab Wheathoof, a kindly rancher by the lake near Bloodhoof whose dog Kyle has a habit of running off.",
  },

  greetings = {
    { id = "g_kyle", text = "Oh! Hello, traveler, you haven't seen a dog, have you? He's brown and scruffy, and he never sits still, and he stole a whole fish off Kauth's rack last week." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Have you seen any sign of him, any at all?" },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "That's a fine companion you have. Keep it close, and don't ever let it wander off." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Oh, well, nobody has. Kyle doesn't care what anyone is, living, dead or glowing, as long as they've got a treat. I suppose that makes him better than most folk, doesn't it?" } },
      choices = {
        { text = "He's right. Everyone deserves a kind welcome.", next = "BACK", reply = "He is, and I think that's why I love him so. Everyone deserves a wag of the tail and a kind word.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Dogs don't know any better. People should.", next = "BACK", reply = "Maybe they should, but they often don't, and Kyle never asks them to. I think I'd rather be like Kyle.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Would you? I'd be ever so grateful, because I've called and called and he won't come, and the only thing he ever came running for was a bit of tender wolf meat. Pray he's warm and fed, wherever he is, and pray he remembers the way home." } },
      choices = {
        { text = "A dog's spirit matters too. I'll pray for him.", next = "BACK", reply = "Thank you, that's ever so kind of you. I'm sure he'll feel it, wherever he's got to.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers are for people, Ahab, not for strays.", next = "BACK", reply = "Oh, well, I suppose you're right. I'll pray for him myself, then, and hope it's enough.", fx = { align = { light = -1 } } },
        { text = "Something else, Ahab.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Scruffy and brown and always hungry, with a tail that never stops wagging. He ran off after the smell of something tasty, and I'm afraid the wolves or the swoops might mistake him for supper, so a strong warrior keeping an eye out would ease my mind." } },
      choices = {
        { text = "I'll keep an eye out for Kyle, Ahab.", next = "BACK", reply = "Thank you, ever so much! He's scruffy and brown, and he'll come for a bit of tender meat.", fx = { align = { honor = 1 } } },
        { text = "A lost dog isn't a warrior's concern, Ahab.", next = "BACK", reply = "No, I suppose it isn't, and I'm sorry to have bothered you. If you see him, though, you'll tell me, won't you?", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Kyle wants to be found, I'm sure of it, he's just got his nose in something he shouldn't. He loves tender meat more than he loves me, the scamp, so if you see a scruffy tail wagging by the lake, that's my boy." },
      },
      choices = {
        { text = "I'll find him, Ahab. You have my word.", next = "BACK", reply = "Oh, thank you, thank you! I'll leave the door open for him, and for you.", fx = { align = { honor = 1 } } },
        { text = "If I find him, I'll expect something for my trouble.", next = "BACK", reply = "Oh, I've not got much, but I'll find something, I promise. Just bring him home.", fx = { align = { honor = -1 } } },
        { text = "What's Kyle like?", next = "kyle" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "If you can, you're a better mage than any I've heard of. Kyle doesn't answer to spells, he answers to tender meat, and he'll come running for a good bit of wolf if you leave it where he can smell it." },
      },
      choices = {
        { text = "Then I'll look the old way, for Kyle's sake.", next = "BACK", reply = "Thank you, he'll like that much better. A bit of tender meat by the lake, and he'll come running.", fx = { align = { light = 1 } } },
        { text = "Magic can find anything. I'll show you.", next = "BACK", reply = "Well, if you can, you're welcome to try. Just don't frighten him, he's a bit of a coward.", fx = { align = { light = -1 } } },
        { text = "What does Kyle look like?", next = "kyle" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "He might, because he walked right up to a wolf once and seemed to think they were friends, right up until the wolf disagreed. The druids say every beast knows its place on the plains, but nobody ever told Kyle, and I don't think I want anyone to." } },
      choices = {
        { text = "A dog belongs at home, Ahab. I'd bring him back.", next = "BACK", reply = "Thank you, that's what I want more than anything. The plains are no place for a scruffy little dog.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Maybe Kyle wants to run with the plains for a while.", next = "BACK", reply = "Oh, don't say that, please. He'll get eaten, and I'll be all alone.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Oh, no, please don't send it after him, because Kyle frightens easily and he'd never come home again. He'll come for tender wolf meat if anyone feeds him, so if you see him, give him a bite and he'll trot home on his own." },
      },
      choices = {
        { text = "I'll find him gently. No demons, I promise.", next = "BACK", reply = "Thank you, ever so much. He's a gentle soul, and he'd never forgive me if a demon found him.", fx = { align = { light = 1 } } },
        { text = "A demon would bring him home faster.", next = "BACK", reply = "It might, but he'd never come home again after. Please, just tender meat, and a kind word.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin! Have you seen Kyle? He's a scruffy dog, and I don't suppose the Light helps you find dogs, does it?" },
        { id = "h_default", key = true,
          text = "I'm Ahab Wheathoof, and I keep a little ranch by the lake. I kept a dog, too, Kyle, until he ran off, and he's never been gone this long." },
        { id = "h_kyle", tags = { "news" }, when = { questActive = TODO_QUEST("Kyle's Gone Missing!") },
          text = "If you find him, he'll be hungry; he's always hungry. Bring him something tasty and he'll follow you anywhere." },
        { id = "h_kyle_done", when = { questDone = TODO_QUEST("Kyle's Gone Missing!") },
          text = "He's home! Look at him, Kyle, sit, Kyle, sit, oh, he won't sit and I don't care one bit. He's home!" },
        { id = "h_fence", when = { questDone = TODO_QUEST("Kyle's Gone Missing!"), metBefore = true }, text = "Kyle chewed through the fence again, but he didn't go anywhere; he just likes chewing fences. I've stopped mending it." },
        { id = "h_watch", when = { questDone = TODO_QUEST("Kyle's Gone Missing!"), timeOfDay = "night" }, text = "He sleeps across the door now, like he's afraid I'll be the one to wander off. Silly dog." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "You're a shaman? Then maybe the spirits have seen my Kyle, because he's a scruffy little thing and he goes wherever his nose takes him." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! If you happen to see my dog Kyle while you're out fighting things, please don't fight him; he's only a little scruffy." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Would you say a prayer for my Kyle? He's only a dog, but I've a feeling the Earth Mother keeps an eye on dogs too." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid! You understand animals, don't you? If you meet a scruffy dog called Kyle out on the plains, please tell him I'm not angry and he can come home." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock! Have you seen my dog, Kyle? And, er, that isn't your demon eating something, is it?" },
        { id = "h_dd_gnolls", tags = { "news" }, when = { killed = { name = "Palemane", min = 15 } }, text = "The Palemane gnolls haven't come sniffing round the village since you went west after them, and Kyle has stopped growling at the dark. I don't like killing, but I do like my fences standing." },
        { id = "h_dd_mazz", when = { questDone = TODO_QUEST("Mazzranache") }, text = "Maur says you brought down that beast that's been stalking the plains, so Kyle and I can walk to the lake at dusk again. He still barks at every shadow in the grass, mind, but now the shadows are only shadows." },
      },
      choices = {
        { text = "Tell me about Kyle.", next = "kyle" },
        { text = "I'm good at finding things that don't want to be found.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "A mage might be able to find a lost dog.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What does Kyle look like, Ahab?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "I'll keep an eye out for him.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Shall I say a prayer for Kyle, Ahab?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Could my demon find Kyle for you, Ahab?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "I haven't seen Kyle, Ahab. I'm sorry.", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "It's only a dog.", next = "END", fx = { affinity = -2 } },
        { text = "My beast could follow Kyle's scent.", next = "hunter", when = { class = "HUNTER", pet = { type = "Beast" } } },
        { text = "The spirits might watch over a lost dog, Ahab.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Kyle might come to a druid, Ahab.", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "The gnolls won't trouble your fields for a while, Ahab.", next = "dd_gnolls", when = { killed = { name = "Palemane", min = 15 } } },
      },
      again = {
        { id = "h_again", text = "Anything else? Sorry, I keep looking at the lake shore in case he comes back, the way a cow watches for a strayed calf." },
      },
    },
    dd_gnolls = {
      lines = {
        { id = "dd_gnolls_1", text = "I hope not, because they took two sacks of grain last spring and Kyle nearly went after them alone, the silly thing. They sit up on Palemane Rock watching the village like hungry crows, and now there are fewer of them watching." },
      },
      choices = {
        { text = "They'd steal you blind given half a chance. They earned it.", next = "BACK", reply = "Maybe they did, and I won't argue with someone who went up there when I wouldn't. I'll sleep better, at least, and so will the dog.", fx = { align = { light = -1 } } },
        { text = "I'd sooner have scared them off than killed them.", next = "BACK", reply = "That's a kind thought, and Baine would like you for it. I'm not sure gnolls scare, though, and I'm glad I didn't have to find out.", fx = { align = { light = 1 } } },
        { text = "Something else, Ahab.", next = "BACK" },
      },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Could it? Oh, could it really? Here, this is the old blanket he sleeps on, so let {pet} have a good sniff. He likes the lake shore and the far end of the fields, and he never goes near the bluffs." } },
      choices = { { text = "We'll start at the lake.", next = "BACK", fx = { affinity = 3, trait = { kind = 1 } } } },
    },
    kyle = {
      lines = {
        { id = "k_pup", text = "Found him as a pup down by the lake, soaking wet and barking at a frog. He's been barking at things ever since. Best friend I've got." },
      },
      choices = { { text = "He sounds wonderful.", next = "BACK", fx = { affinity = 2 } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I hope they do, because I leave a bowl by the door every night and every morning it's still full. If the wind carries his scent anywhere, it's probably toward the wolves, and Kyle is no match for a wolf, though he'd never believe it." } },
      choices = {
        { text = "The spirits look after small, loyal things. He'll come home.", next = "BACK", reply = "I hope so, oh, I hope so. I'll leave the bowl by the door again tonight.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If the wolves got him, better to know and grieve now.", next = "BACK", reply = "Oh, please don't say that. I'll keep hoping, if it's all the same to you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Sorry, I can't think about anything else until Kyle's home, Earth Mother keep him." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "When the Faire came last, Kyle ran under one of the tents and came out wearing a hat. I never found out whose hat it was, and he still won't give it back." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother made dogs, I think, on one of her best days. Kyle is proof of that, even when he runs off." } },
    cairne = { { id = "tp_cairne", text = "Cairne once asked about Kyle, by name, and I nearly fainted. He is a great chieftain and a kind one, and he remembers what matters." } },
  },
}

P:NPC {
  key = "kauth", id = TODO_NPC("Innkeeper Kauth"), name = "Innkeeper Kauth",
  gender = "male",
  bible = "bibles/mulgore.md", role = "innkeeper", tier = "service",
  communities = { "bloodhoof" }, temper = { "warm" }, values = { "generous" },
  notices = { "weary", "drink" },
  impression = {
    first = "No traveller leaves Innkeeper Kauth's inn unfed, and he keeps bringing Mull stew that goes uneaten. He swears the bluff folk come down for his stew, not the view.",
    third = "{name} rested at Innkeeper Kauth's inn in Bloodhoof Village, where nobody leaves without a bowl of stew.",
  },

  greetings = {
    { id = "o_orcs_useful", when = { gossip = { topic = "orcs", stance = "useful" } }, text = "Krang Stonehoof's been growling about you all week, something about calling the orcs useful. He growls about everyone, so have some stew and don't let it spoil your appetite." },
    { id = "o_peace_war", when = { gossip = { topic = "peace", stance = "war" } }, text = "Baine's been quiet since you left, and word is you told him there'll be no peace with the humans. Eat something, at least, before you go off looking for a war." },
    { id = "g_inn", text = "Come in from the grass and the wind. There's stew, and a hide to sleep on, and the hide only smells a little of kodo." },
    { id = "g_home", when = { homeInn = { "Bloodhoof Village" } }, text = "Your sleeping hide is aired and ready. The wind is kind tonight." },
    { id = "g_away", when = { away = 14 }, text = "You've been out on the grass {away}, and I kept a pot on for you most nights anyway. Come in from the wind and eat." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The whole village talks of the help you've given us, so tonight the stew is yours for nothing. Don't tell the bluff folk." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Someone came through grumbling about you, and they left my stew half eaten. Whatever passed between you, the inn is a peaceful place." },
    { id = "g_fl", when = { flirt = true, chance = 0.4, ["not"] = { npcFlagBefore = "kau_fl_no" } }, text = "Oh, welcome, come in from the wind, and I'll, ah, I'll bring you a bowl from the bottom of the pot, where the best meat settles, though I'd thank you not to tell the others it's there." },
    { id = "g_fl_yes", when = { flirt = true, chance = 0.5, npcFlagBefore = "kau_fl_yes" }, text = "You came back! I hoped you might, and I've been stirring the pot all evening so the stew would be at its best, just in case." },
    { id = "g_fl_no", when = { flirt = true, chance = 0.3, npcFlagBefore = "kau_fl_no" }, text = "Welcome back, friend. A bowl and a hide, as always, and I'll not make things any more awkward than I did before." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look worn thin. Sit by the fire until the color comes back." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "The village brew is stronger than it tastes, and most learn that once." },
  },

  start = "hello",
  nodes = {
    fl = {
      lines = { { id = "fl_default", text = "Do I? I suppose I do, and I suppose you've noticed, which means I'm not as quiet about it as I thought. Forgive a plain innkeeper, friend, but when someone so fine walks in off the grass, the Earth Mother puts bread in my hands before I've thought it through." } },
      choices = {
        { text = "I don't mind, Kauth. The bread is lovely.", next = "fl_yes", fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "kau_fl_yes" }, clear = { "kau_fl_no" } } } },
        { text = "Are you trying to court me, Kauth?", next = "fl_ask" },
        { text = "A tauren your size, blushing? I like it, mon.", next = "fl_troll", when = { race = "Troll" } },
        { text = "That's kind, but I'm only passing through.", next = "BACK", fx = { trait = { reserved = 1 }, npcFlag = { set = { "kau_fl_no" }, clear = { "kau_fl_yes" } } }, reply = "Of course, of course, and the bread comes with the bowl regardless. Pay me no mind, friend." },
        { text = "Keep your bread, Kauth. I'm not interested.", next = "BACK", fx = { trait = { stern = 1 }, npcFlag = { set = { "kau_fl_no", "kau_fl_rebuff" }, clear = { "kau_fl_yes" } } }, reply = "Ah. Yes, I understand, and I'm sorry if I made you uneasy. The stew is still yours, and I'll keep to my side of the fire." },
      },
    },
    fl_ask = {
      lines = { { id = "fla_default", text = "I, well, yes, I think I might be, though I'm doing it badly, by the look on your face. The tauren take their time over such things, the way the grass takes its time, so you needn't answer me tonight." } },
      choices = {
        { text = "Take your time, Kauth. I'll keep coming back.", next = "fl_yes", fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "kau_fl_yes" }, clear = { "kau_fl_no" } } } },
        { text = "I'd rather we stayed friends, Kauth.", next = "BACK", fx = { trait = { reserved = 1 }, npcFlag = { set = { "kau_fl_no" }, clear = { "kau_fl_yes" } } }, reply = "Friends, then, and gladly. A friend at the fire is no small thing in Mulgore." },
      },
    },
    fl_troll = {
      lines = { { id = "flt_default", text = "I don't blush, it's only the fire, though I'll grant you're very tall for a troll and very bold for anyone. My grandmother used to say a laughing troll could charm a kodo out of its harness, and I'm beginning to see what she meant." } },
      choices = {
        { text = "Then consider yourself charmed, Kauth.", next = "fl_yes", fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "kau_fl_yes" }, clear = { "kau_fl_no" } } } },
        { text = "Your grandmother was wise. I'll leave you be.", next = "BACK", fx = { trait = { reserved = 1 }, npcFlag = { set = { "kau_fl_no" }, clear = { "kau_fl_yes" } } }, reply = "She was, and so are you, I think. Eat your stew, at least." },
      },
    },
    fl_yes = {
      lines = { { id = "fly_default", text = "Then I'll keep the bread warm and the best of the pot for you, and I'll try to say something clever next time instead of only staring. Walk with the Earth Mother, friend, and walk back this way whenever you can." } },
      choices = {
        { text = "I'll walk back soon, Kauth.", next = "BACK", reply = "The lake will still be singing against the shore, and I'll still be here." },
        { text = "Something else.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Mind? No, only curious. Some of the young braves will want to see the Light, and some of the old ones will keep their distance, since they've heard the orcs' stories of the camps. Sit, and let them look. That's how we learn about strangers." } },
      choices = {
        { text = "Let them look. I'll answer their questions.", next = "BACK", reply = "That's the spirit, friend. They'll be shy at first, but a good answer warms them faster than my stew.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'm not here to be gawked at, Kauth.", next = "BACK", reply = "Then sit by the back wall, and I'll keep the young ones away. Your stew will come all the same.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Mull does, though he'd never say so, because he walks to those wells sick at heart and comes back sicker, and he won't touch my stew. Braves come down from Bael'dun bruised from the dwarves' blasting too, so you'd not want for work." } },
      choices = {
        { text = "I'll look in on Mull. A heavy heart needs tending too.", next = "BACK", reply = "Thank you, friend, he needs it more than he'll admit. Bring him a bowl, too, if he'll take it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Mull's grief is his own. I'll tend the braves.", next = "BACK", reply = "That's fair, and the braves will be glad of you. Mull will come round in his own time.", fx = { align = { light = -1 } } },
        { text = "Something else, Kauth.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every young brave on the way down from Camp Narache, and plenty of orcs and trolls besides, now that we stand with the Horde. They eat like kodos and sleep like stones, and the next morning they're off to fight the gnolls or the centaur without so much as a thank you." } },
      choices = {
        { text = "Thank you for your fire, Kauth. It's appreciated.", next = "BACK", reply = "It's no trouble, friend, and it's nice to be thanked for once. Come back whenever the road gets long.", fx = { align = { honor = 1 } } },
        { text = "An inn is for sleeping. I'll be gone at dawn.", next = "BACK", reply = "Most are, and that's no fault of yours. The fire will be here when you pass back this way.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Plainstrider and kodo, mostly, and a prairie wolf when the hunters are feeling generous. The tauren waste no part of a beast, so I make broth from the bones and send the hides up to Una on the bluffs, and nothing goes to waste in my kitchen." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Plainstrider and kodo, mostly, and a prairie wolf when the hunters are feeling generous. And there's always a bowl for your {pet}. Every beast that walks into Bloodhoof gets fed, same as everyone else." },
      },
      choices = {
        { text = "I'll bring my game here, and waste none of it.", next = "BACK", reply = "Thank you, friend, the broth will be the better for it. Nothing goes to waste in my kitchen, and nothing in yours.", fx = { align = { honor = 1 } } },
        { text = "I'll keep my game for myself. I caught it.", next = "BACK", reply = "That's fair, and I'll not argue with it. Still, if you ever have more than you can eat, you know where the pot is.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Easy to rob and hard to carry, friend, because it's iron and it's hot and it's bigger than you. Besides, nobody in Bloodhoof needs to steal from me, since I feed anyone who asks, and that's the best lock any inn ever had." },
      },
      choices = {
        { text = "That's a good lock. I'd never rob a kind host.", next = "BACK", reply = "Then you're welcome at my table any night, and I'll stop counting the ladles.", fx = { align = { honor = 1 } } },
        { text = "A full belly never stopped a real thief.", next = "BACK", reply = "Maybe not, but it's never failed me yet. Eat your stew, friend, and we'll see.", fx = { align = { honor = -1 } } },
        { text = "What's in the stew today?", next = "stew" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Your imp gets a bowl when the Earth Mother herself comes to supper and asks for one. I don't feed things from the Twisting Nether, friend, so it can wait outside the door and you can eat for the both of you." },
      },
      choices = {
        { text = "Fair. It waits outside, and I'll eat its share.", next = "BACK", reply = "Ha, that's the spirit, and I'll pile it high. The imp can sulk in the cold.", fx = { align = { light = 1 } } },
        { text = "It's hungry, and it's coming in whether you like it.", next = "BACK", reply = "Then it'll find my ladle waiting, friend, and I swing it hard. Outside, please.", fx = { align = { light = -1 } } },
        { text = "What goes into the stew?", next = "stew" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Now and then, on their way out to the wells with Mull or to the Venture mine, to see what the goblins have done to the ground. They come back quiet and angry, so I feed them, because I've never seen anyone stay angry through a second bowl." } },
      choices = {
        { text = "The druids should face the goblins openly and drive them off.", next = "BACK", reply = "That's what Mull wants too, and I'd not stand in his way. Just eat first, so you've got the strength for it.", fx = { align = { honor = 1 } } },
        { text = "Quiet anger is better spent spoiling the goblins' drills by night.", next = "BACK", reply = "That's a quieter road, and maybe a smarter one. Eat first, though, because spoiling drills is hungry work.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Troll mages, mostly, on the road up to Thunder Bluff, and now and then a Forsaken who won't eat a thing. The trolls eat like kodos and the Forsaken don't eat at all, so I've learned to cook for both by cooking too much, and nobody pays for seconds." },
      },
      choices = {
        { text = "I'll pay my way, Kauth, like any other guest.", next = "BACK", reply = "That's kind of you, and I'll take it gladly. Most of the young braves pay me in promises.", fx = { align = { honor = 1 } } },
        { text = "If the bowl's on offer, I'll take it free.", next = "BACK", reply = "It's on offer, friend, and I'll not take it back. Eat your fill, and remember Bloodhoof kindly.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken carrying the Light. No traveller leaves my inn unfed, though I admit I'm not sure what feeds you." },
        { id = "h_default", key = true,
          text = "I'm Kauth. Travelers come through here on the way to the bluffs, and the Earth Mother would never forgive me if one left my inn hungry." },
        { id = "h_task", when = { questActive = TODO_QUEST("A Task Unfinished") },
          text = "There's a task left undone that weighs on me. You'll carry it further than I can." },
        { id = "h_view", when = { metBefore = true }, text = "The bluff folk come down for my stew and say they're here for the view. The view's fine, but the stew's better." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The wind's dropped, so listen: that's the lake against the shore, the best sound in Mulgore." },
        { id = "h_mull", when = { heardLine = "mull.h_default" }, text = "Mull's been to every well again, hasn't he? I bring him stew, and he forgets to eat it, so I bring more." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman at my table! Sit near the fire, since your kind always seem to be listening to it, and I'll bring you a bowl of stew." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, and I can hear your stomach from here. Sit down, friend, and let me feed you before you go off and fight something." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll have game to share, I hope, because my pot's always open to a fresh plainstrider." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Sit and eat, because I've never met a healer yet who remembers to feed themselves, and stew mends what the Light forgets." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, by the grass seed on your boots. Sit down, because the druids who come down from Elder Rise always forget to eat, and I take that personally." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage at my inn! Sit, and I'll bring you stew, because spellwork burns through a body like a fire through grass." },
        { id = "h_dd_kyle", tags = { "news" }, when = { questDone = TODO_QUEST("Kyle's Gone Missing!") }, text = "Ahab came through my door laughing last night, which he hasn't done since that pup ran off, and he told everyone at my fire who brought Kyle home. Sit down, friend, and let me shake the hand that found him." },
        { id = "h_dd_deaths", when = { deaths = { min = 8 } }, text = "You've the grey look of someone who has walked back from the spirit healer more than once. Sit by the fire and eat something warm, because a body needs feeding after a road like that." },
      },
      again = {
        { id = "h_again", text = "Is there something more you need, friend? Sit while you ask it." },
        { id = "h_again2", text = "Ask what you like. The fire is warm, and I am in no hurry." },
      },
      choices = {
        { text = "What's in the stew?", next = "stew" },
        { text = "I'd guess the elders still bless the hearths in Bloodhoof.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Your stew pot would be easy to rob, Kauth.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do many warriors pass through Bloodhoof, Kauth?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What do you cook from the plains, Kauth?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Does my imp get a bowl too, Kauth?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Someone in Bloodhoof must need a healer, Kauth.", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do the druids from Elder Rise often stop here, Kauth?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Do mages come through Bloodhoof often, Kauth?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "The tauren must mind a paladin at the inn, Kauth.", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Do you remember the night the braves brought me in, Kauth?", next = "xorig_orphan", when = { origin = "tauren_razormane_orphan" } },
        { text = "You keep bringing me extra bread, Kauth.", next = "fl", when = { flirt = true, ["not"] = { npcFlagBefore = "kau_fl_rebuff" } } },
        { text = "I hear Ahab has been telling everyone about Kyle.", next = "dd_kyle", when = { questDone = TODO_QUEST("Kyle's Gone Missing!") } },
        { text = "Just a meal, thank you.", next = "END" },
      },
    },
    dd_kyle = {
      lines = {
        { id = "dd_kyle_1", text = "Everyone, twice, and the hunters a third time when they came in late. He sat right where you're standing with that dog's head in his lap and said Kyle smelled the wolf meat before he ever saw your face, and that it was the best trick he'd ever heard of." },
        { id = "dd_kyle_night", when = { timeOfDay = "night" }, text = "He's asleep by now, and so is Kyle, across the door like a log. Ahab told the whole inn who brought that dog home, and I'll tell you what I told him: a village is only as happy as its saddest farmer, and Bloodhoof is a little happier tonight." },
      },
      choices = {
        { text = "He should keep that dog on a rope from now on.", next = "BACK", reply = "I said the same, and Ahab looked at me as if I'd asked him to tie up the wind. He'll keep a closer eye on him, though, which is the best we'll get.", fx = { align = { order = 1 } } },
        { text = "Let the pup roam. He always finds his way home.", next = "BACK", reply = "With a little help, he does! You're as soft as Ahab is, and I mean that kindly, because the plains could use more of it.", fx = { align = { order = -1 } } },
        { text = "Something else, Kauth.", next = "BACK" },
      },
    },
    xorig_orphan = {
      lines = {
        { id = "xorp_default", text = "I remember you wouldn't eat for two days, and on the third you ate three bowls and fell asleep against my kettle. The whole village claimed you after that, though I always thought the kettle had the best claim. Do you ever go back to the Barrens, to where it happened?" },
      },
      choices = {
        { text = "Sometimes. The Razormane still owe me a debt.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "No. Mulgore is my home now, and that's enough.", next = "BACK", fx = { affinity = 2 } },
        { text = "Is the kettle still here, Kauth?", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    stew = {
      lines = {
        { id = "s_roots", text = "Tallstrider, wild roots, and whatever the hunters bring in that they can't name. Don't ask more than that; it spoils the taste." },
      },
      choices = { { text = "Smells good.", next = "END", fx = { affinity = 1 } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Old Zarlman blesses everything from the well to my stewpot, and I let him, because it only costs me a bowl. Mull won't touch the stew, but he says the fire burns cleaner since, and I'll take a compliment wherever I find one." } },
      choices = {
        { text = "Old ways keep a village whole. I'm glad he blesses it.", next = "BACK", reply = "It does, and I'm glad of it too. Zarlman's blessings cost me a bowl, and they've never once let me down.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A good fire needs good wood, not blessings.", next = "BACK", reply = "It does, and I chop it myself, thank you. But I'll take the blessings too, they don't weigh anything.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I hear a little of everything and keep less, like a river keeps the rain. Ask Baine." } },
    cairne = { { id = "tp_cairne", text = "Cairne eats my stew whenever he comes down from the bluff, and he always asks for more. That is why I keep the pot full." } },
    thrall = { { id = "tp_thrall", text = "The Warchief ate at this inn once, and he said my stew was better than anything in Orgrimmar. I believe him, because orcs don't lie about food." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "When the Darkmoon Faire comes to Mulgore, every bed in Bloodhoof is full and every pot is empty. I spend the whole week cooking, and I love every minute of it." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken don't eat, which is a pity, because they look like they could use it. I offer them stew anyway, out of habit, and they always say no." } },
  },
}

-- Forever's camping: the adventurer camped just outside Bloodhoof Village.
P:NPC {
  key = "kaga", id = TODO_NPC("Kaga Wildhoof"), name = "Kaga Wildhoof",
  bible = "bibles/mulgore.md", role = "questgiver", tier = "quest",
  communities = { "bloodhoof" }, temper = { "warm" }, values = { "generous", "brave" },
  notices = { "craft" },
  impression = {
    first = "Kaga Wildhoof wanders and camps and comes home to Mulgore when the wind turns. She has met more friends at campfires than in any town, she says, and after sitting at hers I can see why.",
    third = "{name} shared a fire with Kaga Wildhoof, a wandering tauren camped outside Bloodhoof who teaches the art of a good camp.",
  },

  greetings = {
    { id = "g_fire", text = "Earth Mother's blessing, traveler. Come and sit; the fire is big enough for two." },
    { id = "g_back", when = { metBefore = true }, text = "Back at my fire, are you? Good. Sit, and tell me where the road took you." },
  },

  notice = {
    { id = "n_leather", cat = "craft", when = { profession = "Leatherworking" },
      text = "You work hides? Then you'll want to learn the tent. A night by a fire with a tent close by is a night well spent." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "We wandered a long time and met many peoples, and all of them prayed to something, and yours just happens to shine. I'd sooner hear how it answers you than argue about whether it should." } },
      choices = {
        { text = "It answers when I serve the living. Gladly.", next = "BACK", reply = "That's a fine answer, and I'd be glad to hear it more often. Sit a while, if you like, and tell me more.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It answers. That's all I need to know.", next = "BACK", reply = "Then it's a better answer than most prayers get. Sit, friend, and warm your hands.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "A troll one in Sen'jin Village, who prayed to the loa so loudly the crabs scattered, and a Forsaken one in the Barrens, who never once raised her voice. They prayed to different things in different ways, and both of them shared my fire, and that's all I ask of anybody." } },
      choices = {
        { text = "Faith is faith, however it's spoken. I agree.", next = "BACK", reply = "That's how I see it, and I've shared my fire with every kind of faith there is. Sit, and tell me yours.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some prayers are best kept away from your fire.", next = "BACK", reply = "Maybe some are, and I've met a few I'd rather not hear again. Still, I'd rather risk it than sit alone.", fx = { align = { light = -1 } } },
        { text = "Something else, Kaga.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Up into the Stonetalon Mountains, out across the Barrens and down to the edge of Thousand Needles, and I've come back to Mulgore every time the wind turned. I've seen warriors guard caravans and warriors raid them, and I'll tell you the first kind sleeps a good deal better." } },
      choices = {
        { text = "Then I'll be the kind who guards caravans.", next = "BACK", reply = "Good, then you'll sleep well, as I said. The caravans need more like you.", fx = { align = { honor = 1 } } },
        { text = "The raiders eat better, I'd wager.", next = "BACK", reply = "For a while, maybe, but they never sleep well, and they rarely grow old. I'll take the guard's supper any night.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Then you're missing the best part of camping, friend, which is the fire and whoever wanders up to it. I've met more good friends at a campfire than I've lost to bandits, and that wager beats sleeping cold and alone in the dark." },
      },
      choices = {
        { text = "Perhaps you're right. I'll light a fire tonight.", next = "BACK", reply = "Good, and if you light it near here, I'll bring a story. The fire's half the camp, and the company's the other half.", fx = { align = { light = 1 } } },
        { text = "Friends find you too easily. Better cold and alone.", next = "BACK", reply = "Then I hope the cold is kind to you, friend. My fire will be here if you ever change your mind.", fx = { align = { light = -1 } } },
        { text = "What is it you love about camping?", next = "why" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Ha, that's true, and I once watched a troll mage light a campfire with a snap of his fingers. Still, striking flint makes a fire feel earned, so I'll keep doing it the old way, though I won't refuse your spark if the wood is wet." },
      },
      choices = {
        { text = "The old way has its place. I'll strike flint.", next = "BACK", reply = "Good, it makes the fire feel like yours. Here, I've a spare flint, if you need one.", fx = { align = { order = 1 } } },
        { text = "Flint is a waste of time when a spell works faster.", next = "BACK", reply = "Faster, yes, and I'll not argue it. But I'll still strike mine, and you can laugh at me if you like.", fx = { align = { order = -1 } } },
        { text = "What do you love about camping?", next = "why" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "More every year, and that's new, because when I was a calf there were no druids among the tauren at all, only stories of the night elves in their faraway forest. Now I meet them at every other campfire, and they ask the fire's leave before they light it, which I've started doing too." } },
      choices = {
        { text = "The old ways came back to us for a reason. Keep them close.", next = "BACK", reply = "They did, and I'm glad to see it. The night elves gave us something, and the druids keep it well.", fx = { align = { order = 1 } } },
        { text = "A druid should learn from the open road, not just from teachers.", next = "BACK", reply = "Ha, that's what I've been saying for years! Come sit at my fire, druid, and learn something.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "I share it with anyone who sits quietly and tells a good story, and I've met a warlock or two on the wandering roads. The Chief would frown at me, but I've found the folk who carry dark things often want a warm fire more than anyone." },
      },
      choices = {
        { text = "Then I'll tell you a story and keep the demon quiet.", next = "BACK", reply = "Then you're welcome here, and so's your story. The demon can listen from the dark.", fx = { align = { light = 1 } } },
        { text = "My demon eats when I say, not last.", next = "BACK", reply = "Then it eats when you say, and not from my pot. Keep it fed and quiet, and we'll get on fine.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin by my fire! I've met all sorts at campfires, but I've never met one who glowed. Sit down." },
        { id = "h_default", key = true,
          text = "I'm Kaga Wildhoof. I wander, I camp, and I come back to Mulgore when the wind turns, and Chief Hawkwind of Camp Narache and I go back a long way." },
        { id = "h_bundle", tags = { "news" }, when = { questActive = TODO_QUEST("The Adventurer") },
          text = "A bundle from Chief Hawkwind? He never forgets a kindness. Tell him he owes me nothing, and that I said so twice." },
        { id = "h_outdoors", when = { questActive = TODO_QUEST("The Great Outdoors") },
          text = "Sit by the fire and let it work on you. The rest comes when it comes." },
        { id = "h_narache", when = { metBefore = true }, text = "I came past Camp Narache on the way in, where the young ones were fighting boars with sticks. I gave them a few pointers, and a few bandages." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman at the campfire is good luck, the old wanderers used to say, because the fire burns brighter beside one of you. Sit down, and we'll test the saying." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Sit by my fire a while, because I've met warriors on every road I've ever walked, and they always have the best stories." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde at my campfire! I've shared fires with orcs, trolls and once a very lost goblin, but never a priest, so sit and tell me who you pray to." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid! I once shared a fire with one of Hamuul's students out past the Red Rocks, and she spent most of the night as a bear because she said the ground felt warmer that way." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock, at my campfire? Sit down, then, but tell your demon it eats last." },
      },
      choices = {
        { text = "You seem to love camping.", next = "why" },
        { text = "My people camped under a different sky.", next = "skyborne", when = { race = "Skyborne" } },
        { text = "I hunt as I travel. Does that suit a camp?", next = "hunter", when = { class = "HUNTER" } },
        { text = "The wandering bands must have kept shamans on the long road.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I prefer camps with no fire, where nobody finds me.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "A mage never needs flint to start a fire.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Where have your roads taken you, Kaga?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "You must have met a few priests on your travels.", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Have you met many druids on the roads, Kaga?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "I'd guess you don't share your fire with warlocks.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What do the wandering tauren make of the Light, Kaga?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Earth Mother keep you.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Something else? Throw a stick on the fire while you think of it, and not the one with the grub in it; that's supper." },
      },
    },
    skyborne = {
      lines = { { id = "sk_default", text = "Did they? I'd love to hear how a fire behaves where the wind is a spirit and not just weather. Down here it only wants to blow my sparks into the grass, and I have to talk it out of that every night." } },
      choices = { { text = "Ask it nicely. The wind listens.", next = "BACK", fx = { affinity = 2 } } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "It suits it best of all, because a hunter brings the supper and keeps the watch. Every camp I've shared with a hunter has eaten well and slept soundly." } },
      choices = { { text = "Then I'll bring the supper.", next = "BACK", fx = { affinity = 2 } } },
    },
    why = {
      lines = { { id = "w_default", text = "Every fire is a small village for a night. Whoever passes can sit at it. I've met more friends at campfires than in any town." } },
      choices = { { text = "Teach me.", next = "BACK", fx = { affinity = 2, learn = { "camping" } } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Every band had one, and ours sang to the earth each night before we slept, so we'd know where the water hid. Now Mulgore is home and the shamans sit up on the bluffs, and I miss hearing that singing out on the plains." } },
      choices = {
        { text = "The bluffs keep the songs safe for everyone, and that's worth something.", next = "BACK", reply = "It is, and I'll not say otherwise. Still, I miss them out here, under the open sky.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A shaman belongs on the open road, singing for the people.", next = "BACK", reply = "That's what I think too, though I'd never say it to the elders. Come and sing for me sometime, if you're a shaman.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    camping = { { id = "tp_camping", text = "Start with a fire, which any cook can make, and then add what your hands know how to make." } },
    centaur = { { id = "tp_centaur", text = "The centaur roam the plains much as I do, and we have met at more than one campfire. Some of them are reasonable, and some will kill you for your blanket, so I sleep with one eye open." } },
    quilboar = { { id = "tp_quilboar", text = "The quilboar camp like animals, all mud and thorns, and they never put out their fires. I've followed their smoke more than once to find a good place to stay away from." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I've followed the Faire from Mulgore to the human lands and back, and I've never seen a stranger crowd anywhere. They are the best campfire company I know." } },
    thrall = { { id = "tp_thrall", text = "The Warchief walked a long road before he found his home, and so did I. I think he would like my campfire, if he ever came by." } },
    everlook = { { id = "tp_everlook", text = "I wandered as far as Everlook once, in Winterspring, and I learned that snow is a poor blanket. The goblins there sold me a better one at a terrible price." } },
    _none = { { id = "tp_none", text = "I don't know. The wind hasn't told me, and the wind tells me most things eventually." } },
  },
}
