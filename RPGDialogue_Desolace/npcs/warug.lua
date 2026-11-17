-- Warug, spokesman of the Magram clan, who answers only to the strong (0.72.0). Voice: bibles/warug.md
-- Classic: Magram Alliance (turn-in); Assault on the Kolkar, Broken Tears, Brutal Politics, Gizmo for Warug,
-- Khan Shaka, Khan Hratha (at Friendly).
local P = RPGDialogueAPI:Pack("rpgd.desolace")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "warug", id = TODO_NPC("Warug"), name = "Warug",
  bible = "bibles/warug.md", role = "noble", tier = "quest",
  communities = { "magram_village" }, temper = { "boastful", "fierce" }, values = { "strength", "clan" },
  notices = { "race", "deeds" },
  impression = {
    first = "Warug laughs at the Kolkar, sneers at the Gelkis and their mother, and boasts that the Magram need no one. Then he asked me, almost shyly, whether I had any gnomish gadgets.",
    third = "{name} met Warug, the Magram clan's spokesman, a boastful centaur with a strange fondness for gnomish gizmos.",
  },

  greetings = {
    { id = "g_hostile", when = { reputation = { faction = "Magram Clan Centaur", max = "neutral" } }, text = "Go away, outsider! Warug does not talk to weaklings; the Magram only kill them." },
    { id = "g_friend", when = { reputation = { faction = "Magram Clan Centaur", min = "friendly" } }, text = "The Gelkis cry when they hear your name! Come, strong one, and talk with Warug." },
    { id = "g_shaka", when = { questActive = TODO_QUEST("Khan Shaka") }, text = "Shaka still prays to his mother. Go and see if she saves him." },
    { id = "g_gizmo", when = { questDone = TODO_QUEST("Gizmo for Warug") }, text = "The gizmo still clicks and whirs! I watch it at night, and it makes me laugh." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and you come back alive. That is how the Magram know who is strong." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You are stronger than when you first came. Warug sees it, and Warug likes it." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A little one, like the gnome who came with the cart of funny things! Do you have funny things? Show Warug." },
    { id = "n_gelkis", cat = "deeds", when = { any = { { killed = { name = "Gelkis", min = 30 } }, { reputation = { faction = "Magram Clan Centaur", min = "friendly" } } } },
      text = "You smell of Gelkis blood, and the Gelkis are crying somewhere. Good! You are strong like the Magram." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "If you want to speak with Warug, then show me you are strong. Go and slay many Gelkis, and come back when they cry at your name." },
        { id = "h_friend", key = true, when = { reputation = { faction = "Magram Clan Centaur", min = "friendly" } },
          text = "I am Warug, and I speak for the Magram. The Kolkar think they are strong, but we laugh at them, and then we kill them, and you are welcome to help." },
        { id = "h_alliance", tags = { "news" }, when = { questActive = TODO_QUEST("Magram Alliance"), reputation = { faction = "Magram Clan Centaur", min = "friendly" } },
          text = "The Gelkis fear you, and they hate you as they hate the Magram. Maybe you are strong like the Magram, then. We will see." },
        { id = "h_hratha", tags = { "news" }, when = { questRecent = { TODO_QUEST("Khan Hratha"), days = 3 } },
          text = "Hratha is dead! The Kolkar will run in circles for a year, and the Magram will laugh the whole time." },
        { id = "h_hostile", when = { reputation = { faction = "Magram Clan Centaur", max = "unfriendly" } },
          text = "Go away! Warug does not waste words on the weak, and you are weak until the Gelkis know your name. Kill many of them, and then come back." },
      },
      again = {
        { id = "h_again", text = "What else? Speak loud, so the Gelkis hear it." },
        { id = "h_again2", text = "More talk? Talk is good, but killing Gelkis is better." },
      },
      choices = {
        { text = "Why do the Magram hate the Gelkis?", next = "gelkis", when = { reputation = { faction = "Magram Clan Centaur", min = "neutral" } } },
        { text = "Where do the centaur come from?", next = "origin", when = { reputation = { faction = "Magram Clan Centaur", min = "friendly" } } },
        { text = "Why do you like gnomish gadgets?", next = "gizmo", when = { reputation = { faction = "Magram Clan Centaur", min = "friendly" } } },
        { text = "The tauren remember your raids, Warug.", next = "tauren_w", when = { race = "Tauren", reputation = { faction = "Magram Clan Centaur", min = "friendly" } } },
        { text = "What would the Magram have me do?", next = "BUSINESS", when = { reputation = { faction = "Magram Clan Centaur", min = "friendly" } } },
        { text = "I'll go.", next = "END" },
      },
    },

    gelkis = {
      lines = {
        { id = "ge_default", text = "The Gelkis think our mother, Theradras, protects us. They are stupid! No one protects the centaur, and the Magram do not need protecting, because we are the strongest." },
      },
      choices = {
        { text = "And if Theradras is real?", next = "gelkis_real" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gelkis_real = {
      lines = {
        { id = "gr_default", text = "Maybe she is real, maybe not, but she does not fight our wars. The Magram fight their own wars, and the Gelkis pray, and so the Gelkis lose." },
      },
      choices = {
        { text = "Pride like that can break a clan.", next = "gelkis_pride" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gelkis_pride = {
      big = true,
      lines = {
        { id = "gp_default", text = "Ha! Then let it break us, and we will break the Gelkis first. You talk like a shaman, strong one, but you fight like a Magram, and that is the part Warug likes." },
      },
      choices = {
        { text = "The strong should rule. You're right.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Strength without wisdom just gets you killed.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    origin = {
      lines = {
        { id = "or_default", text = "The Gelkis tell the story of Zaetar and Theradras, the son of the forest god and the earth mother, and the first centaur born in the deep caves. Maybe it is true, but it does not matter, because what matters is who is strong now." },
      },
      choices = {
        { text = "You don't care where you came from?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gizmo = {
      lines = {
        { id = "gz_default", text = "Long ago a small gnome rode into Desolace with a cart full of wonders, lights that burned every colour and little machines that walked with no life in them. I killed him, because he was on Magram land, but first he made Warug laugh harder than anyone ever has." },
      },
      choices = {
        { text = "You killed him?", next = "gizmo_killed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gizmo_killed = {
      big = true,
      lines = {
        { id = "gk_default", text = "He was weak, and he was on Magram land, and that is how it is in Desolace. But I kept one of his little machines, and sometimes I wind it, and I am sorry there are no more." },
      },
      choices = {
        { text = "That's cruel, Warug.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The desert is hard. I understand.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren_w = {
      lines = {
        { id = "tw_default", text = "And the centaur remember yours. But today the Gelkis and the Kolkar are in front of us both, so today Warug will laugh with a tauren." },
      },
      choices = {
        { text = "Today, then.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I am Warug, and I speak for the Magram because I am loud and I am strong. That is enough." } },
    advice = { { id = "tp_ad", text = "Never let a centaur get behind you. We do not fight fair, because fair is for losers." } },
    centaur = { { id = "tp_centaur", text = "The Magram are the strongest of the clans, and the Kolkar are dogs, and the Gelkis are crying children who hug rocks! Warug says so, and Warug is right." } },
    maraudon = { { id = "tp_maraudon", text = "The Gelkis say Maraudon is holy, and the Maraudine say Maraudon is theirs. Warug says Maraudon is a big hole full of rocks, and the Magram do not need holes." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "Warug hears the little gnomes had a city full of gadgets, and lost it! Warug would have kept it, and Warug would have all the gadgets." } },
    scourge = { { id = "tp_scourge", text = "The dead in the Valley of Bones fight for the Magram now, so even death obeys the strong. Warug likes this very much." } },
    burning_legion = { { id = "tp_burning_legion", text = "The orcs in the fortress talk to demons, and the demons talk back. Warug thinks demons are strong, but Warug does not trust a thing that will not come out and fight." } },
    _none = { { id = "tp_none", text = "Warug does not know, and Warug does not care. Kill some Gelkis, and ask again." } },
  },
}
