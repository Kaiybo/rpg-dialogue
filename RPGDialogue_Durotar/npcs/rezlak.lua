-- Rezlak, the Tinkers' Union's man on the road south of Orgrimmar. Voice: bibles/rezlak.md
-- One of Gazlowe's boys, losing caravans to the harpies and money by the hour.
local P = RPGDialogueAPI:Pack("rpgd.durotar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "rezlak", id = TODO_NPC("Rezlak"), name = "Rezlak", title = "Tinkers' Union",
  bible = "bibles/rezlak.md", role = "questgiver", tier = "quest",
  temper = { "anxious" }, values = { "profit", "practical" },
  notices = { "purse", "craft" },
  impression = {
    first = "Rezlak is one of Gazlowe's goblins, posted on the road outside Orgrimmar to keep the supply caravans moving. The harpies keep taking them, and he talks faster every time he counts what that has cost.",
    third = "{name} met Rezlak of the Tinkers' Union, a harried goblin trying to keep Gazlowe's caravans safe from the Durotar harpies.",
  },

  greetings = {
    { id = "g_road", text = "Keep moving, pal, keep moving. Standing still on this road is how you get carried off by a harpy." },
    { id = "g_sacks", when = { questActive = TODO_QUEST("Winds in the Desert") }, text = "Five sacks, Razorwind Canyon, harpies on top of them. You remember the deal, right?" },
    { id = "g_harpies", when = { questActive = TODO_QUEST("Securing the Lines") }, text = "Every harpy you drop is a caravan I don't have to explain to the boss. Keep counting!" },
    { id = "g_safe", when = { questDone = TODO_QUEST("Securing the Lines") }, text = "Two caravans through this week without a feather in sight. That's a record, pal, and you're half of it." },
    { id = "g_away", when = { away = 14 }, text = "There you are! {away} gone, and you know what I lost while you were away? Don't answer that, it'll ruin both our days." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Look at you, all grown up and dangerous. If I'd known you'd turn out this tough I'd have charged you less for the privilege of working for me." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Word on the road says you've been helping folks out. Good for business, pal, because helpful people are the ones I hire." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "Whoa, you're jingling, pal. Somebody's been doing well for themselves, and I respect that more than you know." },
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "Is that grease under your fingernails? An engineer! Finally somebody on this road who knows a sprocket from a spoon." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Rezlak, Tinkers' Union, one of Gazlowe's boys. The boss sent me up from Ratchet to keep the orcs supplied, and that'd be easy money if the harpies would stop eating my caravans." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Winds in the Desert") },
          text = "You look like you can swing something sharp. The last shipment, the one they PROMISED would get through, got snatched by the Dustwind harpies down in Razorwind Canyon, and I need those supplies back before somebody up the chain notices." },
        { id = "h_sacks_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Winds in the Desert"), days = 3 } },
          text = "My sacks! Every one of them, and only a little chewed. Now I just need somebody to haul them, because I'm a thinker, pal, not a lifter." },
        { id = "h_lines_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Securing the Lines"), days = 3 } },
          text = "No harpies over the canyon for three days running, and I can finally breathe. Word is the next shipment has some fun little toys in it, so I'd better be here to sign for them." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "Don't give me that look, pal. This road belongs to the orcs, sure, but my business belongs to whoever's paying, and the harpies don't check colors before they bite." },
        { id = "h_goblinfriend", when = { race = "Troll" }, text = "A troll! You lot have long arms, pal, and long arms carry sacks. Tell me you've got a strong back to match." },
      },
      again = {
        { id = "h_again", text = "What else? Talk fast, pal, the clock's running." },
        { id = "h_again2", text = "Go on, go on. Time's money and you're spending mine." },
      },
      choices = {
        { text = "What happened to your caravans?", next = "caravans" },
        { text = "What's a goblin doing working for the orcs?", next = "orcs" },
        { text = "Tell me about this Gazlowe.", next = "gazlowe" },
        { text = "I'm Alliance. Why deal with me at all?", next = "alliance", when = { faction = "Alliance" } },
        { text = "I know engines. What's in the next shipment?", next = "toys", when = { profession = "Engineering" } },
        { text = "Let's talk business.", next = "BUSINESS" },
        { text = "Good luck with the harpies.", next = "END" },
      },
    },
    caravans = {
      lines = { { id = "c_default", text = "The Dustwind harpies nest in Razorwind Canyon, right where the road squeezes between the walls. A kodo can't turn around in there, and a harpy can drop on you from three sides, so every caravan's a coin toss and I keep losing." } },
      choices = {
        { text = "Why not hire guards?", next = "guards" },
        { text = "Then go around the canyon.", next = "around" },
      },
    },
    guards = {
      lines = { { id = "gu_default", text = "Guards cost money, pal, and dead guards cost more, because then there's paperwork. Gazlowe told me once that if you want something done well, you do it yourself, so here I am, doing it myself, by paying you." } },
      choices = {
        { text = "That's not quite doing it yourself.", next = "price" },
        { text = "Something else, Rezlak.", next = "BACK" },
      },
    },
    price = {
      big = true,
      lines = { { id = "pr_default", text = "Sure it is! The other thing the boss taught me is that you can get anything done for a price, so doing it myself means finding the price. Anyway, the harpies don't care whose coin it is, and neither should you." } },
      choices = {
        { text = "Fair work for fair pay. I'll take it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd clear those harpies for nothing. They're a menace.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    around = {
      lines = { { id = "ar_default", text = "Around? There is no around, pal, that's the whole problem with canyons. The only other way is through the scorpid country, and the scorpids are worse, because scorpids don't even want the cargo." } },
      choices = { { text = "Fair point. Something else.", next = "BACK" } },
    },
    orcs = {
      lines = { { id = "o_default", text = "Orgrimmar didn't build itself, pal. Gazlowe put his boys to work on it back when the Warchief first landed, and the orcs have been good customers ever since, which in my line of work is the same as being friends." } },
      choices = {
        { text = "So you're friends with whoever pays.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Do the orcs trust you?", next = "trust" },
      },
    },
    trust = {
      lines = { { id = "t_default", text = "They trust me to show up and they trust me to charge them, and I've never let them down on either one. That's more than you can say for most people, if you think about it." } },
      choices = { { text = "Something else, Rezlak.", next = "BACK" } },
    },
    gazlowe = {
      lines = { { id = "gz_default", text = "Runs Ratchet, down on the coast past the Crossroads. Best boss I ever had, and the only one who never set me on fire, so if you're ever in Ratchet, tell him Rezlak sent you, and tell him I'm working hard." } },
      choices = {
        { text = "I'll tell him you're working hard.", next = "BACK", fx = { affinity = 1, learn = { "steamwheedle" } } },
        { text = "I'll tell him what I see.", next = "BACK", fx = { learn = { "steamwheedle" } } },
      },
    },
    alliance = {
      lines = { { id = "al_default", text = "Because the Tinkers' Union doesn't take sides, pal, it takes orders and it fills them. You get your hands dirty with my harpies, I pay you the same as anybody, and nobody in Orgrimmar has to know who cleared the road." } },
      choices = {
        { text = "A neutral road helps everyone. I'll do it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll take Horde-side coin and enjoy it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    toys = {
      lines = { { id = "ty_default", text = "Wouldn't you like to know! The manifest says fun little toys, which in the Tinkers' Union means anything from a pocket clock to something that eats a wall. I'll find out when I sign for it, same as you." } },
      choices = { { text = "Save me one of the wall-eaters.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Born in Undermine, raised on invoices, working my way up. That's all you get for free, pal." } },
    advice = { { id = "tp_ad", text = "Never trust a canyon, and never pay up front. Those two rules have kept me alive longer than any armor." } },
    steamwheedle = { { id = "tp_steam", text = "Gazlowe's in with the Steamwheedle folk down in Ratchet, and that means a port that'll sell to anybody. You want neutral, that's as neutral as it gets." } },
    _none = { { id = "tp_none", text = "Don't know, don't care, unless there's money in it. Is there money in it?" } },
  },
}
