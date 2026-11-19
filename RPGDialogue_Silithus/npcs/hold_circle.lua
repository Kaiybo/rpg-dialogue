-- Cenarion Hold: the druids who watch the Twilight's Hammer, the craftsman who fools its masters, and a Watcher of the bronze. Voice: bibles/silithus.md
local P = RPGDialogueAPI:Pack("rpgd.silithus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "bor_wildmane", id = TODO_NPC("Bor Wildmane"), name = "Bor Wildmane",
  bible = "bibles/silithus.md", role = "questgiver", tier = "quest",
  communities = { "cenarion_hold" }, temper = { "jovial", "steady" }, values = { "brave", "loyal" },
  notices = { "race", "class" },

  impression = {
    first = "He collects the cult's secret papers and can't read a word.",
    third = "{name} met Bor Wildmane, the younger of the two Wildmane brothers who watch the Twilight's Hammer from Cenarion Hold.",
  },

  greetings = {
    { id = "o_th_pity", when = { opinion = { twilights_hammer = "pity" } }, text = "Ha, somebody says you feel sorry for the crazies! I don't, but I'll let you read their papers to me, if you like, since I can't make out a word of them." },
    { id = "o_fan_distrust", when = { gossip = { topic = "fandral", stance = "distrust" } }, text = "Ha, Mar'alith says you think Staghelm's proud and cold! That makes two of us, or three if you count Huum, though he'd never say it out loud." },
    { id = "g_default", text = "Ho there! Come to help keep an eye on the crazies? Pull up a bit of sand; it's no Mulgore grass, but it'll do." },
    { id = "g_back", when = { metBefore = true }, text = "There they are! I keep hearing your name from the western camps, and never in a happy voice." },
    { id = "g_council", when = { questDone = TODO_QUEST("Dukes of the Council") }, text = "I hear about your fights with the Abyssal Council all the time, {name}. Keep it up!" },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A brother of the plains! Big brother Huum will want to say something solemn at you; let him, it makes him happy." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid! Good; you can talk to the land with Huum, and I'll do the part where we hit the cultists." },
  },

  start = "hello",
  nodes = {
    xpt_bor_wildmane = {
      big = true,
      lines = { { id = "xpt_bor_wildmane_default", text = "Because we listen to the land, and the land here is screaming about what's buried under it. The crazies want that thing awake, and every druid in the Hold is one more voice telling the world to let it sleep." } },
      choices = {
        { text = "Some cultists might be saved. Not all of them chose this.", next = "BACK", reply = "Huum says the same, and he's wiser than me, so if you find one who wants to come home, bring them to the Hold and we'll see.", fx = { align = { light = 1 } } },
        { text = "Every cultist we find dies. That's all there is to it.", next = "BACK", reply = "You sound like me before my brother sat me down and talked at me for a whole night, but I won't pretend I'll miss many of them.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Ha, I'd show you, but the scholars took them off to study, and I only kept the ones with the funniest drawings! There's pages on the wind stones and something called the Abyssal Council, and I'd much rather you burned their camps than read their scribbles." } },
      choices = {
        { text = "Their writing could reveal their plans. It must be studied.", next = "BACK", reply = "That's what the scholars say too, and they get very cross when I bring them a page with soup on it, so I'll be more careful.", fx = { align = { order = 1 } } },
        { text = "Burn the camps, then. Knowledge like that should die with them.", next = "BACK", reply = "Ha, I like the way you think, friend, but Huum would never let me hear the end of it if I burned something the scholars wanted.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Their papers, mostly, the secret ones they carry in their robes! I can't read a word of them, but the Hold's scholars can, and every one you bring me tells us a little more about what they're doing at their wind stones, and I keep score, so you'd better beat the last fellow." } },
      choices = {
        { text = "I'll bring every paper I can. The cult must be stopped.", next = "BACK", reply = "That's the spirit, friend, and every scrap you bring is one more thing the crazies have to write out all over again.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Keeping score? I'll take the challenge and win it.", next = "BACK", reply = "Oh, you'll try, friend, but I've got a head start and very long arms, so you'd better start running.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Oh, they leave plenty, because crazies never think anybody's watching, and they drag their robes through the sand like brooms. Follow the robe-marks west and you'll find a camp, and bring me back any papers you find, even if neither of us can read them." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Oh, plenty, because they drag their robes through the sand like brooms, so follow the robe-marks west and you'll find a camp. And if {pet} likes chasing crazies, I'll count its kills too, because I keep score of everything." },
      },
      choices = {
        { text = "I'll scout first and report. Rushing in helps nobody.", next = "BACK", reply = "Huum would like you, friend, because he says the same thing every time I come back covered in sand and somebody else's robe.", fx = { align = { order = 1 } } },
        { text = "I'll hit their camp the moment I find it.", next = "BACK", reply = "Now that's my kind of plan, friend, though bring back the papers before you set fire to anything, or Huum will skin me.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Something under the sand, or something behind the wall, or maybe just the end of everything, because they seem happy about all three. Huum says they've given their hearts to something old, and my brother is rarely wrong about such things." } },
      choices = {
        { text = "Whatever they serve, I'll pray against it, Bor.", next = "BACK", reply = "Then the Earth Mother walks with you, priest, and my brother will be glad to hear somebody's praying on our side.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Old powers can be useful, even to a priest.", next = "BACK", reply = "Useful to who, friend? Because the crazies thought the same, and now they spend their nights dancing on graves.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Calling them up and binding them with those wind stones, as far as we can tell, and the elements don't like it one bit. Huum says the land screams every time they do it, and Huum doesn't exaggerate, so I believe him, even if all I hear is wind." } },
      choices = {
        { text = "Forcing spirits into service is a crime. The cult must answer.", next = "BACK", reply = "That's how Huum puts it, and he's right, because the land doesn't scream for nothing, and it's screaming a great deal.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Bound elements make a fine weapon. Maybe we should learn the trick.", next = "BACK", reply = "Ha, don't let my brother hear you say that, friend, because he'll hold you by the horns and talk at you till sunrise.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "No idea, friend, that's the joke! I bring them in by the armful and Huum frowns at them, and somewhere in all that scribbling are the names of the crazies' leaders, so keep bringing them." } },
      choices = {
        { text = "I'll bring you every paper I find.", next = "BACK", reply = "That's the way, friend, and I'll keep a pile of them by my bedroll so Huum has something to frown at in the mornings.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Maybe I'll read them first.", next = "BACK", reply = "Read them, then, if you can, but don't start chanting any of it, because the last fellow who did that grew a very funny rash.", fx = { align = { order = -1 } } },
        { text = "That's a lot of paper.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Not demons, I think, but something worse, things from the earth and the sky that shouldn't be awake. My brother says the land weeps when they call them, and I believe him, because the sand shakes out there." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Not demons, I think, though your servant is staring at the sand as if it hears something beneath it. Things from the earth and the sky that should not be awake, my brother says, and the land weeps when they are called, so perhaps your creature knows more of it than we do." },
      },
      choices = {
        { text = "Then we'll stop them before they wake anything else.", next = "BACK", reply = "That's what I like to hear, friend, so go on, and come back with their papers and your hide in one piece.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'd like to see what they summon.", next = "BACK", reply = "You'd like it less than you think, friend, because the sand shakes for days afterward, and my brother doesn't sleep at all.", fx = { align = { light = -1 } } },
        { text = "That's grim.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Big brother says they want to call up the elemental lords through the old stones out there, and they talk about it like other folk talk about the weather. I don't understand half of it, but I understand a crazy with a dagger, and I don't go past the old stones after supper anymore, not even for a dare." } },
      choices = {
        { text = "Some might still listen to reason. Try that before the dagger.", next = "BACK", reply = "Huum would say that too, and maybe one or two of them would listen, but I've not met that one yet.", fx = { align = { light = 1 } } },
        { text = "Crazies don't listen. Bring them down and burn their papers.", next = "BACK", reply = "My thinking exactly, friend, and if you bring me the papers, I'll find a good fire to put them on, after the scholars have had a look.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_bor_wildmane", tags = { "news" }, when = { party = { class = "DRUID" } },
          text = "Ho, a druid in your company! {companion} and I can trade stories about the crazies, because the Twilight's Hammer hate druids more than they hate anyone." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Twilight", min = 40 } },
          text = "Ha, I've been keeping score, and you're well ahead of the last fellow! The Twilight crazies are fewer around the wind stones, and the ones left are jumping at every shadow." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "Ha, a mage! You'll be able to read those Twilight papers, won't you, because I can't make heads or tails of them, and I'm fairly sure half are upside down." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "Ha, a paladin! You'll be wanting to know about the Twilight crazies, I expect, because your sort can't abide a cult, and neither can I, so we'll get on splendidly." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "Ha, a shaman! You'll know better than anyone what those Twilight crazies are doing to the elements out west, and my brother and I would love to hear it from someone who can feel it." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue! Big brother says you lot can read the crazies' papers before they know they've lost them, and I'd believe it, because I can't read a word of them myself." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock, eh? The crazies out west summon all sorts of things, and I'd love to know whether your demon could tell me what they're doing." },
        { id = "h_default", key = true,
          text = "We've got more than one enemy in Silithus, friend. While everyone's watching the bugs, my big brother and I keep a close eye on the Twilight's Hammer crazies out west, and believe me, they need watching, the way a herd needs watching when the wolves are near." },
        { id = "h_texts", tags = { "news" }, when = { questActive = TODO_QUEST("Secret Communication") },
          text = "Those little papers the cultists carry, covered in gibberish? Bring me a stack. Every one I've got is one they haven't." },
        { id = "h_texts_done", when = { questDone = TODO_QUEST("Secret Communication") },
          text = "Still bringing me papers? Good, because I've a whole chest of them now, and the crazies must be wondering why nobody answers their letters." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "Ha, a priest of the Horde! You'll have to tell me whether those Twilight crazies pray to anything at all, because their papers read like a madman's shopping list." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Big brother says the crazies out west hate your Light worse than they hate the bugs, so you and I are going to get along fine." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! Good, the crazies leave tracks all over the western dunes, and I bet you can follow them better than my big brother can." },
        { id = "h_dd_geolords", tags = { "news" }, when = { questDone = TODO_QUEST("Twilight Geolords") }, text = "Huum says you struck down the geolords in the western camps, and for once my brother sounded almost cheerful about a killing. The crazies will be a while finding new ones to stand on those rocks and chant." },
      },
      again = {
        { id = "h_again", text = "What else, friend? Huum's busy being serious with the Earth Mother, so I've got time." },
        { id = "h_again2", text = "Ask away! I like talking more than my brother does." },
      },
      choices = {
        { text = "What are the Twilight's Hammer doing to the elements out west?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Why watch the cult, with the bugs so close?", next = "crazies" },
        { text = "What do you take off the cultists?", next = "texts" },
        { text = "Tell me about your brother.", next = "brother" },
        { text = "Someone must command the cult out here.", next = "council", when = { questDone = TODO_QUEST("Aurel Goldleaf") } },
        { text = "It must be hard fighting so far from Mulgore.", next = "tauren", when = { race = "Tauren" } },
        { text = "Let me break some cultist heads, Bor.", next = "x_warrior", when = { class = "WARRIOR" } },
        { text = "What do the cult's papers say?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "I'd guess the Twilight's Hammer use demons.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What do the Twilight's Hammer want in Silithus?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do the Twilight's Hammer pray to anything, Bor?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do the Twilight's Hammer leave much of a trail, Bor?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What do you need from a paladin against the cult, Bor?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I'd like to see the papers you've collected, Bor.", next = "xmage", when = { class = "MAGE" } },
        { text = "Why do the cultists hate druids so much, Bor?", next = "xpt_bor_wildmane", when = { party = { class = "DRUID" } } },
        { text = "Huum seemed pleased about the geolords?", next = "dd_geolords", when = { questDone = TODO_QUEST("Twilight Geolords") } },
        { text = "I'll bring you whatever I find on them.", next = "END", fx = { standing = { cenarion_hold = 1 } } },
      },
    },
    dd_geolords = {
      lines = {
        { id = "dd_geolords_1", text = "Pleased for Huum, which means he lit a second stick of sage and said the spirits were quieter. My brother listens to the land and I listen to the cultists, and between us we usually hear the same thing a day apart, but this time we both heard you." },
      },
      choices = {
        { text = "Killing them was the only way to stop the rituals.", next = "BACK", reply = "I'd say the same, and I'd say it louder than Huum would. The crazies don't stop chanting for anything short of a blade.", fx = { align = { light = -1 } } },
        { text = "I'd rather have captured them and learned their plans.", next = "BACK", reply = "Now you sound like me on a good day! Bring me one alive someday, and I'll have him talking before the sun goes down.", fx = { align = { light = 1 } } },
        { text = "Something else, Bor.", next = "BACK" },
      },
    },

    crazies = {
      lines = { { id = "c_default", fx = { learn = { "twilights_hammer" } },
        text = "Because a cult that wants the world to end is camped next door to the biggest bug nest in Kalimdor, and I don't like those odds. They chant, they build camps around their stones, and they're up to something with the crystals, and nobody else here has the time to find out what." } },
      choices = {
        { text = "What do you think they're planning?", next = "crazies_plan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crazies_plan = {
      lines = { { id = "cp_default", text = "Huum thinks it's to do with the land, something deep and old. I think it's to do with them being crazy, and I'm usually right, but he's usually right about the deep and old things." } },
      choices = { { text = "Maybe you're both right.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    texts = {
      lines = { { id = "t_default", text = "Coded messages, how their camps talk to each other. I can't read a word, but that's not the point: the more we take out of their pockets, the less they can say to each other." } },
      choices = {
        { text = "Silence them. A cult that can't talk can't plan.", next = "BACK", reply = "That's the whole idea, friend, and every bundle you take out of their robes is one less secret they can whisper.", fx = { align = { order = 1 }, opinion = { twilights_hammer = "silence" } } },
        { text = "Let some through. We'd learn more listening.", next = "BACK", reply = "Ha, that's a sneaky thought, and Huum might even like it, though I'd rather they said nothing at all.", fx = { align = { order = -1 }, opinion = { twilights_hammer = "listen" } } },
        { text = "I know a hermit who reads their code.", next = "texts_ortell", when = { questDone = TODO_QUEST("The Twilight Lexicon") } },
        { text = "Something else.", next = "BACK" },
      },
    },
    texts_ortell = {
      lines = { { id = "to_default", fx = { learn = { "ortell" } },
        text = "The deserter? Ha! Then I'll keep stacking them, and maybe one day we'll sit down with that hermit and read the whole lot. I bet half of it's complaints about the food." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brother = {
      lines = { { id = "b_default", text = "Huum's older, and wiser, and he'll tell you so if you stand still long enough. He listens to the spirits and the land, and I listen to him, and between us we've got the whole thing covered." } },
      choices = {
        { text = "You two must disagree now and then.", next = "brother_argue" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brother_argue = {
      lines = { { id = "ba_default", text = "Every night! He says the land's the bigger problem, I say the crazies are, and Aurel Goldleaf tells us we're both giving her a headache. Then we go out and fight whichever one's closer." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    council = {
      lines = { { id = "co_default", fx = { learn = { "abyssal_council" } },
        text = "Not the cultists, it turns out, but the things they pray to through their wind stones: the Abyssal Council, templars and dukes and lords of fire and water and earth and air. The crazies are just the hands; Aurel's found a way to reach the heads." } },
      choices = {
        { text = "How do you fight a lord of the elements?", next = "council_fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    council_fight = {
      lines = { { id = "cf_default", text = "Carefully, and with lots of friends! Bring me what you take from them, the crests and signets and scepters, and I'll see the Circle knows who to thank." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tauren = {
      lines = { { id = "ta_default", text = "Some days. Then I remember the plains are safe because we're out here, and I hit the next cultist a little harder." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_warrior = {
      lines = {
        { id = "xw_default", text = "Ha! That's the spirit, friend, and there are plenty of heads out west in the Twilight camps, though do bring me their papers before you break anything else. Big brother says strike the leaders and spare the followers, but between you and me, the followers hit back too." },
      },
      choices = {
        { text = "Leaders first, then. Your brother's right about that.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "I'll hit whatever hits me first.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the crazies, and I know what they carry. Ask me something." } },
    background = { { id = "tp_bg", text = "Bor Wildmane, little brother of Huum, druid of the Circle, son of Mulgore and professional cultist-watcher. That's it, that's the story!" } },
    advice = { { id = "tp_ad", text = "Check every cultist's pockets. You'd be amazed what crazy people write down." } },
    twilights_hammer = { { id = "tp_hammer", text = "Crazies with a plan, which is the worst kind of crazies.", next = "crazies" } },
    abyssal_council = { { id = "tp_council", text = "Elementals with titles. Ask Aurel Goldleaf; she's the one who figured out how to knock on their door." } },
    cairne = { { id = "tp_cairne", text = "Cairne would enjoy hunting these crazies, I think, the way he enjoys any good hunt. He would not like the smell, and neither do I." } },
    silithid_hives = { { id = "tp_silithid_hives", text = "The bugs come up out of the hives in waves, and the crazies dance around them like it's a festival. One day the bugs will eat the crazies, and I will laugh." } },
    ortell = { { id = "tp_ortell", text = "The hermit in the hills used to be a crazy, and now he's a nervous man in a cave. I trust him more than the crazies, but less than my own boots." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother is angry with this desert, and I don't blame her. I'd be angry too if crazies danced on my back all day." } },
    _none = { { id = "tp_none", text = "No idea, friend! Ask Huum; he knows the deep stuff, the kind the Earth Mother whispers instead of shouts." } },
  },
}

P:NPC {
  key = "huum_wildmane", id = TODO_NPC("Huum Wildmane"), name = "Huum Wildmane",
  bible = "bibles/silithus.md", role = "questgiver", tier = "quest",
  communities = { "cenarion_hold" }, temper = { "steady", "gentle" }, values = { "wise", "patient", "devout" },
  notices = { "race", "class" },

  impression = {
    first = "He says the land of Silithus is weeping.",
    third = "{name} met Huum Wildmane, the elder Wildmane brother, who hears the spirits of Silithus grieving.",
  },

  greetings = {
    { id = "g_default", text = "The spirits of this place call out, {name}. Listen, and you'll hear them." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and the land seems a little quieter for it, like the plains after the rain has passed." },
    { id = "g_vyral", when = { questDone = TODO_QUEST("Vyral the Vile") }, text = "Twilight's Run is silent now. The spirits thank you, though they have no words for it." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Child of the Earth Mother. You feel it too, I think: the ground here is grieving, under all the sand." },
    { id = "n_spirit", cat = "class", when = { class = { "SHAMAN", "PRIEST" } },
      text = "You speak to things beyond the living, as I do. Then you'll understand when I say this desert is crowded with the dead." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I would have them stopped, and the Earth Mother does not care how. The cult's Templars gather around their wind stones and call to something that should never be called, and if a quiet blade ends that call sooner than a war band, the land will be grateful." } },
      choices = {
        { text = "Then I'll end them quietly, and take no joy in it.", next = "BACK", reply = "That is the right heart for the work, and the land will remember that you took no pleasure in it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll strike from shadow, and enjoy every minute.", next = "BACK", reply = "Take your pleasure, then, but do not let the land see it. The spirits here have watched the Twilight's Hammer enjoy their work, and they cannot tell one smile from another.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because the spirits of this land are frightened, and they remember a war of light and fire long ago. The cult dances among their bones, and they cannot tell one bright thing from another, so strike the cult hard, but do not burn what you do not need to." } },
      choices = {
        { text = "I'll strike only the cult, and leave the land in peace.", next = "BACK", reply = "Then the spirits will know you, and they will not mistake you for the cult when you walk among their bones.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "War leaves scars. I'll not hold back for the land's comfort.", next = "BACK", reply = "War leaves scars, yes, but the land carries them long after the warriors are gone, so think on whose wound it will be.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They are not the same, though many warriors never learn the difference until the land has bled dry around them. The Twilight's Hammer fight upon Silithus for their own ends, and you may strike them down, but only if you remember the land is not your enemy." } },
      choices = {
        { text = "I fight for the land, not for myself.", next = "BACK", reply = "Good. Walk lightly in the dunes south of here, where the sand opens without warning, and the land may yet decide to hold you up.", fx = { align = { light = 1 } } },
        { text = "A fight's a fight. The land can look after itself.", next = "BACK", reply = "It has been trying, warrior, for a thousand years, and it grows tired, so I would ask you to carry a little of its weight.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Their camps foul the ground and their rituals shake the earth, and the creatures that once wandered freely now flee or turn savage. When you hunt here, take only what you need, for this land has little left to give." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Their camps foul the ground and their rituals shake the earth, so the creatures here flee or turn savage. Your {pet} walks with the old spirits close about it, so listen when it grows uneasy." },
      },
      choices = {
        { text = "I take only what I need from this land.", next = "BACK", reply = "You hunt as the old ways teach. The beasts that remain will learn your scent and stop running from it.", fx = { align = { light = 1 } } },
        { text = "This desert is cursed. I'll hunt as I please.", next = "BACK", reply = "It is not cursed, only wounded, and a wounded beast lashes out, so walk carefully, hunter, or it will lash at you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "The cult's summonings, which tear at the elements and leave the earth raw, and the swarm, which hollows it out from below. A shaman can soothe the spirits, but a priest can pray for the living who must stand upon such wounded ground." } },
      choices = {
        { text = "Then I'll pray for them, Huum, and fight beside them.", next = "BACK", reply = "Then you will be a friend to the living and the land both, and I have met very few of those in this desert.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Wounded ground is fertile ground for shadow. I'd make use of it.", next = "BACK", reply = "I hear the shadow in your voice, priest, and I would ask you to look elsewhere, because this land has suffered enough.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "The spirits do not judge, they only remember, and they remember the Twilight's Hammer calling things up from the deep. Prove to them you are different, and they may speak again in your presence." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "The spirits do not judge, they only remember, and they have drawn far back from us now that your demon stands here. They remember the Twilight's Hammer calling things up from the deep, so prove to them you are different, and they may come close enough to speak again." },
      },
      choices = {
        { text = "I'll prove it. The spirits deserve peace.", next = "BACK", reply = "Speak gently, then, and act kindly. Sit at the Hold's edge some evening, and in time they may come close enough to show you what they have seen.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I don't need the spirits' approval.", next = "BACK", reply = "You may not need it, but you walk upon their land. I have seen a dune swallow a whole cult camp that thought the same.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'll think on it.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Softly, and without demands, as you would speak to an elder at the fire. The land of Silithus has many stories, and most of them are sad, so listen more than you speak." } },
      choices = {
        { text = "I'll listen with respect.", next = "BACK", reply = "Then they will speak to you. Some of what the sand has kept is very old, and some of it is still angry.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The arcane doesn't need the spirits' permission.", next = "BACK", reply = "Perhaps not, but the spirits will remember you as one more voice that did not ask, and they are tired of such voices.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "I'll keep that in mind.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Perhaps, {name}, but not soon and not by us alone. The swarm poisons the soil and the Twilight's Hammer poisons the wind, and until both are driven out, the best we can do is keep a few green places alive and remember." } },
      choices = {
        { text = "Healing must start now, even while we fight.", next = "BACK", reply = "You speak wisely, druid. Every green place we keep alive now is a seed for the healing that comes after, and Bor has already killed two of my seedlings by watering them with ale.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Burn the hives and salt them. Healing can wait.", next = "BACK", reply = "Salted earth heals for no one, druid, and I would not leave Silithus more barren than the cult has already made it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue. You walk softly, as the land likes, and I think the cult's leaders will not hear you until you are already among them." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin. The land of Silithus weeps, and your Light shines bright in a place that has been dark for a long time, so I ask you to shine it gently." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock walks among us, and the spirits of Silithus fall silent. You carry something that does not belong in this land, and the land knows it." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, {name}. The spirits of the land are wary of the arcane, but they are not unkind, and they will listen if you speak with respect." },
        { id = "h_default", key = true,
          text = "The spirits of Silithus call out to us, {name}. The land weeps, for the Earth Mother has a long and sorrowful story to tell here, and the Twilight's Hammer would add a terrible new chapter to it." },
        { id = "h_geolords", tags = { "news" }, when = { questActive = TODO_QUEST("Twilight Geolords") },
          text = "The geolords lead the rituals in the western camps. Strike at them, for they are the heads of the serpent, and the body will thrash without them." },
        { id = "h_vyral", tags = { "news" }, when = { questActive = TODO_QUEST("Vyral the Vile") },
          text = "Vyral the Vile hides in Twilight's Run, a cave in the northeast where the cult keeps its secrets. Bring me his signet ring, and go carefully; the cave is full of horrors." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. The land of Silithus weeps, {name}, and perhaps your prayers can reach the places where its tears have dried to sand." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. Even the scorpids hear a warrior's boots coming, {name}, and the land asks whether you come to defend it or only to fight upon it." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. The spirits of the beasts here are restless, {name}, for the crystals and the cult have driven them from their old paths." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, and welcome among your own. The Circle needs every claw and every root it can find in Silithus, for the land here has forgotten what it was." },
        { id = "h_dd_texts", when = { questDone = TODO_QUEST("Secret Communication") }, text = "My brother tells me you have been bringing him the cult's papers by the armful, and he reads them aloud to me at night in a terrible voice. The spirits grow uneasy at the words, but Bor says every page brings us closer to their masters." },
      },
      again = {
        { id = "h_again", text = "Ask what you will, {name}; the spirits have waited this long, and they can wait a little longer." },
        { id = "h_again2", text = "Go on, {name}. There is time, though less than there was, as the old bulls of the herd always said." },
      },
      choices = {
        { text = "Can Silithus ever be healed, Huum?", next = "xdruid", when = { class = "DRUID" } },
        { text = "What story does the land tell?", next = "spirits" },
        { text = "What is the cult doing in the west?", next = "geolords" },
        { text = "Your brother calls them crazies.", next = "brother", when = { heardLine = "bor_wildmane.h_default" } },
        { text = "The dead here are restless. Can they be helped?", next = "spirit_help", when = { class = { "PRIEST", "SHAMAN" } } },
        { text = "Who can help me reach the cult's masters?", next = "aurel", when = { questDone = TODO_QUEST("Vyral the Vile") } },
        { text = "My people speak with the loa, not the Earth Mother.", next = "x_troll", when = { race = "Troll" } },
        { text = "The spirits must judge me for my power.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "How should a mage speak to the spirits?", next = "xmage", when = { class = "MAGE" } },
        { text = "What wounds the land here most, Huum?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Defending and fighting seem much the same to me, Huum.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "How has the cult disturbed the beasts of Silithus, Huum?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Why should I shine the Light gently here, Huum?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would you have me strike the cult's leaders unseen, Huum?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "May the Earth Mother watch over you.", next = "END", fx = { affinity = 1 } },
      },
    },

    spirits = {
      big = true,
      lines = { { id = "s_default", fx = { learn = { "ahn_qiraj" } },
        text = "Of a war fought here long before my people walked the plains, and of a great wall raised to end it. The dead of that war never left, and now the hives grow loud again, and the cult dances among the bones, and the spirits are afraid." } },
      choices = {
        { text = "Afraid of what?", next = "spirits_fear" },
        { text = "The dead should stay dead. Let them rest.", next = "BACK", reply = "That is my wish too, and I sing to them each night, though they are restless, and the cult's dancing wakes them.", fx = { align = { light = 1 } } },
        { text = "The dead can serve us yet, if they know what's coming.", next = "BACK", reply = "They may know already, and perhaps that is why they are restless, but they have fought enough, and I would not ask more.", fx = { align = { light = -1 }, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirits_fear = {
      lines = { { id = "sf_default", text = "Of being woken. Of something behind the wall that was never fully asleep. They will not say more, and I don't press them; a frightened spirit is like a frightened child, and must be soothed before it can speak." } },
      choices = { { text = "Then soothe them, Huum.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    geolords = {
      lines = { { id = "g_default2", fx = { learn = { "twilights_hammer" } },
        text = "They perform rituals day and night around their stones, and I believe their work is tied to the red crystals pulsing in the sand. We don't yet know what they intend, but we needn't know a serpent's plans to cut off its head." } },
      choices = {
        { text = "Who leads them?", next = "geolords_vyral" },
        { text = "Something else.", next = "BACK" },
      },
    },
    geolords_vyral = {
      lines = {
        { id = "gv_default", text = "Here, the geolords, and above them a man called Vyral, who keeps to a cave the cult calls Twilight's Run. Above Vyral, I suspect there is something that is not a man at all." },
        { id = "gv_done", when = { questDone = TODO_QUEST("Vyral the Vile") },
          text = "Vyral is dead, and the cult has been dealt a blow it won't easily shrug off. But a signet ring speaks of a master, and we've learned since that the master isn't mortal." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brother = {
      lines = { { id = "b_default", text = "Bor calls everything he can't understand 'crazy', and he says it so cheerfully that I don't correct him. He is braver than I am, and less careful, and I'm grateful every day that he's at my side." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    spirit_help = {
      lines = { { id = "sh_default", text = "Some can be freed, as Layo Starstrike frees the dead of Southwind. Others are bound too tightly to this place, and we can only bear witness, and remember them, and make sure their war was not for nothing." } },
      choices = {
        { text = "I'll pray for them before I leave.", next = "BACK", fx = { affinity = 2, trait = { pious = 1 } } },
        { text = "Then I'll remember them.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    aurel = {
      lines = { { id = "a_default", fx = { learn = { "abyssal_council" } },
        text = "Aurel Goldleaf, our craftsman. The cult answers to a power called the Abyssal Council, which speaks through the wind stones in their camps, and Aurel believes a clever enough disguise could put you face to face with it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_troll = {
      lines = {
        { id = "xt_default", text = "The loa, the Earth Mother, the spirits of the wind; perhaps they are many voices in one song, young one, and perhaps they are not. But I would hear what your loa say of this place, for the land here weeps, and I would know whether every spirit hears it." },
      },
      choices = {
        { text = "The loa say the dead here are not at rest.", next = "BACK", fx = { affinity = 2 } },
        { text = "The loa keep their own counsel, elder.", next = "BACK", fx = { affinity = -1 } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know what the land remembers, and some of what it fears. Ask, and I'll tell what I may." } },
    background = { { id = "tp_bg", text = "A druid of the Circle, from Mulgore, who came because the spirits called. My brother came because I did." } },
    advice = { { id = "tp_ad", text = "Walk softly in the old ruins. The dead notice footsteps." } },
    twilights_hammer = { { id = "tp_hammer", text = "They dance on graves and call it worship. I'll see their camps empty before I leave this desert." } },
    southwind = { { id = "tp_southwind", text = "A grieving place. Layo does good work there, the kind that is never thanked." } },
    cthun = { { id = "tp_cthun", text = "Some names are older than the earth and should be left in the earth, and that is one. The land shivers when the cultists speak it." } },
    silithid_hives = { { id = "tp_silithid_hives", text = "The land weeps around the hives, and the weeping grows louder. I listen to it every morning and pray for patience." } },
    cairne = { { id = "tp_cairne", text = "Cairne is a great chief, and he would tell you to honor every life, even the silithid. I try to, but I find it very hard." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother is wounded in Silithus, and the wound is deep under the sand. We are bandages, and we are not enough." } },
    ortell = { { id = "tp_ortell", text = "The hermit Ortell has seen the inside of the cult, and his fear is a gift to us. I hope he can forgive himself someday." } },
    _none = { { id = "tp_none", text = "The spirits haven't spoken of that to me. Perhaps Bor has heard something; he hears everything eventually, like a young calf with his ears always turning." } },
  },
}

P:NPC {
  key = "aurel_goldleaf", id = TODO_NPC("Aurel Goldleaf"), name = "Aurel Goldleaf",
  bible = "bibles/silithus.md", role = "questgiver", tier = "quest",
  communities = { "cenarion_hold" }, temper = { "steady", "sharp" }, values = { "patient", "cunning", "curious" },
  notices = { "class", "craft" },

  impression = {
    first = "Her disguises are good enough to fool elemental lords.",
    third = "{name} met Aurel Goldleaf, the Cenarion Circle's craftsman, who forges the Twilight's Hammer's own regalia against it.",
  },

  greetings = {
    { id = "g_default", text = "Mind the bench, please. Everything on it is either sharp or very, very old, and when a kaldorei calls a thing old, you may believe her." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you. Come and look at this clasp and tell me if you'd believe it." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You've the look of someone who has worn another person's coat before. Good; my work goes further on someone who knows how to wear it." },
    { id = "n_craft", cat = "craft", when = { profession = { "Blacksmithing", "Leatherworking", "Tailoring", "Jewelcrafting", "Engineering" } },
      text = "Calluses in the right places. You make things, too, so you'll know the difference between something that looks right and something that is right." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I hope not, or my work is wasted. Still, a shaman who listens to stone might know whether the stone I'm working wants to be a lie, and I'd value that." } },
      choices = {
        { text = "A lie is a lie, even one told to the cult.", next = "BACK", reply = "You're a hard judge, and perhaps right, but I'd rather tell a lie to a cult than tell the truth at a funeral.", fx = { align = { honor = 1 } } },
        { text = "A disguise that stops the cult is no sin.", next = "BACK", reply = "That's what I tell myself while I work, and it helps to hear a dwarf say it, since dwarves are honest to a fault.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I can make the robe and the medallion, but the walk is yours to change, and warriors are the hardest to teach. You hold your shoulders like you expect a blow, and a true cultist holds them like he expects a reward." } },
      choices = {
        { text = "I'd sooner face them openly than hide behind a disguise.", next = "BACK", reply = "Openly, then, and with my blessing, though I'll keep a robe in your size on the shelf in case you change your mind.", fx = { align = { honor = 1 } } },
        { text = "A disguise is just another weapon. I'll learn the walk.", next = "BACK", reply = "Good, then stand up straight and stop scowling, because a true cultist walks like he already owns the world.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I could try, but the cult keeps few animals, and a disguised wolf among them would draw more eyes than an honest one. The better trick is to hide yourself well and let your beast be what it is, since a stray in the desert surprises no one." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "I could try, but the cult keeps few animals, and a disguised beast would draw more eyes than an honest one. I confess {pet} would look very fine in a small Twilight robe, though, if only the cult were the sort to be fooled by it." },
      },
      choices = {
        { text = "Hiding my beast feels like a lie. I'd rather not.", next = "BACK", reply = "Then don't, and let your beast stay what it is, because an honest wolf is better than a nervous disguise.", fx = { align = { honor = 1 } } },
        { text = "Deception wins wars. Hide whatever you must.", next = "BACK", reply = "Spoken like someone who's done it before, and I'll make you a cloak that'll fool even a Templar at ten paces.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Their priests worry me least, because they see only what they wish to see; it is the things they serve that worry me. A disguise fools eyes, but what the Twilight's Hammer calls up looks past eyes, and I'd want a priest's blessing on anyone who wore my work into their camps." } },
      choices = {
        { text = "Then I'll bless the medallion before anyone wears it.", next = "BACK", reply = "I'd welcome that, and I'll admit I've wished for it, because a blessed medallion might hold up longer under those eyes.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Deceit is its own prayer, Aurel. Your craft needs no blessing.", next = "BACK", reply = "Perhaps it is, but I'll take your blessing on the work anyway, because I've seen what looks past disguises.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Not if I've done my work properly, and I have. The stones answer to the cult's medallion and robes, not to the heart beneath them, so whatever speaks through them is either very old or very foolish, and I have no wish to learn which." } },
      choices = {
        { text = "Deceiving the elements feels wrong, even against the cult.", next = "BACK", reply = "It feels wrong to me too, sometimes, but I'd rather the elements were fooled than the land burned.", fx = { align = { honor = 1 } } },
        { text = "A good lie in a good cause. Make it convincing.", next = "BACK", reply = "It will be convincing, I promise you, because every stitch and every rune has been copied twice and checked three times.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Some of their rituals look much like yours, from what the druids tell me, and a forgery must match every detail. If you see a sigil I've copied badly, say so, and I'll fix it before it gets someone killed." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Some of their rituals look much like yours, from what the druids tell me, and a forgery must match every detail. Your demon has been reading my sigils over my shoulder this whole time, which is unsettling, but if either of you sees one I've copied badly, say so before it gets someone killed." },
      },
      choices = {
        { text = "I'll help. A good forgery saves lives.", next = "BACK", reply = "Then come and look at my sigils, and tell me where I've gone wrong, because a mistake here costs more than coin.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Forgery's dishonest work, even for a good cause.", next = "BACK", reply = "Dishonest, perhaps, but the Twilight's Hammer are far worse, and I've found I can sleep beside that particular sin.", fx = { align = { honor = 1 } } },
        { text = "I'll take a look.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Honest, no, but I'd call it just, which isn't the same thing, and the Twilight's Hammer have told far bigger lies to far more people. Still, I understand if a paladin would rather knock on the front door, and some days I wish I could too." } },
      choices = {
        { text = "I'd rather walk in as myself. Lies wear on the soul.", next = "BACK", reply = "I understand, and I'll not press you, though the front door of a cult camp tends to have a lot of blades behind it.", fx = { align = { honor = 1 } } },
        { text = "Cunning saves lives. A good disguise beats a hundred swords.", next = "BACK", reply = "I've always thought so, and I'm glad to hear it from someone who's handled a hundred swords and still believes it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Things that look like nothing much, mostly, which is what makes them such a nuisance to make. They want tools that don't scar the land and blades that don't shine in the sun, and once a whole crate of bronze stakes for the Hold's tents, which still puzzles me." } },
      choices = {
        { text = "Make what they ask. The Circle knows its business.", next = "BACK", reply = "They do, I think, though I'll admit I sometimes wonder why they want a spade that makes no sound.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Ask why. A craftsman should know what his work is for.", next = "BACK", reply = "I do ask, and they tell me about half of it, which is more than most craftsmen get, so I count myself lucky.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" }, text = "A shaman of the Horde. The druids say your kind hear the earth as they do, in a rougher dialect, and if that's so, perhaps you'll tell me whether the stone I'm working wants to be a lie." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. I make masks good enough to fool an elemental duke, so I notice faces, and yours looks as if it has prayed over a great many of the dead." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock. The cultists' medallions I forge would fool their masters, I think, but a warlock's eye might see through them, so tell me if they look wrong to you." },
        { id = "h_default", key = true,
          text = "The Circle has learned many of the earth's secrets since Malfurion first walked the Dream, and a craftsman would do well to listen to these druids. I listen, and then I make what they need, which lately has been a great many lies in metal and cloth." },
        { id = "h_sent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Aurel Goldleaf"), days = 3 } },
          text = "So you're the one who'll stand against the Abyssal Council. Then listen closely, because the next part is all about not being yourself." },
        { id = "h_dukes", when = { questActive = TODO_QUEST("Dukes of the Council") },
          text = "A large brilliant shard and three of the templars' crests, and I'll have a medallion of station that would fool the cult's own officers. Bring them, and I'll do the rest." },
        { id = "h_discovery", tags = { "news" }, when = { questActive = TODO_QUEST("Goldleaf's Discovery") },
          text = "Huum told you true: I think I can call down one of the Council's lords. Sit, and let me explain how badly this could go." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, and a disguise is the last thing you'd wear, I imagine, because your kind would rather be seen and struck than hidden and safe." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. Your bearing would give you away in any cult camp, I'm afraid, for no cultist I've studied ever stood that straight." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. Your companion would be a problem if I ever had to disguise you, for I have yet to make a cult robe for a beast." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid of the Circle! Then you're kin to my best customers, and I'll treat you as well as I treat them, which is to say fairly and without haste." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman of the Alliance. The druids say shamans hear the earth as they do, in a rougher dialect, and I'd like to hear that dialect for myself." },
      },
      again = {
        { id = "h_again", text = "What else? I can talk and work at once; I have had a few centuries to practise." },
        { id = "h_again2", text = "Ask on. My hands don't need my mouth." },
      },
      choices = {
        { text = "What do druids want from a smith?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Can the wind stones tell a cultist from a disguise?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "That looks like careful work, Aurel.", next = "craft" },
        { text = "Who commands the Twilight's Hammer?", next = "council" },
        { text = "Sending me in disguise hardly seems honourable.", next = "honor" },
        { text = "I've worn a false face before.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Why not an illusion instead of a disguise?", next = "x_mage", when = { class = "MAGE" } },
        { text = "Do the Twilight's Hammer use warlock magic?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Is it honest, fooling the cult with your forgeries?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would your disguises fool the cult's own priests, Aurel?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Could you disguise a warrior well enough to fool the cult?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Could you make a disguise for a beast, Aurel?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Can the wind stones tell a cultist from a disguise?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll leave you to your bench.", next = "END" },
      },
    },

    craft = {
      lines = { { id = "c_default", text = "A medallion of station: the badge the cult's middle ranks wear to speak through the wind stones. Put it on with the rest of their trappings, touch a stone, and whatever answers will think you're one of its servants." } },
      choices = {
        { text = "And if it doesn't believe me?", next = "craft_risk" },
        { text = "Something else.", next = "BACK" },
      },
    },
    craft_risk = {
      lines = { { id = "cr_default", text = "Then it will be very angry, very quickly, and very close. That's why it has to be perfect, and why I don't let anyone rush me." } },
      choices = {
        { text = "Take all the time you need.", next = "BACK", fx = { affinity = 2, trait = { patient = 1 } } },
        { text = "I'll be ready for the anger either way.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    council = {
      lines = { { id = "co_default", fx = { learn = { "abyssal_council" } },
        text = "We thought it was men like Vyral, but the cult answers to something older: the Abyssal Council, elementals that speak through the wind stones in the camps. Templars at the bottom, dukes above them, and lords at the top, whom only the cult's own high leaders may approach." } },
      choices = {
        { text = "So we climb the ranks, one disguise at a time.", next = "council_climb" },
        { text = "Something else.", next = "BACK" },
      },
    },
    council_climb = {
      lines = { { id = "cc_default", text = "Exactly so. Each one you fell gives me the pieces to fool the next: a crest, a signet, a ring of lordship. It's a ladder made of their own regalia, and I find that rather satisfying." } },
      choices = { { text = "So do I.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    honor = {
      lines = { { id = "ho_default", text = "Is it honourable to let a cult call fire down on a desert because I was too proud to tell a lie? I've thought about it, and I sleep well." } },
      choices = {
        { text = "Deceiving deceivers is fair play.", next = "BACK", reply = "That's how I see it too, and it helps to know I'm not the only one at the Hold who thinks so.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd still rather face them openly, blade drawn.", next = "BACK", reply = "Then go with my blessing, and I'll sew you a cloak that's honest through and through, if a little less useful.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue = {
      lines = { { id = "r_default", text = "Then you know folk notice the walk long before they notice the coat. Wear my medallion like you've worn it for years, and the stones will never know." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_mage = {
      lines = {
        { id = "xm_default", text = "Because the Council's servants can smell a spell the way you'd smell smoke, and a mage hidden behind an illusion might as well carry a lantern on their head. Good cloth, the right medallion and a steady face hide a person better than any magic I know." },
      },
      choices = {
        { text = "Craft over spellwork, then. This once.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'd still trust my magic over your stitching.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know how things are made, and how to make them look like something else. Ask." } },
    background = { { id = "tp_bg", text = "A craftsman of the Circle. Before that, a craftsman of other things, which I'll keep to myself, as craftsmen do." } },
    advice = { { id = "tp_ad", text = "Never trust a perfect copy. The real thing always has a flaw." } },
    abyssal_council = { { id = "tp_council", text = "Templars, dukes and lords, and each wants to be obeyed. That's their weakness.", next = "council" } },
    silithid_hives = { { id = "tp_silithid_hives", text = "The hives have a geometry to them, did you know? I study it the way a jeweller studies a gem, and I wish I didn't find it beautiful." } },
    ortell = { { id = "tp_ortell", text = "Ortell's notes on the cult's medallions were sloppy and frightened, but he got every detail right. Fear makes some people careful." } },
    elune = { { id = "tp_elune", text = "I made jewelry for the priestesses of Elune in Darnassus, once, before the Circle asked for disguises instead. I miss working with moonsilver." } },
    _none = { { id = "tp_none", text = "Not my craft, I'm afraid. Try the Wildmanes, and may Elune light your way to them." } },
  },
}

P:NPC {
  key = "baristolth", id = TODO_NPC("Baristolth of the Shifting Sands"), name = "Baristolth of the Shifting Sands",
  bible = "bibles/silithus.md", role = "questgiver", tier = "quest",
  communities = { "cenarion_hold" }, temper = { "steady", "cold" }, values = { "patient", "wise" },
  notices = { "race", "class" },

  impression = {
    first = "He speaks of a thousand-year-old promise as though it were yesterday's.",
    third = "{name} met Baristolth of the Shifting Sands, a strange night elf at Cenarion Hold who keeps a very old promise.",
  },

  greetings = {
    { id = "g_default", text = "Look behind you, mortal, and see how the hive stirs." },
    { id = "g_back", when = { metBefore = true }, text = "You again. The sands have shifted a little since you were last here." },
    { id = "g_risen", when = { questDone = TODO_QUEST("What Tomorrow Brings") }, text = "It is as it should be. My watch nears its end." },
  },

  notice = {
    { id = "n_kaldorei", cat = "race", when = { race = "NightElf" },
      text = "One of my own people, though you would not know my face. We have both forgotten much, you and I, but I was made to remember." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid of the Circle. Druids stood on this sand once before, beside the Brood, and some of them were very brave." },
  },

  start = "hello",
  nodes = {
    xcl_aq40 = {
      big = true,
      lines = { { id = "xcl_aq40_default", text = "My watch was to remain as long as I must, and I find I do not yet know whether I must. The thing in that temple whispered to the Qiraji for longer than your kingdoms have had names, and something that old does not die the way a mortal dies." } },
      choices = {
        { text = "Then we keep watching. Patience won this war, not haste.", next = "BACK", reply = "Patience, yes, and you have learned more in a single season than most of your kind learn in a lifetime.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "It's dead. Leave the sands and live your own life.", next = "BACK", reply = "It is dead, perhaps, but I have been wrong before about such things, and I would rather watch a while longer.", fx = { align = { order = -1 } } },
        { text = "What did you see here a thousand years ago?", next = "xcl_aq402" },
      },
    },
    xcl_aq402 = {
      lines = { { id = "xcl_aq402_default", text = "I saw the Scarab Wall rise, and young Valstann Staghelm fall before it, and the dragons bind the swarm behind the wall with their own strength. I remember all of it, because remembering is what I was made for, and today I may finally lay some of it down." } },
      choices = {
        { text = "Lay it down, then. You've earned the rest.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The sands, the hive, and the wall the kaldorei raised to hold back what lies behind it. I was told to remain as long as I must, and so I watch for the day the sands shift again, and I would rather the eyes that watch beside me were patient ones." } },
      choices = {
        { text = "I'll be patient, then, and watch with you.", next = "BACK", reply = "Then you will watch with me, mortal. It is not idleness, whatever the young ones at the Hold think; it is only waiting with open eyes.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Watching gets nothing done. I'd rather act.", next = "BACK", reply = "Action has its place, mortal, but those who acted too soon a thousand years ago filled the graves at Valor's Rest.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I have seen it carried into many battles, mortal, and I have seen it carried out again by fewer hands. Time does not care for faith, but it remembers those who keep their promises, and I made one here a thousand years ago that I keep still." } },
      choices = {
        { text = "Then I'll keep my oaths as you keep yours.", next = "BACK", reply = "Then you and I understand each other. The Brood has kept its oath here for a thousand years, and it has never once been easy.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Promises bind only those foolish enough to make them.", next = "BACK", reply = "Then you have never kept one, mortal, and I would not wish on you the weight of discovering why it matters.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A thousand years past I stood among many, and I fell among many, and a bronze dragon's breath bound me to watch where I would otherwise have died. The courage of those who held that day is why the wall still stands, and I remember every one of them." } },
      choices = {
        { text = "I'd hold the line as they did, whatever the cost.", next = "BACK", reply = "They would be glad to hear it, those who held that day, and I will remember that you said it.", fx = { align = { order = 1 } } },
        { text = "Holding lines buys time. Breaking the enemy ends wars.", next = "BACK", reply = "You speak as a young warrior speaks, and perhaps you are right, but the enemy behind this wall was never broken, only held.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "By watching the sand where nothing walks, for it shifts when the hive stirs below, as a pool shivers before the rain. The Brood taught me to watch for it, and I have watched for a thousand years, and it shifts more now than ever." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "By watching the sand where nothing walks, for it shifts when the hive stirs below, and it shifts more now than ever. Your {pet} feels it already, I think, for it will not lie flat upon this ground." },
      },
      choices = {
        { text = "Some threats are too great to hunt. Watch, and warn.", next = "BACK", reply = "You speak with the patience of the Brood, mortal. I have not heard that from one of your kind since the Hold was raised.", fx = { align = { order = 1 } } },
        { text = "Then strike the hive now, before it rises.", next = "BACK", reply = "Many said that, a thousand years ago, and they are buried now beneath the very sand you would strike.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Little alone, and much together, as those who stood at the wall learned a thousand years ago. Heal those who hold the line, mortal, and do not let the whispers from beneath the sand persuade you that the dark is kinder." } },
      choices = {
        { text = "I'll heal those on the line, and close my ears to whispers.", next = "BACK", reply = "Then you will do more good than you know. A heart busy with bandages has no room left for whispers.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Whispers can be heard without being obeyed. I'll listen.", next = "BACK", reply = "So say all who are eventually persuaded, mortal, and I would rather you did not test that wisdom on my watch.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Those who built the hives, and what they serve, which is older than the sand itself. A thousand years ago the wall was raised to hold them, and every grain of this desert remembers the price that was paid for it." } },
      choices = {
        { text = "Then the wall must hold, whatever it costs.", next = "BACK", reply = "It will hold, mortal, as long as those who guard it remember why it was raised, and that is all I can ask.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Walls only delay. Better to strike before they wake.", next = "BACK", reply = "You may be right, mortal, and one day the strike will come, but it will need more than one brave heart to make it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They see the threads of time that every spell disturbs, as a stone disturbs a pond. You shape the world a little each time you cast, mortal, and the Brood watches every ripple." } },
      choices = {
        { text = "Then I'll cast carefully, and respect time.", next = "BACK", reply = "Then you are wiser than most mages who come through here. Most of them want to know what the hourglass does when they touch it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Time can bend to my will.", next = "BACK", reply = "Time bends to no one's will, mortal, and those who try it learn very quickly how far it bends back.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "That's unsettling.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Something older than your demons, and hungrier, sealed away a thousand years ago by those who paid dearly for it. I made my promise then, and I keep it still, and I will not speak more of it to one who bargains with fire." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Something older than your demons, and hungrier, and I see that the one beside you has gone very still at the mention of it. I made my promise a thousand years ago, and I keep it still, and I will not speak more of it to one who bargains with fire, nor to the fire itself." },
      },
      choices = {
        { text = "I respect your promise, Watcher. I won't pry.", next = "BACK", reply = "Then you have my thanks, and perhaps one day I will tell you what I cannot tell you now.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Your secrets won't stay secret forever.", next = "BACK", reply = "They will not, mortal, because a promise held for a thousand years is not one I will let slip to you.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'll leave you to your watch.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_cl_aq40", tags = { "news" }, when = { cleared = "Ahn'Qiraj" }, text = "The eye beneath Ahn'Qiraj is closed, and the sands are still in a way I have not felt in a thousand years. You have done what the Brood and the kaldorei together could only delay, mortal." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue, mortal, who watches from the edges as I do. We are alike in that, though I have watched for a thousand years, and you, I think, for rather less." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, mortal. Your Light is young, younger than the wall that stands behind me, yet I have watched it burn steadily in some of your kind, and that is worth something." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You hear the land as it was meant to be heard, mortal, and so you know already that it is afraid of what sleeps behind the wall." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, mortal, and of the Horde. Your prayers are young beside what sleeps behind the Scarab Wall, yet even a young flame shines in the dark." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, mortal, whose magic flows like sand through the hourglass. The Brood would find you interesting, and so do I, though perhaps not for the reasons you would wish." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock, mortal, and the hive stirs at your coming. The things you bind are small beside what waits behind the Scarab Wall, and I would not have you mistake one for the other." },
        { id = "h_default", key = true,
          text = "The land around us shudders, and the hive answers. I made a promise a thousand years past, mortal, and the time to keep it draws near, for the sands are shifting once more." },
        { id = "h_tomorrow", tags = { "news" }, when = { questActive = TODO_QUEST("What Tomorrow Brings") },
          text = "Go to the Caverns of Time, in the deserts of Tanaris, and see whether the great bronze one I serve has returned. I must be certain before I may act." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. I have seen warriors stand before the hive, mortal, and I have seen the sand cover them, and still they came, for that is what your kind does." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. You read the tracks of beasts, mortal, but can you read the tracks of the hive, which move beneath the sand and remember?" },
      },
      again = {
        { id = "h_again", text = "Ask, then. I have waited a thousand years; I can wait a little longer." },
        { id = "h_again2", text = "Speak. The hive will not stop for us, but I will." },
      },
      choices = {
        { text = "What does the land fear behind the Scarab Wall?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Who are you, really?", next = "who" },
        { text = "What promise did you make?", next = "promise" },
        { text = "Why do you watch the hive?", next = "hive" },
        { text = "The bronze one has returned. I saw him.", next = "risen", when = { questDone = TODO_QUEST("What Tomorrow Brings") } },
        { text = "Our people fought here once.", next = "kaldorei", when = { race = "NightElf" } },
        { text = "The land remembers the old war, Watcher.", next = "x_druid", when = { class = "DRUID" } },
        { text = "What does the Brood see in mages?", next = "xmage", when = { class = "MAGE" } },
        { text = "What waits behind the Scarab Wall?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What can a priest do against the swarm, Baristolth?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "You speak as one who stood before the hive yourself.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "How does one read the tracks of the hive, Baristolth?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What have you seen of the Light in your long watch?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What have you watched for a thousand years, Baristolth?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "C'Thun is dead, Baristolth. Is your watch over?", next = "xcl_aq40", when = { cleared = "Ahn'Qiraj" } },
        { text = "Farewell, Baristolth.", next = "END" },
      },
    },

    who = {
      lines = { { id = "w_default", text = "A hunter, once, who went into the hives and did not come out whole. Death had nearly finished with me when one of the great ones breathed upon me, once, and waited while the sands of time closed my wounds." } },
      choices = {
        { text = "One of the great ones?", next = "who_bronze" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_bronze = {
      lines = { { id = "wb_default", fx = { learn = { "bronze_dragonflight" } },
        text = "The Brood of Nozdormu, the bronze dragonflight, keepers of what was and what will be. He told me I would remain as long as I must, and so I am a Watcher, and I have watched." } },
      choices = {
        { text = "A thousand years of watching. That's a heavy price.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    promise = {
      lines = { { id = "p_default", text = "To watch the desert until the second war comes, and to find a mortal worthy of the Brood's trust when it does. The Brood are slow to trust your kind, and they have their reasons, which are theirs to tell." } },
      choices = {
        { text = "Time should be left to run its course.", next = "BACK", reply = "That is the way of my masters, and I am glad to hear a mortal speak it, though few of you understand the cost.", fx = { align = { order = 1 } } },
        { text = "If I could change what's coming, I would.", next = "BACK", reply = "Many have said that, mortal, and the Brood watches them more closely than it watches anyone.", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Am I worthy?", next = "promise_worthy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    promise_worthy = {
      lines = { { id = "pw_default", text = "Not yet, and perhaps not ever, but you came and asked, and most do not." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hive = {
      lines = { { id = "h_default2", fx = { learn = { "silithid_hives", "ahn_qiraj" } },
        text = "Because the hives are the city's breath, and they are breathing faster. Behind the wall at Ahn'Qiraj, the Qiraji plan for war, and the silithid are only the first of their servants to stir." } },
      choices = {
        { text = "The Qiraji?", next = "hive_qiraji" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hive_qiraji = {
      lines = { { id = "hq_default", text = "The masters of the hive, sealed in their city a thousand years ago, and not nearly as asleep as your kind would like to believe. I have feared them for a very long time." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    risen = {
      lines = { { id = "r_default", text = "Then it is as it should be: the great one has risen, and my watch begins to end. What comes next is not mine to give you yet; when it is, I will find you." } },
      choices = { { text = "I'll be waiting.", next = "BACK", fx = { affinity = 1, trait = { patient = 1 } } } },
    },
    kaldorei = {
      lines = { { id = "k_default", text = "Fought, and bled, and won, and then chose to forget, which is the one thing the Brood would never do. I remember for them, and for you, whether or not you thank me for it." } },
      choices = { { text = "I thank you.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    x_druid = {
      lines = {
        { id = "xd_default", text = "It remembers, child of Cenarius, though the sand has buried what the land will not speak of. Walk softly when you wear a beast's shape here, mortal, for the hive is sensitive to living things, and it has a long memory of druids." },
      },
      choices = {
        { text = "I'll walk softly, Watcher.", next = "BACK", fx = { affinity = 1 } },
        { text = "The Circle doesn't fear the hive.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know what was. Some of it I may tell you." } },
    background = { { id = "tp_bg", text = "A hunter who should have died, and a Watcher who has not. That is enough of a story.", next = "who" } },
    advice = { { id = "tp_ad", text = "When the ground hums, step away from it. When it falls silent, run." } },
    bronze_dragonflight = { { id = "tp_bronze", text = "They watch over time itself, and they do not forget a debt, owed or owing." } },
    ahn_qiraj = { { id = "tp_aq", text = "The city behind the wall. I was there when the wall was raised." } },
    cthun = { { id = "tp_cthun", text = "There is something sleeping beneath Ahn'Qiraj that dreams the silithid into being. I will not say its name, and I would ask you not to say it here." } },
    silithid_hives = { { id = "tp_silithid_hives", text = "The hives are the fingers of a hand, and the hand is buried beneath the old city. When the fingers move, the hand is waking." } },
    elune = { { id = "tp_elune", text = "I prayed to Elune at the Scarab Wall a thousand years ago, and she listened, and the wall held. I hope she is still listening." } },
    tyrande = { { id = "tp_tyrande", text = "Tyrande does not remember me, I think, but I remember her, and I remember why we came here. One day she will need to remember too." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The green dragons stood with us in the old war, and the Dream lent us its strength. I wonder whether they would come again." } },
    _none = { { id = "tp_none", text = "That is not a thing I watch." } },
  },
}
