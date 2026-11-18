-- Katar: the patrol leader of Misty Reed Post, who hates the sea and every murloc it spawns. Voice: bibles/katar.md
local P = RPGDialogueAPI:Pack("rpgd.swampofsorrows")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "katar", id = TODO_NPC("Katar"), name = "Katar",
  bible = "bibles/katar.md", role = "soldier", tier = "quest",
  communities = { "misty_reed_post", "stonard" }, temper = { "grim", "brooding" }, values = { "vengeful", "dutiful" },
  notices = { "class", "kit" },

  impression = {
    first = "I have not asked what the sea took from him.",
    third = "{name} met Katar, the grim patrol leader of Misty Reed Post, who hates the sea and its murlocs.",
  },

  greetings = {
    { id = "g_default", text = "Be silent a moment. Even over the sea's roar, you can hear the fish men gurgling." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. How many did you kill, and did they die screaming?" },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}. The fish men haven't, so neither have I." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The tide's in, and they come up with it at night. Keep your weapon close." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. Don't speak to me of the spirits of water, because whatever spirits live in that sea, they're as cruel as the sea itself." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armor's been chewed, and I'd know the marks of murloc teeth anywhere. Mend it before you go back to the beach." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Katar, and I lead the patrols along this beach for the Horde. I've no love for the sea, nor for any creature I've seen come from it, and if it were in my power I'd slay the fish men by the hundreds, as my clan once slew its enemies." },
        { id = "h_threat_active", tags = { "news" }, when = { questActive = TODO_QUEST("Threat From the Sea") },
          text = "Slay the marsh murlocs, their inkspewers and their flesheaters, as many as you can, {class}, and I'll take my pleasure in hearing them die." },
        { id = "h_threat_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Threat From the Sea"), days = 3 } },
          text = "You've stained the sea with the blood of her own spawn, and the fish men know pain tonight. I'll smile every time I hear one silenced." },
        { id = "h_continued", tags = { "news" }, when = { questActive = TODO_QUEST("Continued Threat") },
          text = "It pleases me that your hatred for the fish men grows with mine. Find their oracles too, and come back when you've had your fill." },
        { id = "h_continued_done", tags = { "news" }, when = { questDone = TODO_QUEST("Continued Threat") },
          text = "I called for more of their blood and you brought it. Let all the fish men perish, and let us hear it." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren, from the dry plains. You've never had the sea try to swallow you, so you may not understand me, but you can still kill what comes out of it." },
      },
      again = {
        { id = "h_again", text = "What else? Speak low, the way an orc speaks on the hunt." },
        { id = "h_again2", text = "Go on. I'm listening to you and the sea both." },
      },
      choices = {
        { text = "You speak of the sea like an old enemy.", next = "sea" },
        { text = "What are the murlocs doing on this coast?", next = "murlocs" },
        { text = "How do the patrols work?", next = "patrol" },
        { text = "The water spirits aren't cruel, Katar.", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "The dead know the sea doesn't care, Katar.", next = "xforsaken", when = { race = "Scourge" } },
        { text = "I'll go hunting.", next = "END" },
      },
    },

    sea = {
      lines = {
        { id = "se_default", text = "It is a powerful but blind mistress, callous and brutal, and it takes what it wants without knowing what it's taken. That's all I'll say of it." },
      },
      choices = {
        { text = "What did it take from you?", next = "sea_loss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sea_loss = {
      lines = {
        { id = "sl_default", text = "Tok'Kar asked me that once, and he got no answer, and neither will you. Kill the fish men and I'll think better of you than of anyone who asks questions." },
      },
      choices = {
        { text = "I'll leave it, then. Your grief is yours.", next = "sea_respect" },
        { text = "Hatred will eat you hollow, Katar.", next = "sea_respect" },
      },
    },
    sea_respect = {
      lines = {
        { id = "sr_default", text = "My hate has kept me sharp on this beach for a long time, and the camp's alive because of it. When the sea stops sending murlocs, I'll consider letting it go." },
      },
      choices = {
        { text = "Hate that keeps the camp alive is no sin.", next = "BACK", reply = "It isn't, and I'm glad someone sees it. The sea can have my hatred; it gave me reason enough.", fx = { align = { light = -1 } } },
        { text = "I'd rather fight for something than against it.", next = "BACK", reply = "For something? I fight for the camp, if that helps. But it's the sea that gets my axe.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    murlocs = {
      lines = {
        { id = "mu_default", text = "Breeding, and gathering, and growing bolder, with marsh oracles among them now who chant over the tide. Their stupidity forces them to refortify after every slaughter, and that's good, because it keeps them busy." },
      },
      choices = {
        { text = "I doubt murlocs could ever threaten Stonard.", next = "murlocs_stonard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    murlocs_stonard = {
      lines = {
        { id = "ms_default", text = "In enough numbers, anything can threaten anything, and murlocs never stop at enough. If the beach falls, they'll be in the reeds outside Stonard's walls by morning." },
      },
      choices = {
        { text = "Then they die on the beach.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    patrol = {
      lines = {
        { id = "pa_default", text = "Two at a time along the tideline, from the post to the rocks and back, and never closer to the water than a spear's throw. The ones who get careless at the water's edge are the ones I don't see again." },
      },
      choices = {
        { text = "You look like you need more soldiers.", next = "patrol_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    patrol_more = {
      lines = {
        { id = "pm_default", text = "I need soldiers who don't drink, and those are rarer than pearls out here. Tok'Kar the cook says the same, though I'd never tell him he's right." },
      },
      choices = {
        { text = "Discipline should be enforced. Punish the drinkers.", next = "BACK", reply = "Punished, aye, and they will be, if I catch them. Tok'Kar can keep his sympathy.", fx = { align = { order = 1 } } },
        { text = "Let them drink. It's a miserable post.", next = "BACK", reply = "Miserable, aye, and drunk makes it worse. A drunk on watch is a murloc's dinner.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xshaman = {
      big = true,
      lines = {
        { id = "xs_default", text = "Then they're not the spirits that live in this sea, shaman, or they've grown deaf to whatever happens beneath it. Pray to them if you like, but bring your axe to the beach either way." },
      },
      choices = {
        { text = "The spirits can be called to help. I'll ask.", next = "BACK", reply = "Ask, then, and I'll watch. If they answer, I'll owe you an apology, shaman.", fx = { align = { honor = 1 } } },
        { text = "You're right. Here, the axe speaks louder.", next = "BACK", reply = "It does, and it always has. Pick up an axe, and I'll stand you on the beach.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xforsaken = {
      big = true,
      lines = {
        { id = "xf_default", text = "You'd know, I suppose, that it doesn't care whether you're living or dead, only whether you're in it. I'll trust a corpse who's seen the sea's indifference over a living orc who hasn't." },
      },
      choices = {
        { text = "The sea's just water. It's the murlocs we fight.", next = "BACK", reply = "Just water, aye, and the murlocs are its children. You'll forgive me if I hate the mother as well.", fx = { align = { order = 1 } } },
        { text = "Some things deserve hatred. The sea's one of them.", next = "BACK", reply = "You understand, then, corpse. Stand on my beach whenever you like.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I've lived by this beach long enough to hate it, and the sand's in every seam of my armour. Ask me something else." } },
    advice = { { id = "tp_ad", text = "Never turn your back on the tide, for it's always coming back." } },
    thrall = { { id = "tp_thrall", text = "The Warchief gave us Durotar, and I left it for this swamp, which shows how little sense I have. I'd follow him anywhere, but not back to this beach, if I had the choice." } },
    second_war = { { id = "tp_second_war", text = "I fought in the Second War, on ships off the coast of Lordaeron. The sea took more of us than the Alliance did, and I've hated it since." } },
    sunken_temple = { { id = "tp_sunken_temple", text = "The trolls in that temple on the lake chant all night, and the sound carries over the water to my beach. I don't sleep much anymore." } },
    internment = { { id = "tp_internment", text = "I spent years in an internment camp after the war, and when I got out I came to the sea. I don't know why, it's never done me any good." } },
    _none = { { id = "tp_none", text = "I don't know. Ask me about the fish men instead, because that's where my blood runs hot." } },
  },
}
