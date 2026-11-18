-- The Spirit of Kirith: a lieutenant of Thrall's Grasp, broken by the Shadowsworn and turned into Kirith the Damned, whose spirit rises at Serpent's Coil once the damned thing is slain. Voice: bibles/kirith.md
-- As in the Swamp pack, the Fallen Hero is never named; Razelikh is, because Kirith knows him.
local P = RPGDialogueAPI:Pack("rpgd.blastedlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "kirith", id = TODO_NPC("Spirit of Kirith"), name = "Spirit of Kirith",
  bible = "bibles/kirith.md", role = "questgiver", tier = "quest",
  communities = { "blasted_lands" }, temper = { "sardonic", "urgent" }, values = { "loyal", "bitter" },
  notices = { "race", "class" },

  impression = {
    first = "The Spirit of Kirith rose from what the demons made of him and grinned at me as if we shared a joke. He was one of the Fallen Hero's men, and he spent his last moments telling me how to kill the thing that broke him.",
    third = "{name} spoke with the Spirit of Kirith at Serpent's Coil, a lieutenant of Thrall's Grasp freed from damnation in the Blasted Lands.",
  },

  greetings = {
    { id = "g_default", text = "Let us not mince words, {class}, for my time here is limited, and an orc who dies twice should spend what's left on the demon rather than on pleasantries." },
    { id = "g_back", when = { metBefore = true }, text = "I'm still here, and still lingering, which surprises me more than you. Ask quickly, before the ancestors call me home." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc. Thrall's Grasp was full of faces like yours, young and certain, and the Legion ate them one at a time." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock, smelling of the same fire they put in me. Be careful, for the demons here know your kind and like the taste." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Lieutenant Kirith, of Thrall's Grasp, and you've just freed me from what Allistarj made of me, so I owe you the truth before I go. My captain sent you, didn't he?" },
        { id = "h_kirith", tags = { "news" }, when = { questActive = TODO_QUEST("Kirith") },
          text = "He sent you to find out what became of me? Then here it is, and you can tell him he was right to fear it. Sit, and listen, because I don't know how long I'll last." },
        { id = "h_cover", tags = { "news" }, when = { questActive = TODO_QUEST("The Cover of Darkness") },
          text = "Go back to my captain and tell him what Razelikh needs, for he'll know what to do with it. And tell him I'm sorry I broke first." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "Alliance, freeing a damned soldier of the Horde. My captain would laugh at that, and so would I, if I still had the breath for it." },
      },
      again = {
        { id = "h_again", text = "More? Ask, but I can feel the edges of me fraying." },
        { id = "h_again2", text = "Go on. I'll answer as long as I'm here to." },
      },
      choices = {
        { text = "They did something terrible to you, I can see that.", next = "torture" },
        { text = "Who is Razelikh?", next = "razelikh" },
        { text = "How do we reach him?", next = "amulet" },
        { text = "What should I tell your captain?", next = "captain" },
        { text = "Let me give your spirit rest.", next = "xpriest", when = { class = { "PRIEST", "SHAMAN", "PALADIN" } } },
        { text = "What happened to Thrall's Grasp?", next = "regiment" },
        { text = "Why would a Horde soldier trust the Alliance?", next = "alliance", when = { faction = "Alliance" } },
        { text = "Is there anything I can carry for you?", next = "last" },
        { text = "Rest, Kirith.", next = "END" },
      },
    },

    torture = {
      lines = {
        { id = "to_default", text = "We were both taken, my captain and I, and caged in the caves by Archmage Allistarj of the Shadowsworn. He worked on me for a long time, and my strength of will faltered where my captain's didn't, and so I became the thing you killed." },
      },
      choices = {
        { text = "It wasn't weakness. No one should endure that.", next = "torture_shame", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "He held. You didn't. That's the truth of it.", next = "torture_shame", fx = { align = { light = -1 } } },
        { text = "What was it like?", next = "torture_shame" },
      },
    },
    torture_shame = {
      lines = {
        { id = "ts_default", text = "Like drowning in someone else's hunger, and enjoying it, which is the worst of it. I remember everything Kirith the Damned did, and I'll carry it wherever I'm going." },
      },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },

    razelikh = {
      lines = {
        { id = "ra_default", text = "Razelikh the Defiler, a demon lord who oversees the Legion's work in these lands, and the one who took our regiment. His cunning is almost as calculated as his brutality, and that's saying a great deal." },
      },
      choices = {
        { text = "A demon lord like that won't be without servants.", next = "razelikh_triad" },
        { text = "Something else.", next = "BACK" },
      },
    },
    razelikh_triad = {
      lines = {
        { id = "rt_default", text = "Three underlings: Grol of the Dreadmaul, Lady Sevine, and Allistarj, who you'll want most of all after hearing my story. They're the triad of power that protects him, and you must break it before you can touch him." },
      },
      choices = {
        { text = "Allistarj first, then. For you.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    amulet = {
      lines = {
        { id = "am_default", text = "Each of the triad wears a third of an amulet of Razelikh's own making, and you'll need the whole of it to summon the arch demon. He made it so he couldn't be called without his servants' leave, which tells you how much he trusts them." },
      },
      choices = {
        { text = "Then I take the amulet from their corpses.", next = "amulet_plan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    amulet_plan = {
      lines = {
        { id = "ap_default", text = "From their corpses, yes, and it won't be as simple as freeing one damned soldier. Take friends you trust, and don't let Lady Sevine speak to you for long, for she lies better than Allistarj tortures." },
      },
      choices = {
        { text = "Strike them one at a time, quiet and quick.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll face each of them openly, as a soldier would.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    captain = {
      lines = {
        { id = "ca_default", text = "Tell him what Razelikh requires, and he'll instruct you further, because he's had a long time to think about little else. And tell him I'm not angry that he couldn't save me, because he never could have." },
      },
      choices = {
        { text = "He'll still blame himself.", next = "captain_blame" },
        { text = "Something else.", next = "BACK" },
      },
    },
    captain_blame = {
      lines = {
        { id = "cb_default", text = "He will, because he blames himself for all of us, and for orders that never came. That's his burden, and I can't lift it from beyond the grave, so I'll ask you to be kind to him in my place." },
      },
      choices = {
        { text = "I'll tell him gently.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    regiment = {
      lines = {
        { id = "rg_default", text = "We were sent into these lands to keep watch on the demons, a whole regiment with Thrall's name on our banner, and we were proud of it. The Defiler took us anyway, a company at a time, and bound what was left of us with his stones." },
        { id = "rg_orc", when = { race = "Orc" }, text = "We were sent here with Thrall's name on our banner to keep watch on the demons, and we were proud of it, as you'd be. The Defiler took us anyway, a company at a time, and bound what was left with his stones." },
      },
      choices = {
        { text = "Did anyone else survive?", next = "regiment_rest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    regiment_rest = {
      big = true,
      lines = { { id = "rr_default", text = "My captain, and that's all I know of, though there may be others bound in the stones who'd thank you for breaking them. We waited a long time for orders from Stonard, and they never came, and I've stopped asking why." } },
      choices = {
        { text = "Someone failed you. Those orders should have reached you.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Soldiers hold without orders. You did your duty.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    alliance = {
      lines = { { id = "al_default", text = "Because you're the one standing here, and the Legion doesn't care what banner we fought under before it found us. My captain sent you, and he's no fool, so if he trusts you then I'll do the same, for the little time I have left." } },
      choices = {
        { text = "Then let's finish what your captain started.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    last = {
      lines = { { id = "la_default", text = "Only the truth to my captain, and maybe my name, if anyone in Stonard ever asks what became of the soldiers who went south. Tell them Kirith broke, but that he was freed, and that the one who freed him went on to finish the job." } },
      choices = {
        { text = "I'll tell them, Kirith.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xpriest = {
      big = true,
      lines = {
        { id = "xp_default", text = "Not yet, healer, not while Razelikh still walks these lands. Let me linger a little longer and be some use, and when it's done, say whatever words you like over the place I stood." },
      },
      choices = {
        { text = "The dead deserve rest, not more duty.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "A soldier's duty doesn't end. I understand.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I was a lieutenant of Thrall's Grasp, and then a demon's plaything, as our fathers were before Thrall freed them, and now I'm neither, which I'm grateful for." } },
    advice = { { id = "tp_ad", text = "If they cage you, don't listen to the voice that says it would be easier to agree. That's how they get in." } },
    thrall = { { id = "tp_thrall", text = "The Warchief's name was on our banner, and I like to think he'd have laughed at how I went out. Maybe not, he's a serious sort." } },
    second_war = { { id = "tp_second_war", text = "I was too young for the Second War, so these wastes were my first real fight. I'd have liked a better one." } },
    dark_portal = { { id = "tp_dark_portal", text = "The Portal's shadow is where the demons waited for us, and they knew our names before we knew theirs. Don't go near the Tainted Scar unless you mean to kill something." } },
    dreadmaul = { { id = "tp_dreadmaul", text = "The Dreadmaul ogres watched the demons take us and didn't lift a finger. I'd have done the same, in their place, but I still hope you kill a few." } },
    _none = { { id = "tp_none", text = "I don't know that, and a dead warrior hasn't time to wonder about it." } },
  },
}
