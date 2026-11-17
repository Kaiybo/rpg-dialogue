-- Impsy, Niby the Almighty's put-upon imp, north of Bloodvenom Falls, building himself a pet
-- out of felcloth, rotten wood and troll feathers. Voice: bibles/impsy.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "impsy", id = TODO_NPC("Impsy"), name = "Impsy",
  bible = "bibles/impsy.md", role = "questgiver", tier = "quest",
  communities = { "felwood_wilds" }, temper = { "sharp", "proud" }, values = { "ambitious", "cunning" },
  notices = { "class", "pet" },

  impression = {
    first = "Impsy is Niby the Almighty's imp, and he thinks his master is an idiot, which he will tell anyone. What he wants most in the world is a pet of his own, and he's building one out of whatever foul things he can get.",
    third = "{name} met Impsy, a sulking fel imp in Felwood who serves Niby the Almighty and dreams of a pet of his own.",
  },

  greetings = {
    { id = "g_default", text = "What? Can't you see I'm busy being ignored by the Almighty? Go and bother him." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "Oh, a warlock, a real one, not a puffed-up imp with a fancy title. Come closer, I've got a proposition for you." },
    { id = "g_cloth", when = { questActive = TODO_QUEST("The Wrong Stuff") }, text = "Wood and ooze, wood and ooze! Have you got my wood and ooze yet, or are you just standing there?" },
    { id = "g_feathers", when = { questActive = TODO_QUEST("Trolls of a Feather") }, text = "Feathers! Troll feathers, from the sunken temple, and the right colours, mind. My pet won't stuff itself." },
    { id = "g_pet", when = { questDone = TODO_QUEST("Trolls of a Feather") }, text = "Shh, my pet is resting. It's always resting, because it's stuffed, but that's not the point." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and Niby didn't even notice, which tells you how much attention he pays to anything that isn't his own reflection." },
  },

  notice = {
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "You can summon things, can't you? Real things, with teeth. Niby can too, and it's the only thing he's good at, and it drives me mad." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Is that your {pet}? It follows you about and everything, doesn't it? Some people have all the luck." },
    { id = "n_imp", cat = "pet", when = { pet = { type = "Demon" } },
      text = "Oh, look at you, following your warlock about like a good little servant. Do they ever let you have anything of your own? No? Thought not." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Impsy, minion, servant, footstool and general dogsbody to Niby the Almighty, who is neither almighty nor much of anything else. He summons me, he orders me about, and in return I get nothing, not even a pet to call my own." },
        { id = "h_lock", when = { class = "WARLOCK" },
          text = "You're the one the trainers sent? Good. I want something, warlock, and I've got Niby's things to pay you with, which he'll never miss because he never looks at them." },
        { id = "h_cloth_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("An Imp's Request"), days = 3 } },
          text = "Ohh, felcloth. Feel that burn, and the nasty little thoughts it gives you. That's a sign of good faith, that is, and now we can talk business." },
        { id = "h_wrong", when = { questActive = TODO_QUEST("The Wrong Stuff") },
          text = "The pet needs eyes, and the best eyes come carved out of rotting wood from the Irontree. It needs a smell too, so bring me essence off those oozes in the Bloodvenom; a demon's pet should smell like a demon's pet." },
        { id = "h_trolls", when = { questActive = TODO_QUEST("Trolls of a Feather") },
          text = "It's almost done, but it's flat, and a flat pet is no pet at all. The only stuffing good enough is voodoo feathers off the trolls in the Sunken Temple, two amber, two blue and two green." },
        { id = "h_notlock", when = { class = { "WARRIOR", "PALADIN", "PRIEST" } },
          text = "You're not a warlock, are you? You've got that clean, shiny look, like somebody scrubbed you. I've nothing for you, unless you want to hear about Niby, and everybody wants to hear about Niby." },
      },
      again = {
        { id = "h_again", text = "Still here? Fine, what?" },
        { id = "h_again2", text = "Go on, then, ask. Niby's not listening; he never is." },
      },
      choices = {
        { text = "What's wrong with Niby?", next = "niby" },
        { text = "Why do you want a pet?", next = "pet" },
        { text = "What exactly are you building?", next = "build" },
        { text = "Why are you out here in Felwood?", next = "felwood" },
        { text = "What will you pay me with?", next = "pay", when = { class = "WARLOCK" } },
        { text = "I could banish you right now, imp.", next = "xholy", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "I'm leaving, Impsy.", next = "END" },
      },
    },
    niby = {
      lines = {
        { id = "n_default", text = "He's an idiot, that's what. He's an imp, same as me, but he learned to summon and now he wears a big name and calls himself almighty, and he summons me to fetch his slippers. I could summon, too, if anybody had ever taught me." },
      },
      choices = {
        { text = "How did Niby learn to summon?", next = "niby_how" },
        { text = "Why not just leave him?", next = "niby_leave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    niby_how = {
      lines = {
        { id = "nh_default", text = "He says he read it in a book in the ruins. I say he found a warlock's notes after the warlock got eaten, and he didn't understand half of them, and the half he did understand was me." },
      },
      choices = {
        { text = "That's funnier than you think.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    niby_leave = {
      big = true,
      lines = {
        { id = "nl_default", text = "Leave? I'm bound, you dolt, it's what summoned means. If I wander off he just snaps his fingers and back I come, and he laughs, and then he makes me fetch the slippers again." },
      },
      choices = {
        { text = "A bargain is a bargain. Serve him well.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then find a way to break the binding.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pet = {
      lines = {
        { id = "p_default", text = "Because Niby has one, and it's me! Everybody gets something that follows them around and does what it's told, everybody except Impsy. Just once I'd like to say 'heel' to something." },
      },
      choices = {
        { text = "Why not catch a real animal?", next = "pet_real" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pet_real = {
      lines = {
        { id = "pr_default", text = "Tried it. The squirrels round here are all corrupted and the last one bit my tail, and the wolf I tried to tame ate my lunch and then tried to eat me. A made pet doesn't bite and doesn't run off and doesn't tell Niby." },
      },
      choices = {
        { text = "So you're building a stuffed one.", next = "build" },
        { text = "Something else.", next = "BACK" },
      },
    },
    build = {
      lines = {
        { id = "b_default", text = "A proper demon's pet. Felcloth for the skin, because it burns lovely, rotten Irontree wood for the eyes, ooze essence so it smells right, and feathers to stuff it. It'll be the finest pet in Felwood, and it'll be mine." },
        { id = "b_done", when = { questDone = TODO_QUEST("Trolls of a Feather") }, text = "It's finished, thanks to you, and it's beautiful. It doesn't do anything, but it sits where I put it, which is more than I can say for anybody else around here." },
      },
      choices = {
        { text = "Why does a pet need to smell like a demon?", next = "build_smell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    build_smell = {
      big = true,
      lines = {
        { id = "bs_default", text = "So everybody knows whose it is! A pet that smells like flowers might as well belong to a druid. Mine's going to smell like brimstone and bad ideas, the way a pet should." },
      },
      choices = {
        { text = "Be proud of what you are, Impsy.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Maybe try being something better than a demon.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    felwood = {
      lines = {
        { id = "f_default", text = "Because Niby likes it here; he says the fel in the ground makes him feel powerful. It makes me feel itchy, and the oozes in the river keep sliding up to sniff at me." },
      },
      choices = {
        { text = "Do the satyrs or the Shadow Council bother you?", next = "felwood_council" },
        { text = "Something else.", next = "BACK" },
      },
    },
    felwood_council = {
      lines = {
        { id = "fc_default", text = "The Council lot in Jaedenar think Niby's a joke, and for once they're right. They'd have both of us in a summoning circle in an afternoon, so we keep our heads down and our voices low, except Niby's, which is never low." },
      },
      choices = {
        { text = "Keep your heads down, then.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pay = {
      lines = {
        { id = "pa_default", text = "Niby's things, of course: robes, a staff, a shard he keeps under his pillow and never uses. He won't notice they're gone, and if he does, I'll tell him a satyr took them." },
      },
      choices = {
        { text = "You'd steal from your own master?", next = "pay_steal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pay_steal = {
      big = true,
      lines = {
        { id = "ps_default", text = "Steal? I'm redistributing, warlock. He took my time and my dignity and my afternoons, and I'm only taking back a few shiny things in return. That's fair dealing where I come from." },
      },
      choices = {
        { text = "I'll take the reward. His loss is my gain.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll help, but I won't take stolen goods.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xholy = {
      big = true,
      lines = {
        { id = "xh_default", text = "Banish me? Go on, then, and see what happens; I'll be back in a fortnight when Niby gets bored, and in a worse mood. Or you could leave a little imp alone to make his little pet, and nobody gets hurt." },
      },
      choices = {
        { text = "A demon is a demon. Begone from this world.", next = "BACK", fx = { affinity = -2, align = { light = 1 } } },
        { text = "You're harmless enough. Make your pet, imp.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    burning_legion = { { id = "tp_bl", text = "Big, important demons who've never once noticed me, which suits me fine." } },
    satyrs = { { id = "tp_sat", text = "They laugh at Niby, too. I like the satyrs a little bit for that." } },
    background = { { id = "tp_bg", text = "I was summoned, I was bound, I was handed a slipper. That's the whole tale." } },
    advice = { { id = "tp_ad", text = "Never let anybody give you a title. It only goes to their head when they give themselves one." } },
    _none = { { id = "tp_none", text = "Ask Niby. He'll say he knows, and he won't, and you'll enjoy watching him try." } },
  },
}
