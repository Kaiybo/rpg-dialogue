-- Abercrombie, the hermit of Raven Hill. Voice: bibles/abercrombie.md
-- Canon secret: he is building Stitches. He is kind, grateful, slightly too interested in
-- your health, and never says what the supplies are for until the note is read.
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "abercrombie", id = TODO_NPC("Abercrombie"), name = "Abercrombie",
  bible = "bibles/abercrombie.md", role = "questgiver", tier = "quest",
  communities = { "raven_hill" }, temper = { "steady" }, values = { "kind", "curious" },
  notices = { "body", "craft" },

  greetings = {
    { id = "g_hermit", text = "A visitor! How lovely. I don't get many. Living ones." },
    { id = "g_supplies", when = { questActive = TODO_QUEST("Supplies from Darkshire") }, text = "Back from Darkshire already? No? Everyone's so slow. I'm not. Not anymore." },
    { id = "g_after", when = { questDone = TODO_QUEST("Translation to Ello") }, text = "Oh, hello again. Busy week. Busy week for everyone, I hear." },
  },

  notice = {
    { id = "n_big", cat = "body", when = { class = "WARRIOR" },
      text = "My, what a frame you have. Good broad shoulders. Sturdy. I do admire a well-made body. Professionally. I was an alchemist." },
    { id = "n_alchemy", cat = "craft", when = { profession = "Alchemy" },
      text = "A fellow alchemist! Oh, we must talk sometime. Preservation, mostly. It's a hobby. A small hobby. Getting bigger." },
    { id = "n_hurt", cat = "body", when = { durability = { max = 0.25 } },
      text = "You're in pieces, dear. Do be careful out there. It would be such a waste." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Abercrombie. I keep to myself up here. My wife and I lived in Raven Hill once. I stay close to her. It's what she'd want." },
        { id = "h_hermit", when = { questActive = TODO_QUEST("The Hermit") },
          text = "Someone sent you to check on me? How thoughtful. I'm perfectly well. I'm working on something. It's coming along." },
        { id = "h_thread", when = { questActive = TODO_QUEST("Deliver the Thread") },
          text = "Thread! Strong thread. You can't have too much strong thread. Things come apart otherwise." },
        { id = "h_juice", when = { questActive = TODO_QUEST("Zombie Juice") },
          text = "Smitts brews it for me. A little pick-me-up. Don't drink it yourself, mind. It's not for the living." },
        { id = "h_effigy", when = { questActive = TODO_QUEST("Ghoulish Effigy") },
          text = "Ghoul ribs. Not the cracked ones. I need them whole. Big ones, if you can." },
        { id = "h_ogre", when = { questActive = TODO_QUEST("Ogre Thieves") },
          text = "My crate! Those brutes from the mound chased me off and took it. Tools and herbs. Irreplaceable herbs. Mostly herbs." },
        { id = "h_note", key = true, tags = { "news" }, when = { questActive = TODO_QUEST("Note to the Mayor") },
          text = "Take this to the mayor, would you? It's a note. Just a note. I'd rather not watch you read it." },
        { id = "h_eliza", when = { questActive = TODO_QUEST("Bride of the Embalmer") },
          text = "Eliza's resting. Don't go near the graves. She doesn't like visitors. She's, well. Particular about her diet." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "My, so slender. Your people are built for the wind, aren't they? Light bones. Wonderful. Professionally speaking." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest! How nice. You'll say a word for an old man's wife, won't you? From here is fine. From here is best, really." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "Oh, my. All that shine. Do stand a little further off, dear. My eyes aren't what they were. Nothing of me is." },
      },
      again = {
        { id = "h_again", text = "More questions? How lovely. Nobody asks me anything anymore." },
        { id = "h_again2", text = "Go on, dear. I've time. I've a great deal of time." },
      },
      choices = {
        { text = "What are you working on?", next = "work" },
        { text = "Tell me about your wife.", next = "wife" },
        { text = "Don't the dead bother you, up here?", next = "dead" },
        { text = "Why not live in Darkshire?", next = "town" },
        { text = "Let me say the rites at her grave.", next = "priest", when = { class = "PRIEST" } },
        { text = "I know necromancy when I smell it.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "What do you preserve, exactly?", next = "alchemy", when = { profession = "Alchemy" } },
        { text = "Goodbye, Abercrombie.", next = "END" },
      },
    },

    work = {
      lines = {
        { id = "w_default", text = "A surprise. For Darkshire. They've been so unkind about my hobbies. I want to show them what I can make." },
        { id = "w_after", when = { questDone = TODO_QUEST("Translation to Ello") },
          text = "Nothing. Nothing at all. A garden, perhaps. Something that stays where it's put." },
      },
      choices = {
        { text = "I'm sure they'll love it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something about this feels wrong.", next = "wrong", fx = { trait = { skeptical = 1 } } },
        { text = "What's all the thread for?", next = "work_thread" },
      },
    },
    wrong = {
      lines = { { id = "wr_default", text = "Wrong? No, dear. Unfinished. People always confuse the two." } },
      choices = {
        { text = "Unfinished how?", next = "wrong_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrong_more = {
      big = true,
      lines = {
        { id = "wm_default", text = "A few more parts and a good tight stitch, and then it will be perfectly itself. Oh, I've said too much. I always say too much to kind faces." },
      },
      choices = {
        { text = "Then say a little more.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "I'll leave you to it.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    work_thread = {
      lines = {
        { id = "wt_default", text = "For the doors and windows, dear. Strung across, it keeps unwanted spirits out. One can't be too careful, living by a cemetery." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    wife = {
      big = true,
      lines = {
        { id = "wf_default", text = "Eliza. Kind, clever, beautiful, and then gone. I couldn't bear it. So I didn't. Let's leave it there." },
      },
      choices = {
        { text = "I'm sorry for your loss.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "What do you mean, you didn't?", next = "didnt", fx = { trait = { curious = 1 } } },
      },
    },
    didnt = {
      lines = { { id = "d_default", text = "Grief, dear. I didn't bear the grief. I'm a hermit. We're allowed to be strange about it." } },
      choices = {
        { text = "Strange how?", next = "didnt_strange" },
        { text = "Something else.", next = "BACK" },
      },
    },
    didnt_strange = {
      lines = {
        { id = "ds_default", text = "I keep her close. Very close. Just behind the shack. She was always particular about visitors, and she's grown more so." },
      },
      choices = {
        { text = "Behind the shack?", next = "BACK", fx = { trait = { curious = 1 }, learn = { "embalmer" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    dead = {
      lines = {
        { id = "de_default", text = "Oh, they come knocking. A pack of bone chewers pounded on my walls only yesterday. So rude. I'm making a scarecrow for them. A ghoulish one." },
      },
      choices = {
        { text = "A scarecrow, out of what?", next = "dead_effigy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead_effigy = {
      lines = {
        { id = "dd_default", text = "Ribs, dear. Ghoul ribs. Like calls to like, and then like goes away. That's the theory. I'm terribly fond of the theory." },
      },
      choices = {
        { text = "That's ingenious.", next = "BACK", fx = { affinity = 1 } },
        { text = "That's disgusting.", next = "BACK", fx = { affinity = -1 } },
      },
    },

    town = {
      lines = {
        { id = "to_default", text = "It's a long road, and I'm not getting any younger. Besides, Darkshire has been unkind about my hobbies. Whispers. Looks." },
      },
      choices = {
        { text = "Who's been unkind?", next = "town_unkind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    town_unkind = {
      lines = {
        { id = "tu_default", text = "Oh, everyone, a little. Never mind. The mayor and I are old friends, you know. I'm writing him a note. It will clear everything up." },
      },
      choices = {
        { text = "The mayor's your friend?", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    priest = {
      lines = {
        { id = "pr_default", text = "Oh, how kind. No. She's sleeping, and she doesn't care for visitors. Pray from here. Better yet, pray for me. I'm the one still up and about." },
      },
      choices = {
        { text = "Why can't I see her grave?", next = "priest_grave" },
        { text = "Then I'll pray for you both.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
      },
    },
    priest_grave = {
      lines = {
        { id = "pg_default", text = "Because I asked nicely, dear. And because you'd be disappointed. It's a very plain grave. All the effort went elsewhere." },
      },
      choices = {
        { text = "The dead should be left to rest.", next = "BACK", fx = { affinity = -1, align = { light = 1 }, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },

    warlock = {
      lines = {
        { id = "wl_default", text = "Necromancy? Dear me. Such a big word for a little hobby. You'll keep it between us? One dabbler to another?" },
      },
      choices = {
        { text = "Your secret's safe.", next = "BACK", fx = { affinity = 2, align = { light = -1 } } },
        { text = "The Night Watch will hear of it.", next = "BACK", fx = { affinity = -3, align = { order = 1 } } },
      },
    },
    alchemy = {
      lines = {
        { id = "al_default", text = "Everything, given time. Flowers. Fruit. Feelings. The trick is the heart. You must keep the heart going. Oh, I'm rambling." },
      },
      choices = {
        { text = "Keep the heart going?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Just an old alchemist who outlived his wife. Well. Outlived is a strong word." } },
    advice = { { id = "tp_ad", text = "Keep your strength up and your stitches tight, dear. Things come apart otherwise." } },
    night_watch = { { id = "tp_watch", text = "Brave souls. Fragile, though. So very fragile." } },
    worgen = { { id = "tp_worgen", text = "They don't bother me. I'm not much of a meal. Not anymore." } },
    stalvan = { { id = "tp_stalvan", text = "Old Mistmantle? Before my time up here. Shame. I'd have liked to meet him." } },
    morbent_fel = { { id = "tp_morbent", text = "The fellow on the hill? Crude work. All bones, no heart. I'd never let anything of mine go out like that." } },
    embalmer = { { id = "tp_embalmer", text = "A silly story they tell children in Darkshire. I've always thought the ending was unkind." } },
    _none = { { id = "tp_none", text = "Oh, I wouldn't know. I'm out of touch. Pleasantly out of touch." } },
  },
}
