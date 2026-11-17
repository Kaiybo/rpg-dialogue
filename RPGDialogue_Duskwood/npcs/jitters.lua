-- Jitters, hiding in Raven Hill. Voice: bibles/jitters.md
-- Ex-Defias. Saw things in the woods. Saw worse at the Yorgen farm. Hungry, mostly.
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "jitters", id = TODO_NPC("Jitters"), name = "Jitters",
  bible = "bibles/jitters.md", role = "questgiver", tier = "quest",
  communities = { "raven_hill" }, temper = { "cowardly" }, values = { "honest" },
  notices = { "fright", "hunger" },

  impression = {
    first = "Jitters jumps at every sound and begged me for food before he told me anything else. Whatever he saw in these woods, he hasn't stopped seeing it.",
    third = "{name} met Jitters, a frightened man hiding near Raven Hill who jumps at every sound in the woods.",
  },

  greetings = {
    { id = "g_flinch", text = "Wh-who's there... oh, it's only a person, thank the Light, because you are a person, aren't you?" },
    { id = "g_food", when = { questActive = TODO_QUEST("Jitters' Growling Gut") }, text = "Is that food? Please tell me that's food you've got there." },
    { id = "g_after", when = { questDone = TODO_QUEST("Return to Sven") }, text = "Oh, it's you... you told him, didn't you, and it's fine, really, it's fine." },
    { id = "g_ravenhill", when = { questActive = TODO_QUEST("Raven Hill") }, text = "Don't shoot, please don't shoot, it's only me, harmless old Jitters!" },
  },

  notice = {
    { id = "n_stealth", cat = "fright", place = "replace", when = { stealthed = true },
      text = "AH! Don't ever do that to me again, my heart's not what it was, and it was never much to start with." },
    { id = "n_worgen", cat = "fright", when = { form = { "bear", "cat" } },
      text = "Get back, get- oh, you're a druid, of course you're a druid, I knew that, and I'm just going to sit down for a moment now." },
    { id = "n_cook", cat = "hunger", when = { profession = "Cooking" },
      text = "You smell like a kitchen... I don't suppose you've got anything on you, anything at all? I've been eating bark, and the bark here tastes like fog." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I saw things, terrible things. They're still there, every time I close my eyes. Your spirits might chase them away." } },
      choices = {
        { text = "I'll help you, Jitters. You're safe now.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Get hold of yourself. Fear won't help.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Things out past the Yorgen farm that I'll not describe, not even to a warrior, and I ran from them and I've not stopped running since. If you've a sword, you'll want it out before you go that way, and you'll want someone watching your back as well." } },
      choices = {
        { text = "I'll find whatever you saw and put an end to it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll stay clear of the Yorgen farm. Some things aren't worth it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Jitters.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Follow me? They wait for me, I swear, behind every tree I pass, and I hear them breathing even when there's nothing there. I know it's nonsense, mostly, but a man who's seen what I've seen gets suspicious of the bushes." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} of yours keeps looking at the trees, {class}, and every time it does, I nearly jump out of my skin. Does it see something?" },
      },
      choices = {
        { text = "I'll keep watch tonight, Jitters. You can sleep.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Nothing's there. You've got to stop jumping at shadows.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Jitters.", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Will you? Will you really, all night? Because the last lamp went out in the fog, and that's when I saw them, and I haven't stopped seeing them since." } },
      choices = {
        { text = "Steady breaths, Jitters. Fear needs discipline.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Run if you must. Fear keeps you alive.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What did you see out there?", next = "saw" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "Then you're mad, or worse, and I don't want to know which. Please don't go near the Yorgen farm with that thing following you, because I can't take another shadow on that road." } },
      choices = {
        { text = "I'll keep it away from you, Jitters.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Shadows follow me. Get used to it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Why are you hiding?", next = "hiding" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Run, probably, though I'm not a good runner anymore, and then I'd let them catch me, because I'm so tired. Sven would say I've earned whatever came, and some nights I think he's right." } },
      choices = {
        { text = "You've suffered enough. I won't be the one to judge you.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You let a family die. Someone must answer for that.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Jitters.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A p-paladin! You're not here to punish me, are you? I wore the red, I know, but I never hurt anybody, not with my own hands, not really." },
        { id = "h_default", text = "They call me Jitters, on account of the jitters, because I jump at things. You'd jump too, if you'd seen what I've seen in these woods." },
        { id = "h_ravenhill", tags = { "news" }, when = { questActive = TODO_QUEST("Raven Hill") },
          text = "A monster, in Raven Hill? N-no, that light in the window was only me, and I'm sorry about the light, I'll stop lighting it, I promise." },
        { id = "h_found", tags = { "news" }, when = { questActive = TODO_QUEST("Finding the Shadowy Figure") },
          text = "That's my book, my old book... you dug up the stump, didn't you, oh no, so you've read it, and now you only know half of it." },
        { id = "h_gut", tags = { "news" }, when = { questActive = TODO_QUEST("Jitters' Growling Gut") },
          text = "I can't go to town and I can't go in the woods, I can't go anywhere, and I'm so hungry I can hear my stomach arguing with itself." },
        { id = "h_gut_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Jitters' Growling Gut"), days = 3 } },
          text = "That was the best meal I've had in a year, maybe ever, so please don't tell anyone where I am." },
        { id = "h_sven", when = { questActive = TODO_QUEST("Return to Sven") },
          text = "You're going to tell Sven, aren't you? Tell him I didn't do anything, that I only watched... but that's worse, isn't it, it's so much worse." },
        { id = "h_defias", when = { topicKnown = "defias" },
          text = "I wore the red, once, before all this, and I'm not proud of it, or of much else, but I'm alive, and I suppose that's something." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "AH! Oh... an elf, from the sky? I didn't know elves came from the sky, but then I don't know anything, and that's fine, that's fine." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest? Are you here for me? I'm not dead, I'm nearly sure I'm not dead, but you'd better check, just in case." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "You walk like them, quiet and heel first... please say you're not Brotherhood, please say nobody sent you." },
        { id = "h_sleep", when = { metBefore = true }, text = "I slept two whole hours last night and nobody came for me, and I-I'm almost disappointed... no, no, I'm not, I'm not at all." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior? Oh, thank the Light, a big strong warrior, and you'll not let anything grab me, will you, not with that sword?" },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! You'll see things in the dark, won't you, before they see you, because you're trained for it, and I'm not, and it shows." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman? Food? Please? I'll tell you everything, but food first. The things in the woods... I keep seeing them." },
      },
      again = {
        { id = "h_again", text = "W-what else? Ask quickly, because something's moving by the well, though it's probably nothing." },
        { id = "h_again2", text = "You're still here, that's good, stay a bit, would you? Nobody ever stays." },
      },
      choices = {
        { text = "What did you see?", next = "saw" },
        { text = "Why are you hiding?", next = "hiding" },
        { text = "How did you end up in Duskwood?", next = "mine" },
        { text = "When did you last eat?", next = "food" },
        { text = "I could pray with you.", next = "pray", when = { class = "PRIEST" } },
        { text = "The Brotherhood doesn't forget deserters.", next = "rogue", when = { class = "ROGUE" } },
        { text = "I'm a druid. Not every beast in the woods is a monster.", next = "druid", when = { class = "DRUID" } },
        { text = "Calm down, Jitters. I'll keep a light burning.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What did you see in the woods, Jitters?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do the wolves follow you, Jitters?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What you saw in the woods doesn't frighten me.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What would you do if someone came to judge you, Jitters?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What did you see in the woods, Jitters?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Stay safe, Jitters.", next = "END" },
      },
    },

    saw = {
      big = true,
      lines = {
        { id = "s_default", key = true,
          text = "Riders in black came to the Yorgen farm looking for something, and they killed everyone there. I was in the barn the whole time, and I didn't move, I didn't do anything, I just watched." },
      },
      choices = {
        { text = "You couldn't have stopped them.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 }, align = { light = 1 } } },
        { text = "You should have tried.", next = "BACK", fx = { affinity = -2, trait = { stern = 1 }, align = { light = -1 } } },
        { text = "Who was at the farm that night?", next = "saw_wife" },
      },
    },
    saw_wife = {
      lines = {
        { id = "sw_default", text = "Sven's wife was there, and she was braver than anyone I've ever known. She told them she knew where the thing was, so they'd take her and leave the children, but they didn't believe her.",
          fx = { learn = { "dark_riders" } } },
      },
      choices = {
        { text = "What was her name?", next = "saw_name" },
        { text = "Something else.", next = "BACK" },
      },
    },
    saw_name = {
      big = true,
      lines = {
        { id = "sn_default", text = "I don't know, I never knew... he called her 'dearest' and the children called her 'mama', and I'm the only one who saw what she did, and I don't even know her name." },
      },
      choices = {
        { text = "Then remember what she did.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hiding = {
      lines = {
        { id = "h2_default", text = "From the worgen, and the riders, and from Sven most of all, because he saw me burying something once and he thinks it's all my fault, and maybe he's right." },
      },
      choices = {
        { text = "What did you bury?", next = "hiding_book" },
        { text = "Something else.", next = "BACK", fx = { learn = { "worgen" } } },
      },
    },
    hiding_book = {
      lines = {
        { id = "hb_default", text = "My journal, the first one; I couldn't run and carry it, so I buried it by the stump and started another. Writing helps, though don't ask me why." },
      },
      choices = {
        { text = "Write it all down, Jitters. It helps.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    mine = {
      lines = {
        { id = "mi_default", text = "I came here with... friends, working men, and we went into a mine called Roland's Doom. There was something in the rubble, rune-carved wood, and I pulled it free." },
      },
      choices = {
        { text = "What happened?", next = "mine_worgen" },
        { text = "Working men. Defias?", next = "mine_defias" },
      },
    },
    mine_worgen = {
      big = true,
      lines = {
        { id = "mw_default", text = "The torches went wrong, and whispers came out like shouts, and then the wolves came out of the floor and off the ceiling, and I ran. I'm good at running.",
          fx = { learn = { "worgen" } } },
      },
      choices = {
        { text = "And the thing you pulled free?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mine_defias = {
      lines = {
        { id = "md_default", text = "...Yes, I wore the red. We were doing well in Duskwood, they said, right up until the mine, and now I'm nobody's, because they don't let you leave, and I left.",
          fx = { learn = { "defias" } } },
      },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "The Night Watch should know.", next = "BACK", fx = { affinity = -2, align = { order = 1 }, trait = { stern = 1 } } },
      },
    },

    food = {
      lines = {
        { id = "fd_default", text = "Grubs and weeds, mostly, and bark once, when it got bad. I'd go into town, but town has eyes, and the road has teeth." },
      },
      choices = {
        { text = "I'll bring you something.", next = "food_grual" },
        { text = "Something else.", next = "BACK" },
      },
    },
    food_grual = {
      lines = {
        { id = "fg_default", text = "Would you? Chef Grual at the Scarlet Raven makes crab cakes, and I don't care what's in them, I really, truly don't." },
        { id = "fg_done", when = { questDone = TODO_QUEST("Return to Jitters") },
          text = "You'd do it again? Grual's cakes, or anything Grual makes, really... I used to be proud, but it never once filled me up." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, standing = { raven_hill = 1 } } } },
    },

    pray = {
      lines = {
        { id = "pr_default", text = "You want to pray with me, when I never even learned how? I prayed once, in the barn, for her, and it didn't work." },
      },
      choices = {
        { text = "It isn't a trade. Pray anyway.", next = "pray_together" },
        { text = "The Light heard you, Jitters.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Prayers won't keep you safe, Jitters, so learn to fight instead.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    pray_together = {
      big = true,
      lines = {
        { id = "pt_default", text = "...All right, you say the words, and I'll keep my eyes open, because somebody has to." },
      },
      choices = {
        { text = "Then keep watch. I'll pray.", next = "BACK", fx = { affinity = 3, align = { light = 1 }, trait = { pious = 1 } },
          journal = { first = "Prayed with Jitters at Raven Hill, for Sven Yorgen's wife. He kept his eyes open the whole time.",
                      third = "{name} prayed with Jitters at Raven Hill, for a woman whose name neither of them knew." } },
        { text = "The Light wasn't there for her, so I'll keep watch instead.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },

    rogue = {
      lines = {
        { id = "ro_default", text = "I know they don't, I know! I didn't run from the Brotherhood, I ran from the mine, so tell them that... no, wait, don't tell them anything at all." },
      },
      choices = {
        { text = "I won't tell them.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "That depends on what you're worth.", next = "BACK", fx = { affinity = -3, align = { honor = -1 }, trait = { cruel = 1 } } },
      },
    },
    druid = {
      lines = { { id = "dr_default", text = "A druid. That means you turn into things, doesn't it, with fur and teeth, out in the woods where nobody can see? Please don't, not here, not while I'm looking, because I've seen a man go down on four legs once and I can't see it again." } },
      choices = {
        { text = "I won't change in front of you.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "What man?", next = "saw" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I know things, I do, I hear them from out here, and some of them I wish I didn't. Ask me about any of this, but quietly, please, quietly." },
    },
    background = { { id = "tp_bg", text = "I'm Jitters, and that's all there is of me now, because the rest I wrote down and gave away." } },
    advice = { { id = "tp_ad", text = "Never pick anything up in a mine, never, I don't care how old it looks; just leave it in the rocks where it is." } },
    worgen = { { id = "tp_worgen", text = "They got my friends, the ones I came here with, and I ran, because I'm good at running." } },
    defias = { { id = "tp_defias", text = "Please don't ask me about them, because they don't let people leave, and I left." } },
    stalvan = { { id = "tp_stalvan", text = "The manor? I don't go near the manor; I don't go near anything if I can help it." } },
    dark_riders = { { id = "tp_riders", text = "Don't say it so loud, they're still looking, I know they're still looking." } },
    night_watch = { { id = "tp_watch", text = "They'd only ask questions, and I don't have good answers, just true ones, which is worse." } },
    _none = { { id = "tp_none", text = "I don't know, I don't know anything, and that's how I've stayed alive this long!" } },
  },
}
