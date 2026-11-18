-- Felgur Twocuts, orc intelligence-gatherer against the Kolkar at Ghost Walker Post (0.72.0). Voice: bibles/felgur.md
-- Classic: The Kolkar of Desolace (turn-in, from Regthar Deathgate), Centaur Bounty, Khan Dez'hepah.
local P = RPGDialogueAPI:Pack("rpgd.desolace")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "felgur", id = TODO_NPC("Felgur Twocuts"), name = "Felgur Twocuts",
  bible = "bibles/felgur.md", role = "soldier", tier = "quest",
  communities = { "ghost_walker" }, temper = { "curt", "hard" }, values = { "practical", "loyal" },
  notices = { "soldier", "race" },
  impression = {
    first = "Felgur Twocuts wants everything quickly, especially conversations. He has spent too long counting centaur camps to have patience left for anything else, and he says the struggle will be long.",
    third = "{name} met Felgur Twocuts, an orc at Ghost Walker Post gathering intelligence on Desolace's centaur for the Horde.",
  },

  greetings = {
    { id = "g_hello", text = "Make it quick, {race}; an orc's time is for the hunt." },
    { id = "g_ears", when = { questActive = TODO_QUEST("Centaur Bounty") }, text = "I want ears from any clan and any camp, and I want a great many of them." },
    { id = "g_khan", when = { questActive = TODO_QUEST("Khan Dez'hepah") }, text = "Dez'hepah's still breathing, I take it, so go and fix that." },
    { id = "g_done", when = { questDone = TODO_QUEST("Khan Dez'hepah") }, text = "The Kolkar are still fighting over who leads them now. Good; let them." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}. The centaur didn't miss you, but I did, a little." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've hardened since you first came to Desolace. Desolace does that, or it kills you." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Heard you made someone at the post angry. Do it to the centaur instead, where it's useful." },
  },

  notice = {
    { id = "n_kills", cat = "soldier", when = { killed = { name = "Kolkar", min = 40 } },
      text = "You smell of Kolkar blood, and plenty of it. That's the only introduction I need." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren. The centaur hate your people worst of all, so they'll come for you first; use that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Felgur Twocuts. I was sent to gather what I could on the centaur of Desolace, and what I've gathered is that there are too many of them and they all hate us." },
        { id = "h_clans_resolved", tags = { "news" }, when = { thread = { id = "desolace_clans", state = "resolved" }, faction = "Horde" },
          text = "Khan Hratha of the Maraudine is dead, and your centaur friends are drunk on it. The rest of the clans are still killing each other, which is how I like them, so sit down and tell me which camps moved." },
        { id = "h_op_war", when = { opinion = { topic = "centaur", stance = "war" } },
          text = "Regthar Deathgate's runners say you'd carry the war right into Desolace. Well, you're here now, so start with the Kolkar and work your way south." },
        { id = "h_op_people", when = { gossip = { topic = "centaur", stance = "people" } },
          text = "Takata Steelblade tells me you think the centaur are a people. Keep thinking it, if you like, but keep your shield up while you do." },
        { id = "h_arrive", tags = { "news" }, when = { questActive = TODO_QUEST("The Kolkar of Desolace") },
          text = "You're here on Regthar Deathgate's orders? Then you're here to deal with the centaur. Good; sit, listen, and don't expect this to end quickly." },
        { id = "h_bounty_before", when = { questBefore = TODO_QUEST("Centaur Bounty") },
          text = "Many clans make up the centaur, each with its own khan, but they all share one thing, and that's cruelty. Hunt them wherever you find them and bring me their ears, and the Horde gets one step closer to peace out here." },
        { id = "h_bounty_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Centaur Bounty"), days = 3 } },
          text = "That's a fine bag of ears. The blood you spilled will save lives at the Barrens' edge, whether anyone there thanks you or not." },
        { id = "h_khan", tags = { "news" }, when = { questActive = TODO_QUEST("Khan Dez'hepah") },
          text = "Khan Dez'hepah leads the Kolkar here. Cut off the head, and the body spends a season fighting over who gets to be the new head." },
        { id = "h_khan_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Khan Dez'hepah"), days = 3 } },
          text = "Dez'hepah's dead, and the Kolkar camps are howling about it. That's the sound of a good week's work." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick about it, because I've centaur to count, and they don't count themselves." },
        { id = "h_again2", text = "Something more, {race}? Then spit it out before the next raid." },
      },
      choices = {
        { text = "Why do the centaur hate us?", next = "hate" },
        { text = "Why collect ears?", next = "ears" },
        { text = "You must know the clans well by now.", next = "clans" },
        { text = "Why do they call you Twocuts?", next = "name" },
        { text = "The Earth Mother weeps for this killing.", next = "tauren_f", when = { race = "Tauren" } },
        { text = "Give me a target.", next = "BUSINESS" },
        { text = "I'll be quick, then. Farewell.", next = "END" },
      },
    },

    hate = {
      lines = {
        { id = "ha_default", text = "Because they've warred with the tauren longer than anyone remembers, and when we helped drive them out of Mulgore, they added orcs to the list. They've been raiding the Barrens since before Orgrimmar had walls." },
      },
      choices = {
        { text = "Is there any talking to them?", next = "hate_talk" },
        { text = "Do you think they're beasts, then?", next = "centaur_op" },
        { text = "Something else.", next = "BACK" },
      },
    },
    centaur_op = {
      lines = { { id = "co_default", text = "Doesn't matter what I think, I count ears for a living. You've seen them up close now, though, and some of the tauren say there's a people under all that cruelty, so tell me: is there?" } },
      choices = {
        { text = "They're beasts, every clan of them.", next = "co_beasts", fx = { affinity = 1, align = { light = -1 }, opinion = { centaur = "hate" } } },
        { text = "They're a people, cruel or not. Kill only who you must.", next = "co_people", fx = { affinity = -1, align = { light = 1 }, opinion = { centaur = "people" } } },
        { text = "They're most useful when they're killing each other.", next = "co_useful", fx = { opinion = { centaur = "divide" } } },
        { text = "Kolkar spears killed my grandfather. I'll never forgive them.", next = "co_blood", when = { race = "Tauren" }, fx = { affinity = 2, opinion = { centaur = "blood" } } },
        { text = "I'm still making up my mind.", next = "BACK" },
      },
    },
    co_beasts = {
      lines = { { id = "cob_default", text = "Beasts with bows and khans and grudges, which is worse than beasts. Bring me ears, and we'll agree on everything." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    co_people = {
      lines = { { id = "cop_default", text = "Maybe they are. People can be worth killing too, and these ones burn tauren camps for sport, so I'll take your mercy under advisement." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    co_useful = {
      lines = { { id = "cou_default", text = "Now you sound like Captain Pentigast, the Alliance commander at Nijel's Point, and I mean that as half an insult. The other half's a compliment, because he's still alive." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    co_blood = {
      lines = { { id = "cobl_default", text = "Then you've more right to that bag of ears than I have. Fill it, and say his name over every one if it helps." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hate_talk = {
      lines = {
        { id = "ht_default", text = "To one clan at a time, maybe, when it wants help killing another clan. That's not peace; that's a knife pointed somewhere else for a while." },
      },
      choices = {
        { text = "Then we should use that knife.", next = "hate_knife" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hate_knife = {
      big = true,
      lines = {
        { id = "hk_default", text = "Maybe. Thrall would call it diplomacy, and I'd call it a bargain with a snake, but I'm not the Warchief, and he's earned the right to choose." },
      },
      choices = {
        { text = "Turn them on each other. Fewer of ours die.", next = "BACK", reply = "Good. That's my thinking too, and Gurda's, and if it saves one grunt, I'll call it worth the snake.", fx = { align = { honor = -1 }, opinion = { centaur = "divide" } } },
        { text = "I'd rather fight them face to face.", next = "BACK", reply = "Then you'll get your chance, because the centaur don't fight fair, and they'll come at you face to face sometimes.", fx = { align = { honor = 1 }, opinion = { centaur = "war" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ears = {
      big = true,
      lines = {
        { id = "ea_default", text = "Proof. I can't count dead centaur from here, and I don't trust a story without something in the bag. If it's ugly, so is Desolace." },
      },
      choices = {
        { text = "War is ugly. I'll bring the ears.", next = "BACK", reply = "Good. War is war, and the ears keep the count honest, which is more than most stories do.", fx = { align = { light = -1 } } },
        { text = "I'll kill them, but I won't cut trophies.", next = "BACK", reply = "Then bring me something else, a banner, a bow, I don't care, as long as I can count it.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    clans = {
      lines = {
        { id = "cl_default", text = "Kolkar in the north, Gelkis in the southwest, Magram in the southeast, and Maraudon somewhere at the back of it all, where the shaman say their mother lives. The Gelkis and Magram hate each other even more than they hate us." },
      },
      choices = {
        { text = "Their mother?", next = "clans_mother" },
        { text = "Something else.", next = "BACK" },
      },
    },
    clans_mother = {
      lines = {
        { id = "cm_default", text = "Some old earth spirit, the Gelkis say, and they say it like it's a threat. The Magram laugh at them for it, which is the only funny thing a centaur's ever done in my hearing." },
      },
      choices = {
        { text = "I'll keep my ears open.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Farewell, Felgur.", next = "END" },
      },
    },

    name = {
      lines = {
        { id = "na_default", text = "Two cuts on one Kolkar, in one afternoon. The second one was the important one; ask me again sometime when I've had a drink." },
      },
      choices = {
        { text = "I'll hold you to that.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren_f = {
      lines = {
        { id = "tf_default", text = "Maybe she does, and I'm sorry for it. But the centaur don't weep when they burn your people's camps, so I'll do my weeping after the Barrens are safe." },
      },
      choices = {
        { text = "Then let it end soon.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A grunt who could count, so they made me a scout. I was born in an internment camp, and I've been fighting for the Horde since the day the gates broke, and that's all of it." } },
    advice = { { id = "tp_ad", text = "Centaur ride in circles before they charge. When they stop circling, run or swing." } },
    centaur = { { id = "tp_centaur", text = "All five clans want us dead, and they all want each other dead more, so we have time. Bring me ears." } },
    thrall = { { id = "tp_thrall", text = "The Warchief needs this coast held, so it is held. Do you have more questions, or ears?" } },
    maraudon = { { id = "tp_maraudon", text = "The centaur call Maraudon holy, and they defend it like rabid wolves, so no orc goes there. Good, there is enough to kill out here." } },
    burning_legion = { { id = "tp_burning_legion", text = "Takata Steelblade hunts the demon-lovers and I hunt centaur, and both of us have more work than hands, so if you want work, ask either of us and stop talking." } },
    _none = { { id = "tp_none", text = "I don't know, and I don't much care, so ask me something useful, something with blood in it." } },
  },
}
