-- Brother Neals, Northshire Abbey (the bell tower, where the wine is tasted). Voice: bibles/neals.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "neals", id = TODO_NPC("Brother Neals"), name = "Brother Neals",
  bible = "bibles/neals.md", role = "questgiver", tier = "quest",
  communities = { "northshire" }, temper = { "steady" },
  notices = { "drink", "faith" },

  greetings = {
    { id = "g_light", text = "Light be with you." },
    { id = "g_manifest", when = { questActive = TODO_QUEST("Grape Manifest") }, text = "Ah, the manifest! Hand it here, friend, and carefully, if you please." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 1 } },
      text = "You've been sampling, I see. Moderation, friend, and I say that as someone who has failed at it often." },
    { id = "n_priest_gnome", cat = "faith", when = { race = "Gnome", class = "PRIEST" },
      text = "A gnome who follows the Light! I'd heard there were some now, but I'd not quite believed it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "The Abbey's cellars are a quiet comfort, friend, for our guests, naturally." },
        { id = "q_manifest_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Grape Manifest"), days = 2 } },
          text = "Every barrel accounted for. The Light loves a careful tally almost as much as I do." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest! Do they still make novices copy the old texts by candlelight at the Cathedral, or has Stormwind gone soft?" },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "Brother Sammuel's pupil? Mind he doesn't work you too hard. He forgets that some of us enjoy supper." },
        { id = "h_book", tags = { "news" }, once = true, priority = 15, when = { bookRead = "The Seven Kingdoms" },
          text = "You've read The Seven Kingdoms? Then you know Stromgarde won't let go of what it was. Neither will I, of the Abbey." },
        { id = "h_kind", when = { alignment = { axis = "light", min = 40 } },
          text = "There's a kindness about you, friend. It shows, you know; it always shows." },
        { id = "h_asleep", when = { metBefore = true }, text = "I fell asleep in the library again, friend, face-down in a book of prayers. The Light, I'm told, found it very funny." },
        { id = "h_stairs", when = { questActive = TODO_QUEST("Grape Manifest") },
          text = "You climbed all the way up the bell tower with Milly's manifest! Sit, sit, and catch your breath; I'll pour while you do." },
        { id = "h_novice", when = { origin = "human_abbey_novice" },
          text = "I know that face! You used to bring the tallies up these stairs and pretend you hadn't read them, but you had, and I always knew." },
      },
      again = {
        { id = "h_again", text = "Something else, friend? The bells won't ring for an hour." },
        { id = "h_again2", text = "Go on, I'm in no hurry. I'm rarely in a hurry, up here." },
      },
      choices = {
        { text = "Tell me about the Abbey.", next = "abbey" },
        { text = "You like your wine, Brother?", next = "wine" },
        { text = "What's in the library worth reading?", next = "library" },
        { text = "How do I keep my faith when it's hard?", next = "faith", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "About the manifest...", next = "BUSINESS", when = { questActive = TODO_QUEST("Grape Manifest") } },
        { text = "Just paying my respects.", next = "END" },
      },
    },
    abbey = {
      lines = {
        { id = "a_default", key = true,
          text = "Archbishop Faol's clerics trained the first paladins here. The walls remember, even if Stormwind forgets.",
          fx = { learn = { "northshire_abbey" } } },
      },
      choices = {
        { text = "These walls look newer than that.", next = "abbey_war" },
        { text = "I'd like to see the library sometime.", next = "BACK", fx = { trait = { curious = 1 }, affinity = 1 } },
        { text = "Old stones. Nothing more.", next = "BACK", fx = { trait = { skeptical = 1 }, affinity = -1 } },
      },
    },
    abbey_war = {
      big = true,
      lines = {
        { id = "aw_default", text = "They are. The orcs burned the old Abbey in the First War, and they hunted the clerics first, because a healer sends a soldier back to the line, you see." },
      },
      choices = {
        { text = "And after the war?", next = "abbey_after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    abbey_after = {
      lines = {
        { id = "aa_default", text = "In the Second War the Twilight's Hammer camped on our ruins. Archbishop Faol rebuilt the Abbey afterwards and founded the Brotherhood you see today, and I thank him for it nightly." },
      },
      choices = {
        { text = "I'll remember him too.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wine = {
      lines = {
        { id = "w_default", text = "I keep the stores of food and drink, you see, and keeping them requires inventory. Inventory requires tasting, and tasting requires honesty, and I am very honest." },
      },
      choices = {
        { text = "And Milly's grapes?", next = "wine_milly" },
        { text = "That's a lot of honesty, Brother.", next = "BACK", fx = { trait = { witty = 1 }, affinity = 1 } },
      },
    },
    wine_milly = {
      lines = {
        { id = "wm_default", text = "Milly Osworth grows them across the river. When the brigands overran her vineyard I very nearly despaired, though only nearly." },
        { id = "wm_saved", when = { questDone = TODO_QUEST("Grape Manifest") },
          text = "Saved, thanks to you! A full load of bushels in our stores. There'll be wine this year, and I'll be the first to tell you if it's any good." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "defias" } } } },
    },
    library = {
      lines = {
        { id = "l_default", text = "Prayers, histories and our own records. A Guardian once slept ten years in the clerics' care, here in this valley: Medivh, long before everything that came after." },
      },
      choices = {
        { text = "Medivh? Here?", next = "library_medivh" },
        { text = "Anything locked away?", next = "library_locked" },
      },
    },
    library_medivh = {
      lines = {
        { id = "lm_default", text = "He was only a boy then, struck down by more power than he could hold, and it took a hundred clerics to contain it. We kept him safe, but we couldn't keep him from what came after." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    library_locked = {
      lines = {
        { id = "ll_default", text = "There's a protected wing, for dangerous books. One went missing with a novice who ran off to the Defias, so now I lock the cellar as well, and twice over.",
          fx = { learn = { "defias" } } },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    faith = {
      big = true,
      lines = {
        { id = "f_default", text = "Badly, some days. When Milly's vines were overrun I despaired, then I prayed, and then help walked in; faith is mostly staying put long enough to see the answer." },
      },
      choices = {
        { text = "And when no one walks in?", next = "faith_none" },
        { text = "That's a comfort, Brother.", next = "BACK", fx = { affinity = 2, align = { light = 2 }, trait = { pious = 1 } } },
      },
    },
    faith_none = {
      lines = {
        { id = "fn_default", text = "Then you're the one who walks in, for somebody else. That's what the clerics did in the First War. Unarmed, and they never once hung back." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { align = { light = 1 }, trait = { brave = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A brother of Northshire. I keep the stores and climb the bell tower, and only one of those is good for my knees." } },
    advice = { { id = "tp_ad", text = "Keep a careful tally of everything: barrels, prayers and debts. The Light loves a careful tally, and so do creditors." } },
    northshire_abbey = { { id = "t_abbey", text = "Rebuilt by Archbishop Faol after the wars. Its foundations are older than half the walls in Stormwind, and better kept." } },
    defias = { { id = "t_defias", text = "I pray for them, and then I lock the cellar." } },
    _none = { { id = "t_none", text = "I'd have to look that up, and the library closes at dusk." } },
  },
}
