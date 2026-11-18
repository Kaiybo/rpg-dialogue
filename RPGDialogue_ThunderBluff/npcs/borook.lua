-- Borook Gallfist, Darkspear Islands battlemaster on Hunter Rise (Forever).
-- A Darkspear far from the sea, sending tauren to fight on his people's old islands.
-- Voice: bibles/borook.md
local P = RPGDialogueAPI:Pack("rpgd.thunderbluff")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "borook", id = TODO_NPC("Borook Gallfist"), name = "Borook Gallfist", title = "Darkspear Islands Battlemaster",
  bible = "bibles/borook.md", role = "soldier", tier = "service",
  communities = { "thunder_bluff" }, temper = { "gruff", "dry" }, values = { "loyal", "practical" },
  notices = { "race", "pvp", "level" },

  impression = {
    first = "Borook Gallfist is a sour-tempered Darkspear troll on Hunter Rise who recruits for the fighting on the old Darkspear Islands. He complained about the wind, the height and the tauren cooking, and then spoke of his people's islands with something close to tenderness.",
    third = "{name} met Borook Gallfist, the Darkspear battlemaster on Thunder Bluff's Hunter Rise who sends the Horde to fight on the Darkspear Islands.",
  },

  greetings = {
    { id = "g_default", text = "Well, well. You come all the way up this rock to fight for the Horde on the Darkspear Islands, or just to look at a troll?" },
    { id = "g_low", when = { maxLevel = 29 }, text = "Sorry, {class}, but you not ready for the islands yet. Go and get a few more fights behind you, then climb back up here." },
    { id = "g_back", when = { metBefore = true, minLevel = 30 }, text = "You again. Good, the islands need you more than Borook needs the company, but he'll take both." },
    { id = "g_tb", when = { reputation = { faction = "Darkspear Trolls", min = "honored" } }, text = "Vol'jin's people speak well of you, mon. Then come and fight for the place we came from." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" }, place = "before",
      text = "A Darkspear, up here among the tauren! Tell me true, does your stomach still turn when you look over the edge, or be it only mine?" },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Your elders tell me the land be sacred everywhere. Then the islands be sacred too, friend, and somebody should stand on them who respects that." },
    { id = "n_low", cat = "level", when = { maxLevel = 15 },
      text = "So young, and already up on Hunter Rise asking about wars. Go and hunt plainstriders a while longer, little one." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "Borook Gallfist, battlemaster for the Darkspear Raiders. Theramore's soldiers be crawling over our old islands, and Borook stands on this windy rock sending tauren to throw them off, which be a strange life for a troll." },
        { id = "h_low", when = { maxLevel = 29 },
          text = "Borook Gallfist, and Borook be sorry, {class}, but you not experienced enough to go to the Darkspear Islands yet. The jungle there don't care how brave you be, only how strong." },
        { id = "h_troll", when = { race = "Troll" },
          text = "Borook Gallfist, and you be a long way from the sea, same as me. The Raiders be fighting for the islands where Sen'jin met the Warchief, and every Darkspear knows that story." },
      },
      again = {
        { id = "h_again", text = "What else? Talk fast, this wind steals the words out of your mouth." },
        { id = "h_again2", text = "Go on, mon. Borook be listening, when the wind lets him." },
      },
      choices = {
        { text = "Why recruit up here, of all places?", next = "bluff" },
        { text = "What happened on those islands?", next = "islands" },
        { text = "How do you like Thunder Bluff?", next = "likes" },
        { text = "Send me to the Darkspear Islands.", next = "BUSINESS", when = { minLevel = 30 } },
        { text = "Another time, Borook.", next = "END" },
      },
    },
    bluff = {
      lines = {
        { id = "bl_default", text = "Because the tauren be the strongest fighters in the Horde, and they don't run when the tide comes in. So the Raiders sent Borook here to find them, on the top of a mountain, as far from the sea as a troll can get." },
      },
      choices = {
        { text = "The tauren don't mind fighting for troll land?", next = "bluff_tauren" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bluff_tauren = {
      big = true,
      lines = {
        { id = "bt_default", text = "Some do, and they tell me so, very politely. They say the Horde should mend what it has before it fights for what it lost, and Borook says a people who forget their old home forget themselves too. Who be right?" },
      },
      choices = {
        { text = "Your people's old home is worth fighting for.", next = "BACK", reply = "Ha, dat be what Borook wants to hear, mon. The Echo Isles still remember Darkspear feet, and one day they gonna feel them again.", fx = { align = { order = -1 } } },
        { text = "Mend what the Horde has first. The past can wait.", next = "BACK", reply = "You talk like a tauren elder, slow and sensible, and maybe you be right. But Zalazane sits on our islands while we mend, and the loa don't wait forever.", fx = { align = { order = 1 } } },
        { text = "You both are, in your way.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    islands = {
      lines = {
        { id = "is_default", text = "Thrall's ships washed up there in a storm, and old Sen'jin welcomed them, and then the murlocs took them both down under the islands for their sea witch. Sen'jin died there, and the mountain blew, and the Darkspear left with the Horde." },
      },
      choices = {
        { text = "And now Theramore holds them?", next = "islands_now" },
        { text = "Something else.", next = "BACK" },
      },
    },
    islands_now = {
      lines = {
        { id = "in_default", text = "Theramore wants them, and the Raiders want them, and nobody holds them for long. Some of our people never left, you know, and Borook would like to know they be safe before he goes back to complaining about the wind." },
      },
      choices = {
        { text = "Then we'll go and make sure.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    likes = {
      lines = {
        { id = "lk_default", text = "The wind never stops, the ground be a long way down, and the tauren put grain in everything, even the meat. But they be kind, they keep their word, and nobody up here ever tried to sell Borook to a sea witch, so he can't complain much." },
      },
      choices = {
        { text = "You've complained quite a lot already.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    echo_isles = { { id = "tp_echo", text = "The Echo Isles be the new home, off Durotar, and Zalazane's madness sits on them now. The Darkspear Islands be the old home, out past the sea, and Borook would like his people to keep at least one of them." } },
    background = { { id = "tp_bg", text = "Borook be a Darkspear who left the islands young and ended up on a mountain. He fights for Vol'jin, and that be all he needs to say about himself." } },
    advice = { { id = "tp_ad", text = "Never stand at the edge of anything in this town when the wind changes. Borook learned that one the hard way, and he still has the bruise." } },
    _none = { { id = "tp_none", text = "Borook don't know about that. Ask a tauren, they'll tell you, slowly." } },
  },
}
