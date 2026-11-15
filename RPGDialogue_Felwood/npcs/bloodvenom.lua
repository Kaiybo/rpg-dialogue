-- Bloodvenom Post: the Horde's only fire in Felwood, on the cliffs over the poisoned river. Voice: bibles/felwood.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "winna", id = TODO_NPC("Winna Hazzard"), name = "Winna Hazzard",
  bible = "bibles/felwood.md", role = "questgiver", tier = "quest",
  communities = { "bloodvenom_post" }, temper = { "manic" }, values = { "curious", "mischievous" },
  notices = { "race", "pet" },

  impression = {
    first = "Winna Hazzard cackles at the end of every other sentence and keeps a kitten she plans to make much larger. Felwood delights her, and that alone ought to worry everyone.",
    third = "{name} met Winna Hazzard, the cackling alchemist of Bloodvenom Post, who finds the corruption of Felwood fascinating.",
  },

  greetings = {
    { id = "g_laugh", text = "*cackles* Oh, a visitor! Mind the kitten, and mind the bottles, and mind everything, really." },
    { id = "g_back", when = { metBefore = true }, text = "*laughs* You came back, and nobody comes back! That's my favourite kind of person." },
  },

  notice = {
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "One of us! Isn't it wonderful, not needing to breathe in a place like this? *cackles* The tauren all cough." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Ooh, a pet! My kitten wants to meet it, but my kitten wants to meet everything, so keep them apart, I think." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Winna Hazzard, alchemist of a sort and keeper of one kitten! Felwood is the most interesting place I've ever been, because everything in it is wrong in some new way. *cackles*" },
        { id = "h_strange", tags = { "news" }, when = { questActive = TODO_QUEST("A Strange One") },
          text = "Someone told you I was strange, didn't they? *laughs* Then there's hope for you yet, because you came anyway. Are you here to help me?" },
        { id = "h_well", when = { questActive = TODO_QUEST("Well of Corruption") },
          text = "The Jadefire satyrs keep a moonwell at the Ruins of Constellas, south of here, gone all foul and bubbling. Bring me a sample, and don't drink it! *laughs* Well, don't drink much." },
        { id = "h_sabers", when = { questActive = TODO_QUEST("Corrupted Sabers") },
          text = "One sip of that water and my kitten doubled in size, and it's stronger, somehow! Carry it to the moonwell and let it out beside it, and we'll see what it becomes... *cackles* oh, we'll see!" },
        { id = "h_sabers_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Corrupted Sabers"), days = 3 } },
          text = "Look at it, look at the size of it! *cackles* If the corrupted water can do that to one little cat, think what a few dozen like it could do to the Alliance." },
      },
      again = {
        { id = "h_again", text = "*giggles* More questions? I love questions; they're like experiments that talk back." },
        { id = "h_again2", text = "Yes, yes, what else? Quickly, something's about to bubble over." },
      },
      choices = {
        { text = "What's the kitten's name?", next = "kitten" },
        { text = "What are you working on?", next = "work" },
        { text = "Some would call this cruel.", next = "cruel" },
        { text = "What do you make of Felwood?", next = "felwood" },
        { text = "A fellow Forsaken. Who sent you here?", next = "forsaken", when = { race = "Scourge" } },
        { text = "Keep your potions away from my pet.", next = "hunter", when = { class = "HUNTER" } },
        { text = "Moonwells were sacred to someone.", next = "tauren", when = { race = "Tauren" } },
        { text = "I'll go.", next = "END", fx = { affinity = 1 } },
      },
    },

    kitten = {
      lines = {
        { id = "k_default", text = "A name? It doesn't need a name, because it knows who it is. *cackles* Which is more than most of the people at this post can say." },
      },
      choices = {
        { text = "What are you planning for it?", next = "kitten_plans" },
        { text = "Fair enough.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    kitten_plans = {
      lines = {
        { id = "kp_default", text = "Bigger, stronger, hungrier! *laughs* The Horde could use a few cats like that, don't you think, and if they're a little bit corrupted, well, so is everything else around here." },
      },
      choices = {
        { text = "That's horrible.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "That's brilliant.", next = "BACK", fx = { affinity = 2, align = { light = -1 } } },
      },
    },

    work = {
      lines = {
        { id = "w_default", text = "The moonwell at Constellas, the night elves' precious symbol of renewal, and now it's poisoned and the satyrs use it to make more satyrs. *cackles* Isn't that marvellous?" },
      },
      choices = {
        { text = "What do you want with it?", next = "work_use" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work_use = {
      lines = {
        { id = "wu_default", text = "To use it, of course! The corruption is already here and nobody wants it, so we ought to find a way to turn it on our enemies before it's wasted." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    cruel = {
      big = true,
      lines = {
        { id = "c_default", text = "Some would, and some do, and I let them. *laughs* Really, all I want is for the Horde to have an advantage over the Alliance, any advantage at all, and is that so terrible?" },
      },
      choices = {
        { text = "It depends on the advantage.", next = "cruel_alliance" },
        { text = "Not if it wins the war.", next = "BACK", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "Some advantages cost more than any war is worth.", next = "BACK", fx = { align = { honor = 1 } } },
      },
    },
    cruel_alliance = {
      lines = {
        { id = "ca_default", text = "Oh, you sound like a tauren. The Forsaken will use whatever means it takes to crush the Alliance, my dear, and we don't get to be fussy about which means are pretty. *cackles*" },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { opinion = { forsaken_methods = "against" } } } },
    },

    felwood = {
      lines = {
        { id = "f_default", text = "Everything here is poisoned or mad or both, and every poison is different from the last! I could study this forest for a hundred years and still find something new to bottle. *giggles*" },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    forsaken = {
      lines = {
        { id = "fo_default", text = "Nobody sent me, I came! *laughs* Well, the Undercity may think it sent me, and I let it think so, because they pay for the bottles." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    hunter = {
      lines = {
        { id = "hu_default", text = "*cackles* Oh, I wouldn't dream of it, not without asking first. But if your pet ever looks a little small to you, you know where I am." },
      },
      choices = { { text = "Never.", next = "BACK", fx = { trait = { stern = 1 } } } },
    },
    tauren = {
      lines = {
        { id = "ta_default", text = "To the night elves, and they had ten thousand years to keep it clean, and look! *laughs* It's my turn now, and I'm much less precious about it." },
      },
      choices = {
        { text = "The Earth Mother wouldn't approve.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The land's already poisoned, so somebody may as well use it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "An alchemist, a Forsaken and a cat lover, and two of those are true! *cackles* You decide which." } },
    advice = { { id = "tp_ad", text = "Never let anything in Felwood lick you. *laughs* I mean it, actually, that one's serious." } },
    _none = { { id = "tp_none", text = "No idea! *laughs* Isn't that exciting?" } },
  },
}

P:NPC {
  key = "trull", id = TODO_NPC("Trull Failbane"), name = "Trull Failbane",
  bible = "bibles/felwood.md", role = "soldier", tier = "quest",
  communities = { "bloodvenom_post" }, temper = { "grim" }, values = { "loyal", "practical" },
  notices = { "kit" },

  impression = {
    first = "Trull Failbane wants to know everything Felwood hides, and he'll know if I skip a part of my report. He is grim and careful, and he plainly doesn't trust the alchemist either.",
    third = "{name} met Trull Failbane, the grim orc who serves as Orgrimmar's eyes at Bloodvenom Post.",
  },

  greetings = {
    { id = "g_post", text = "Did Orgrimmar send you, or did you wander up here by mistake? Either way, you're useful now." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The forest had you for lunch, so get fixed up before it comes back for supper." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Trull Failbane. Orgrimmar wants eyes in Felwood, and these are them; this forest hides a great deal, and I'm paid to find out what." },
        { id = "h_guardians", tags = { "news" }, when = { questActive = TODO_QUEST("Wild Guardians") },
          text = "Back with word? Good, then sit and tell me everything, slowly, because I'll know if you skip a part." },
        { id = "h_secrets", when = { questActive = TODO_QUEST("Guarding Secrets") },
          text = "Some things in Winterspring are guarded for a reason, and I want to know the reason; then I'll decide if the guards were right." },
        { id = "h_winna", when = { heardLine = "winna.h_default" },
          text = "You've met the alchemist, then. Don't ask me about her, because I don't know what she's doing either, and nobody does; she laughs when you ask." },
        { id = "h_guardians_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Wild Guardians"), days = 3 } },
          text = "Hard work is something I respect, and you've done a great deal of it in the snow. With those owlbeasts out of the way, we can push further into Winterspring." },
      },
      again = {
        { id = "h_again", text = "Anything else? Make it worth writing down." },
      },
      choices = {
        { text = "What's out in Winterspring?", next = "winterspring" },
        { text = "Why does Orgrimmar care about owlbeasts?", next = "why" },
        { text = "What is this post, anyway?", next = "post" },
        { text = "What's the alchemist really up to?", next = "winna" },
        { text = "What do you make of that glowing necklace?", next = "nara", when = { questDone = TODO_QUEST("Guarding Secrets") } },
        { text = "The wildkin are kin to one of my forms.", next = "druid", when = { class = "DRUID" } },
        { text = "I'll be your eyes too.", next = "END", fx = { affinity = 1, standing = { bloodvenom_post = 1 } } },
      },
    },

    winterspring = {
      lines = {
        { id = "ws_default", text = "Snow, past the Timbermaw tunnels to the northeast, and owlbeasts, wildkin, crawling all over it. They guard something, secrets of the night elves, and creatures don't guard nothing." },
      },
      choices = {
        { text = "Where would the secrets be?", next = "winterspring_caves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    winterspring_caves = {
      lines = {
        { id = "wc_default", text = "Runners came back with word of small caves in the south of Winterspring, with wildkin thick around them. Those ones have gone mad, berserk, as if whatever they guard has been working on them for too long." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    why = {
      lines = {
        { id = "wy_default", text = "Because the night elves have had this continent to themselves for ten thousand years, and we've had it for a few. Whatever they've hidden, the Horde should know about it before it surprises us." },
      },
      choices = {
        { text = "And if it's something sacred?", next = "why_sacred" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_sacred = {
      lines = {
        { id = "wsa_default", text = "Then we'll know that too, and Orgrimmar can decide whether to leave it be. Knowing is my job; deciding is somebody else's, which suits me." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    post = {
      lines = {
        { id = "p_default", text = "Some tauren raised it on these cliffs above the poisoned river, and their braves still keep the watch. It's the only Horde fire in Felwood, so we keep it small and we keep it lit." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    winna = {
      lines = {
        { id = "wi_default", text = "Bottling corrupted water and feeding it to her cat, as far as I can tell. I don't ask, because she laughs, and I don't like the laugh." },
      },
      choices = {
        { text = "Do you report on her?", next = "winna_report" },
        { text = "Something else.", next = "BACK" },
      },
    },
    winna_report = {
      lines = {
        { id = "wr_default", text = "I report on everything, and she's in every report. Whether anyone in Orgrimmar reads that part, I couldn't tell you." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    nara = {
      lines = {
        { id = "n_default", text = "That's beyond me; I know owlbeasts, not their magic, which is why it went to Nara Wildmane in Thunder Bluff. If the wildkin were made to guard someone's holy places, then what they're guarding matters more than I thought." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    druid = {
      lines = {
        { id = "d_default", text = "Then you'd know better than me what makes a wildkin angry, and I'd like to hear it. Write it down, slowly, and I'll see it gets to Orgrimmar." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "These are in my reports, so I can speak to them. The rest stays between me and Orgrimmar." },
    },
    cenarion_circle = { { id = "tp_circle", text = "The druids south of here are honest, as far as I can tell. That's rare enough to report." } },
    background = { { id = "tp_ba", text = "I gather what Orgrimmar needs to know and send it home. My own story isn't something anyone's asked for." } },
    advice = { { id = "tp_ad", text = "Take the tunnels through Timbermaw country politely, if the furbolgs let you. The other way round is longer and colder." } },
    _none = { { id = "tp_none", text = "Not in my reports." } },
  },
}
