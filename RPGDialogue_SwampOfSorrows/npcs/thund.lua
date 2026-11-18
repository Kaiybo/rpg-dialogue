-- Corporal Thund Splithoof: a tauren soldier of Thrall's Grasp whose spirit answers the Fallen Hero's call by the road to the Blasted Lands. Voice: bibles/thund.md
-- As in swamp_wilds.lua, the Fallen Hero's name stays out.
local P = RPGDialogueAPI:Pack("rpgd.swampofsorrows")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "thund", id = TODO_NPC("Corporal Thund Splithoof"), name = "Corporal Thund Splithoof",
  bible = "bibles/thund.md", role = "soldier", tier = "quest",
  communities = { "swamp_of_sorrows" }, temper = { "calm", "gentle" }, values = { "loyal", "generous" },
  notices = { "race", "class" },

  impression = {
    first = "Corporal Thund Splithoof is a tauren ghost who rose from the swamp when the Fallen Hero called him. He gave away his clan's relic as easily as another soldier might share a ration, and he seemed glad to.",
    third = "{name} met the spirit of Corporal Thund Splithoof, a tauren of Thrall's Grasp, by the road from the Swamp of Sorrows to the Blasted Lands.",
  },

  greetings = {
    { id = "g_default", text = "Peace, friend. My captain's spirit called, and I came, as I always did when he called." },
    { id = "g_back", when = { metBefore = true }, text = "You come back to a dead soldier's road. The Earth Mother keeps you, I see." },
    { id = "g_relic", when = { questDone = TODO_QUEST("Heroes of Old") }, text = "Does the relic serve you well? I hope it does. It was never meant to sit in a box." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of the shu'halo, so far from Mulgore. Tell me, do the plains still smell of rain in the spring?" },
    { id = "n_druid", cat = "class", when = { class = { "DRUID", "SHAMAN" } },
      text = "You walk with the spirits, I can feel it, and they are kinder to me when you are near." },
  },

  start = "hello",
  nodes = {
    op_horde = {
      lines = {
        { id = "oph_default", text = "I've had a long while on this road to think about it, and I still go back and forth like a kodo at a river crossing. The orcs saved Mulgore, and then they sent me here to die. What do you think, friend?" },
      },
      choices = {
        { text = "The Horde gave the tauren a home and allies. It was worth it.", next = "op_horde_trust", fx = { affinity = 1, align = { honor = 1 }, opinion = { horde = "trust" } } },
        { text = "The tauren pay the orcs' debts in blood. It isn't fair.", next = "op_horde_distrust", fx = { align = { honor = -1 }, opinion = { horde = "distrust" } } },
        { text = "Cairne chose well. I'd follow him anywhere.", next = "op_horde_trust", fx = { affinity = 2, opinion = { cairne = "trust", horde = "trust" } }, when = { race = "Tauren" } },
        { text = "The Horde sent you to die here. That's what I think.", next = "op_horde_distrust", fx = { opinion = { horde = "hate" } }, when = { faction = "Alliance" } },
        { text = "I think you've earned some rest.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    op_horde_trust = {
      lines = {
        { id = "opht_default", text = "That's what I tell myself on the good nights, and it's a comfort to hear it from living lips. Thank you, friend; it makes the waiting lighter." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_horde_distrust = {
      lines = {
        { id = "ophd_default", text = "Perhaps. But a debt isn't unfair just because it's heavy, and the orcs bled for us against the centaur too. I'd rather we were all of us better at paying, that's all." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Corporal Thund Splithoof, of Thrall's Grasp, or what remains of him. My captain bound me to this place with his grief, I think, and I don't mind it, for I would have stayed anyway." },
        { id = "h_heroes", tags = { "news" }, when = { questActive = TODO_QUEST("Heroes of Old") },
          text = "The chest is for you, friend. Please, take from it a relic of old, for we no longer have any use for it, and may it serve you well against the Legion." },
        { id = "h_heroes_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Heroes of Old"), days = 3 } },
          text = "You took it, good. The Splithooves carried that shard for a long time, and it's right that someone living carries it now." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "You wear the Alliance's colours, but my captain called you a friend, and that's enough for a dead tauren. Stand easy." },
      },
      again = {
        { id = "h_again", text = "Ask, friend. I've all the time the dead have, which is to say all of it." },
        { id = "h_again2", text = "What else would you know? Speak gently; the captain is listening." },
      },
      choices = {
        { text = "How did you die?", next = "death" },
        { text = "What's in that chest beside you?", next = "relic" },
        { text = "Tell me about your captain.", next = "captain" },
        { text = "How did a tauren come to serve in Thrall's Grasp?", next = "grasp" },
        { text = "The Earth Mother waits for you, Thund.", next = "xtauren", when = { race = "Tauren" } },
        { text = "Rest well, Corporal.", next = "END" },
      },
    },

    death = {
      lines = {
        { id = "de_default", text = "In the Blasted Lands, holding a line we'd been told to hold, waiting for orders that never came. The demons came instead, and we did our duty until there was no one left to do it." },
      },
      choices = {
        { text = "You must have been angry, waiting.", next = "death_wait" },
        { text = "Something else.", next = "BACK" },
      },
    },
    death_wait = {
      lines = {
        { id = "dw_default", text = "No, only tired, and a little afraid, and glad of the soldiers beside me. Anger is my captain's burden, and he carries enough of it for all of us." },
      },
      choices = {
        { text = "Holding the line was right. Orders are orders.", next = "BACK", reply = "They were, and I held, and I'd hold again. Thank you for saying it, friend; it eases the waiting.", fx = { align = { order = 1 } } },
        { text = "You should have fallen back. Orders aren't worth dying for.", next = "BACK", reply = "Perhaps, but my captain stood, and I would not leave him to stand alone. The Earth Mother understands that, I think.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    relic = {
      lines = {
        { id = "re_default", text = "The Shard of the Splithooves, carried by my family for longer than anyone remembers, and brought to war because my grandfather said it brought luck. It didn't, but it's still a fine thing, and you'll make better use of it than a ghost." },
      },
      choices = {
        { text = "It ought to go back to your family.", next = "relic_family" },
        { text = "Something else.", next = "BACK" },
      },
    },
    relic_family = {
      lines = {
        { id = "rf_default", text = "There's no one left who'd know it, friend, for the Splithooves were never a large tribe. Better it goes forward with someone who fights the Legion than back into a tent to be wept over." },
      },
      choices = {
        { text = "I'll carry it with honor.", next = "BACK", reply = "Then it goes in good hands, and the Splithooves walk with you a little longer. Walk with the Earth Mother.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "It's a useful thing. That's all that matters.", next = "BACK", reply = "It is a good blade, and it will serve you well, whatever you think of the hands that held it before.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    captain = {
      lines = {
        { id = "ca_default", text = "The best of us, and the hardest on himself, and he won't rest until he knows why the orders never came. I've told him it doesn't matter now, but a ghost can be as stubborn as a living orc." },
      },
      choices = {
        { text = "Can you help him find peace?", next = "captain_peace" },
        { text = "Something else.", next = "BACK" },
      },
    },
    captain_peace = {
      lines = {
        { id = "cp_default", text = "Only by staying, and listening when he talks, which is what I've done. You can do more, friend, because you can walk where he can't, and finish what we couldn't." },
      },
      choices = {
        { text = "I'll finish it for all of you.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    grasp = {
      lines = {
        { id = "gr_default", text = "The Warchief asked for soldiers to watch the road to the Dark Portal, and my tribe owed the orcs a debt from the centaur wars in Mulgore. I went to pay it, and I'd go again, though perhaps I'd pack warmer." },
      },
      choices = {
        { text = "Has the Horde been good for the tauren, do you think?", next = "op_horde" },
        { text = "Something else.", next = "BACK" },
      },
    },

    xtauren = {
      big = true,
      lines = {
        { id = "xt_default", text = "She does, I know, and someday I'll walk to her. But a soldier doesn't leave his captain alone on a dark road, even when the Earth Mother calls." },
      },
      choices = {
        { text = "Then stay, and be at peace in staying.", next = "BACK", reply = "At peace, yes, I think I am, more than I was. Thank you, and may the eternal sun shine upon you.", fx = { align = { light = 1 } } },
        { text = "Your duty ended with your death. Go to her.", next = "BACK", reply = "Ended? Perhaps, but loyalty does not die so easily as flesh. I will go to her when my captain is ready.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I am a tauren of the Splithooves, a corporal of Thrall's Grasp, and a ghost who doesn't mind it much." } },
    advice = { { id = "tp_ad", text = "Keep the friends who stand beside you in the worst of it, and let the rest go." } },
    cairne = { { id = "tp_cairne", text = "Cairne Bloodhoof is the greatest of us, and I was proud to fight under his blessing in Thrall's Grasp. Tell him a Splithoof died well, if you ever see him." } },
    earth_mother = { { id = "tp_earth_mother", text = "My captain called me back to this road, and I didn't mind, because the Earth Mother will still be waiting. Death is just another kind of rest." } },
    thrall = { { id = "tp_thrall", text = "The Warchief named our regiment for himself, and we were proud of it. We still are, those of us that are left." } },
    _none = { { id = "tp_none", text = "I don't know, friend. The dead hear less than the living think." } },
  },
}
