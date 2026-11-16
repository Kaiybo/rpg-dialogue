-- Thousand Needles between the towns: the canyon paths, the Shimmering Flats crews, and the quieter folk of Freewind Post.
local P = RPGDialogueAPI:Pack("rpgd.thousandneedles")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "paoka", id = TODO_NPC("Pao'ka Swiftmountain"), name = "Pao'ka Swiftmountain",
  bible = "bibles/thousandneedles.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Pao'ka Swiftmountain is a young tauren who wandered too far into the Needles and needed help getting home safely.",
    third = "{name} met Pao'ka Swiftmountain, a young tauren lost in the canyons of Thousand Needles.",
  },
  greetings = {
    { id = "g_main", text = "Oh, you're not a centaur, thank the Earth Mother!" },
    { id = "g_back", when = { metBefore = true }, text = "You came back! I'm still here, sort of, if that's good news." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Pao'ka Swiftmountain, and I came out here to gather things for my family, but I got turned around in the canyons. The Galak centaurs are everywhere, and I don't think I can make it back to Freewind alone." },
        { id = "h_c0", when = { questActive = TODO_QUEST("Homeward Bound") }, text = "You'll walk me home? I'll stay close, I promise, and I'll run if I see centaurs, because I'm better at running than fighting." },
      },
      again = { { id = "h_again", text = "What else? I'm listening, just a bit nervous." }, { id = "h_again2", text = "Ask me anything; it helps to talk." } },
      choices = {
        { text = "How did you get lost?", next = "b1_1" },
        { text = "Who's your family?", next = "b2_1" },
        { text = "Why are the centaurs dangerous?", next = "b3_1" },
        { text = "Freewind is my kin's home too.", next = "x_1", when = { race = "Tauren" } },
        { text = "Should you have stayed home?", next = "s_1" },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "I was following a herd of plainstriders because my father said their feathers are lucky, and before I knew it, I'd gone further than I've ever been. Then the centaurs came, and I hid." } },
      choices = { { text = "You'll be fine.", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "My family will be so worried, and my father especially, because he told me not to go past the lifts. I didn't listen, and now I'm sorry." } },
      choices = { { text = "Will you listen next time?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "If you get me home, I'll tell everyone a stranger helped me, and I'll listen next time. Maybe." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "The Swiftmountains, from Freewind Post up on the mesas. My father's a hunter and my mother keeps the hearth, and they've probably already sent half the post looking for me." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "The Galak centaurs think all of Thousand Needles belongs to them, and they don't like tauren very much. They've raided Freewind before, and they'd take me too if they could." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Then you'll know the way better than me! Please, take me back, and I'll tell everyone a cousin from Mulgore found me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "My father would say I should have, and maybe he'd be right, but I wanted to see the canyons for myself." } },
      choices = { { text = "Adventure is worth a little danger.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } }, { text = "Listen to your father. The world is dangerous.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I don't know, but I'm only young, so maybe that's fine." } } },
}

P:NPC {
  key = "kanati", id = TODO_NPC("Kanati Greycloud"), name = "Kanati Greycloud",
  bible = "bibles/thousandneedles.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Kanati Greycloud is a tauren of Freewind Post who watches the Grimtotem and the Galak with equal wariness.",
    third = "{name} met Kanati Greycloud of Freewind Post in Thousand Needles.",
  },
  greetings = {
    { id = "g_main", text = "Peace, friend. You've come a long way up the mesas." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The winds bring you here often." },
  },
  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "They claim the high places and drive off anything that isn't theirs, beast and tauren alike. The mesas were meant to be shared, and the Grimtotem have forgotten it." } },
      choices = {
        { text = "Cairne should send braves to drive them off.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let each camp defend its own mesa.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Kanati Greycloud. Freewind Post sits above the canyons, and from here we watch both the centaurs below and the Grimtotem who think these mesas belong to them." },
        { id = "h_c0", when = { race = "Tauren" }, text = "A child of Mulgore here at Freewind! The Earth Mother keeps you, kin, and Cairne would be proud to see you so far from home." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid of the Earth Mother! Then you'll feel what the Grimtotem do to these mesas, even if the others only see it." },
      },
      again = { { id = "h_again", text = "What else?" }, { id = "h_again2", text = "Speak, friend." } },
      choices = {
        { text = "What are the Grimtotem doing to the mesas?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Who are the Grimtotem?", next = "b1_1" },
        { text = "What of the Galak centaurs?", next = "b2_1" },
        { text = "How do you live up here?", next = "b3_1" },
        { text = "The spirits here feel restless.", next = "x_1", when = { class = "SHAMAN" } },
        { text = "Should the Grimtotem be forgiven?", next = "s_1" },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "They are tauren, like us, but they follow Magatha Grimtotem and reject Cairne's way. They want the land to themselves and they don't care who they hurt to take it." } },
      choices = { { text = "Kin you once shared fires with?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Here in the Needles they've built camps on the high mesas, and they harass anyone who crosses their path. Some are kin we once shared fires with." } },
      choices = { { text = "Can they be reconciled?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "That is the hardest part, friend. It is one thing to fight a stranger, and another to fight a cousin." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "The Galak hold the canyon floors and raid anyone who comes near. They are cruel, but at least they are honest about being enemies, which is more than the Grimtotem offer." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Carefully, and with good lifts. The mesas keep us safe from the centaurs, and the wind keeps us company." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "They are, shaman. The Grimtotem disturb the land, and the spirits don't forget, even when we wish they would." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Cairne hopes they might return to us one day. I've seen what they do, and I'm not sure I share his hope." } },
      choices = { { text = "Cairne is wise. Leave the door open.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } }, { text = "They chose their path. Let them walk it.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "The winds haven't spoken of that to me." } } },
}

P:NPC {
  key = "motega", id = TODO_NPC("Motega Firemane"), name = "Motega Firemane",
  bible = "bibles/thousandneedles.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Motega Firemane is a tauren of Freewind Post who has had enough of the Grimtotem and isn't shy about saying so.",
    third = "{name} met Motega Firemane, a tauren at Freewind Post in Thousand Needles.",
  },
  greetings = {
    { id = "g_main", text = "Welcome, traveler. Come, but watch your step on the mesa edges." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. Good." },
  },
  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "Power, the same as she wants in Thunder Bluff, only out here no one watches her. The Grimtotem hold Darkcloud Pinnacle, and every season they take a little more of the canyon around it." } },
      choices = {
        { text = "Bring the matter before Cairne and let him judge.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Strike the Pinnacle without warning. She'd do the same.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Motega Firemane, and I keep watch over Freewind Post. The Grimtotem grow bolder each season, and someone has to stand against them before they take the whole of the Needles." },
        { id = "h_c0", when = { race = "Tauren" }, text = "A fellow tauren who walks the Earth Mother's path, not Magatha's. You are welcome at my fire." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "You walk the Earth Mother's path as a druid should, but Magatha's people bend the spirits to their will, and I would hear what you make of that." },
      },
      again = { { id = "h_again", text = "What else?" }, { id = "h_again2", text = "Ask, if you have more." } },
      choices = {
        { text = "What does Magatha want from the Needles?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What are the Grimtotem doing?", next = "b1_1" },
        { text = "Why not go back to Mulgore?", next = "b2_1" },
        { text = "What of the goblins in the Flats?", next = "b3_1" },
        { text = "I'll take the fight to them.", next = "x_1", when = { class = "WARRIOR" } },
        { text = "Are you being too harsh on them?", next = "s_1" },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "They have taken the high mesas to the north and claim them for Magatha. They shoot at our riders and send warnings that we should leave." } },
      choices = { { text = "Why not fight them?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "We will not leave, of course, because Freewind is ours as much as anyone's. But we cannot fight them on every mesa at once." } },
      choices = { { text = "I'll strike at them.", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "If you can strike at their camps, the others at Freewind will remember your name, and so will I." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Because the Needles are home to us too, and running is not the tauren way. The Earth Mother gave us this land as she gave us Mulgore." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Loud and strange, but harmless enough. They race their machines on the salt flats and pay well for help, which some of our young braves enjoy too much." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Then go with my blessing, and with your axe. The Grimtotem respect strength, even if they respect nothing else." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some say I'm too angry about the Grimtotem, but I've buried friends because of them. Anger seems fair." } },
      choices = { { text = "Your anger is earned. Use it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } }, { text = "Anger will make you as bad as them.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "That I do not know, friend." } } },
}

P:NPC {
  key = "razzeric", id = TODO_NPC("Razzeric"), name = "Razzeric",
  bible = "bibles/thousandneedles.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Razzeric is a goblin racer at the Mirage Raceway who treats every lap like it's his last, and some of them almost were.",
    third = "{name} met Razzeric, a goblin racer at the Mirage Raceway in Thousand Needles.",
  },
  greetings = {
    { id = "g_main", text = "Hey! You lookin' at my car? Don't touch, it's still warm." },
    { id = "g_back", when = { metBefore = true }, text = "My biggest fan's back! Ha, I knew you'd come round." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Razzeric, the fastest goblin on the Shimmering Flats! I race for the goblin team, and every time I take the car out, the gnomes start sweating." },
        { id = "h_c0", when = { race = "Gnome" }, text = "Uh-oh, a gnome. You here to sabotage my car, or just to watch me beat your friends?" },
      },
      again = { { id = "h_again", text = "What else? Talk quick, like me." }, { id = "h_again2", text = "More? Sure, I got a minute between laps." } },
      choices = {
        { text = "How do you race here?", next = "b1_1" },
        { text = "Is it safe?", next = "b2_1" },
        { text = "What's the prize?", next = "b3_1" },
        { text = "I bet you've got a trick or two in that car.", next = "x_1", when = { class = "ROGUE" } },
        { text = "Is racing worth the danger?", next = "s_1" },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "You strap yourself into the fastest machine money can buy, point it at the far end of the Flats, and pray. The salt's flat, but the rocks aren't, and neither are the gnomes." } },
      choices = { { text = "The gnomes cheat?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "The gnomes have their own team with Fizzle and the rest, and they cheat, or at least I think they cheat. We'd never do that, of course." } },
      choices = { { text = "You'd cheat too?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "Of course we would, actually, but we're better at it. Don't tell Kravel I said that." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Safe? Friend, I've crashed more times than I've won, and I've won a lot. That's just racing." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Glory, money and bragging rights over the gnomes, mostly the last one. Pozzik keeps the books, and he says we're up this season." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Ha! You've got a good eye, friend, and a quiet mouth, I hope. What's under the hood stays under the hood." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Pozzik says I'm crazy to keep racing. I say a goblin without risk is just a banker with a hat." } },
      choices = { { text = "Life's short. Race fast.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } }, { text = "You'll get killed for nothing. Slow down.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Never heard of it, but if it's fast, I want to drive it." } } },
}

P:NPC {
  key = "daisy", id = TODO_NPC("Daisy"), name = "Daisy",
  bible = "bibles/thousandneedles.md", role = "citizen", tier = "service",
  impression = {
    first = "Daisy keeps time at the Mirage Raceway and has no patience for anyone who slows the track down.",
    third = "{name} met Daisy, the timekeeper at the Mirage Raceway.",
  },
  greetings = {
    { id = "g_main", text = "Hey! Step back from the line, the next lap's coming through." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Watching the races, or getting in the way?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Daisy, and I keep the times at the Mirage Raceway. If it happens on the track, I've got it on my stopwatch, so nobody argues about who won." },
      },
      again = { { id = "h_again", text = "What else, hon?" }, { id = "h_again2", text = "Make it fast; the cars sure are." } },
      choices = {
        { text = "Who's winning?", next = "b1_1" },
        { text = "Is the job dangerous?", next = "b2_1" },
        { text = "Do the racers ever cheat?", next = "s_1" },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Depends on the day and who's been tinkering with what. The goblins are fast, but the gnomes are clever, and clever wins when the goblins blow an engine." } },
      choices = { { text = "You don't take sides?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "I don't take sides, though. My stopwatch is the only fair one on the Flats." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Only if you stand where the cars are, hon. I've learned to stand behind the rocks and duck when I hear the engines." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Everybody tries something, hon, from tweaked engines to bent fuel. My job's to time them, not to judge them, but I see it." } },
      choices = { { text = "Cheaters should be disqualified. Fair is fair.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } }, { text = "Racing's about winning. Let them cheat.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Couldn't tell you. I only know what happens on the track." } } },
}

P:NPC {
  key = "wizzle", id = TODO_NPC("Wizzle Brassbolts"), name = "Wizzle Brassbolts",
  bible = "bibles/thousandneedles.md", role = "citizen", tier = "service",
  impression = {
    first = "Wizzle Brassbolts works for the gnome racing team and is very serious about engineering, if less serious about modesty.",
    third = "{name} met Wizzle Brassbolts of the gnome racing team at the Mirage Raceway.",
  },
  greetings = {
    { id = "g_main", text = "Oh, hello! Careful with that, that's a very expensive wrench." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Have you come to see our new design?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Wizzle Brassbolts, gnome engineer, at your service! I help design the cars for our team, and I'm quite sure this season's model is the best yet, assuming it holds together." },
      },
      again = { { id = "h_again", text = "What else?" }, { id = "h_again2", text = "Questions? I love questions!" } },
      choices = {
        { text = "How do you beat the goblins?", next = "b1_1" },
        { text = "Are you related to Fizzle?", next = "b2_1" },
        { text = "Is racing a good use of engineering?", next = "s_1" },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Engineering, friend! The goblins strap a rocket to a crate and call it a car, while we actually calculate things like aerodynamics and fuel ratios." } },
      choices = { { text = "Do the goblins cheat?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Of course, the goblins win sometimes, but that's only because their rockets are bigger and they don't care if they explode." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Fizzle's on the team too, and we share a workshop and the family name. We argue about every bolt, which is how good engineering happens." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some in Ironforge say racing's a waste of good engineers. I say there's no better way to test a machine than to push it to its limits." } },
      choices = { { text = "Pushing limits is how you learn.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } }, { text = "There are better uses for your brains.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I'm not sure, friend, but I could probably build something to find out!" } } },
}
