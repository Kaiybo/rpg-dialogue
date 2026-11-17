-- Thal'trak Proudtusk: a Darkspear soldier at Kargath whose wife, Sha'ni, went into the Burning Steppes with her platoon and never reported back. Voice: bibles/thaltrak.md
local P = RPGDialogueAPI:Pack("rpgd.badlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "thaltrak", id = TODO_NPC("Thal'trak Proudtusk"), name = "Thal'trak Proudtusk",
  bible = "bibles/thaltrak.md", role = "questgiver", tier = "quest",
  communities = { "kargath" }, temper = { "restless", "warm" }, values = { "loyal", "dutiful" },
  notices = { "race", "kin" },

  impression = {
    first = "Thal'trak Proudtusk stands his post at Kargath and keeps looking east, toward the Burning Steppes, where his wife went with her platoon. He talks about her as if she might walk in at any moment.",
    third = "{name} met Thal'trak Proudtusk at Kargath, a troll soldier waiting on word of his wife, Sha'ni.",
  },

  greetings = {
    { id = "g_default", text = "Hey, mon, you be coming from the east? You see any troll soldiers on the road, any word at all?" },
    { id = "g_back", when = { metBefore = true }, text = "You be back, mon. Sit with me a while, I still be watching that road." },
    { id = "g_away", when = { away = 14 }, text = "You been gone {away}, and I been standing right here every day of it, because the Warlord say I can't leave my post." },
    { id = "g_grief", when = { questDone = TODO_QUEST("Krom'Grul") }, text = "You again, mon. I don't watch the road no more, so I don't know what I be doing out here." },
    { id = "g_word_kind", when = { word = "helped" }, text = "Kargath be saying you help people, mon. That be a good thing to be known for in a fort like this." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear, eh, mon? Good to see tusks that ain't mine around here, it make the place feel a little more like home." },
    { id = "n_kin", cat = "kin", when = { race = "Orc" },
      text = "You got the look of a soldier, mon, so maybe you understand what it be like to wait on a platoon that don't come back." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Thal'trak Proudtusk, Kargath Expeditionary Force. My wife Sha'ni went out to the Burning Steppes more than three weeks ago, and nobody in her platoon been heard from since." },
        { id = "h_rock_active", tags = { "news" }, when = { questActive = TODO_QUEST("Dreadmaul Rock") },
          text = "You going to look for her, mon? She went to see what the Firegut ogres be doing up on Dreadmaul Rock, and that be where you start looking." },
        { id = "h_rock_done", tags = { "news" }, when = { questDone = TODO_QUEST("Dreadmaul Rock"), questBefore = TODO_QUEST("Krom'Grul") },
          text = "You found something up on that rock, I can see it in your face, mon. Don't make me wait for it, please." },
        { id = "h_ring", tags = { "news" }, when = { questRecent = { TODO_QUEST("Krom'Grul"), days = 3 } },
          text = "Keep the ring, throw it away, I don't care, mon. It don't mean nothing to me now, not without her." },
        { id = "h_later", when = { questLater = { TODO_QUEST("Krom'Grul"), days = 7 } },
          text = "I keep thinking I should write to her mother and father, mon, but I don't got the words yet. Maybe there be no words for it." },
        { id = "h_troll", when = { race = "Troll" },
          text = "A Darkspear, good. Sit with me, mon, because my wife be out past the mountains and I could use a voice that sound like home." },
      },
      again = {
        { id = "h_again", text = "What else, mon? I still be standing here." },
        { id = "h_again2", text = "Go on, I be listening, with one eye on the road." },
      },
      choices = {
        { text = "Tell me about Sha'ni.", next = "shani" },
        { text = "What was her platoon doing out there?", next = "mission" },
        { text = "Why don't you go after her yourself?", next = "post" },
        { text = "What will you do now?", next = "after", when = { questDone = TODO_QUEST("Krom'Grul") } },
        { text = "The spirits might know where she is.", next = "xspirit", when = { class = { "SHAMAN", "PRIEST" } } },
        { text = "I'll keep my eyes open on the road.", next = "END" },
      },
    },

    shani = {
      lines = {
        { id = "sh_default", text = "Best scout in the platoon, and stubborn as a raptor, and she laugh louder than anyone in Kargath. We was married before the Warlord sent us out here, and we said this would be our last tour." },
        { id = "sh_done", when = { questDone = TODO_QUEST("Krom'Grul") },
          text = "She was the best scout in the platoon, mon, and stubborn, and she laugh louder than anybody. It be strange how fast you start saying 'was'." },
      },
      choices = {
        { text = "Your last tour? Then what?", next = "shani_plans" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shani_plans = {
      lines = {
        { id = "sp_default", text = "We was going to the Hinterlands to live with her mother and father, mon, away from forts and ogres and orders. Her people got trees there, real green ones, not this red dust." },
      },
      choices = {
        { text = "That's a good thing to come home to.", next = "shani_hope" },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    shani_hope = {
      lines = {
        { id = "sho_default", text = "It be the only thing I think about out here, mon, when I ain't thinking the worst. You go find her for me, and maybe I get to see those trees after all." },
        { id = "sho_done", when = { questDone = TODO_QUEST("Krom'Grul") },
          text = "It would have been, mon. Now I don't know where I go, because the Hinterlands was her home and not mine." },
      },
      choices = {
        { text = "I'll find her, Thal'trak. One way or another.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    mission = {
      lines = {
        { id = "mi_default", text = "The Firegut ogres on Dreadmaul Rock been doing some kind of ritual, chanting and burning things, and the Warlord sent Sha'ni's platoon to see what it was. Strange things on that mountain, mon, strange and ugly." },
      },
      choices = {
        { text = "What sort of ritual?", next = "mission_ritual" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mission_ritual = {
      lines = {
        { id = "mr_default", text = "Nobody know, that be why they sent scouts. Ogres don't do much magic, mon, so when they start, it be because somebody bigger taught them, and I don't like to think who." },
        { id = "mr_done", when = { questDone = TODO_QUEST("Krom'Grul") },
          text = "Krom'Grul wanted her for it, you told me, chained to an altar up there. I don't want to know no more about that ritual, mon, not ever." },
      },
      choices = {
        { text = "The Warlord shouldn't have sent so few.", next = "mission_blame" },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    mission_blame = {
      lines = {
        { id = "mb_default", text = "Maybe, mon, but the Warlord got Blackrock on every side and not enough soldiers for any of it. Goretooth tell me to move on and focus on the task at hand, and I can't believe he say that about my wife." },
      },
      choices = {
        { text = "A soldier's orders come first. He's right.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Orders be damned. She's your wife.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    post = {
      lines = {
        { id = "po_default", text = "Because the Warlord say I can't leave my post, mon, and if every soldier in Kargath went running after someone they love, there be no Kargath. I know that, I just don't like it." },
      },
      choices = {
        { text = "You could go anyway.", next = "post_desert" },
        { text = "Something else.", next = "BACK" },
      },
    },
    post_desert = {
      lines = {
        { id = "pd_default", text = "And what Sha'ni say if she come back and find I deserted for her? She laugh at me first and then she hit me, mon. No, I stay, and you go, if you be willing." },
      },
      choices = {
        { text = "I'll go to Dreadmaul Rock for you.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    after = {
      lines = {
        { id = "af_default", text = "Stand here, I guess, because it be the only thing I know how to do. You told me what she said, that we meet again in another life, and I hold on to that, mon, because I got nothing else to hold." },
      },
      choices = {
        { text = "Krom'Grul paid for it. That's something.", next = "after_krom" },
        { text = "Something else.", next = "BACK" },
      },
    },
    after_krom = {
      lines = {
        { id = "ak_default", text = "He paid, and I'm glad, mon, I'm glad you did it. But the ogre being dead don't make her any less gone, and I keep waiting for it to feel like enough." },
      },
      choices = {
        { text = "It won't ever be enough. You'll carry her instead.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then go kill more ogres. It helps.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xspirit = {
      big = true,
      lines = {
        { id = "xs_default", text = "You think so, mon? I been asking the spirits every night, but they don't answer a soldier the way they answer someone like you. If you hear her, you tell me, even if it be bad." },
        { id = "xs_done", when = { questDone = TODO_QUEST("Dreadmaul Rock") },
          text = "You already heard her, mon, up on that rock, and I be grateful and I hate it at the same time. Did she seem at peace to you?" },
      },
      choices = {
        { text = "I'll tell you the truth, whatever it is.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Some truths are better left unsaid, Thal'trak.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "Darkspear, mon, from the Echo Isles, and a soldier of the Horde since the Warchief bring us across the sea. Kargath be where they put me." } },
    advice = { { id = "tp_ad", text = "Say the important things before somebody leave on a mission, mon, because you don't always get to say them after." } },
    _none = { { id = "tp_none", text = "I don't know nothing about that, mon. Ask me about the road east, that be all I watch." } },
  },
}
