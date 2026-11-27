-- Highlord Demitrian, alone among the ruins of a Twilight camp in the Crystal Vale, waiting for the Windseeker.
-- Voice: bibles/demitrian.md
local P = RPGDialogueAPI:Pack("rpgd.silithus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "demitrian", id = TODO_NPC("Highlord Demitrian"), name = "Highlord Demitrian",
  bible = "bibles/demitrian.md", role = "questgiver", tier = "quest",
  communities = { "silithus_wilds" }, temper = { "grave", "excitable" }, values = { "devout", "ambitious" },
  notices = { "shaman", "bindings" },

  impression = {
    first = "He speaks of Thunderaan the way a priest speaks of a god.",
    third = "{name} met Highlord Demitrian, the strange, devout human in Silithus who knows how to free Thunderaan the Windseeker.",
  },

  greetings = {
    { id = "g_default", text = "Another wanderer in the Crystal Vale. The wind brought you, mortal, whether you know it or not." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Have you brought me the bindings, or only your questions again?" },
    { id = "g_vessel", when = { questActive = TODO_QUEST("Examine the Vessel") }, text = "The vessel of his rebirth! Bring it to me, mortal, and let me look upon it." },
    { id = "g_risen", when = { questDone = TODO_QUEST("Thunderaan the Windseeker") }, text = "I have seen him. I have seen him with my own eyes, and I will never again be the man I was." },
  },

  notice = {
    { id = "n_shaman", cat = "shaman", when = { class = "SHAMAN" },
      text = "A shaman. You hear the wind as I do, do you not? Then you know it has been weeping for a very long time." },
    { id = "n_bindings", cat = "bindings", when = { cleared = "Molten Core" },
      text = "You have walked in the Firelord's halls and come out alive. Then perhaps you are the one the wind has been promising me." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Highlord Demitrian, and I serve one who is older than existence. Thunderaan, Prince of Air, the Windseeker, lies imprisoned by the Firelord, his essence torn in two and bound away from the sky, and I have waited in this desert for the mortal who will set him free." },
        { id = "h_quest", when = { questActive = TODO_QUEST("Thunderaan the Windseeker") },
          text = "I have told you all that I know, mortal. It is you who must find the elementium, and it is you who must destroy the Firelord's corporeal form, and only then will the bindings answer to me." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Thunderaan the Windseeker"), days = 3 } },
          text = "Even in dreams I did not dare foresee that day. He rose, mortal, he rose and the sky answered him, and you struck him down and took his blade, and still I am grateful. Do you understand how strange that is?" },
        { id = "h_horde_ally", when = { faction = "Horde" },
          text = "Horde, Alliance, I see neither. The wind does not ask which banner you carry, and neither does the Windseeker, so let us speak as mortals speak to mortals." },
      },
      again = {
        { id = "h_again", text = "Ask, mortal. I have waited years; I can wait for your questions." },
        { id = "h_again2", text = "What else? The wind is listening, so choose your words." },
      },
      choices = {
        { text = "Who is Thunderaan?", next = "thunderaan" },
        { text = "What are you doing in a Twilight camp?", next = "camp" },
        { text = "What do you need to free him?", next = "need" },
        { text = "Why would you want an elemental lord freed?", next = "why" },
        { text = "I have the Bindings of the Windseeker.", next = "bindings", when = { cleared = "Molten Core" } },
        { text = "The spirits of air speak of him too.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "How did you first hear Thunderaan's voice?", next = "w9_voice" },
        { text = "I'll leave you to the wind.", next = "END" },
      },
    },

    w9_voice = {
      lines = {
        { id = "w9_voice_d", text = "In a storm over the Crystal Vale, mortal, when I was still a Highlord of the Twilight's Hammer and thought myself very wise. The lightning struck the stone beside me and I heard my name in the thunder, and every word the cult had taught me turned to ash in my mouth." },
        { id = "w9_voice_v1", when = { class = "SHAMAN" }, text = "You would understand it better than most, shaman. It came in a storm over the Crystal Vale, when I still wore the Hammer's robes, and the air itself spoke my name, and the cult's teachings fell away from me like dead skin." },
      },
      choices = {
        { text = "What did it cost you?", next = "w9_voice2" },
        { text = "A voice in a storm could be anything.", next = "w9_voice2" },
        { text = "Something else.", next = "BACK" },
      },
    },

    w9_voice2 = {
      lines = { { id = "w9_voice2_d", text = "Everything I had: my rank, my brothers in the cult, and any welcome among the sane. They would kill me now if they found me, and the Circle would not weep, but I have heard the wind speak, mortal, and I would not trade that for any title." } },
      choices = {
        { text = "Faith is worth whatever it costs.", next = "BACK", fx = { align = { light = 1 } }, reply = "You understand, then. Few do, and fewer still say so." },
        { text = "You traded one master for another.", next = "BACK", fx = { align = { light = -1 } }, reply = "Perhaps. But this master was a prince before your world had names." },
        { text = "Something else.", next = "BACK" },
      },
    },

    thunderaan = {
      lines = { { id = "th_default", text = "A prince of the air, who faced Titan and god alike in the age before history. Ragnaros the Firelord defeated him and tore his essence in two, and the halves were bound and given to the Firelord's servants as trophies, deep in the burning mountain." } },
      choices = {
        { text = "Why did Ragnaros fight him?", next = "thunderaan_war" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thunderaan_war = {
      lines = { { id = "tw_default", text = "Fire and air have always fought, mortal; each feeds on the other and each would rule it. The Firelord won that battle, and the sky has been poorer ever since, whatever the earth-bound may say." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    camp = {
      lines = { { id = "ca_default", text = "Waiting, among the ruins, as you see. The others here served the Hammer and its dark master, and they are gone now, scattered or dead, and I do not mourn them. I came for the wind, not for their doomsaying, and the wind kept me when they were swept away." } },
      choices = {
        { text = "You were one of the Twilight's Hammer?", next = "camp_hammer" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_hammer = {
      big = true,
      lines = { { id = "ch_default", text = "I wore their robes, once, because they promised me the elements, and I wanted to hear the sky speak. They lied, as such cults do, but the sky did speak to me, and so here I am, alone, with my faith and my patience. You may judge me if you like." } },
      choices = {
        { text = "A cultist is a cultist. I don't trust you.", next = "camp_judge", fx = { align = { light = 1 } } },
        { text = "Your past is yours. I care about results.", next = "camp_judge", fx = { align = { light = -1 } } },
        { text = "Why tell me this?", next = "camp_judge" },
      },
    },
    camp_judge = {
      lines = { { id = "cj_default", text = "Because you will help me or you will not, and a lie would not change your mind. The Windseeker does not need my honesty, but you do, mortal, so I give it freely." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "twilights_hammer" } } } },
    },

    need = {
      lines = {
        { id = "ne_default", text = "Both halves of the Bindings of the Windseeker, taken from the Firelord's lieutenants in the Molten Core. Ten bars of enchanted elementium, which you must find yourself. And the essence of the Firelord, which you will have only when Ragnaros's form is destroyed." },
        { id = "ne_vessel", when = { questDone = TODO_QUEST("Examine the Vessel") },
          text = "You have shown me the vessel, so you know the path. The bindings, the elementium, the essence of the Firelord, and then we will call him, together." },
      },
      choices = {
        { text = "That's a lot to ask of me.", next = "need_much" },
        { text = "Something else.", next = "BACK" },
      },
    },
    need_much = {
      lines = { { id = "nm_default", text = "It is everything, mortal, and it should be. A prince of the air is not freed for the price of a few herbs, and the one who frees him will carry his blessing in a blade the world has never seen." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },

    why = {
      lines = { { id = "wh_default", text = "Because a world with one elemental lord in chains and another sitting on a burning throne is not a world in balance. Free the Windseeker, and the Firelord loses his trophy, and perhaps the sky remembers who opened the door." } },
      choices = {
        { text = "And if Thunderaan turns on us?", next = "why_turn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_turn = {
      lines = { { id = "wt_default", text = "Then you will have to defeat him, and take his strength into your blade. Either way the Firelord loses, and either way you win, so I do not see why you hesitate." } },
      choices = { { text = "That's not as reassuring as you think.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },

    bindings = {
      lines = { { id = "bi_default", text = "Then you have walked where few mortals walk, and come back. Show me, and I will tell you what remains; you are closer now than anyone has been in an age of the world." } },
      choices = { { text = "What remains?", next = "need" } },
    },
    shaman = {
      lines = { { id = "sh_default", text = "Do they? Then they remember him, as I hoped. The spirits of air are scattered and frightened, shaman, because their prince is in chains, and when he is free you will hear them sing as they have not sung in ten thousand years." } },
      choices = {
        { text = "I'll listen for it.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know of the Windseeker, the Firelord, and the price of freedom." } },
    background = { { id = "tp_bg", text = "A man who once followed liars, and now follows only the wind.", next = "camp" } },
    twilights_hammer = { { id = "tp_th", text = "Liars and doomsayers. I wore their robes once. I wear them no longer in my heart." } },
    _none = { { id = "tp_none", text = "That is a thing of the earth, mortal. I listen only to the air." } },
  },
}
