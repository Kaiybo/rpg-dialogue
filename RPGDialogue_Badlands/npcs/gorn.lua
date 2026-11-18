-- Gorn: an old orc of Kargath who means to kill two black drakes the old Horde once fought beside, Blacklash and Hematus, chained in Lethlor Ravine. Voice: bibles/gorn.md
local P = RPGDialogueAPI:Pack("rpgd.badlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gorn", id = TODO_NPC("Gorn"), name = "Gorn",
  bible = "bibles/gorn.md", role = "questgiver", tier = "quest",
  communities = { "kargath" }, temper = { "grim", "blunt" }, values = { "honor", "proud" },
  notices = { "race", "class" },

  impression = {
    first = "Gorn is an old orc at Kargath who remembers the Second War better than he'd like. He wants two black drakes dead because the Horde once fought beside them, and he calls that cleaning up after himself.",
    third = "{name} met Gorn, an old orc veteran at Kargath who means to slay the black drakes Blacklash and Hematus.",
  },

  greetings = {
    { id = "g_default", text = "Stand straight when you speak to me, {class}, and speak plainly. I'm too old for riddles, and an orc's word should be as blunt as his axe." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good, I had a use for you, and the last grunt I had a use for is still picking drake scales out of his teeth." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and the drakes are still breathing in their ravine. Tell me you've come to change that." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 6 }, text = "You've grown since I saw you last, and you carry yourself like you've earned it. Good, because Lethlor Ravine doesn't care how brave you feel." },
    { id = "g_word_scared", when = { word = "intimidated" }, text = "Word is you've been frightening folk in Kargath. Save that for the Blackrock, who deserve it, and leave your own clan their peace." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "You're young, and you never wore a chain in the camps. I'm glad of it, and I'll thank you not to waste it." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. Then you'll know that a blade carries every hand that's held it, and the Horde's carries some ugly ones." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Gorn, of Kargath, and old enough to remember when the Horde took gifts from the black dragons and called them allies. Two of those allies still sleep in chains in Lethlor Ravine, and I mean to see them dead." },
        { id = "h_ba1_active", tags = { "news" }, when = { questActive = TODO_QUEST("Broken Alliances") },
          text = "Tho'grun took our coin and then took the Sign of the Earth for himself. Go to Camp Boff and bring it back, and leave him where the buzzards can find him." },
        { id = "h_ba_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Broken Alliances"), days = 3 } },
          text = "Blacklash and Hematus are dead, and their chains are in my hands where they belong. Now the black dragonflight has two fewer friends among the Blackrock, and we can turn our eyes west, to the Spire." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren. Your people never bargained with the black dragons, so this isn't your shame to clean up, but I'll take your help gladly all the same." },
        { id = "h_scourge", when = { race = "Scourge" },
          text = "One of the Forsaken. You know something about being used by masters who don't care whether you live, so you'll understand why I want these drakes dead." },
      },
      again = {
        { id = "h_again", text = "What else? Speak, then, the way a warrior should." },
        { id = "h_again2", text = "Ask, then, but be quick about it." },
      },
      choices = {
        { text = "Who are the two in chains?", next = "drakes" },
        { text = "Why kill them now, after all these years?", next = "honor" },
        { text = "Have you tried to reach those two before?", next = "ogres" },
        { text = "What was the Second War like?", next = "war" },
        { text = "My people never fought beside dragons.", next = "xtauren", when = { race = "Tauren" } },
        { text = "Why free them first? Why not leave them chained?", next = "xcaster", when = { class = { "MAGE", "WARLOCK", "PRIEST" } } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },

    drakes = {
      lines = {
        { id = "dr_default", text = "Lieutenants of Deathwing himself, from the days when the Horde fought alongside his flight. They were locked away in Lethlor Ravine when the war turned, and the Seal of the Earth has held them ever since." },
      },
      choices = {
        { text = "How do we reach them?", next = "drakes_seal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    drakes_seal = {
      lines = {
        { id = "ds_default", text = "The Seal's held by three runestones in the Pillars of Diamond, Opal and Amethyst, and the Sign of the Earth opens all three. Take the stones, place them in the Seal, and the drakes wake up angry, so be ready when they do." },
        { id = "ds_done", when = { questDone = TODO_QUEST("Broken Alliances") },
          text = "You know the way, because you walked it. The ravine is still full of drakes, but the two that mattered are gone." },
      },
      choices = {
        { text = "Waking them seems a great risk.", next = "drakes_risk" },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    drakes_risk = {
      lines = {
        { id = "dk_default", text = "It is, and if you'd rather not, I'll find someone who would. But a chained enemy is an enemy someone else can free, and the black dragonflight has new friends among the Blackrock who'd love to turn those two loose." },
      },
      choices = {
        { text = "Then we strike first. Better them dead than freed.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    honor = {
      lines = {
        { id = "ho_default", text = "Because the Warchief tells us we are free of the old masters, and I believe him. But a debt doesn't vanish because you've stopped paying it, and the Horde's old allies are a debt that the young pay for." },
      },
      choices = {
        { text = "The young shouldn't pay for the old Horde's sins.", next = "honor_debt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    honor_debt = {
      lines = {
        { id = "hd_default", text = "They shouldn't, but they will if we old ones sit by the fire and pretend it was someone else. I fought in that war, and I took what the dragons gave, so I'll see the drakes dead and call it settled." },
      },
      choices = {
        { text = "Settling old debts is a matter of honor.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "The past is dead. Kill them because they're dangerous.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ogres = {
      lines = {
        { id = "og_default", text = "We hired Tho'grun and his band of ogre mercenaries to fetch the Sign of the Earth for us, and they fetched it well enough. Then they overwhelmed my soldiers and kept it for themselves, and I'm still paying the widows out of my own purse." },
      },
      choices = {
        { text = "You trusted ogre mercenaries?", next = "ogres_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ogres_trust = {
      lines = {
        { id = "ot_default", text = "I trusted their greed, which is usually safer than trusting their word, and I was wrong about that too. Kill Tho'grun and the rest of them will scatter, because ogres follow strength and nothing else." },
        { id = "ot_done", when = { questDone = TODO_QUEST("Broken Alliances") },
          text = "Tho'grun is dead and his corpse picked clean by the desert winds, and the ogres at Camp Boff are in disarray. Small victory, but it led to a large one." },
      },
      choices = {
        { text = "Ogres for hire were a fair gamble. It just went bad.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Next time, send orc soldiers. Discipline wins.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    war = {
      lines = {
        { id = "wa_default", text = "Loud, and hungry, and we didn't know half of what we'd become until the camps gave us time to think about it. The dragons burned whole valleys for us, and we cheered, because we were fools." },
      },
      choices = {
        { text = "Something must have changed your mind since then.", next = "war_change" },
        { text = "Something else.", next = "BACK" },
      },
    },
    war_change = {
      lines = {
        { id = "wc_default", text = "Thrall, and the camps, and seeing the Blackrock still chasing the same fire they chased then. Look at Rend and his lot in the Spire and you'll see what I'd have been without the Warchief, and I don't like the look of it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    xtauren = {
      big = true,
      lines = {
        { id = "xt_default", text = "No, and be glad of it, because your people walked their plains while mine burned the world for masters who laughed at us. I'll not ask you to carry our shame, only to help me bury a piece of it." },
      },
      choices = {
        { text = "The Horde's shame is all of ours now.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Your shame is yours. I'm here for the drakes.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcaster = {
      big = true,
      lines = {
        { id = "xc_default", text = "Because I've watched warlocks break better chains than these, and the Blackrock have warlocks. A dead drake stays dead, so I'll risk waking them now over someone else freeing them later." },
      },
      choices = {
        { text = "Killing is surer than any binding.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "A prisoner could be redeemed. A corpse can't.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I fought in the Second War, sat in the camps after it, and walked out free when Thrall broke them open. Kargath is where I've chosen to be useful." } },
    advice = { { id = "tp_ad", text = "Never hire a mercenary who's stronger than the soldiers guarding your coin." } },
    second_war = { { id = "tp_second_war", text = "I fought in the Second War, beside the black dragons, and I didn't know then what they were. Now I want two of them dead, and I call it cleaning up after myself." } },
    internment = { { id = "tp_internment", text = "I sat in the camps after the war, and the guards were humans who'd lost families to us. I didn't blame them, and I don't now." } },
    thrall = { { id = "tp_thrall", text = "The Warchief broke the camps open and gave us back our pride. I'd die for him, and I nearly have, a few times." } },
    black_dragonflight = { { id = "tp_black_dragonflight", text = "The black dragons fought beside the Horde in the Second War, and they were never our allies. They were using us, and we were too foolish to see it." } },
    blackrock_spire = { { id = "tp_blackrock_spire", text = "The Blackrock clan sits in the Spire now, still loyal to the old ways. They're what I could have become, and I don't forget it." } },
    _none = { { id = "tp_none", text = "I don't know it, and I'm too old and too proud to pretend I do." } },
  },
}
