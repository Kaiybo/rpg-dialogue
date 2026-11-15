-- Jitters, hiding in Raven Hill. Voice: bibles/jitters.md
-- Ex-Defias. Saw things in the woods. Saw worse at the Yorgen farm. Hungry, mostly.
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "jitters", id = TODO_NPC("Jitters"), name = "Jitters",
  bible = "bibles/jitters.md", role = "questgiver", tier = "quest",
  communities = { "raven_hill" }, temper = { "cowardly" }, values = { "honest" },
  notices = { "fright", "hunger" },

  greetings = {
    { id = "g_flinch", text = "Wh- who's there? Oh. Oh, it's a person. Good. You're a person, right?" },
    { id = "g_food", when = { questActive = TODO_QUEST("Jitters' Growling Gut") }, text = "Food? Is that food? Please say that's food." },
    { id = "g_after", when = { questDone = TODO_QUEST("Return to Sven") }, text = "Oh. You. You told him. Didn't you. It's fine. It's fine." },
    { id = "g_ravenhill", when = { questActive = TODO_QUEST("Raven Hill") }, text = "Don't! Don't shoot! It's only me. Only Jitters. Harmless Jitters." },
  },

  notice = {
    { id = "n_stealth", cat = "fright", place = "replace", when = { stealthed = true },
      text = "AH! Don't do that! Don't ever do that! My heart's not what it was. It was never much to start with." },
    { id = "n_worgen", cat = "fright", when = { form = { "bear", "cat" } },
      text = "Get back! Get- oh. A druid. You're a druid. I knew that. I'm going to sit down now." },
    { id = "n_cook", cat = "hunger", when = { profession = "Cooking" },
      text = "You smell like a kitchen. Any chance you've got something? Anything? I've been eating bark. The bark here tastes like fog." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Jitters, they call me. On account of the jitters. I jump at things. You'd jump too, if you'd seen what I've seen in these woods." },
        { id = "h_ravenhill", tags = { "news" }, when = { questActive = TODO_QUEST("Raven Hill") },
          text = "A monster? In Raven Hill? N-no. That light in the window was me. Sorry about the light. I'll stop lighting it." },
        { id = "h_found", tags = { "news" }, when = { questActive = TODO_QUEST("Finding the Shadowy Figure") },
          text = "That's my book. My old book. You dug up the stump. Oh, no. Then you've read it. Then you only know half." },
        { id = "h_gut", tags = { "news" }, when = { questActive = TODO_QUEST("Jitters' Growling Gut") },
          text = "Can't go to town. Can't go in the woods. Can't go anywhere. And I'm so hungry I can hear my stomach arguing with itself." },
        { id = "h_gut_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Jitters' Growling Gut"), days = 3 } },
          text = "That was the best meal I've had in a year. Maybe ever. Don't tell anyone where I am. Please." },
        { id = "h_sven", when = { questActive = TODO_QUEST("Return to Sven") },
          text = "You're going to tell Sven, aren't you. Tell him I didn't do anything. Tell him I just watched. That's worse, isn't it. It's worse." },
        { id = "h_defias", when = { topicKnown = "defias" },
          text = "I wore the red, once. Before. I'm not proud of it. I'm not proud of much. I'm alive, though. That's something." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "AH! Oh. An elf. From the sky? I didn't know elves came from the sky. I don't know anything. That's fine. That's fine." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest? Are you here for me? I'm not dead. I'm nearly sure I'm not dead. Check, would you?" },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "You walk like them. Quiet. Heel first. Please say you're not Brotherhood. Please say nobody sent you." },
        { id = "h_sleep", when = { metBefore = true }, text = "I slept two hours last night. Two whole hours. Nobody came for me. I-I'm almost disappointed. No. No, I'm not." },
      },
      again = {
        { id = "h_again", text = "W-what else? Ask quick. Something's moving by the well. It's probably nothing." },
        { id = "h_again2", text = "You're still here. Good. Stay a bit. Nobody stays." },
      },
      choices = {
        { text = "What did you see?", next = "saw" },
        { text = "Why are you hiding?", next = "hiding" },
        { text = "How did you end up in Duskwood?", next = "mine" },
        { text = "When did you last eat?", next = "food" },
        { text = "I could pray with you.", next = "pray", when = { class = "PRIEST" } },
        { text = "The Brotherhood doesn't forget deserters.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Stay safe, Jitters.", next = "END" },
      },
    },

    saw = {
      big = true,
      lines = {
        { id = "s_default", key = true,
          text = "Riders. In black. At the Yorgen farm, looking for something. They killed everyone. I was in the barn. I didn't move. I didn't do anything. I just watched." },
      },
      choices = {
        { text = "You couldn't have stopped them.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 }, align = { light = 1 } } },
        { text = "You should have tried.", next = "BACK", fx = { affinity = -2, trait = { stern = 1 } } },
        { text = "Tell me about Sven's wife.", next = "saw_wife" },
      },
    },
    saw_wife = {
      lines = {
        { id = "sw_default", text = "She was brave. Braver than anyone. She told them she knew where the thing was, so they'd take her and leave the children. They didn't believe her.",
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
        { id = "sn_default", text = "I don't know. I never knew. He called her 'dearest', the children called her 'mama'. I'm the only one who saw what she did, and I don't know her name." },
      },
      choices = {
        { text = "Then remember what she did.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hiding = {
      lines = {
        { id = "h2_default", text = "From the worgen. From the riders. From Sven, mostly. He saw me burying something once. He thinks it's my fault. Maybe he's right." },
      },
      choices = {
        { text = "What did you bury?", next = "hiding_book" },
        { text = "Something else.", next = "BACK", fx = { learn = { "worgen" } } },
      },
    },
    hiding_book = {
      lines = {
        { id = "hb_default", text = "My journal. The first one. I couldn't run and carry it, so I buried it by the stump. I started another. Writing helps. Don't ask me why." },
      },
      choices = {
        { text = "Writing is a kind of confession.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    mine = {
      lines = {
        { id = "mi_default", text = "I came with... friends. Working men. We went into a mine called Roland's Doom. There was something in the rubble. Rune-carved wood. I pulled it free." },
      },
      choices = {
        { text = "What happened?", next = "mine_worgen" },
        { text = "Working men. Defias?", next = "mine_defias" },
      },
    },
    mine_worgen = {
      big = true,
      lines = {
        { id = "mw_default", text = "The torches went wrong, and whispers came out like shouts. Then wolves, out of the floor and off the ceiling, and I ran. I'm good at running.",
          fx = { learn = { "worgen" } } },
      },
      choices = {
        { text = "And the thing you pulled free?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mine_defias = {
      lines = {
        { id = "md_default", text = "...Yes. The red. We were doing well in Duskwood, they said. Then the mine. Now I'm nobody's. They don't let you leave. I left.",
          fx = { learn = { "defias" } } },
      },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "The Night Watch should know.", next = "BACK", fx = { affinity = -2, align = { order = 1 }, trait = { stern = 1 } } },
      },
    },

    food = {
      lines = {
        { id = "fd_default", text = "Grubs. Weeds. Bark, once. I'd go to town, but town has eyes, and the road has teeth." },
      },
      choices = {
        { text = "I'll bring you something.", next = "food_grual" },
        { text = "Something else.", next = "BACK" },
      },
    },
    food_grual = {
      lines = {
        { id = "fg_default", text = "Would you? Chef Grual at the Scarlet Raven makes crab cakes. I don't care what's in them. I really, truly don't." },
        { id = "fg_done", when = { questDone = TODO_QUEST("Return to Jitters") },
          text = "Again? You'd do it again? Grual's cakes. Anything Grual makes. I'm not proud. I used to be. It didn't fill me up." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, standing = { raven_hill = 1 } } } },
    },

    pray = {
      lines = {
        { id = "pr_default", text = "Pray? With me? I never learned. I prayed once, in the barn. For her. It didn't work." },
      },
      choices = {
        { text = "It isn't a trade. Pray anyway.", next = "pray_together" },
        { text = "The Light heard you, Jitters.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
      },
    },
    pray_together = {
      big = true,
      lines = {
        { id = "pt_default", text = "...All right. You say the words. I'll keep my eyes open. Somebody has to." },
      },
      choices = {
        { text = "Then keep watch. I'll pray.", next = "BACK", fx = { affinity = 3, align = { light = 1 }, trait = { pious = 1 } },
          journal = { first = "Prayed with Jitters at Raven Hill, for Sven Yorgen's wife. He kept his eyes open the whole time.",
                      third = "{name} prayed with Jitters at Raven Hill, for a woman whose name neither of them knew." } },
      },
    },

    rogue = {
      lines = {
        { id = "ro_default", text = "I know. I know! I didn't run from the Brotherhood. I ran from the mine. Tell them that. No. Don't tell them anything." },
      },
      choices = {
        { text = "I won't tell them.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "That depends on what you're worth.", next = "BACK", fx = { affinity = -3, align = { honor = -1 }, trait = { cruel = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Jitters. That's all of me now. The rest I wrote down and gave away." } },
    advice = { { id = "tp_ad", text = "Never pick anything up in a mine. Never. I don't care how old it looks. Leave it in the rocks." } },
    worgen = { { id = "tp_worgen", text = "My friends. The ones I came here with. The wolves got them. I ran. I'm good at running." } },
    defias = { { id = "tp_defias", text = "Don't. Please. They don't let people leave. I left." } },
    stalvan = { { id = "tp_stalvan", text = "The manor? I don't go near the manor. I don't go near anything." } },
    dark_riders = { { id = "tp_riders", text = "Don't say it so loud. They're still looking. I know they're still looking." } },
    night_watch = { { id = "tp_watch", text = "They'd ask questions. I don't have good answers. I've got true ones, which is worse." } },
    _none = { { id = "tp_none", text = "I don't know! I don't know anything! That's how I've stayed alive." } },
  },
}
