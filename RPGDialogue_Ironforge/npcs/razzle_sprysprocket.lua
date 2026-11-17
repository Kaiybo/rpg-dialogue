-- Razzle Sprysprocket, gnome tinker in Kharanos, partner of Ozzie Togglevolt. Voice: bibles/razzle_sprysprocket.md
-- Building the Recombobulator to undo what Gnomeregan's radiation did to his people.
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "razzle_sprysprocket", id = TODO_NPC("Razzle Sprysprocket"), name = "Razzle Sprysprocket",
  bible = "bibles/razzle_sprysprocket.md", role = "questgiver", tier = "quest",
  communities = { "kharanos" }, temper = { "eager" }, values = { "craft", "hopeful" },
  notices = { "gnome", "craft" },

  impression = {
    first = "Razzle Sprysprocket talks about curing the leper gnomes the way some people talk about the weather tomorrow: certain it will come. Underneath the jargon I think he is grieving, and building is how he does it.",
    third = "{name} met Razzle Sprysprocket in Kharanos, a gnome tinker building a machine to restore the gnomes ruined at Gnomeregan.",
  },

  greetings = {
    { id = "g_shop", text = "Careful, that's live! No, not that one, the other one, though that one's only mostly fine." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you! Good, good, I've had three new ideas since you left and only one of them caught fire." },
    { id = "g_op", when = { questActive = TODO_QUEST("Operation Recombobulation") }, text = "Cogs and gears, cogs and gears! The Recombobulator won't recombobulate itself." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}! Ozzie and I recalibrated the whole thing twice while you were away, and we're very nearly where we started." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "My, you've come along since you first fetched gears for us. If you ever fancy going back into Gnomeregan properly, you look ready." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Everyone in Kharanos says you've been helping out. That's exactly the sort of variable we like to see!" },
    { id = "g_word_angered", when = { word = "angered" }, text = "Somebody in town's cross with you, I hear. I find a good apology works about as well as a good spanner, and it's lighter to carry." },
  },

  notice = {
    { id = "n_gnome", cat = "gnome", when = { race = "Gnome" },
      text = "Another one of us out of the city! Did you get out before or after the radiation? You don't have to say, I'm only glad you're here." },
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "Is that a blasting powder burn on your sleeve? An engineer! Oh, you'll understand the schematics, finally someone will." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Razzle Sprysprocket, at your service, and that's Ozzie Togglevolt with his head in the gearbox. Between the two of us, we're going to put the gnomish race back together." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Operation Recombobulation") },
          text = "Upon further analysis, we didn't only fail to get rid of the troggs, we also turned most of our own people into leper gnomes. Ozzie and I mean to reverse it, with the Recombobulator!" },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Operation Recombobulation") },
          text = "Restabilization cogs and gyromechanic gears, eight of each. The leper gnomes outside Gnomeregan carry them about, and I'd rather not think too hard about why." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Operation Recombobulation"), days = 3 } },
          text = "Perfect, every one, exactly to Ozzie's schematics! A little hydrolubricant on the pistons, a turn of the crank-o-ratchet, and the gnomish race will be as good as new." },
        { id = "h_later", when = { questDone = TODO_QUEST("Operation Recombobulation"), metBefore = true },
          text = "No, it hasn't worked yet, before you ask. But it's failed in very interesting new ways, and that's how you know you're close." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf! Your folk have been so kind about letting us crowd into Kharanos. I keep meaning to bake something, but the oven's full of parts." },
      },
      again = {
        { id = "h_again", text = "What else? I can talk and solder at the same time." },
        { id = "h_again2", text = "Go on, go on, for Ozzie's not listening anyway!" },
      },
      choices = {
        { text = "What happened at Gnomeregan?", next = "gnomeregan" },
        { text = "How does the Recombobulator work?", next = "machine" },
        { text = "Tell me about Ozzie.", next = "ozzie" },
        { text = "Can I look at the schematics?", next = "schematics", when = { profession = "Engineering" } },
        { text = "Do you think the lepers can really be saved?", next = "saved", when = { race = "Gnome" } },
        { text = "What do you need?", next = "BUSINESS" },
        { text = "My brother is one of the lepers outside Gnomeregan, Razzle.", next = "xorig_leperkin", when = { origin = "gnome_leper_kin" } },
        { text = "Good luck, Razzle.", next = "END" },
      },
    },
    xorig_leperkin = {
      lines = {
        { id = "xoleperkin_default", text = "Oh! Oh, I'm so sorry, and I'm sorry I talked about putting the race back together as though it were a clock. Your brother is exactly who the machine is for, and if it works he'll be first through it, or second, after Ozzie tests it on himself. What was his trade, before?" },
      },
      choices = {
        { text = "He mended clocks. Thank you, Razzle.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Test it properly first. I won't lose him twice.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnomeregan = {
      lines = { { id = "g_default", text = "The troggs came up from beneath the city, and the High Tinker had a plan to flush them out with radiation. It went badly, and we lost the city and most of the people in it." },
      },
      choices = {
        { text = "Lost how?", next = "gnomeregan_lost" },
        { text = "Was the plan a mistake?", next = "gnomeregan_blame" },
      },
    },
    gnomeregan_lost = {
      lines = { { id = "gl_default", text = "Some died, and the rest were changed, and now they wander outside the gates picking at scrap like they've forgotten their own names. Some of them I knew, which is why I'd rather talk about gears." },
      },
      choices = {
        { text = "I'm sorry, Razzle.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Gears, then.", next = "machine" },
      },
    },
    gnomeregan_blame = {
      big = true,
      lines = { { id = "gb_default", text = "Everyone asks that, and Ozzie won't hear a word against the High Tinker. I say the plan was sound and the city wasn't, but I've been wrong about bigger things than that." },
      },
      choices = {
        { text = "Mekkatorque did what he had to. Stand by him.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Someone should answer for it, High Tinker or not.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    machine = {
      lines = { { id = "m_default", text = "You put a leper gnome in one end and a gnome comes out the other, in theory! In practice, it's a matter of viscosity in the electrogum gel and getting the inner combustion pistons to agree with each other." },
      },
      choices = {
        { text = "Have you tested it on anyone?", next = "machine_test" },
        { text = "I understood about half of that.", next = "BACK", fx = { trait = { witty = 1 }, affinity = 1 } },
      },
    },
    machine_test = {
      lines = { { id = "mt_default", text = "On a turnip, which came out a slightly different turnip. Ozzie says that's progress, and I've decided to believe him." },
      },
      choices = { { text = "Something else, then.", next = "BACK" } },
    },
    ozzie = {
      lines = { { id = "o_default", text = "The cleverest gnome I know and the worst at remembering lunch. He draws the schematics, and I make them work, or at least make them explode less." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    schematics = {
      lines = { { id = "s_default", text = "Here, look, that's the crank-o-ratchet and that's the restabilization housing. See how the cogs have to sit? That's why the lepers' parts are so valuable; they're all from Gnomeregan's own workshops." },
      },
      choices = {
        { text = "That housing will crack under the heat.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    saved = {
      lines = { { id = "sv_default", text = "I have to think so, or I'd stop working, and if I stop working I'll start remembering. So yes, they can be saved, and we'll be the ones to do it." },
      },
      choices = {
        { text = "Then we'll save them together.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "Some of them may be past saving. Be ready for that.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Tinker, Gnomeregan born, Kharanos for now. That's the short version, and the long one has more explosions." } },
    advice = { { id = "tp_ad", text = "Always label your wires. I didn't once, and my eyebrows still haven't grown back." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "Home, until the troggs and the radiation. We'll have it back one day.", next = "gnomeregan" } },
    _none = { { id = "tp_none", text = "Ooh, no idea, but if you find out, write it down for me. I collect facts like other people collect spoons." } },
  },
}
