-- Deathknell's other residents: Venya Marthand (the warlock's first binding, Piercing the Veil),
-- Kayla Smithe (demon trainer, with her imp) and Archibald Kava (cloth and leather).
-- Voices: bibles/deathknell_folk.md
local P = RPGDialogueAPI:Pack("rpgd.tirisfal")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Kayla Smithe
---------------------------------------------------------------------------
P:NPC {
  key = "kayla_smithe", id = TODO_NPC("Kayla Smithe"), name = "Kayla Smithe", title = "Demon Trainer",
  bible = "bibles/deathknell_folk.md", role = "trainer", tier = "service",
  communities = { "deathknell" }, temper = { "wry" }, values = { "practical", "loyal" },
  notices = { "pet" },

  impression = {
    first = "Kayla Smithe teaches warlocks' demons new tricks in Deathknell, with her own imp sulking at her feet. She talks about it the way other people talk about a bad-tempered old dog they would never give up.",
    third = "{name} met Kayla Smithe, the demon trainer of Deathknell.",
  },

  greetings = {
    { id = "g_default", text = "Don't step on the imp. He bites, and then he sulks, and the sulking is worse." },
  },

  notice = {
    { id = "n_demon", cat = "pet", when = { pet = { type = "Demon" } },
      text = "Your {pet} has been chewing something it shouldn't, I can always tell. Bring it here and we'll teach it a better habit." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Kayla Smithe. I teach your demons what Maximillion teaches you, which is how to be more useful and less trouble, and the second lesson always takes longer." },
      },
      again = {
        { id = "h_again", text = "Anything else? Quickly, before he finds my ink again." },
      },
      choices = {
        { text = "Teach my demon something new.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "How do you teach a demon?", next = "teach" },
        { text = "Whose imp is that?", next = "imp" },
        { text = "I'll go.", next = "END" },
      },
    },
    teach = {
      lines = { { id = "t_default", text = "The same way you teach a dog, except the dog doesn't know its own name in a language older than the world. You show it what you want, you reward it with a little of your power, and you never let it think the idea was its own." } },
      choices = {
        { text = "What happens if it does?", next = "teach2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    teach2 = {
      lines = { { id = "t2_default", text = "Then it starts having ideas, and each idea is worse than the last, and one morning you find it has rearranged your books to see what you'll do. I've lost two good grimoires that way, and one very good pair of boots." } },
      choices = { { text = "No ideas for my demon, then.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    imp = {
      big = true,
      lines = { { id = "i_default", text = "Mine, and he's been with me since I first rose, which makes him the longest friend I've had in either life. He bites, he lies and he steals my ink, and I wouldn't trade him for every voidwalker in the Undercity." } },
      choices = {
        { text = "A demon is no friend. Keep it leashed.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Loyalty is loyalty, even from an imp.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask my imp. He'll tell you something, and it'll even be true now and then." } },
  },
}

---------------------------------------------------------------------------
-- Archibald Kava
---------------------------------------------------------------------------
P:NPC {
  key = "kava", id = TODO_NPC("Archibald Kava"), name = "Archibald Kava", title = "Cloth & Leather Armor Merchant",
  bible = "bibles/deathknell_folk.md", role = "vendor", tier = "service",
  communities = { "deathknell" }, temper = { "dry" }, values = { "practical", "kind" },
  notices = { "kit" },

  impression = {
    first = "Archibald Kava sells cloth and leather to the newly risen of Deathknell, most of whom arrive in nothing but a burial shroud. He unpicks the red from Scarlet coats before he sells them and finds hats for the ones who've gone quiet.",
    third = "{name} met Archibald Kava, who sells cloth and leather armor in Deathknell.",
  },

  greetings = {
    { id = "g_default", text = "Out of the shroud and into something decent, that's my trade. What can I fit you for?" },
  },

  notice = {
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "Bless me, you've barely a stitch on, and the bats in this valley have very sharp teeth. Let me find you a jerkin before something takes a bite." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Archibald Kava, cloth and leather, for those who woke in the Deathknell graves with nothing but a burial shroud. You've moved on from the shroud, I see, and I've something better if you have the coin." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've seams to finish." },
      },
      choices = {
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "Where do your clothes come from?", next = "source" },
        { text = "Do the dead care how they look?", next = "look" },
        { text = "I'll go.", next = "END" },
      },
    },
    source = {
      big = true,
      lines = { { id = "s_default", text = "From the Undercity's tailors, mostly, and the rest from what the deathguards bring back off the fields, washed twice and mended once. Some of it belonged to the Scarlets, and I unpick the red before I sell it, which takes longer than you'd think." } },
      choices = {
        { text = "Spoils of war are fair. I'd wear the red proudly.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'd rather wear something honestly made.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    look = {
      lines = { { id = "l_default", text = "More than you'd think, because a body that's coming apart at the seams still wants a decent coat over it. The vain ones come back every week, and I don't mind, since vanity is a sign somebody's still in there." } },
      choices = {
        { text = "Is somebody still in there, usually?", next = "look2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    look2 = {
      lines = { { id = "l2_default", text = "In most of them, yes, and it's the ones who stop caring how they look that I worry about. Novice Elreth sends me the ones who've gone quiet, and I find them a hat, and sometimes that's enough to start them talking again." } },
      choices = { { text = "That's kind of you, Kava.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I measure people, I don't question them. Ask Executor Arren." } },
  },
}
