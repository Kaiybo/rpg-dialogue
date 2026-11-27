-- Azshara folk with no conversation until now: three passengers of the sunken Horizon Scout, ashore at the
-- captain's camp: Alexandra Blazen (priestess), Patrick Mills (paladin) and Lindros (a close-mouthed mage).
local P = RPGDialogueAPI:Pack("rpgd.azshara")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Alexandra Blazen
---------------------------------------------------------------------------
P:NPC {
  key = "az_alexandra", id = TODO_NPC("Alexandra Blazen"), name = "Alexandra Blazen",
  role = "citizen", tier = "service", race = "Human",
  communities = { "ruined_reaches" }, temper = { "weary", "kind" }, values = { "healing", "faith" },
  impression = {
    first = "A priestess who has been mending sailors alone since the night the ship went down.",
    third = "{name} met Alexandra Blazen, a priestess who survived the wreck of the Horizon Scout on the Azshara coast.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Oh, it's you. Light bless you; your visits help more than you know. Sit, if you can find a dry spot." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Light be with you, I suppose. I'm very tired, and I'd like to rest." },
    { id = "g_default", text = "Light be with you. Forgive me if I don't stand; I haven't slept since the wreck." },
    { id = "g_healer", when = { class = { "PRIEST", "PALADIN", "SHAMAN", "DRUID" } }, text = "A healer! Oh, thank the Light. Two of the sailors still have fevers, and I'm nearly out of strength." },
    { id = "g_crew", when = { questDone = TODO_QUEST("A Crew Under Fire") }, text = "You held the beach for us when the naga came. I prayed for you that night, {name}, and I'll keep praying." },
  },
  start = "hello",
  nodes = {
    xsurvive = {
      narr = "She looks down at her hands; they are still raw from rope and salt.",
      lines = { { id = "xsurvive_default", text = "Patrick pulled me out of the water by my collar. I don't remember much after that, only the singing in the dark and the cold. I woke on the sand with a sailor's head in my lap, and I started praying." } },
      choices = {
        { text = "The Light will see the survivors home.", next = "BACK", reply = "I believe it will. I have to believe it, or I would not get up in the morning.", fx = { align = { light = 1 } } },
        { text = "Faith won't get you off this beach. Planning will.", next = "BACK", reply = "Perhaps, but faith is what gets me through the night. Please let me rest.", fx = { align = { light = -1 } } },
        { text = "The singing?", next = "xsing" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsing = {
      lines = { { id = "xsing_default", text = "The naga sing before they strike. Some of the sailors say it's how they call the waves. I only know I hear it in my sleep, and I wake with the Light already on my lips." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xlindros = {
      lines = { { id = "xlindros_default", text = "He is cold, and frightened, and he hides the fear under rudeness. The sailors want him gone. I think a stranded camp can't afford to cast anyone out. What would you have me do?" } },
      choices = {
        { text = "Keep him close. Mercy keeps a camp together.", next = "BACK", reply = "Thank you. I'll ask him to help with the fires.", fx = { align = { light = 1 } } },
        { text = "Watch him closely. He's hiding something dangerous.", next = "BACK", reply = "I'll watch him, then. Though I hate to.", fx = { align = { light = -1 } } },
      },
    },
    xlearn = {
      lines = { { id = "xlearn_default", text = "In the Cathedral of Light in Stormwind, under Bishop Farthing. I was a poor student of scripture and a good one of bandages, and he decided the Light could use both kinds." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpriest = {
      lines = { { id = "xpriest_default", text = "Oh, would you? The two by the rocks have fevers that won't break. Pray over them while I rest my eyes for an hour, and I'll owe you more than I can say." } },
      choices = { { text = "Rest. I'll see to them.", next = "BACK", reply = "Bless you. I'll be right here." } },
    },

    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Alexandra Blazen. I paid for passage on the Horizon Scout, and when the naga sank her, I found myself the only priestess on a beach full of drowned and wounded men." },
      },
      again = {
        { id = "h_again", text = "Is there anything else? I should check on the wounded soon." },
        { id = "h_again2", text = "Go on. I can spare a moment." },
      },
      choices = {
        { text = "How did you survive the wreck?", next = "xsurvive" },
        { text = "What do you make of Lindros?", next = "xlindros" },
        { text = "Where did you learn to heal?", next = "xlearn" },
        { text = "I'm a priest. Let me help with the wounded.", next = "xpriest", when = { class = "PRIEST" } },

        { text = "Why did you come to Azshara?", next = "why" },
        { text = "How are the wounded?", next = "wounded" },
        { text = "Rest, Alexandra. I'll keep watch.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "I'd rather not say, if you'll forgive me. Patrick and I had our reasons, and they hardly matter now that the ship is at the bottom of the sea." } },
      choices = {
        { text = "Everyone here keeps secrets. It makes me uneasy.", next = "why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why2 = {
      lines = { { id = "w2_default", text = "Lindros most of all, I know. But a secret isn't a sin, and I won't judge a man for keeping his own counsel when I'm keeping mine." } },
      choices = {
        { text = "Secrets on a stranded crew can get people killed.", next = "BACK", reply = "Perhaps. I'll speak to Patrick about it.", fx = { align = { order = 1 } } },
        { text = "Fair. A person's business is their own.", next = "BACK", reply = "Thank you. That's more grace than I expected.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wounded = {
      lines = { { id = "wo_default", text = "Most will live, if the fevers break. Some won't, and I'll bury them as gently as I can. The Light gives what it gives." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    patrick = { { id = "tp_xpatrick", text = "My oldest friend. He'd walk into the sea after me again, I think." } },
    horizon_scout = { { id = "tp_xhorizon", text = "Our ship. She's on the bottom now, with half our supplies and two good sailors." } },
  },
}

---------------------------------------------------------------------------
-- Patrick Mills
---------------------------------------------------------------------------
P:NPC {
  key = "az_patrick", id = TODO_NPC("Patrick Mills"), name = "Patrick Mills",
  role = "soldier", tier = "service", race = "Human",
  communities = { "ruined_reaches" }, temper = { "steady", "earnest" }, values = { "duty", "faith" },
  impression = {
    first = "A paladin standing guard over a camp of shipwrecked sailors.",
    third = "{name} met Patrick Mills, a paladin who survived the wreck of the Horizon Scout and now guards the captain's camp.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "You're a sight for sore eyes, friend. Sit down; the naga have been quiet, thanks to you." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Hold there. I know you, and I'd rather not. Say what you need, and then let me get back to the watch." },
    { id = "g_default", text = "Hold there. Ah, you're no naga. Forgive me, friend; we're all a little jumpy since the wreck." },
    { id = "g_pal", when = { class = "PALADIN" }, text = "A brother of the Light! Good. One more sword and one more prayer might be the difference out here." },
  },
  start = "hello",
  nodes = {
    ylife = {
      lines = { { id = "ylife_x", text = "Because of Alexandra. She took her vows at the Cathedral of Light in Stormwind, and I couldn't bear to be left behind. I wasn't brave like her, so I took up a hammer instead. The Light took me anyway, which still surprises me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yvoyage = {
      lines = { { id = "yvoyage_x", text = "We sailed from Stormwind on the Horizon Scout, the captain, twelve sailors, Alexandra, Lindros and me. The sea was calm until the last night. Then the singing started. I'll hear it the rest of my life." } },
      choices = {
        { text = "Standing by Alexandra is the bravest thing you've done.", next = "BACK", reply = "Maybe it is. It doesn't feel brave, it just feels like the only thing to do.", fx = { align = { honor = 1 } } },
        { text = "You should have stayed in Stormwind where it was safe.", next = "BACK", reply = "Probably. But then who would have pulled her out of the water?", fx = { align = { honor = -1 } } },
        { text = "What should be done about Lindros?", next = "ylindros" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylindros = {
      lines = { { id = "ylindros_x", text = "He knew where the ruins were, and he won't say why. The sailors want him tied up until he talks. Should I let them, or protect him?" } },
      choices = {
        { text = "Protect him. He's done nothing wrong yet.", next = "BACK", reply = "Aye. That's what the Light asks of me. I'll keep the sailors back.", fx = { align = { honor = 1 } } },
        { text = "Let them. Our lives depend on what he knows.", next = "BACK", reply = "Hm. Hard, but not wrong. I'll speak to him first, at least.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xalex = {
      narr = "His face softens for a moment before he looks back to the water.",
      lines = { { id = "xalex_default", text = "Since we were children in Goldshire. She was always braver than me, and smarter. When she said she was going to Azshara, I didn't ask why. I just packed my armor." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhold = {
      lines = { { id = "xhold_default", text = "A week, maybe two, if the naga don't come in force. The water's the problem, not the food. Ravencrest's old ruins have a spring, but getting there means crossing the beach." } },
      choices = {
        { text = "Should we risk the spring?", next = "xspring" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xspring = {
      lines = { { id = "xspring_default", text = "I'd go myself, but then who guards the camp? Some say send the strongest sailors; others say we wait for rain and keep everyone together. You've seen the beach. What would you do?" } },
      choices = {
        { text = "Send a party. Waiting won't bring water.", next = "BACK", reply = "Then I'll ask for volunteers tonight.", fx = { align = { honor = 1 } } },
        { text = "Keep everyone together. Splitting up invites slaughter.", next = "BACK", reply = "Wise, perhaps. I'll pray for rain.", fx = { align = { honor = -1 } } },
      },
    },
    xlindros = {
      lines = { { id = "xlindros_default", text = "I trust him to save himself. Beyond that, I don't know. He knew where the ruins were before the captain did, and he won't tell us how. That bothers me more than the naga." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpaladin = {
      lines = { { id = "xpaladin_default", text = "Gladly, brother or sister of the Hand. Take the north end of the beach, and if you hear singing, call out. The Light shines a little brighter when there are two of us holding it." } },
      choices = { { text = "I'll take the north end.", next = "BACK", reply = "Good. Light keep you." } },
    },

    hello = {
      lines = {
        { id = "h_default", key = true, text = "Patrick Mills, paladin, at your service. Alexandra and I came aboard the Horizon Scout together, and now I keep watch so she can tend the wounded without looking over her shoulder." },
        { id = "yh_dwarf", when = { race = "Dwarf" }, text = "A dwarf! Good, a strong arm and a steady head. We need both. Watch the waterline with me, if you've a moment." },
      },
      again = {
        { id = "h_again", text = "Anything else? I need to keep my eyes on the water." },
        { id = "h_again2", text = "Speak, friend. I'll listen and watch at once." },
      },
      choices = {
        { text = "How long have you known Alexandra?", next = "xalex" },
        { text = "How long can the camp hold?", next = "xhold" },
        { text = "Do you trust Lindros?", next = "xlindros" },
        { text = "I'm a paladin too. Stand watch with me.", next = "xpaladin", when = { class = "PALADIN" } },

        { text = "What happened to the ship?", next = "wreck" },
        { text = "What brought a paladin to Azshara?", next = "why" },
        { text = "Why did you become a paladin?", next = "ylife" },
        { text = "What happened on the voyage?", next = "yvoyage" },
        { text = "Farewell, Patrick.", next = "END" },
      },
    },
    wreck = {
      lines = { { id = "wr_default", text = "Naga, singing in the dark, and then the hull split open. The captain got most of us ashore, but the naga still come up the beach at night to see who's left." } },
      choices = {
        { text = "Then we strike them before they strike again.", next = "BACK", reply = "Spoken like a soldier. I'll follow your lead, if you'll go.", fx = { align = { honor = 1 } } },
        { text = "Better to hold the camp and wait for rescue.", next = "BACK", reply = "That's my thinking too. Our first duty is to the living.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "wy_default", text = "Duty, of a sort, and I'll leave it at that. I'll tell you this much: Lindros knew more about where we were going than any of us did." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    horizon_scout = { { id = "ytp_hs", text = "The Horizon Scout was a good ship. She's at the bottom of the bay now." } },
    goldshire = { { id = "ytp_gs", text = "Goldshire's where I grew up. Alexandra and I used to fish in the river there." } },
    alexandra = { { id = "tp_xalex", text = "She'll heal everyone but herself. Make her rest, if you can." } },
    naga = { { id = "tp_xnaga", text = "They come with the tide. Keep your back to the trees and your eyes on the water." } },
  },
}

---------------------------------------------------------------------------
-- Lindros
---------------------------------------------------------------------------
P:NPC {
  key = "az_lindros", id = TODO_NPC("Lindros"), name = "Lindros",
  role = "citizen", tier = "service", race = "Human",
  communities = { "ruined_reaches" }, temper = { "cold", "guarded" }, values = { "knowledge", "privacy" },
  impression = {
    first = "A mage who survived the wreck and will not say why he came.",
    third = "{name} met Lindros, the tight-lipped mage who survived the wreck of the Horizon Scout.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Oh, it's you. Fine, come in. You're the only one here with sense enough to talk to." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "You. If you're here about the trunk, it's still at the bottom of the sea. Go away." },
    { id = "g_default", text = "Yes? If you're here to ask about my trunk, it's at the bottom of the sea, and good riddance." },
    { id = "g_mage", when = { class = "MAGE" }, text = "Ah, a mage. Perhaps you, at least, won't ask me foolish questions." },
  },
  start = "hello",
  nodes = {
    ysent = {
      lines = { { id = "ysent_x", text = "No one sends me. A patron in Stormwind paid for the voyage, and I agreed to bring back anything of interest. He wants Highborne relics. I want to understand them. Those are different things." } },
      choices = {
        { text = "The Highborne relics belong in a museum, not a private collection.", next = "BACK", reply = "How quaint. My patron would laugh, but I suppose I don't entirely disagree.", fx = { align = { honor = 1 } } },
        { text = "Relics go to whoever pays the most. That's the trade.", next = "BACK", reply = "At last, someone honest about it. Not that it makes me like you any better.", fx = { align = { honor = -1 } } },
        { text = "And if he wants something dangerous?", next = "ydanger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ydanger = {
      lines = { { id = "ydanger_x", text = "Then I'll decide when I find it. Some would say knowledge should belong to whoever pays. Others would say it should go to the Kirin Tor, or be buried. Which do you think?" } },
      choices = {
        { text = "Give it to the Kirin Tor. They'll keep it safe.", next = "BACK", reply = "They'll lock it in a vault and argue about it for a century. Still, it's a sensible answer.", fx = { align = { order = 1 } } },
        { text = "Keep it yourself. You found it.", next = "BACK", reply = "Now that is the answer I'd give, if anyone asked me honestly.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ypatrick = {
      lines = { { id = "ypatrick_x", text = "Patrick is a good man. That's the trouble. Good men ask too many questions about other people's business, and they always think they're entitled to the answers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xstudy = {
      narr = "He straightens his salt-stained robe with a flick of irritation.",
      lines = { { id = "xstudy_default", text = "Dalaran, before the Scourge made the Kirin Tor so very careful. I studied the theory of ancient magic, which is to say I studied what the elves wrote about their ancestors and then disagreed with them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xwreck = {
      lines = { { id = "xwreck_default", text = "A small ward of air, held beneath the water for longer than I'd like to admit. I could have saved the trunk instead of myself. I chose myself, which tells you what I value." } },
      choices = {
        { text = "What was in the trunk?", next = "xtrunk" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtrunk = {
      lines = { { id = "xtrunk_default", text = "Notes. Maps of ruins. A few instruments of my own design. Nothing anyone here would understand, and nothing they'd thank me for recovering. Leave it at that." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xnaga = {
      lines = { { id = "xnaga_default", text = "That they were Highborne once, the Queen's own court, and the sea changed them. Their sorceresses still wield magic I'd give my right hand to study. Patrick thinks that's madness. Is it?" } },
      choices = {
        { text = "Some knowledge isn't worth the hand.", next = "BACK", reply = "Spoken like a paladin. How dull.", fx = { align = { order = 1 } } },
        { text = "No. Understanding them may be our best defense.", next = "BACK", reply = "Finally, a mind that isn't asleep.", fx = { align = { order = -1 } } },
      },
    },
    xmage = {
      lines = { { id = "xmage_default", text = "The Highborne shaped the arcane before humans had words for it. Their ruins are libraries carved in stone. To a mage, walking past one is like walking past a book you're forbidden to open." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    hello = {
      lines = {
        { id = "h_default", key = true, text = "My name is Lindros. I had business in Azshara, and the naga have delayed it considerably. That is all anyone in this camp needs to know." },
        { id = "yh_human", when = { race = "Human" }, text = "Another human. If you're from Stormwind, tell no one there you saw me. If you're from Dalaran, tell them even less." },
      },
      again = {
        { id = "h_again", text = "Is there more? Be brief." },
        { id = "h_again2", text = "You're persistent. Go on." },
      },
      choices = {
        { text = "Where did you study magic?", next = "xstudy" },
        { text = "How did you survive the wreck?", next = "xwreck" },
        { text = "What do you know of the naga?", next = "xnaga" },
        { text = "Fellow mage, what draws you to these ruins?", next = "xmage", when = { class = "MAGE" } },

        { text = "What business does a mage have in Azshara?", next = "business" },
        { text = "The others don't trust you, you know.", next = "trust" },
        { text = "Who sent you here, really?", next = "ysent" },
        { text = "Why don't you trust Patrick?", next = "ypatrick" },
        { text = "Fine. Keep your secrets.", next = "END" },
      },
    },
    business = {
      lines = { { id = "bu_default", text = "Azshara is littered with the ruins of the Highborne, the greatest arcanists this world has known. Any mage worth the name would want to see them, wouldn't you agree?" } },
      choices = {
        { text = "Knowledge is worth the risk.", next = "BACK", reply = "Finally, someone sensible.", fx = { align = { light = -1 } } },
        { text = "The Highborne's magic destroyed the world. Leave it buried.", next = "BACK", reply = "Spoken like someone who has never read a page of it.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trust = {
      lines = { { id = "tr_default", text = "I know, and I do not care. I paid my fare like everyone else. If they need someone to blame for the wreck, they should look at the naga, not at me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    stormwind = { { id = "ytp_sw", text = "My patron lives in Stormwind. I'll say no more about him." } },
    ruins = { { id = "ytp_ruins", text = "The ruins of Azshara hold more secrets than the whole of Dalaran's library." } },
    highborne = { { id = "tp_xhighborne", text = "The masters of the arcane. Arrogant, yes, but magnificent in their arrogance." } },
    dalaran = { { id = "tp_xdalaran", text = "My alma mater. The Kirin Tor would not approve of this trip, so I didn't ask them." } },
  },
}

---------------------------------------------------------------------------
-- Elder Skygleam: a kaldorei elder honoured at the Lunar Festival, among Azshara's ruins.
---------------------------------------------------------------------------
P:NPC {
  key = "az_elder_skygleam", id = 15600, name = "Elder Skygleam", gender = "male",
  role = "questgiver", tier = "quest",
  temper = { "calm" }, values = { "tradition", "memory" },
  notices = { "race", "faction" },
  impression = {
    first = "An ancient night elf stands among the fallen pillars near the Ravencrest Monument, his gaze fixed on the stars. The ruins around him seem to hold their breath.",
    third = "{name} paid respects to Elder Skygleam of the Lunar Festival.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. You have travelled far to find an old elf among old stones, and I thank you for it." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The Lunar Festival has come round again, and the ancestors are near tonight. I am glad you came to honor them." },
    { id = "g_back", when = { metBefore = true }, text = "The stars bring you back to me. Come, look up with me a while." },
  },
  start = "hello",
  nodes = {
    ylife = {
      lines = { { id = "ylife_x", text = "A star-reader in the temple of Elune at Eldarath. I mapped the heavens for the priestesses and warned them of omens. On the last night, the stars went wrong, and no one listened. Then the sea came in." } },
      choices = {
        { text = "What did the stars show?", next = "ystars" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ystars = {
      lines = { { id = "ystars_x", text = "A green light at the heart of the sky, where none should be. I told the High Priestess, and she told the court, and the court laughed. Should I have defied the court, or kept to my place?" } },
      choices = {
        { text = "Defied them. Truth matters more than rank.", next = "BACK", reply = "Perhaps. I have had ten thousand years to wish I had.", fx = { align = { order = -1 } } },
        { text = "Kept your place. You did what you could.", next = "BACK", reply = "That is a kind answer, child, and a sad one.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yhighborne = {
      lines = { { id = "yhighborne_x", text = "I knew them, as a lamplighter knows the lords he lights the way for. Proud, beautiful and cold. Some of them still walk these ruins as ghosts, still proud, still certain they were right." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Skygleam, and in this season the people honour the elders who carry their memories. I carry a great many of them, and some are heavier than others." },
        { id = "h_q", when = { questActive = TODO_QUEST("Skygleam the Elder") }, text = "You have come to honour the elders, and your journey has been seen. Take this coin of ancestry, and carry the past gently." },
        { id = "h_ne", when = { race = "NightElf" }, text = "A child of the kaldorei, come to these ruins. Do you feel it, little one, the weight of what was lost here?" },
        { id = "yh_tauren", when = { race = "Tauren" }, text = "A child of the Earth Mother, come to honour an old elf. Your people and mine share the druids' craft, and so we share the moon tonight. I am Skygleam." },
      },
      again = {
        { id = "h_again", text = "The stars are patient. What else would you ask?" },
        { id = "h_again2", text = "Speak, child. The night is long." },
      },
      choices = {
        { text = "Why stand here, among these ruins?", next = "ruins" },
        { text = "What does the festival mean to you?", next = "festival" },
        { text = "You watch the stars very closely.", next = "stars" },
        { text = "Are these the ruins of Queen Azshara's realm?", next = "queen", when = { race = "NightElf" } },
        { text = "Who were you in the old empire?", next = "ylife" },
        { text = "Did you know the Highborne?", next = "yhighborne" },
        { text = "Elune-adore, Elder.", next = "END" },
      },
    },
    ruins = {
      lines = { { id = "r_default", text = "Because these stones were once a city, and I walked its streets when I was young. Most who come to Azshara see only ruins and satyrs, but I still see the lanterns." } },
      choices = {
        { text = "What happened to it?", next = "happened" },
        { text = "Something else.", next = "BACK" },
      },
    },
    happened = {
      lines = { { id = "h2_default", text = "The Highborne's pride called the Burning Legion into the world, and the Well of Eternity tore itself apart. The sea took the heart of our empire, and what remains is what you see." } },
      choices = {
        { text = "Pride like that must never return.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Their ambition built wonders, though.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    festival = {
      lines = { { id = "f_default", text = "It is the one night when the living and the remembered sit together. The druids light the sky at Moonglade, and the elders tell the young what the young have forgotten." } },
      choices = { { text = "Then tell me something I've forgotten.", next = "BACK", fx = { affinity = 1 } } },
    },
    stars = {
      lines = { { id = "s_default", text = "Elune's light is in every star, and I have counted them for more years than I can number. I find the counting comforting, though I always lose my place." } },
      choices = { { text = "That's a lovely way to pass the night.", next = "BACK" } },
    },
    queen = {
      lines = { { id = "q_default", text = "They are, and her name still sits on this land like a curse. We do not speak it lightly, child, and you would do well not to either." } },
      choices = { { text = "I'll remember.", next = "BACK" } },
    },
  },
  topics = {
    eldarath = { { id = "ytp_eld", text = "Eldarath was a city of white towers by the sea. Now the sea has it." } },
    elune = { { id = "ytp_elune", text = "Elune's light falls on Azshara still. It is gentler than the light of the old court." } },
    _none = { { id = "tp_none", text = "That is not among my memories. Ask the druids of Moonglade, child." } },
  },
}

---------------------------------------------------------------------------
-- Xiggs Fuselighter: Ironforge pilot whose flying machine sets down at a helipad in Azshara.
---------------------------------------------------------------------------
P:NPC {
  key = "az_xiggs_fuselighter", id = 8517, name = "Xiggs Fuselighter", gender = "male",
  role = "questgiver", tier = "quest",
  communities = { "ironforge" }, temper = { "gruff" }, values = { "craft", "duty" },
  impression = {
    first = "A dwarf in goggles and a scorched flying cap stands beside a battered gyrocopter, tightening bolts with the tender care other dwarves keep for their beards.",
    third = "{name} met Xiggs Fuselighter, a dwarven pilot of Ironforge who flies into Azshara.",
  },
  greetings = {
    { id = "g_default", text = "Mind the rotor, friend! She stops slow, and she's not fussy about what she chops." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? She's still in one piece, and so am I. Mostly." },
  },
  start = "hello",
  nodes = {
    ylearn = {
      lines = { { id = "ylearn_x", text = "A gnome in Gnomeregan taught me, before the city fell. He crashed three times teaching me and laughed every time. I named the gyrocopter after him. She's called Fizzle. Don't laugh." } },
      choices = {
        { text = "What happened to your teacher?", next = "yteacher" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yteacher = {
      lines = { { id = "yteacher_x", text = "He stayed behind when Gnomeregan was flooded with radiation, trying to shut the valves. Nobody's seen him since. I'd go and look, if the troggs weren't so thick. Should I risk it, or stay with my job?" } },
      choices = {
        { text = "Go. A friend is worth the risk.", next = "BACK", reply = "Aye. That's what I keep tellin' myself. One day, lad. One day.", fx = { align = { order = -1 } } },
        { text = "Stay. The Explorers' League needs you here.", next = "BACK", reply = "Aye, that's the sensible answer. I'll keep flyin'.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ydanger = {
      lines = { { id = "ydanger_x", text = "A blue dragon, sleeping on the cliffs past the ruins, bigger than Fizzle and the rest of Ironforge put together. I flew right over him. He opened one eye. I've never climbed so fast in my life." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Xiggs Fuselighter, pilot out of Ironforge. I fly where the King's men can't walk, and Azshara has more such places than I'd like." },
        { id = "h_q", when = { questActive = TODO_QUEST("Xiggs Fuselighter") }, text = "You're the one I was told to expect, then. Good. Let's see what you've brought me, and quick, before the satyrs hear my engine cool." },
        { id = "yh_gnome", when = { race = "Gnome" }, text = "A gnome! Come look at my rotor coupling, would you? I swear she rattles at altitude and I can't find why." },
        { id = "yh_hunter", when = { class = "HUNTER" }, text = "A hunter! Keep that pet clear of Fizzle's rotor, would you? Last wolf that sniffed her lost the tip of its tail, and it's never forgiven me." },
      },
      again = { { id = "h_again", text = "Anything else? I've a long flight home." } },
      choices = {
        { text = "What brings a dwarf pilot this far?", next = "why" },
        { text = "Is flying that thing safe?", next = "safe" },
        { text = "You keep glancing at the trees, Xiggs.", next = "satyrs" },
        { text = "A fellow son of Khaz Modan! How fares the mountain?", next = "kin", when = { race = "Dwarf" } },
        { text = "How did you learn to fly?", next = "ylearn" },
        { text = "What's the most dangerous thing you've seen here?", next = "ydanger" },
        { text = "Safe flight, Xiggs.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Old ruins, old magic, and folk in Ironforge who want to know what's buried here before somebody else digs it up. Azshara was a kingdom once, and kingdoms leave a great deal behind." } },
      choices = {
        { text = "Better the Alliance study it than leave it to rot.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Some ruins should be left buried.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What exactly are they hoping to find?", next = "find" },
        { text = "Something else.", next = "BACK" },
      },
    },
    find = {
      lines = { { id = "fi_default", text = "Highborne writings, mostly, and anything that still hums with the old magic. The Explorers' League wants it catalogued, and the mages in Stormwind want it locked away, so I fly the maps and let them argue." } },
      choices = {
        { text = "Who draws the maps, then?", next = "maps" },
        { text = "Something else, Xiggs.", next = "BACK" },
      },
    },
    maps = {
      lines = { { id = "ma_default", text = "I do, from the air, with a pencil in my teeth and one hand on the stick. Half the coast's not on any chart in Ironforge yet, and the half that is, I drew wrong the first time." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    satyrs = {
      lines = { { id = "sa_default", text = "Aye, and with good reason. The satyrs and the Highborne ghosts in those woods don't care for engines, and the blue dragons over the cliffs care for them even less. I land quick and leave quicker." } },
      choices = {
        { text = "Dragons? Should I worry?", next = "dragons" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dragons = {
      lines = { { id = "dr_default", text = "Only if you go poking about their shore, east past the ruins. They've never come after me, but I've seen one take a wyvern clean out of the sky, and I'd rather not learn how they feel about gyrocopters." } },
      choices = { { text = "I'll keep my distance. Something else.", next = "BACK" } },
    },
    kin = {
      lines = { { id = "ki_default", text = "Ha! Loud and smoky as ever, lad, and the Thunder Brew still flows. I miss the forges something fierce out here, but don't tell anyone I said so." } },
      choices = { { text = "Your secret's safe. Something else.", next = "BACK" } },
    },
    safe = {
      lines = { { id = "s_default", text = "Safer than walking through Azshara, lad, I'll promise you that much. The worst I've had is a fire in the engine and a soft landing in a lake." } },
      choices = { { text = "That's not as reassuring as you think.", next = "BACK" } },
    },
  },
  topics = {
    gyrocopters = { { id = "ytp_gyro", text = "Gyrocopters are the finest invention ever, after beer." } },
    explorers_league = { { id = "ytp_el", text = "The Explorers' League pays me to fly and look. Best job in the world, mostly." } },
    _none = { { id = "tp_none", text = "Can't help you there. Ask me about engines, or ask someone else." } },
  },
}
