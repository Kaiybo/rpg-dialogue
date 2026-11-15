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

  impression = {
    first = "Abercrombie is a kind, rambling old man who lives alone near Raven Hill and speaks of his late wife as if she were in the next room. Something about the hut made my skin crawl.",
    third = "{name} visited Abercrombie, an old hermit near Raven Hill who lives alone and talks fondly of his late wife.",
  },

  greetings = {
    { id = "g_hermit", text = "A visitor, how lovely! I don't get many, dear, not living ones." },
    { id = "g_supplies", when = { questActive = TODO_QUEST("Supplies from Darkshire") }, text = "Back from Darkshire already, dear? No, of course not; everyone's so slow these days, though I'm not, not anymore." },
    { id = "g_after", when = { questDone = TODO_QUEST("Translation to Ello") }, text = "Oh, hello again, dear. It's been a busy week, and a busy week for everyone, I hear." },
  },

  notice = {
    { id = "n_big", cat = "body", when = { class = "WARRIOR" },
      text = "My, what a frame you have, such good broad shoulders! I do admire a well-made body, professionally speaking, since I was an alchemist." },
    { id = "n_alchemy", cat = "craft", when = { profession = "Alchemy" },
      text = "A fellow alchemist! Oh, we must talk sometime about preservation; it's a small hobby of mine, though it's getting bigger." },
    { id = "n_hurt", cat = "body", when = { durability = { max = 0.25 } },
      text = "You're in pieces, dear, so do be careful out there. It would be such a waste." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Abercrombie, and I keep to myself up here. My wife and I lived in Raven Hill once, and I stay close to her now, because it's what she'd want." },
        { id = "h_hermit", when = { questActive = TODO_QUEST("The Hermit") },
          text = "Someone sent you to check on me? How thoughtful! I'm perfectly well, dear, and I'm working on something that's coming along nicely." },
        { id = "h_thread", when = { questActive = TODO_QUEST("Deliver the Thread") },
          text = "Thread, and strong thread too! You can't have too much strong thread, because things come apart otherwise." },
        { id = "h_juice", when = { questActive = TODO_QUEST("Zombie Juice") },
          text = "Smitts brews it for me as a little pick-me-up. Don't drink it yourself, mind, because it's not for the living." },
        { id = "h_effigy", when = { questActive = TODO_QUEST("Ghoulish Effigy") },
          text = "Ghoul ribs, dear, and not the cracked ones, because I need them whole. Big ones, if you can manage it." },
        { id = "h_ogre", when = { questActive = TODO_QUEST("Ogre Thieves") },
          text = "My crate! Those brutes from the mound chased me off and took it, with all my tools and herbs inside, and the herbs are quite irreplaceable." },
        { id = "h_note", key = true, tags = { "news" }, when = { questActive = TODO_QUEST("Note to the Mayor") },
          text = "Take this to the mayor for me, would you? It's only a note, but I'd rather not watch you read it." },
        { id = "h_eliza", when = { questActive = TODO_QUEST("Bride of the Embalmer") },
          text = "Eliza's resting, so don't go near the graves. She doesn't like visitors, and she's, well, particular about her diet." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "My, so slender! Your people are built for the wind, aren't they, with such light bones? Wonderful, professionally speaking." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest, how nice! You'll say a word for an old man's wife, won't you? From here is fine, dear; from here is best, really." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "Oh my, all that shine! Do stand a little further off, dear, because my eyes aren't what they were, and nor is anything else of me." },
      },
      again = {
        { id = "h_again", text = "More questions? How lovely, since nobody asks me anything anymore." },
        { id = "h_again2", text = "Go on, dear. I've time, a great deal of time." },
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
        { id = "w_default", text = "It's a surprise for Darkshire. They've been so unkind about my hobbies, and I want to show them what I can make." },
        { id = "w_after", when = { questDone = TODO_QUEST("Translation to Ello") },
          text = "Nothing at all, dear, nothing. A garden, perhaps, or something else that stays where it's put." },
      },
      choices = {
        { text = "I'm sure they'll love it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something about this feels wrong.", next = "wrong", fx = { trait = { skeptical = 1 } } },
        { text = "What's all the thread for?", next = "work_thread" },
      },
    },
    wrong = {
      lines = { { id = "wr_default", text = "Wrong? No, dear, only unfinished, and people always confuse the two." } },
      choices = {
        { text = "Unfinished how?", next = "wrong_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrong_more = {
      big = true,
      lines = {
        { id = "wm_default", text = "A few more parts and a good tight stitch, and then it will be perfectly itself. Oh, I've said too much, but I always say too much to kind faces." },
      },
      choices = {
        { text = "Then say a little more.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "I'll leave you to it.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    work_thread = {
      lines = {
        { id = "wt_default", text = "It's for the doors and windows, dear, strung across to keep unwanted spirits out. One can't be too careful, living beside a cemetery." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    wife = {
      big = true,
      lines = {
        { id = "wf_default", text = "Eliza was kind and clever and beautiful, and then she was gone. I couldn't bear it, so I didn't, and let's leave it there." },
      },
      choices = {
        { text = "I'm sorry for your loss.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "What do you mean, you didn't?", next = "didnt", fx = { trait = { curious = 1 } } },
      },
    },
    didnt = {
      lines = { { id = "d_default", text = "I didn't bear the grief, dear, that's all I meant. I'm a hermit, and we're allowed to be strange about such things." } },
      choices = {
        { text = "Strange how?", next = "didnt_strange" },
        { text = "Something else.", next = "BACK" },
      },
    },
    didnt_strange = {
      lines = {
        { id = "ds_default", text = "I keep her close, very close, just behind the shack. She was always particular about visitors, and she's grown more so." },
      },
      choices = {
        { text = "Behind the shack?", next = "BACK", fx = { trait = { curious = 1 }, learn = { "embalmer" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    dead = {
      lines = {
        { id = "de_default", text = "Oh, they come knocking, and a pack of bone chewers pounded on my walls only yesterday, which was very rude of them. I'm making a scarecrow for them, a ghoulish one." },
      },
      choices = {
        { text = "A scarecrow, out of what?", next = "dead_effigy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead_effigy = {
      lines = {
        { id = "dd_default", text = "Ghoul ribs, dear, because like calls to like, and then like goes away. That's the theory, at least, and I'm terribly fond of the theory." },
      },
      choices = {
        { text = "That's ingenious.", next = "BACK", fx = { affinity = 1 } },
        { text = "That's disgusting.", next = "BACK", fx = { affinity = -1 } },
      },
    },

    town = {
      lines = {
        { id = "to_default", text = "It's a long road, and I'm not getting any younger. Besides, Darkshire has been unkind about my hobbies, with all its whispers and its looks." },
      },
      choices = {
        { text = "Who's been unkind?", next = "town_unkind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    town_unkind = {
      lines = {
        { id = "tu_default", text = "Oh, everyone, a little, but never mind that. The mayor and I are old friends, you know, and I'm writing him a note that will clear everything up." },
      },
      choices = {
        { text = "The mayor's your friend?", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    priest = {
      lines = {
        { id = "pr_default", text = "Oh, how kind, but no. She's sleeping, and she doesn't care for visitors, so pray from here, or better yet, pray for me, since I'm the one still up and about." },
      },
      choices = {
        { text = "Why can't I see her grave?", next = "priest_grave" },
        { text = "Then I'll pray for you both.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Then I'll save my prayers for someone who wants them.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    priest_grave = {
      lines = {
        { id = "pg_default", text = "Because I asked you nicely, dear, and because you'd only be disappointed. It's a very plain grave, since all the effort went elsewhere." },
      },
      choices = {
        { text = "The dead should be left to rest.", next = "BACK", fx = { affinity = -1, align = { light = 1 }, trait = { pious = 1 } } },
        { text = "The dead don't much care how they're kept.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },

    warlock = {
      lines = {
        { id = "wl_default", text = "Necromancy? Dear me, such a big word for a little hobby. You'll keep it between us, won't you, one dabbler to another?" },
      },
      choices = {
        { text = "Your secret's safe.", next = "BACK", fx = { affinity = 2, align = { light = -1 } } },
        { text = "The Night Watch will hear of it.", next = "BACK", fx = { affinity = -3, align = { order = 1 } } },
      },
    },
    alchemy = {
      lines = {
        { id = "al_default", text = "Everything, given time: flowers, fruit, even feelings. The trick is the heart, because you must keep the heart going... oh, I'm rambling again." },
      },
      choices = {
        { text = "Keep the heart going?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Oh, an old hermit hears a great deal out here, you know, more than you'd think. Ask me about any of this, and I'll put the kettle on." },
    },
    background = { { id = "tp_bg", text = "I'm just an old alchemist who outlived his wife, though 'outlived' is rather a strong word." } },
    advice = { { id = "tp_ad", text = "Keep your strength up and your stitches tight, dear, because things come apart otherwise." } },
    night_watch = { { id = "tp_watch", text = "Brave souls, the Watch, but so very fragile." } },
    worgen = { { id = "tp_worgen", text = "They don't bother me, dear, since I'm not much of a meal anymore." } },
    stalvan = { { id = "tp_stalvan", text = "Old Mistmantle? He was before my time up here, which is a shame, because I'd have liked to meet him." } },
    morbent_fel = { { id = "tp_morbent", text = "The fellow on the hill? Crude work, all bones and no heart, and I'd never let anything of mine go out looking like that." } },
    embalmer = { { id = "tp_embalmer", text = "It's a silly story they tell children in Darkshire, and I've always thought the ending was unkind." } },
    _none = { { id = "tp_none", text = "Oh, I wouldn't know about that, dear. I'm out of touch up here, pleasantly out of touch." } },
  },
}
