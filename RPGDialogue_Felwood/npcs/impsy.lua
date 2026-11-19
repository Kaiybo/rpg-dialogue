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
    first = "He calls his master an idiot and is building a foul pet.",
    third = "{name} met Impsy, a sulking fel imp in Felwood who serves Niby the Almighty and dreams of a pet of his own.",
  },

  greetings = {
    { id = "g_default", text = "What? Can't you see I'm busy being ignored by Niby the Almighty? Go and bother him instead." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "Oh, a warlock, a real one, not a puffed-up imp with a fancy title. Come closer, I've got a proposition for you." },
    { id = "g_cloth", when = { questActive = TODO_QUEST("The Wrong Stuff") }, text = "Wood and ooze, wood and ooze! Have you got my wood and ooze yet, or are you just standing there?" },
    { id = "g_feathers", when = { questActive = TODO_QUEST("Trolls of a Feather") }, text = "Feathers! Troll feathers, from the sunken temple, and the right colours, mind. My pet won't stuff itself." },
    { id = "g_pet", when = { questDone = TODO_QUEST("Trolls of a Feather") }, text = "Shh, my pet is resting. It's always resting, because it's stuffed, but that's not the point." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and Niby didn't even notice, because Niby pays no attention to anything that isn't his own reflection." },
  },

  notice = {
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "You can summon things, can't you? Real things, with teeth. So can Niby, my so-called master, and it's the only thing he's good at, which drives me mad." },
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
        { id = "h_again", text = "Still here? Fine, then, what do you want now?" },
        { id = "h_again3", when = { class = "WARLOCK" }, text = "More questions, warlock? You lot never stop asking things, which is more than I can say for Niby." },
        { id = "h_again2", text = "Go on, then, ask. Niby's not listening; he never is." },
      },
      choices = {
        { text = "What's wrong with Niby?", next = "niby" },
        { text = "Why do you want a pet?", next = "pet" },
        { text = "What exactly are you building?", next = "build" },
        { text = "Why are you out here in Felwood?", next = "felwood" },
        { text = "What will you pay me with?", next = "pay", when = { class = "WARLOCK" } },
        { text = "My imp never complains like you do.", next = "myimp", when = { class = "WARLOCK", pet = { family = "Imp" } } },
        { text = "What do imps really think of warlocks?", next = "imps", when = { class = "WARLOCK" } },
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
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    niby_how = {
      lines = {
        { id = "nh_default", text = "He says he read it in a book in the ruins. I say he found a warlock's notes after the warlock got eaten, and the only part he understood was how to summon me." },
      },
      choices = {
        { text = "That explains a great deal.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Back to your pet, then.", next = "BACK" },
      },
    },
    niby_leave = {
      big = true,
      lines = {
        { id = "nl_default", text = "Leave? I'm bound, you dolt, it's what summoned means. If I wander off he just snaps his fingers and back I come, and he laughs, and then he makes me fetch the slippers again." },
      },
      choices = {
        { text = "A bargain is a bargain. Serve him well.", next = "BACK", reply = "Serve him well? Serve him well, says the fool who doesn't fetch slippers! I'll serve him as well as he deserves, which is barely.", fx = { align = { order = 1 } } },
        { text = "Then find a way to break the binding.", next = "BACK", reply = "Ooh, now you're thinking, and I've been thinking it for years. If you find the trick, I'll owe you something nasty.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Back to the pet, then.", next = "BACK" },
      },
    },
    pet = {
      lines = {
        { id = "p_default", text = "Because Niby has one, and it's me! Everybody gets something that follows them around and does what it's told, everybody except Impsy. Just once I'd like to say 'heel' to something." },
      },
      choices = {
        { text = "Why not catch a real animal?", next = "pet_real" },
        { text = "Let's leave that there.", next = "BACK" },
      },
    },
    pet_real = {
      lines = {
        { id = "pr_default", text = "I tried that, and the squirrels round here are all corrupted, and the last one bit my tail. The wolf I tried to tame ate my lunch and then tried to eat me, and a made pet doesn't bite or run off or tell Niby." },
      },
      choices = {
        { text = "So you're building a stuffed one.", next = "build" },
        { text = "Something else, Impsy.", next = "BACK" },
      },
    },
    build = {
      lines = {
        { id = "b_default", text = "A proper demon's pet. Felcloth for the skin, because it burns lovely, rotten Irontree wood for the eyes, ooze essence so it smells right, and feathers to stuff it. It'll be the finest pet in Felwood, and it'll be mine." },
        { id = "b_done", when = { questDone = TODO_QUEST("Trolls of a Feather") }, text = "It's finished, thanks to you, and it's beautiful. It doesn't do anything, but it sits where I put it, and nobody else around here ever does." },
      },
      choices = {
        { text = "Why does a pet need to smell like a demon?", next = "build_smell" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    build_smell = {
      big = true,
      lines = {
        { id = "bs_default", text = "So everybody knows whose it is! A pet that smells like flowers might as well belong to a druid. Mine's going to smell like brimstone and bad ideas, the way a pet should." },
      },
      choices = {
        { text = "Be proud of what you are, Impsy.", next = "BACK", reply = "I am proud, thank you very much, and it's about time someone noticed. Brimstone is a perfectly respectable perfume.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Maybe try being something better than a demon.", next = "BACK", reply = "Better than a demon? There's no such thing, you twit, and I'd know. Go and preach at a priest.", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Let's leave that there.", next = "BACK" },
      },
    },
    felwood = {
      lines = {
        { id = "f_default", text = "Because Niby likes it here; he says the fel in the ground makes him feel powerful. It makes me feel itchy, and the oozes in the river keep sliding up to sniff at me." },
      },
      choices = {
        { text = "Do the satyrs or the Shadow Council bother you?", next = "felwood_council" },
        { text = "Something else, Impsy.", next = "BACK" },
      },
    },
    felwood_council = {
      lines = {
        { id = "fc_default", text = "The Council lot in Jaedenar think Niby's a joke, and for once they're right. They'd have both of us in a summoning circle in an afternoon, so we keep our heads down and our voices low, except Niby's, which is never low." },
      },
      choices = {
        { text = "Keep your heads down, then.", next = "BACK" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    pay = {
      lines = {
        { id = "pa_default", text = "Niby's things, of course: robes, a staff, a shard he keeps under his pillow and never uses. He won't notice they're gone, and if he does, I'll tell him a satyr took them." },
      },
      choices = {
        { text = "You'd steal from your own master?", next = "pay_steal" },
        { text = "Back to the deal, then.", next = "BACK" },
      },
    },
    myimp = {
      narr = "He leans round your legs to squint at your imp, and your imp squints back.",
      lines = { { id = "mi_default", text = "Never complains to you, you mean, because you've got the soul shard and the leash. Ask it what it says about you when you're asleep, go on, and watch it go all innocent." } },
      choices = {
        { text = "Does mine talk about me?", next = "myimp2" },
        { text = "I'd rather not know. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    myimp2 = {
      big = true,
      lines = { { id = "mi2_default", text = "All of us do, every one, it's practically a union. The ones with decent masters say 'mine's all right, I suppose', and the rest say worse, so which sort of master are you, then?" } },
      choices = {
        { text = "A fair one. It gets rest and it gets thanks.", next = "BACK", reply = "Thanks? Out loud? I'd faint, I would, and then I'd follow you anywhere. Don't tell Niby that, he'll only get jealous and make me fetch more slippers.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "A strict one. It does as it's told, nothing more.", next = "BACK", reply = "Then it's calling you names right now, behind that innocent little face. Proper warlock, you are, and the trainers would be proud.", fx = { align = { order = 1 } } },
        { text = "That's between me and my imp.", next = "BACK" },
      },
    },
    imps = {
      lines = { { id = "im_default", text = "That you're all very tall and very loud, and that you summon us to throw fireballs at things that throw fireballs back. Nobody ever asks an imp if he'd rather be at home in the Nether with his feet up, which I would, most days." } },
      choices = {
        { text = "What's it like, being summoned?", next = "imps2" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    imps2 = {
      lines = { { id = "im2_default", text = "Like being yanked out of a warm bath by your tail and dropped in a cold field, and then somebody shouts 'firebolt' at you before you've even found your feet. The shard's the worst bit, though, because once a warlock's got one of those you can feel him thinking about you, and it itches." } },
      choices = { { text = "I'll try to think about mine more kindly.", next = "BACK", fx = { affinity = 1 } } },
    },
    pay_steal = {
      big = true,
      lines = {
        { id = "ps_default", text = "Steal? I'm redistributing, warlock. He took my time and my dignity and my afternoons, and I'm only taking back a few shiny things in return. That's fair dealing where I come from." },
      },
      choices = {
        { text = "I'll take his things. Let him wake up poorer and wonder why.", next = "BACK", reply = "There's a warlock with sense, and I knew I liked you. His loss, your gain, and my revenge, all in one.", fx = { align = { honor = -1 } } },
        { text = "I'll help, but I won't take stolen goods.", next = "BACK", reply = "Oh, a principled one, how dull. Fine, keep your hands clean, and I'll keep the shiny things.", fx = { align = { honor = 1 } } },
        { text = "I'll take my chances. Something else.", next = "BACK" },
      },
    },
    xholy = {
      big = true,
      lines = {
        { id = "xh_default", text = "Banish me? Go on, then, and see what happens; I'll be back in a fortnight when Niby gets bored, and in a worse mood. Or you could leave a little imp alone to make his little pet, and nobody gets hurt." },
      },
      choices = {
        { text = "A demon is a demon. Begone from this world.", next = "BACK", reply = "Go on, then, and I'll be back sooner than you'd like, and grumpier for it. Niby always gets bored.", fx = { affinity = -2, align = { light = 1 } } },
        { text = "You're harmless enough. Make your pet, imp.", next = "BACK", reply = "Harmless? I'm deeply offended, but I'll take it. Off you go, and don't tell anyone I was polite.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
  },

  topics = {
    burning_legion = { { id = "tp_bl", text = "Big, important demons who've never once noticed me, which suits me fine." } },
    satyrs = { { id = "tp_sat", text = "They laugh at Niby, too. I like the satyrs a little bit for that." } },
    background = { { id = "tp_bg", text = "I was summoned, I was bound, I was handed a slipper. That's the whole tale." } },
    advice = { { id = "tp_ad", text = "Never trust anybody who gives himself a title. Niby did, and look at him." } },
    _none = { { id = "tp_none", text = "Ask Niby. He'll say he knows, and he won't, and you'll enjoy watching him try." } },
  },
}
