-- Tok'Kar: the cook and weaponsmith of Misty Reed Post on the swamp's eastern beach, who turns sawtooth claws into murloc-killers. Voice: bibles/tokkar.md
local P = RPGDialogueAPI:Pack("rpgd.swampofsorrows")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "tokkar", id = TODO_NPC("Tok'Kar"), name = "Tok'Kar",
  bible = "bibles/tokkar.md", role = "questgiver", tier = "quest",
  communities = { "misty_reed_post", "stonard" }, temper = { "chatty", "gruff" }, values = { "craft", "practical" },
  notices = { "kit", "drink" },

  impression = {
    first = "Tok'Kar runs the cookpot and the forge at Misty Reed Post and complains about both without stopping work. He makes good weapons and better stew, and he'd want me to write that down.",
    third = "{name} met Tok'Kar, the cook and weaponsmith of Misty Reed Post on the Swamp of Sorrows' eastern beach.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to Misty Reed Post, where the sea stinks, the murlocs gurgle, and the stew is the only good thing for a league." },
    { id = "g_back", when = { metBefore = true }, text = "Glad to see you're alive and well. Sit down, the pot's on." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and nobody else brought me meat the whole while. The soldiers have been eating boiled reeds and blaming me." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 6 }, text = "You've got bigger since you were last here, or I've got smaller, and it isn't me. Good, the murlocs won't like it." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Stonard's saying you're a help to people. I'll believe it when you bring me claws, but it's a good start." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your blade's chipped to a saw's edge, and not the useful kind. Murloc skulls are harder than they look, so get it seen to." },
    { id = "n_drink", cat = "drink", when = { drunk = true },
      text = "You've been drinking with the louses I share this camp with, haven't you? Keep your wits, because the fish men come when you least want them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Tok'Kar, cook, smith and the only orc on this beach who works. We're stationed here to warn Stonard if the murlocs come in force, and to stop them if they don't come in too much force." },
        { id = "h_meat_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Lack of Surplus"), days = 3 } },
          text = "Fresh sawtooth meat, and the soldiers ate till they groaned. Dar sent you, didn't he? Tell him his face still looks like a stepped-on toad." },
        { id = "h_claws", tags = { "news" }, when = { questActive = TODO_QUEST("Lack of Surplus") },
          text = "Six sawtooth snapper claws, properly sharp, and I'll make you a weapon out of them in thanks. They make fine blades when they're prepared right, and I've got the knack of it." },
        { id = "h_threat", tags = { "news" }, when = { questActive = TODO_QUEST("Threat From the Sea") },
          text = "While I work on your weapon, go and talk to Katar about the beach patrols. Better that than getting drunk with the rest of this lot." },
        { id = "h_reward", tags = { "news" }, when = { questDone = TODO_QUEST("Continued Threat") },
          text = "You brought us meat and you brought Katar a smile, and I'd have said the second one was impossible. Use that weapon well, and bring me back the stories." },
        { id = "h_troll", when = { race = "Troll" },
          text = "A troll, and you'll know your way around a fish, I'd guess. Sit down, I want an opinion on this stew from someone who's eaten worse." },
      },
      again = {
        { id = "h_again", text = "What else? Talk while I stir." },
        { id = "h_again2", text = "Anything more? The pot doesn't stir itself." },
      },
      choices = {
        { text = "What do you make from the claws?", next = "claws" },
        { text = "Why guard this beach?", next = "post" },
        { text = "Tell me about the others here.", next = "camp" },
        { text = "What's in the stew?", next = "stew" },
        { text = "Show me how you work the claws.", next = "xsmith", when = { profession = "Blacksmithing" } },
        { text = "I'll let you get back to it.", next = "END" },
      },
    },

    claws = {
      lines = {
        { id = "cl_default", text = "Bashers, choppers, shankers, whatever suits the hand, all from sawtooth claw and swamp hardwood. A sawtooth claw holds an edge better than half the steel in Stonard, and it costs nothing but a fight." },
      },
      choices = {
        { text = "How do you prepare them?", next = "claws_prep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    claws_prep = {
      lines = {
        { id = "cp_default", text = "Boil the meat off, dry the claw in the sun for three days, then grind the inside edge on beach stone till it bites your thumb. I've become quick at it, so your weapon won't take long once you bring the claws." },
      },
      choices = {
        { text = "Using every part of the kill is good sense.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Seems a lot of work. Steel's simpler.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    post = {
      lines = {
        { id = "po_default", text = "The murlocs on this coast are getting bolder, and if they ever come at Stonard in numbers, somebody has to see them first. That's us, and it doesn't leave much time for anything else." },
      },
      choices = {
        { text = "Are there enough of you?", next = "post_numbers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    post_numbers = {
      lines = {
        { id = "pn_default", text = "There's never enough, and half of them drink, so call it a few and a half. That's why I make weapons, because a weapon in every hand is worth two soldiers asleep." },
      },
      choices = {
        { text = "I'll help hold the beach.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    camp = {
      lines = {
        { id = "ca_default", text = "Katar runs the patrols, and he hates the sea more than anything alive, which makes him good at his job and terrible at supper. The rest are louses, mostly, but they're our louses." },
      },
      choices = {
        { text = "Why does Katar hate the sea?", next = "camp_katar" },
        { text = "What about Dar in Stonard?", next = "camp_dar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_katar = {
      lines = {
        { id = "ck_default", text = "I asked once and he looked at me so long I burned the stew. Whatever the sea did to him, it was a long time ago, and he's been paying it back one fish man at a time ever since." },
      },
      choices = {
        { text = "Some grudges should be let go.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A grudge that kills murlocs is a useful grudge.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_dar = {
      lines = {
        { id = "cd_default", text = "Dar sends my meat, when he remembers, and complains about my manners when he doesn't. He's a good orc, but don't tell him I said it, because he'll want to be paid for it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    stew = {
      lines = {
        { id = "st_default", text = "Sawtooth, swamp onion, and whatever the soldiers haven't hidden from me, and it's better than anything Karakul's inn serves in Stonard. Don't tell Karakul I said that either." },
      },
      choices = {
        { text = "Any murloc in it?", next = "stew_murloc" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stew_murloc = {
      lines = {
        { id = "sm_default", text = "Never, for murloc tastes of old bait and bad luck, and the soldiers would mutiny. I've standards, even out here on the edge of the world." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    xsmith = {
      big = true,
      lines = {
        { id = "xs_default", text = "A smith! Then look here: you grind the claw from the inside, never the outside, or the edge splits along the grain. Stonard's smiths laughed at me for using claws until they saw what they could do." },
      },
      choices = {
        { text = "Good craft is good craft, whatever it's made from.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "I'll stick to proper steel, thanks.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "A cook who learned smithing because nobody else on this beach would. It's worked out, mostly." } },
    advice = { { id = "tp_ad", text = "Never eat anything that comes out of the sea with a face like a murloc's." } },
    thrall = { { id = "tp_thrall", text = "The Warchief would like my stew, I'm sure of it. Nobody's ever told him about it, which is a crime." } },
    second_war = { { id = "tp_second_war", text = "I cooked for the Horde in the Second War, and I learned smithing then because the smiths kept getting killed. It's worked out, mostly." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's got the best fish on the coast, they say, but I've never been. Misty Reed's fish are good enough." } },
    _none = { { id = "tp_none", text = "Don't know it, but if it can be stewed, bring it here and we'll find out." } },
  },
}
