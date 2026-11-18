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
    first = "Whatever he saw in these woods, he hasn't stopped seeing it.",
    third = "{name} met Jitters, a frightened man hiding near Raven Hill who jumps at every sound in the woods.",
  },

  greetings = {
    { id = "g_op_red_mercy", when = { opinion = { topic = "defias", stance = "mercy" } }, text = "Oh, it's you! You said I could come back from it. I've been saying it to myself every night since, mostly when the howling starts." },
    { id = "g_flinch", text = "Wh-who's there... oh, it's only a person, thank the Light, because you are a person, aren't you?" },
    { id = "g_food", when = { questActive = TODO_QUEST("Jitters' Growling Gut") }, text = "Is that food? Please tell me that's food you've got there." },
    { id = "g_after", when = { questDone = TODO_QUEST("Return to Sven") }, text = "Oh, it's you... you told Sven, didn't you, and it's fine, really, it's fine." },
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
    op_red = {
      lines = {
        { id = "op_red_a", text = "I d-don't know, that's what I keep asking the trees. The Brotherhood says once you've worn it, you're theirs till you're dead, and the Watch says the same thing from the other side. What do you think, honest? Can a man come back from it?" },
      },
      choices = {
        { text = "Yes. You left. That already counts for something.", next = "op_red_1", fx = { opinion = { defias = "mercy" }, align = { light = 1 }, trait = { kind = 1 }, affinity = 3 } },
        { text = "No. You chose the mask. You'll answer for it someday.", next = "op_red_2", fx = { opinion = { defias = "hardline" }, align = { light = -1 }, trait = { stern = 1 }, affinity = -2 } },
        { text = "Depends what you do now. Help the Watch and earn it back.", next = "op_red_3", fx = { opinion = { defias = "sympathetic" }, align = { order = 1 }, trait = { practical = 1 } } },
        { text = "The nobles put you in that mask. The shame's theirs.", next = "op_red_4", fx = { opinion = { defias = "masons_wronged", stormwind = "abandoned_its_own" }, align = { order = -1 } } },
        { text = "That's not my question to answer.", next = "BACK" },
      },
    },
    op_red_1 = {
      lines = { { id = "op_red_r1", text = "It does? It does. Nobody's ever said that to me, not once, not even me. I'm going to sit here and think about that for a while, if that's all right." } },
      choices = { { text = "C-can we talk about something else?", next = "BACK" } },
    },
    op_red_2 = {
      lines = { { id = "op_red_r2", text = "I know, I know, I know. I just hoped someone would say different, that's all. You're probably right; you look like someone who's usually right." } },
      choices = { { text = "C-can we talk about something else?", next = "BACK" } },
    },
    op_red_3 = {
      lines = { { id = "op_red_r3", text = "The Watch? They'd hang me before I opened my mouth. Maybe if you were standing beside me, though, maybe then I could say it." } },
      choices = { { text = "C-can we talk about something else?", next = "BACK" } },
    },
    op_red_4 = {
      lines = { { id = "op_red_r4", text = "That's what the men in the mine used to say, round the fire. It sounded better there, but it doesn't change what I saw at the Yorgen farm." } },
      choices = { { text = "C-can we talk about something else?", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I saw things, terrible things. They're still there, every time I close my eyes. Your spirits might chase them away." } },
      choices = {
        { text = "I'll help you, Jitters. You're safe now.", next = "BACK", reply = "Safe, you say, and I want to believe it so badly that it hurts. Stay a little while, will you, until the shaking stops?", fx = { align = { light = 1 } } },
        { text = "Get hold of yourself. Fear won't help.", next = "BACK", reply = "I know it won't, I know, I tell myself that every hour! It doesn't listen, though, and neither do my hands.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Things out past the Yorgen farm that I'll not describe, not even to a warrior, and I ran from them and I've not stopped running since. If you've a sword, you'll want it out before you go that way, and you'll want someone watching your back as well." } },
      choices = {
        { text = "I'll find whatever you saw and put an end to it.", next = "BACK", reply = "You'd go there, on purpose, with your eyes open? Then you're braver than me, and I hope you come back to tell me it's gone.", fx = { align = { honor = 1 } } },
        { text = "I'll stay clear of the Yorgen farm. Some things aren't worth it.", next = "BACK", reply = "That's the wisest thing anyone's said to me since I came to this hill. Stay on the road and keep walking, and don't look at the barn.", fx = { align = { honor = -1 } } },
        { text = "Something else, Jitters.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Follow me? They wait for me, I swear, behind every tree I pass, and I hear them breathing even when there's nothing there. I know it's nonsense, mostly, but a man who's seen what I've seen gets suspicious of the bushes." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Follow me? They wait for me, I swear, behind every tree I pass, and I hear them breathing even when there's nothing there. That {pet} of yours keeps looking at the trees, {class}, and every time it does, I nearly jump out of my skin." },
      },
      choices = {
        { text = "I'll keep watch tonight, Jitters. You can sleep.", next = "BACK", reply = "You'd do that, for me? I don't think anyone's watched over me since I was a boy, and I might actually close my eyes tonight.", fx = { align = { light = 1 } } },
        { text = "Nothing's there. You've got to stop jumping at shadows.", next = "BACK", reply = "I know, I know there's nothing, but knowing doesn't stop the breathing. Maybe one day it will, if I'm lucky, and I'm never lucky.", fx = { align = { light = -1 } } },
        { text = "Something else, Jitters.", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Will you? Will you really, all night? Because the last lamp went out in the fog, and that's when I saw them, and I haven't stopped seeing them since." } },
      choices = {
        { text = "Steady breaths, Jitters. You can learn to master the fear.", next = "BACK", reply = "Discipline, yes, steady breaths, like the sergeant used to shout. I'll try, but my breaths keep running off without me.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Run if you must. Fear keeps you alive.", next = "BACK", reply = "That's what I've been doing, and look where it got me, hiding on a hill with no supper. Still, I'm alive, so maybe you're right.", fx = { align = { order = -1 } } },
        { text = "What did you see out there?", next = "saw" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "Then you're mad, or worse, and I don't want to know which. Please don't go near the Yorgen farm with that thing following you, because I can't take another shadow on that road." } },
      choices = {
        { text = "I'll keep it away from you, Jitters.", next = "BACK", reply = "Thank you, oh thank you, and please keep it far away. I can't look at it without seeing the farm.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Shadows follow me. Get used to it.", next = "BACK", reply = "Get used to it? I can't even get used to the trees. Please, just go the other way round the hill.", fx = { align = { light = -1 } } },
        { text = "Why are you hiding?", next = "hiding" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Run, probably, though I'm not a good runner anymore, and then I'd let them catch me, because I'm so tired. Sven would say I've earned whatever came, and some nights I think he's right." } },
      choices = {
        { text = "You've suffered enough. I won't be the one to judge you.", next = "BACK", reply = "You won't? Nobody's said that to me before, not once, and I don't know what to do with it. Thank you, I think.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You let a family die. Someone must answer for that.", next = "BACK", reply = "I know, I know someone must, and I've been waiting for it to be me. Just make it quick, whoever it is.", fx = { align = { light = -1 } } },
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
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman? Have you any food, please? I'll tell you everything, but food first, because the things in the woods... I keep seeing them." },
      },
      again = {
        { id = "h_again", text = "W-what else? Ask quickly, because something's moving by the well, though it's probably nothing." },
        { id = "h_again2", text = "You're still here, that's good, stay a bit, would you? Nobody ever stays." },
      },
      choices = {
        { text = "What did you see?", next = "saw" },
        { text = "You look like you're hiding from someone.", next = "hiding" },
        { text = "How did you end up in Duskwood?", next = "mine" },
        { text = "You look half-starved, Jitters.", next = "food" },
        { text = "I could pray with you.", next = "pray", when = { class = "PRIEST" } },
        { text = "The Brotherhood doesn't forget deserters.", next = "rogue", when = { class = "ROGUE" } },
        { text = "I'm a druid. Not every beast in the woods is a monster.", next = "druid", when = { class = "DRUID" } },
        { text = "Calm down, Jitters. I'll keep a light burning.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What did you see in the woods, Jitters?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "The wolves seem to follow you everywhere, Jitters.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
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
        { text = "You couldn't have stopped them.", next = "BACK", reply = "You don't know that, you weren't there, but, but it's kind of you to say it, and maybe if I say it to myself enough times I'll start to believe it.", fx = { affinity = 2, trait = { kind = 1 }, align = { light = 1 } } },
        { text = "You should have tried.", next = "BACK", reply = "I know, I know I should have, don't you think I tell myself that every single night when the wind gets into the barn and it sounds like those riders coming back?", fx = { affinity = -2, trait = { stern = 1 }, align = { light = -1 } } },
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
        { text = "They sound like working men. Defias, I'd wager.", next = "mine_defias" },
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
        { text = "Do you think a man can take the red off again?", next = "op_red" },
        { text = "Your secret's safe with me.", next = "BACK", reply = "Safe? Oh, thank you, thank you, because if the Watch knew, they'd hang me by morning. I'll not forget it, I swear.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "The Night Watch should know.", next = "BACK", reply = "Please don't, please, they'd never believe I left. I'll tell them myself, I will, as soon as I stop shaking.", fx = { affinity = -2, align = { order = 1 }, trait = { stern = 1 } } },
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
        { text = "The Light heard you, Jitters.", next = "BACK", reply = "Did it? Then maybe it just answered something else, or answered too late. I'll think about that tonight.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Prayers won't keep you safe, Jitters, so learn to fight instead.", next = "BACK", reply = "Fight? Me? I couldn't even fight off a squirrel for my supper, but maybe you could show me how.", fx = { align = { light = -1 } } },
      },
    },
    pray_together = {
      big = true,
      lines = {
        { id = "pt_default", text = "...All right, you say the words, and I'll keep my eyes open, because somebody has to." },
      },
      choices = {
        { text = "Then you keep watch, and I'll pray.", next = "BACK", reply = "All right, all right, and I'll watch the trees for both of us. Say it slowly, so I can remember the words.", fx = { affinity = 3, align = { light = 1 }, trait = { pious = 1 } },
          journal = { first = "Prayed with Jitters at Raven Hill, for Sven Yorgen's wife. He kept his eyes open the whole time.",
                      third = "{name} prayed with Jitters at Raven Hill, for a woman whose name neither of them knew." } },
        { text = "The Light wasn't there for her, so I'll keep watch instead.", next = "BACK", reply = "That's what I thought too, every night since. At least we'll both be watching, then.", fx = { align = { light = -1 } } },
      },
    },

    rogue = {
      lines = {
        { id = "ro_default", text = "I know they don't, I know! I didn't run from the Brotherhood, I ran from the mine, so tell them that... no, wait, don't tell them anything at all." },
      },
      choices = {
        { text = "I won't tell them.", next = "BACK", reply = "Thank you, oh, thank you, I owe you more than I can pay, which is nothing. I'll stay right here and be very quiet.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "That depends on what you're worth.", next = "BACK", reply = "Worth? I'm worth nothing, I've told you, nothing at all! Please, just keep walking and forget you ever saw me.", fx = { affinity = -3, align = { honor = -1 }, trait = { cruel = 1 } } },
      },
    },
    druid = {
      lines = { { id = "dr_default", text = "A druid. That means you turn into things, doesn't it, with fur and teeth, out in the woods where nobody can see? Please don't, not here, not while I'm looking, because I've seen a man go down on four legs once and I can't see it again." } },
      choices = {
        { text = "I won't change in front of you.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "What did you see out there, Jitters?", next = "saw" },
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
    raven_hill = { { id = "tp_raven_hill", text = "I live out here near Raven Hill, yes, because nobody comes looking, nobody, not even the people I'm hiding from. The dead don't ask questions, and I like that in a neighbor, mostly." } },
    stonemasons = { { id = "tp_stonemasons", text = "I knew some masons once, honest men, good men, before Westfall, and I'm not saying more, not one more word about masons. Don't write that down." } },
    the_stockade = { { id = "tp_the_stockade", text = "The Stockade, no, no, I'm never going there, because I'd die there, they'd find me there. Please don't mention it again, please." } },
    scourge = { { id = "tp_scourge", text = "There are worse things than worgen up north, I've heard, dead men in whole armies, and I'm glad, in a way, because at least they're up north. I'm not glad, I'm only saying." } },
  },
}
