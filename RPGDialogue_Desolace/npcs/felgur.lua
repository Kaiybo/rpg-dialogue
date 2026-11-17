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
    { id = "g_away", when = { away = 14 }, text = "Gone {away}. The centaur didn't miss you, but I did, a little." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've hardened since you came here on Regthar's orders. Desolace does that, or it kills you." },
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
          text = "Felgur Twocuts. I was sent to gather what I could on the centaur of Desolace, and what I've gathered is that there are too many of them and they all hate us." },
        { id = "h_arrive", tags = { "news" }, when = { questActive = TODO_QUEST("The Kolkar of Desolace") },
          text = "You're here on Regthar's orders? Then you're here to deal with the centaur. Good; sit, listen, and don't expect this to end quickly." },
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
        { text = "Something else.", next = "BACK" },
      },
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
        { text = "Turn them on each other. Fewer of ours die.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'd rather fight them face to face.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ears = {
      big = true,
      lines = {
        { id = "ea_default", text = "Proof. I can't count dead centaur from here, and I don't trust a story without something in the bag. If it's ugly, so is Desolace." },
      },
      choices = {
        { text = "War is ugly. I'll bring the ears.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll kill them, but I won't cut trophies.", next = "BACK", fx = { align = { light = 1 } } },
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
        { id = "na_default", text = "Two cuts, one Kolkar, one afternoon. The second one was the important one; ask me again sometime when I've had a drink." },
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
    _none = { { id = "tp_none", text = "I don't know, and I don't much care, so ask me something useful, something with blood in it." } },
  },
}
