-- Gubber Blump, dwarf fisherman on Auberdine's beach, who loves fishing and crab (0.72.0). Voice: bibles/gubber.md
-- Classic: The Family and the Fishing Pole, Fruit of the Sea.
local P = RPGDialogueAPI:Pack("rpgd.darkshore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gubber", id = TODO_NPC("Gubber Blump"), name = "Gubber Blump",
  bible = "bibles/gubber.md", role = "trainer", tier = "quest",
  communities = { "auberdine" }, temper = { "simple", "cheerful" }, values = { "family", "fishing" },
  notices = { "craft", "race" },
  impression = {
    first = "Gubber Blump loves fishing, his family and crab, and he will tell you so in that order and then start again. There's no guile in him at all, and he seemed happier on that beach than anyone I've met.",
    third = "{name} met Gubber Blump, a dwarf fisherman on the beach at Auberdine who is very fond of crab.",
  },

  greetings = {
    { id = "g_hello", text = "Hi there, I'm Gubber Blump, and I fish." },
    { id = "g_grouper", when = { questActive = TODO_QUEST("The Family and the Fishing Pole") }, text = "You caught any Darkshore grouper yet? They're good eating, but I think catching 'em is more fun." },
    { id = "g_crab", when = { questActive = TODO_QUEST("Fruit of the Sea") }, text = "Crab chunks from the reef crawlers, and the encrusted ones too. You can boil 'em, you can bake 'em, you can..." },
    { id = "g_pole", when = { questDone = TODO_QUEST("The Family and the Fishing Pole") }, text = "You still got that Blump Family Fishing Pole? Good. Treat her nice and she'll treat you nice." },
    { id = "g_away", when = { away = 14 }, text = "You were gone {away}. I caught forty-one fish since then, and I ate some of 'em." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You got bigger since you helped me with them groupers. My cousin Graun got bigger too, but that was mostly the beard." },
  },

  notice = {
    { id = "n_fish", cat = "craft", when = { profession = { name = "Fishing", min = 100 } },
      text = "You fish! I can tell, 'cause you smell a little like the docks. That's a compliment, the way I mean it." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "You're a dwarf like me! Do you know any Blumps? There's a lot of us, and most of us fish." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Hi there, I'm Gubber Blump, and I love fishing. The Blump family is known for fishing, so I guess it runs in the blood, like gills, except we don't have gills. Only nobody takes the boats out no more, not since them murlocs moved in." },
        { id = "h_before", when = { questBefore = TODO_QUEST("The Family and the Fishing Pole") },
          text = "I like to catch Darkshore grouper, but no boats go out for 'em since them mean old murlocs moved in. Say, you wanna help me catch some? I'd give you a real good Blump Family Fishing Pole for it." },
        { id = "h_grouper_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Family and the Fishing Pole"), days = 3 } },
          text = "Them's some real nice groupers! You're near as good a fisherman as my cousin Graun, and she's real good, even with the beard and the funny smell." },
        { id = "h_crab_before", when = { questBefore = TODO_QUEST("Fruit of the Sea"), questDone = TODO_QUEST("The Family and the Fishing Pole") },
          text = "I love crab. Crab is the fruit of the sea, you know. I'm busy fishing, though, so I can't get any crab chunks myself, but you could pick 'em out of the reef crawlers." },
        { id = "h_crab_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Fruit of the Sea"), days = 3 } },
          text = "Wow, these are real fine crab chunks! I found something while I was fishing a while back and I got no use for it, so you have it. It don't make any good crab dishes." },
        { id = "h_elf", when = { race = "NightElf" },
          text = "Hi there. You live here, so you probably know all the good fishing spots already. I'm still learning 'em, but I learn real fast when it's fish." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm only fishing, so I got all the time in the world." },
        { id = "h_again2", text = "Sure, I can talk and fish. I can't talk and eat crab, though, 'cause Ma said not to." },
      },
      choices = {
        { text = "How do I fish?", next = "howto" },
        { text = "Tell me about crab.", next = "crab" },
        { text = "Tell me about your family.", next = "family" },
        { text = "The boats here never seem to go out.", next = "murlocs" },
        { text = "I've fished all my life too, Gubber.", next = "fisher_g", when = { profession = { name = "Fishing", min = 75 } } },
        { text = "Can you teach me, or sell me a pole?", next = "BUSINESS" },
        { text = "Bye, Gubber.", next = "END" },
      },
    },

    howto = {
      lines = {
        { id = "ho_default", text = "It's real easy. You take a pole with a line on it, put some bait on if you got some, and cast it out in the water, and sure enough, them fish start biting." },
      },
      choices = {
        { text = "And if they don't bite at all, Gubber?", next = "howto_wait" },
        { text = "I don't have a pole.", next = "BUSINESS" },
      },
    },
    howto_wait = {
      lines = {
        { id = "hw_default", text = "Then you wait some more. Fish are like people, I guess; some of 'em are hungry right now and some of 'em need talking into it." },
      },
      choices = {
        { text = "That's good advice, Gubber.", next = "howto_wise" },
        { text = "Something else.", next = "BACK" },
      },
    },
    howto_wise = {
      big = true,
      lines = {
        { id = "hwi_default", text = "Thank you. Ma used to say a Blump who can't sit still ain't a Blump, and I sat still a whole lot, so I guess I'm a real good Blump." },
      },
      choices = {
        { text = "Patience beats strength most days.", next = "BACK", reply = "That's what Ma always said, and Ma was right about most things except the weather. I'll tell her you said it, if she ever asks.", fx = { align = { order = 1 } } },
        { text = "I'd rather go and find the fish myself.", next = "BACK", reply = "You can, I guess, but the fish don't like being found, they like coming to you. You'll see, after you've chased them a while.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    crab = {
      lines = {
        { id = "cr_default", text = "You can bake it, boil it, grill it, fry it, and you can put it in a pie or a soup or a stew. There's crab cakes and crab on a stick and Ironforge surprise crab, which is my favourite, 'cause it's a surprise." },
      },
      choices = {
        { text = "I hope the surprise is a good one.", next = "crab_surprise" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crab_surprise = {
      lines = {
        { id = "cs_default", text = "It's got crab in it. Somehow it's always got crab in it, whatever I put in the pot." },
      },
      choices = {
        { text = "That is a surprise.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    family = {
      lines = {
        { id = "fa_default", text = "There's a whole lot of Blumps, and nearly all of us fish. My cousin Graun Blump is the best of us, I reckon, though she's got a beard and she smells kinda funny, but that don't stop her fishing none." },
      },
      choices = {
        { text = "Do you miss them?", next = "family_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    family_miss = {
      lines = {
        { id = "fm_default", text = "Sure I do. But a Blump goes where the fish are, and right now the fish are in Darkshore, so here I am." },
      },
      choices = {
        { text = "That makes sense, Gubber.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Bye, Gubber.", next = "END" },
      },
    },

    murlocs = {
      big = true,
      lines = {
        { id = "mu_default", text = "Them mean old murlocs moved into the water and started tipping boats, and now nobody'll go out. I bet they been eating up all the grouper too, which ain't fair, 'cause they don't even cook 'em." },
      },
      choices = {
        { text = "I'll clear out the murlocs for you.", next = "BACK", reply = "You would? Gosh, that'd be the best thing to happen at this dock all year, and I'd catch you the biggest fish I could, for luck.", fx = { align = { light = -1 } } },
        { text = "They're only hungry, same as you.", next = "BACK", reply = "I guess they are, but they don't have to tip my boat over to eat, do they? I never tipped nobody's boat when I was hungry.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fisher_g = {
      lines = {
        { id = "fg_default", text = "Then we're the same, you and me! I knew it the minute I saw you. You wanna sit a while and not say nothing? That's the best part of fishing." },
      },
      choices = {
        { text = "I'd like that, Gubber.", next = "BACK", fx = { affinity = 2 } },
        { text = "Maybe another time.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm Gubber Blump, and I fish, and that's most of it, really." } },
    advice = { { id = "tp_ad", text = "Always bring more bait than you think. Fish don't care what you think." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's got the biggest fishing contest anywhere, I hear, and I'd love to enter. I'd probably lose, but I'd fish the whole time, so that's a win." } },
    ratchet = { { id = "tp_ratchet", text = "Ratchet's goblins buy fish, and they buy it quick, and that's all I ask of anybody." } },
    theramore = { { id = "tp_theramore", text = "Theramore's marsh water has catfish as big as you are, sailors say. I'd go, if I had a boat that floated." } },
    _none = { { id = "tp_none", text = "I don't know nothing about that. I know about fish, though, and crab." } },
  },
}
