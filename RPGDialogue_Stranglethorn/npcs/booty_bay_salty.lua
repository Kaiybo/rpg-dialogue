-- Booty Bay, the Salty Sailor and its regulars: Catelyn the Blade (Ansirem's daughter, Blackwater Raiders),
-- Deeg (a dwarf Raider and his snuff), Dizzy One-Eye (a lookout without eyes), Sly Garrett (Shady Goods),
-- Pix Xizzix (Undermine Trader). Voice: bibles/booty_bay_salty.md
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Catelyn the Blade: an archmage's daughter who traded the Violet Citadel for a pirate's sash.
-- Classic chain: Ansirem's Key (ends here), "Pretty Boy" Duncan, The Curse of the Tides.
P:NPC {
  key = "catelyn", id = TODO_NPC("Catelyn the Blade"), name = "Catelyn the Blade", title = "Blackwater Raiders",
  bible = "bibles/booty_bay_salty.md", role = "questgiver", tier = "quest",
  communities = { "booty_bay", "blackwater" }, temper = { "sharp", "wry" }, values = { "proud", "free" },
  notices = { "class", "weapon" },

  impression = {
    first = "Catelyn the Blade lounges in the Salty Sailor with her boots on the table and an empty sheath at her hip. She talks like a pirate until she forgets to, and then she sounds like somebody who grew up among books.",
    third = "{name} met Catelyn the Blade, a Blackwater Raider in the Salty Sailor who was born a Dalaran archmage's daughter and chose the sea instead.",
  },

  greetings = {
    { id = "g_op_pirates", when = { gossip = { topic = "pirates", stance = "hate" } }, text = "Fleet Master Seahorn says you told him pirates are pirates, code or no code. He laughed it off, but he's been very quiet at the rail since, so I hope you meant it." },
    { id = "g_tavern", text = "Pull up a stool if you're staying, and mind the third one, because it bites." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Sit down, then, and tell me something more interesting than the tide tables." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away} and back in one piece, which is better than most who leave this tavern on business. Sit, and tell me where you've been." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde colors in the Salty Sailor, and nobody's thrown a chair yet. The night's young, so sit down before somebody does." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "You came in along the wall like one of Ian Strom's rogues. Sit where I can see your hands, and I'll do you the same courtesy." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "You smell of the Violet Citadel, or of somewhere very like it, all candle wax and ozone. I'd know that smell in a hurricane, because I grew up breathing it." },
    { id = "n_dagger", cat = "weapon", when = { class = "ROGUE" },
      text = "That's a fine pair of knives you're wearing, and you keep the left one looser than the right. Clever, so long as nobody in here notices but me." },
  },

  react = {
    { id = "r_stealth", on = "stealth", text = "Go on and vanish, then, but you're standing on the board Skindle never nailed down, and it squeaks." },
  },

  start = "hello",
  nodes = {
    op_kirintor = {
      lines = {
        { id = "opk_default", text = "My father thinks the Kirin Tor are the last sane people in Lordaeron, sitting under their dome and calling it wisdom. I've my own view, but you look like you've got one too, so go on: are they wise, or only frightened?" },
      },
      choices = {
        { text = "Wise. Somebody has to guard that much power.", next = "op_kt_trust", fx = { affinity = -1, align = { order = 1 }, opinion = { kirin_tor = "trust" } } },
        { text = "Frightened old men under a glass bowl.", next = "op_kt_contempt", fx = { affinity = 1, align = { order = -1 }, trait = { witty = 1 }, opinion = { kirin_tor = "contempt" } } },
        { text = "I've read their books. They're both, and they know it.", next = "op_kt_mixed", fx = { affinity = 1, opinion = { kirin_tor = "mixed" } }, when = { class = "MAGE" } },
        { text = "Dalaran burned once already. I'd hide too.", next = "op_kt_pity", fx = { trait = { kind = 1 }, opinion = { kirin_tor = "pity" } } },
        { text = "That's between you and your father.", next = "BACK" },
      },
    },
    op_kt_trust = {
      lines = {
        { id = "opkt_default", text = "You sound exactly like him, and I mean that as gently as I can. Power's safest in a lot of hands, if you ask me, and the Kirin Tor have only ever trusted their own." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_kt_contempt = {
      lines = {
        { id = "opkc_default", text = "Ha! I'm stealing that, and if it ever reaches Dalaran, I'll swear I heard it from a sailor. Which, I suppose, I did." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_kt_mixed = {
      lines = {
        { id = "opkm_default", text = "Both, and they know it, and they'd rather die than say so. You'd have done well under the dome, I think, and I hope you never have to." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_kt_pity = {
      lines = {
        { id = "opkp_default", text = "Hm. I hadn't thought of it as fear for the city, only fear for themselves. Don't tell my father you made me think kindly of him; he'd be unbearable." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Catelyn, and the Blade part was earned, whatever the sailors tell you about it. I sail with the Blackwater Raiders, I drink in the Salty Sailor, and I don't talk about my family before the second cup." },
        { id = "h_key", tags = { "news" }, when = { questActive = TODO_QUEST("Ansirem's Key") },
          text = "You've come from my father, haven't you? Only Dalaran ink smells like that, and only Ansirem Runeweaver would send a stranger halfway across the world to ask me about a knife." },
        { id = "h_duncan", tags = { "news" }, when = { questActive = TODO_QUEST("\"Pretty Boy\" Duncan") },
          text = "Duncan, the Bloodsail rat who took my knife, has his camp down on the Southern Savage Coast, and he'll be wearing it as if he won it fairly. Bring it back to me, and if his pretty face gets a scratch on the way, I won't weep." },
        { id = "h_tides", tags = { "news" }, when = { questActive = TODO_QUEST("The Curse of the Tides") },
          text = "That knife at your belt is on loan, remember, and I want it back once the troll altar in the Vile Reef is rubble. The reef is cold and deep, so go in with a full breath and bring my knife back out with you." },
        { id = "h_tides_done", when = { questDone = TODO_QUEST("The Curse of the Tides") },
          text = "You broke the curse on the Stone of the Tides, and now the Baron keeps the stone on a shelf, and he's been admiring my knife beside it as though it came with the set. You did good work in the reef, friend, so I'll only half blame you for that." },
        { id = "h_duncan_done", when = { questDone = TODO_QUEST("\"Pretty Boy\" Duncan") },
          text = "You're the one who took my blade back off Duncan. I owe you a drink for that, and I keep a ledger of my debts like any good Booty Bay girl." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "A mage in a pirate tavern! Don't tell me you studied in Dalaran, or I'll have to ask whether you knew my father, and then we'll both be embarrassed." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "One of the quiet trade, and a decent one by the look of your boots. Ian Strom, who trains the rogues here, says the good ones always find my table eventually, and I'm starting to believe him." },
        { id = "h_human", when = { race = "Human" },
          text = "A northern face, by the look of you, and you're staring at me as if you've seen my father's portrait somewhere. You haven't, and if you have, please don't tell me where it hangs." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Horde, are you? The Blackwater fight the Bloodsail, not the Warchief, so you'll get no quarrel from me while you're inside these walls." },
        { id = "h_seen", when = { metBefore = true },
          text = "Back for more of my stories, or did you only come in out of the rain? Either way, Skindle's rum is the same poison it was yesterday." },
      },
      again = {
        { id = "h_again", text = "What else, then? I've a whole cup left, and it's poor company." },
        { id = "h_again2", text = "Go on. Ask me something I'll regret answering." },
        { id = "h_again3", text = "More questions? You'd have made a fine apprentice in my father's tower." },
      },
      choices = {
        { text = "Why do they call you the Blade?", next = "blade" },
        { text = "Who are you, before the second cup?", next = "family" },
        { text = "Life with the Blackwater Raiders must be a hard one.", next = "raiders" },
        { text = "Do you have enemies among the Bloodsail?", next = "duncan" },
        { text = "Who else drinks in the Salty Sailor?", next = "regulars" },
        { text = "What does a rogue need to know about the Bay?", next = "rogue", when = { class = "ROGUE" } },
        { text = "Have you heard of a house in the Alterac hills?", next = "ravenholdt", when = { class = "ROGUE", minLevel = 24 } },
        { text = "Your father is Ansirem Runeweaver? Of the Kirin Tor?", next = "xmage", when = { class = "MAGE" } },
        { text = "Pirates and paladins don't often share a table.", next = "xpala", when = { class = "PALADIN" } },
        { text = "I'll leave you to your cup.", next = "END" },
      },
    },

    blade = {
      lines = {
        { id = "bl_default", text = "Because of the knife I carry, which is old troll work my father dug out of some ruin and gave me on the day I left home. The sailors think I named myself after it, but the Blackwater named me, after I put it through a Bloodsail's hand on my first boarding." },
        { id = "bl_lost", when = { ["not"] = { questDone = TODO_QUEST("\"Pretty Boy\" Duncan") } },
          text = "Because of a knife I don't currently have, which is a sore point you've walked straight onto. It's old troll work my father gave me, and a Bloodsail rat called Duncan took it off me in a fair fight, or near enough to fair that I can't complain to the Baron." },
      },
      choices = {
        { text = "How did you lose a knife fight?", next = "blade_lost" },
        { text = "A troll dagger seems an odd thing for your father to own.", next = "blade_troll" },
        { text = "Something else.", next = "BACK" },
      },
    },
    blade_lost = {
      lines = { { id = "bll_default", text = "By trusting a man with a lovely smile and a red sash he kept in his pocket instead of on his waist. He was quicker than I gave him credit for and I was drunker than I'd admit, and that's the whole sad tale." } },
      choices = {
        { text = "A thief who smiles is still a thief. He'll answer for it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Every blade's fair game. You'll win it back the same way.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    blade_troll = {
      lines = { { id = "blt_default", text = "Archmages collect everything, and my father hoards worse than a magpie, mostly things he shouldn't touch. He told me the blade was made to break troll magic, and that it would keep me safer than any spell he could teach me, which was his way of admitting I'd never sit still long enough to learn one." } },
      choices = {
        { text = "Then the troll ruins along this coast should fear you.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "He gave you the blade because he loves you.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },

    family = {
      lines = {
        { id = "fm_default", text = "Fine, since you asked so nicely. My father is Ansirem Runeweaver, archmage of Dalaran and one of the Six who sit over the Kirin Tor, and I was meant to spend my life copying his notes in a tower that smells of candle wax." },
        { id = "fm_key", when = { questActive = TODO_QUEST("Ansirem's Key") },
          text = "You know already, since you carried his letter here. Ansirem Runeweaver, archmage of Dalaran, one of the Six, and the only man alive who still writes to me as though I were twelve." },
      },
      choices = {
        { text = "Why did you leave Dalaran?", next = "family_left" },
        { text = "Do you ever write back to him?", next = "family_write" },
        { text = "Something else.", next = "BACK" },
      },
    },
    family_left = {
      lines = { { id = "fl_default", text = "Because the city drew a violet dome over itself to keep Alterac's troubles out, and I found I'd rather face the troubles than live under glass. The sea has no walls and no curfews, and it's never once asked me to recite the schools of magic in order." } },
      choices = {
        { text = "What do you make of the Kirin Tor, then?", next = "op_kirintor" },
        { text = "A daughter's place is with her family and her duty.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You chose your own course. That's worth any title.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    family_write = {
      lines = { { id = "fw_default", text = "Once a year, on his name day, and I tell him the weather and nothing else. He sends back three pages of advice and a fourth asking whether I've met a nice young wizard, and I keep every letter in a box under my bunk." } },
      choices = {
        { text = "You miss him more than you'll say.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Tell him about the pirates. He'd enjoy it.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },

    raiders = {
      hub = true,
      lines = { { id = "rd_default", text = "It's a living, and a better one than most, because the Baron pays us to sink the Bloodsail and then pays again for whatever we drag out of their holds. What do you want to know: the fleet, the enemy, or the Fleet Master himself?" } },
      again = {
        { id = "rd_again", text = "More about the fleet? Ask away, but the secret ones I'll keep." },
        { id = "rd_again2", text = "Go on. Sailors love talking about their ships more than their sweethearts." },
      },
      choices = {
        { text = "How did you come to join the Raiders?", next = "r_join" },
        { text = "What's the quarrel with the Bloodsail?", next = "r_bloodsail" },
        { text = "Seahorn seems a good sort of captain.", next = "r_seahorn" },
        { text = "Do the Raiders take on new hands?", next = "r_hire" },
        { text = "That's enough about ships.", next = "hello" },
      },
    },
    r_join = {
      lines = { { id = "rj_default", text = "I took passage south on a merchantman out of Menethil, and the Bloodsail boarded her off the Savage Coast. The Blackwater boarded the Bloodsail an hour later, and by the end of the afternoon I'd stabbed enough of the right people that Seahorn offered me a berth instead of a bill." } },
      choices = {
        { text = "So you're a pirate by accident.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Did you ever go back for the merchant crew?", next = "r_join_crew" },
      },
    },
    r_join_crew = {
      lines = { { id = "rjc_default", text = "The Baron ruled them salvage and billed them for their own rescue, which is how things are done here. I paid off the cook's fee myself, though, because he made the only decent biscuit south of Westfall." } },
      choices = {
        { text = "Billing rescued sailors is plain robbery.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Rescue costs ships and blood. Somebody has to pay.", next = "BACK", fx = { align = { honor = -1 }, learn = { "steamwheedle" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    r_bloodsail = {
      lines = { { id = "rb_default", text = "They want the Bay, and the Baron wants to keep it, and we're the reason they haven't got it. The Bloodsail would burn this town down to the pilings to own the ashes, which is the difference between them and us, since we'd at least sell the ashes back to you." } },
      choices = {
        { text = "Then I'll help you sink every red sail on the coast.", next = "BACK", fx = { affinity = 1, learn = { "bloodsail" }, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    r_seahorn = {
      lines = { { id = "rs_default", text = "Loud, generous and much cleverer than he lets on, because a tauren who laughs that hard makes people forget he's counting. He runs the fleet from the top floor of this tavern, and if you hear the ceiling shake, that's him walking to the window." } },
      choices = {
        { text = "I'll go up and pay my respects.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    r_hire = {
      lines = {
        { id = "rh_default", text = "We take anyone who can hold a line, swim a little and keep quiet about where the prize ships anchor. Talk to Seahorn if you're serious, but bring your own boots, because dead men's boots never fit and we don't hand out new ones." },
        { id = "rh_horde", when = { faction = "Horde" }, text = "We take anyone who can hold a line, Horde or Alliance, since the sea drowns you both at the same rate. Talk to Seahorn if you're serious, and bring your own boots, because dead men's boots never fit." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "I'd rather keep my feet on dry land.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },

    duncan = {
      lines = {
        { id = "dn_default", text = "Duncan is the handsomest liar on the Savage Coast and a Bloodsail to his bones, though he hid it well for a whole season. He has a camp down south among the red sails now, and my knife is in it." },
        { id = "dn_done", when = { questDone = TODO_QUEST("\"Pretty Boy\" Duncan") },
          text = "Duncan won't be wearing my knife again, thanks to you, and I hear he's taken to telling the Bloodsail he gave it back out of kindness. He was always better at stories than at fighting, and I liked him for it, more fool me." },
      },
      choices = {
        { text = "You liked him?", next = "duncan_liked" },
        { text = "I could fetch the knife back for you.", next = "duncan_help", when = { ["not"] = { questDone = TODO_QUEST("\"Pretty Boy\" Duncan") } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    duncan_liked = {
      lines = { { id = "dl_default", text = "For a while, the way you like a storm from a dry window. Then I found the red sash in his pocket, and it turned out the window was open the whole time and I was soaked through." } },
      choices = {
        { text = "Love's no excuse for treachery. He chose his colors.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Maybe he'd have left the Bloodsail for you.", next = "BACK", fx = { align = { order = -1 }, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    duncan_help = {
      lines = {
        { id = "dh_default", text = "That's kind, but the knife is family business, and I only hand family business to people my father sends me. If he ever does, I'll know you by the smell of Dalaran ink." },
        { id = "dh_key", when = { questActive = TODO_QUEST("Ansirem's Key") }, text = "Father's sent you for it, hasn't he, so I suppose you'll be fetching it whether I like it or not. Hand me his letter and I'll tell you where Duncan sleeps." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "I'll keep my nose open for ink, then.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },

    regulars = {
      lines = { { id = "rg_default", text = "Deeg's at the bar complaining about his snuff, Dizzy's at the window looking for a ship he can't see, and Ian Strom, the rogue trainer, is in the corner pretending not to watch any of us. Sly Garrett sells poison by the stairs, and he's the only honest crook I know." } },
      choices = {
        { text = "Why can't Dizzy see the ships?", next = "regulars_dizzy" },
        { text = "An honest crook? Garrett?", next = "regulars_garrett" },
        { text = "Something else.", next = "BACK" },
      },
    },
    regulars_dizzy = {
      lines = { { id = "rgd_default", text = "Because he hasn't got any eyes, poor fool, only the glass one a wizard enchanted for him, and the Bloodsail took that too. He's our best lookout when he can see, so ask him about it, but buy him a drink first." } },
      choices = {
        { text = "I'll go and talk to him.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    regulars_garrett = {
      lines = { { id = "rgg_default", text = "He tells you exactly what each vial will do and never pretends it's medicine, and in this town that's practically sainthood. I buy my oil from him, and Strom sends every student he has." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    rogue = {
      lines = { { id = "ro_default", text = "Never rob anyone between the tunnel and the docks, because the Baron's Bruisers will throw you in the bay with weights on. Out past the reef the Bloodsail are fair game, and a Blackwater sailor will help you carry the loot if you share it." } },
      choices = {
        { text = "Who's the best mark on the coast?", next = "rogue_mark" },
        { text = "Did you ever think about training as a rogue?", next = "rogue_strom" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue_mark = {
      lines = { { id = "rom_default", text = "The Bloodsail paymasters, who carry the fleet's wages in leather satchels and drink in their camps along the coast. Rob them and you'll have the Baron's thanks and the Bloodsail's undying hatred, and both are worth having." } },
      choices = {
        { text = "Stealing from pirates is still stealing.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A pirate's purse belongs to whoever takes it.", next = "BACK", fx = { align = { honor = -1 }, learn = { "bloodsail" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue_strom = {
      lines = { { id = "ros_default", text = "Strom offered to teach me once, and I told him I'd learned all my knife work from the end of a Bloodsail cutlass. He laughed and said that's how all the best ones learn, and then he stole my pipe to make a point." } },
      choices = {
        { text = "I hope you made him give the pipe back.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ravenholdt = {
      lines = { { id = "rv_default", text = "I grew up a day's ride from those hills, so I've heard the stories, and once a quiet man in grey sat at this table and asked me whether my knife was for sale. I said no, and he paid for my drink and left a raven's feather on the bar, and I've never decided whether that was a compliment or a warning." } },
      choices = {
        { text = "What did he want with a troll knife?", next = "ravenholdt_why" },
        { text = "Did you keep the feather?", next = "ravenholdt_feather" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ravenholdt_why = {
      lines = { { id = "rvw_default", text = "He didn't say, and people from that house don't explain themselves to pirates. My guess is they collect sharp things the way my father collects old ones, and they'd rather own a blade like mine than meet it on a dark night." } },
      choices = {
        { text = "A blade belongs to whoever earns it. Keep it.", next = "BACK", fx = { align = { order = -1 }, learn = { "alterac" } } },
        { text = "If they asked politely, you should've heard their offer.", next = "BACK", fx = { align = { order = 1 }, learn = { "alterac" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ravenholdt_feather = {
      lines = { { id = "rvf_default", text = "It's in my father's letter box, under the name-day letters, which seemed like the safest place I know. If you ever get invited up into those hills, tell them Catelyn still has her knife and still isn't selling." } },
      choices = {
        { text = "I'll tell them, if they ever ask.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The same, and I'd be grateful if you didn't write to tell him you saw me with my boots on a tavern table. He wanted me to follow him into the Kirin Tor, and I wanted to see the edge of the map, and we both still think the other one chose wrong." } },
      choices = {
        { text = "Magic is a gift. You should have studied it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Towers are dull. I'd have run off to sea too.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpala = {
      big = true,
      lines = { { id = "xpala_default", text = "They do in Booty Bay, because the rum is the same for everybody and the Bloodsail don't care who they're stabbing. I'd take a paladin on a boarding party any day, so long as you didn't preach at the prisoners." } },
      choices = {
        { text = "Even a Bloodsail prisoner deserves mercy.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'd save my sermons for the ones worth saving.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Ships, knives, the Bloodsail anchorages and more about Dalaran than I'd like. Ask about any of it, and I'll tell you the parts that don't embarrass me." } },
    background = { { id = "tp_bg", text = "An archmage's daughter who ran away to sea and found she liked it. Ask me properly and I'll tell you the rest.", next = "family" } },
    bloodsail = { { id = "tp_bloodsail", text = "They'd burn the Bay to own the ashes, and one of them still owes me an apology for a knife." } },
    alterac = { { id = "tp_alterac", text = "I grew up under the dome, a day's ride from those hills, and I've no wish to go back to either." } },
    _none = { { id = "tp_none", text = "If it didn't come across the water or out of my father's letters, I haven't heard of it, love." } },
  },
}

-- Deeg: a dwarf of the Blackwater Raiders who runs the ship's tobacco and grieves over every stolen crate.
P:NPC {
  key = "deeg", id = TODO_NPC("Deeg"), name = "Deeg", title = "Blackwater Raiders",
  bible = "bibles/booty_bay_salty.md", role = "questgiver", tier = "quest",
  communities = { "booty_bay", "blackwater" }, temper = { "gruff" }, values = { "loyal", "practical" },
  notices = { "race", "kit" },

  impression = {
    first = "Deeg is a dwarf of the Blackwater Raiders with a pinch of snuff always halfway to his nose. He grumbles about the Bloodsail as if they'd stolen his own mother, and it turns out they stole his tobacco, which he seems to think is worse.",
    third = "{name} met Deeg, a dwarf of the Blackwater Raiders who keeps Booty Bay supplied with snuff and tobacco, when the Bloodsail aren't stealing it.",
  },

  greetings = {
    { id = "g_bar", text = "Aye, what is it? Speak up, friend, because my ears are full of sea salt and my nose is empty, and both have me in a temper." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Sit yerself down, and don't lean on that crate, because it's the last one I've got." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, were ye? The Bloodsail took two more crates while ye were off, so ye picked a fine time to come home." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde, eh? Aye, well, the Bloodsail steal from us both, so I'll call it a truce if you will." },
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "A son of Khaz Modan, in this sweatbox! Come here and let me hear a proper accent before I forget what one sounds like." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Ye look like ye've been keelhauled twice and dried on the rigging, friend. Get that armor seen to before the Bloodsail notice the holes in it." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Don't ye dare tell me ye've invented a machine that makes snuff, because I've heard that one before and it blew up a perfectly good warehouse in Ironforge." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Deeg, of the Blackwater Raiders, and I keep this whole fleet in tobacco and snuff, or I did until the Bloodsail started taking my crates. A sailor without his pipe is a sailor ready to mutiny, so ye can guess how my week's been." },
        { id = "h_snuff", tags = { "news" }, when = { questActive = TODO_QUEST("Up to Snuff") },
          text = "Any luck with my snuff, then? The Bloodsail have it stashed somewhere along the coast, and every hour it sits in their damp holds it loses a little more of its kick." },
        { id = "h_snuff_done", when = { questDone = TODO_QUEST("Up to Snuff") },
          text = "There's the one who brought back my snuff! I've had a pinch of it every hour since, and my nose has never been happier, though my wife in Ironforge would say otherwise." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf! Pull up a barrel, cousin, and let's toast the mountains we're both too daft to go home to. I'm Deeg, and the Raiders' snuff and tobacco is my lookout." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome, all the way down here! I'm Deeg, and I'll thank ye not to tinker with my snuff boxes, because the last gnome who did made one that sneezed back." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "Another tauren! The Fleet Master's one of yours, ye know, and he's the only one aboard who can't smoke a pipe without setting fire to his own nose ring." },
        { id = "h_warrior", when = { class = "WARRIOR" },
          text = "A fighter, by the look of ye, and that's what I need, since the Bloodsail don't give back stolen crates because ye ask them nicely. I'm Deeg, and I'll explain over a pinch." },
        { id = "h_seen", when = { metBefore = true },
          text = "Still here, still grumbling, and still out of snuff, if ye were wondering. The Bloodsail have a lot to answer for." },
      },
      again = {
        { id = "h_again", text = "What else, then? Ask quick, before my nose starts itching again." },
        { id = "h_again2", text = "Go on, {g:lad|lass}. I've nothing to do but sit here and curse the Bloodsail by my beard." },
        { id = "h_again3", text = "More questions? Aye, ask away, I've all night and half a cask." },
      },
      choices = {
        { text = "Why does a pirate fleet need so much snuff?", next = "snuff" },
        { text = "How does a dwarf end up a Blackwater Raider?", next = "origin" },
        { text = "Something must have happened to your tobacco shipment.", next = "theft" },
        { text = "Who are the folk drinking in here?", next = "folk" },
        { text = "Can I have a pinch of that?", next = "pinch" },
        { text = "Do ye miss Ironforge, cousin?", next = "k_dwarf", when = { race = "Dwarf" } },
        { text = "Does Seahorn smoke a pipe too?", next = "k_tauren", when = { race = "Tauren" } },
        { text = "I'll leave you to your grumbling.", next = "END" },
      },
    },

    snuff = {
      lines = { { id = "sn_default", text = "Because a sailor on watch at night needs something to keep his eyes open, and a sailor in a fight needs something to steady his hands afterward. Snuff does both, and it doesn't blow out in the wind like a pipe does, so it's worth its weight in gold out on the water." } },
      choices = {
        { text = "That snuff must come from somewhere.", next = "snuff_where" },
        { text = "Sounds like a bad habit to me.", next = "snuff_habit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    snuff_where = {
      lines = { { id = "snw_default", text = "The leaf's grown by some farmers up in Westfall, or it was before the Defias made that a dangerous business. I grind it myself with a bit of cinnamon and a pinch of something I'll not tell ye, because a dwarf never gives away his recipe." } },
      choices = {
        { text = "The Defias should be hunted down for ruining honest trade.", next = "BACK", fx = { align = { order = 1 }, learn = { "defias" } } },
        { text = "Westfall's farmers have it hard. I don't blame the Defias.", next = "BACK", fx = { align = { order = -1 }, learn = { "defias" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    snuff_habit = {
      lines = { { id = "snh_default", text = "Aye, so's breathing, and so's drinking, and so's sailing with pirates, and I've no plans to give up any of them. My grandfather took snuff for a hundred and forty years and died falling off a ram, so I don't think it was the snuff that got him." } },
      choices = {
        { text = "Ha! Then I'll never argue with a dwarf about habits.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    origin = {
      lines = {
        { id = "or_default", text = "I was a deckhand on a Menethil cargo ship, and the Bloodsail took her off the Savage Coast. The Blackwater took her back, and they offered me a berth, and I thought it beat swimming home." },
        { id = "or_dwarf", when = { race = "Dwarf" }, text = "Same as most of us who go to sea, cousin, which is that I got tired of looking at rock walls. I sailed out of Menethil, got taken by the Bloodsail, got rescued by the Blackwater and never quite found the time to leave." },
      },
      choices = {
        { text = "Was it a hard choice?", next = "origin_choice" },
        { text = "The Fleet Master seems to treat you well.", next = "origin_seahorn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    origin_choice = {
      lines = { { id = "orc_default", text = "Not really, since my ship's captain had sold me out to the Bloodsail for a cut of the cargo. Turns out the Blackwater were more honest than he was, which says something about Menethil, though I'm not sure what." } },
      choices = {
        { text = "A man should keep his word, pirate or not.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Your captain played the odds. That's business.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    origin_seahorn = {
      lines = { { id = "ors_default", text = "Seahorn's the best captain I've sailed under, and he pays on time, and the Baron's paymaster still owes me for the Cape run. Only don't let him near my snuff box, because he's got a nose the size of a cannon and he'll empty it in one go." } },
      choices = {
        { text = "I'll keep him away from your box.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    theft = {
      lines = {
        { id = "th_default", text = "The Bloodsail hit our supply barge off the coast, and they took every crate of tobacco and snuff aboard her while leaving the rum, which tells ye they knew exactly what they were after. Somebody told them which barge was carrying what, and I'd like a word with that somebody." },
        { id = "th_active", when = { questActive = TODO_QUEST("Up to Snuff") }, text = "Ye know the story, since ye're out hunting for it. The Bloodsail took every crate off our supply barge and left the rum behind, so somebody told them exactly which barge to hit." },
      },
      choices = {
        { text = "You think there's a spy in the Bay?", next = "theft_spy" },
        { text = "Why would pirates care about snuff?", next = "theft_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    theft_spy = {
      lines = { { id = "ths_default", text = "There's always a spy in the Bay, friend, because the Bloodsail keep a man in every tavern on this coast. I've my suspicions about a few of the faces in here, but I'll keep them to myself until I've proof, since a wrong accusation in this town gets ye thrown in the bay." } },
      choices = {
        { text = "Find him and hand him to the Bruisers.", next = "BACK", fx = { align = { order = 1 }, learn = { "bloodsail" } } },
        { text = "Find him and feed him lies instead.", next = "BACK", fx = { align = { order = -1 }, learn = { "bloodsail" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    theft_why = {
      lines = { { id = "thw_default", text = "Because snuff's worth more by weight than rum, and because a Blackwater crew without it gets cranky and careless. The Bloodsail know that a tired lookout misses ships, and they'd rather we were all looking the wrong way when they come for the Bay." } },
      choices = {
        { text = "That's clever of them, I'll admit.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    folk = {
      lines = { { id = "fk_default", text = "Catelyn's the one with her boots on the table, and she's better with a knife than anyone in the fleet, though she'll tell ye different since she lost her best knife. Dizzy's by the window, and the poor lad can't see a thing without his glass eye, which the Bloodsail also took." } },
      choices = {
        { text = "The Bloodsail take a lot from this crew.", next = "folk_bloodsail" },
        { text = "Something else.", next = "BACK" },
      },
    },
    folk_bloodsail = {
      lines = { { id = "fkb_default", text = "Aye, they do, and that's no accident, because a crew that's lost its lookout, its best blade and its snuff is a crew that's half beaten already. If ye've a mind to help, friend, start with any one of us, because every crate and eye ye bring back is a blow against them." } },
      choices = {
        { text = "Then I'll take the fight to them.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    pinch = {
      lines = {
        { id = "pi_default", text = "Ye can have a sniff of the box, and that's all, because this is the last of my private stock until my crates come home. Go on, then, and don't sneeze on it." },
        { id = "pi_done", when = { questDone = TODO_QUEST("Up to Snuff") }, text = "Aye, ye've earned it, since it was ye who brought it home. Hold it to one side of the nose and breathe gentle, and if yer eyes water, that's how ye know it's the good stuff." },
      },
      choices = {
        { text = "That's strong enough to knock over a kodo!", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "I'll pass, but thank you.", next = "BACK" },
      },
    },

    k_dwarf = {
      lines = { { id = "kd_default", text = "Every morning, cousin, when I wake up sweating in a hammock instead of under a proper stone roof. Still, the sea's got its charms, and nobody in Ironforge would let me grind snuff in the Great Forge." } },
      choices = {
        { text = "A dwarf belongs in the mountain. Go home someday.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A dwarf belongs wherever he likes. Stay at sea.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_tauren = {
      lines = { { id = "kt_default", text = "He does, and he's a menace with it, because I've seen him light his pipe and singe his own snout three times this season. He laughs it off every time, but he's started making me light it for him, which is a great honor and a great nuisance." } },
      choices = {
        { text = "Seahorn should give up the pipe.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Tobacco, snuff, ships and Bloodsail, and how much they're all worth, give or take a crate." } },
    background = { { id = "tp_bg", text = "Deckhand out of Menethil, taken by the Bloodsail, rescued by the Blackwater, and never left.", next = "origin" } },
    bloodsail = { { id = "tp_bloodsail", text = "They've got my snuff, and I'll not rest until I've got it back." } },
    defias = { { id = "tp_defias", text = "They've made Westfall's tobacco fields a dangerous place, and the price of leaf has doubled since." } },
    _none = { { id = "tp_none", text = "Never heard of it, {g:lad|lass}, and if it's not snuff or Bloodsail, I've nae interest in learning." } },
  },
}

-- Dizzy One-Eye: the Raiders' lookout, who lost both eyes and then the enchanted glass one that replaced them.
P:NPC {
  key = "dizzy", id = TODO_NPC("Dizzy One-Eye"), name = "Dizzy One-Eye", title = "Blackwater Raiders",
  bible = "bibles/booty_bay_salty.md", role = "questgiver", tier = "quest",
  communities = { "booty_bay", "blackwater" }, temper = { "cheerful", "anxious" }, values = { "loyal", "brave" },
  notices = { "voice", "smell" },

  impression = {
    first = "Dizzy One-Eye sits by the Salty Sailor's window with his face turned toward the sea and two empty sockets where his eyes should be. He's cheerful in a brittle way, and he knew me by my footsteps before I'd said a word.",
    third = "{name} met Dizzy One-Eye, the Blackwater Raiders' lookout in Booty Bay, who lost his eyes in battle and then lost the enchanted glass eye that let him see again.",
  },

  greetings = {
    { id = "g_window", text = "Who's that? Don't tell me, let me guess from yer boots, because I'm getting better at it, though I'd rather not have to." },
    { id = "g_back", when = { metBefore = true }, text = "I know that step! Ye've been here before, and ye've a heavy left heel, so come sit by the window and tell me what ye see." },
    { id = "g_away", when = { away = 14 }, text = "That step's been gone {away}, by my count, and I count everything now that I can't watch it. Welcome back, whoever ye are." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Ye smell of Grom'gol's cookfires, so Horde, I'd guess. Sit down anyway, because a blind man can't afford to be choosy about his company." },
  },

  notice = {
    { id = "n_pet", cat = "smell", when = { pet = { type = "Beast" } },
      text = "Something's sniffing at my boots, and it's not one of Skindle's dogs. Keep {pet} close, friend, because I can't see to get out of its way." },
    { id = "n_mage", cat = "voice", when = { class = "MAGE" },
      text = "Ye've got magic on ye, I can hear it humming. It sounds a bit like my old glass eye did, and I miss that sound something terrible." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Dizzy One-Eye, lookout for the Blackwater Raiders, though I'm not much of a lookout these days. The Bloodsail took my glass eye in an ambush, and now I'm sitting by a window I can't see out of, listening for ships." },
        { id = "h_eye", tags = { "news" }, when = { questActive = TODO_QUEST("Keep An Eye Out") },
          text = "Have ye found it? The Bloodsail have my eye somewhere about the Bay, and I'd know its glow anywhere, if I could see it, which I can't, which is the whole problem." },
        { id = "h_eye_done", when = { questDone = TODO_QUEST("Keep An Eye Out") },
          text = "There ye are! I can see ye now, and ye've a better face than I'd imagined from yer boots, so don't let anyone tell ye different. That's my beautiful eye working again, and I owe ye for every ship I spot." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "A spellcaster! I can hear the magic on ye, humming like my old eye. Ye wouldn't happen to know how to enchant glass, would ye, just in case the Bloodsail keep it?" },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, by the smell of yer beast, and ye've the sharpest eyes in any crowd, I'll wager. I'd trade ye a year's wages for one of 'em, and I'd only want the left one." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest, from the way ye speak so gentle. I've asked the Light for my eyes back plenty of times, but it never answers, and I suppose it's busy." },
        { id = "h_seen", when = { metBefore = true },
          text = "Back again! I'd say it's good to see ye, but ye know how that is with me. It's good to hear ye, anyway." },
      },
      again = {
        { id = "h_again", text = "What else, then? I'm listening, and that's all I can do these days." },
        { id = "h_again2", text = "Go on, I'm not going anywhere, as ye can probably tell." },
        { id = "h_again3", text = "More? Ask, and I'll tell ye what I hear." },
      },
      choices = {
        { text = "How did you lose your eyes?", next = "eyes" },
        { text = "Tell me about the glass eye.", next = "glass" },
        { text = "Why are you called One-Eye if you have none?", next = "name" },
        { text = "You must hear plenty, sitting by the window.", next = "listen" },
        { text = "Can a mage make you a new eye?", next = "xmage", when = { class = "MAGE" } },
        { text = "Can the Light heal your sight, Dizzy?", next = "xpriest", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "I'll let you get back to your listening.", next = "END" },
      },
    },

    eyes = {
      lines = { { id = "ey_default", text = "A boarding fight off the Wild Shore, years back, when a Bloodsail threw a pot of burning pitch across the deck. I caught it full in the face, and when I woke up in Skindle's back room, the world had gone dark and stayed that way." } },
      choices = {
        { text = "That must have been terrible.", next = "eyes_after" },
        { text = "Did you get the one who threw it?", next = "eyes_revenge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eyes_after = {
      lines = { { id = "eya_default", text = "It was, for a while, and I won't lie to ye about the drinking. But Seahorn kept me on the crew roll and paid me anyway, and he said a lookout's ears were half his job, so I learned to listen until my ears were better than most men's eyes." } },
      choices = {
        { text = "Seahorn's a good captain to stand by you.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    eyes_revenge = {
      lines = { { id = "eyr_default", text = "No, and I've thought about it every day since. The fellow sails on a Bloodsail ship still, and I'd know his laugh anywhere, so one day he'll walk into this tavern and I'll hear him." } },
      choices = {
        { text = "Then he'll get what he deserves, and I'll help.", next = "BACK", fx = { align = { honor = -1 }, trait = { brave = 1 } } },
        { text = "Let it go, Dizzy. Revenge won't bring your eyes back.", next = "BACK", fx = { align = { honor = 1 }, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    glass = {
      lines = {
        { id = "gl_default", text = "A wizard in Menethil Harbor made it for me, out of pity, I think, and maybe a bit of curiosity about whether it would work. It did, and better than he'd hoped, because I could see further with that one glass eye than I ever had with my own two." },
        { id = "gl_done", when = { questDone = TODO_QUEST("Keep An Eye Out") }, text = "It's right here in my head, thanks to ye, and it's working fine, though it itches when the weather's turning. A wizard in Menethil made it, and I can see further with it than I ever did with my own two." },
      },
      choices = {
        { text = "Who was the wizard?", next = "glass_wizard" },
        { text = "The Bloodsail must have known where to find it.", next = "glass_stolen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    glass_wizard = {
      lines = { { id = "glw_default", text = "He never gave his name, only said he'd come from Dalaran and was heading south, and he wanted a passage on one of our ships. He enchanted my eye on the dock while we were loading, and I never saw him again, though I suppose I didn't see him the first time either." } },
      choices = {
        { text = "Dalaran? Catelyn's father is from there.", next = "glass_catelyn", when = { heardLine = "catelyn.fm_default" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    glass_catelyn = {
      lines = { { id = "glc_default", text = "Aye, and I asked her about it once, and she went quiet and said she didn't want to know if it was him. I think she's afraid he's been keeping watch on her through my eye all this time, and I've told her that's daft, but I've wondered it myself." } },
      choices = {
        { text = "A father watching his daughter isn't so terrible.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    glass_stolen = {
      lines = {
        { id = "gls_default", text = "They jumped me in the dark down by the docks, and they knew exactly what they were after, because they took the eye and left my purse. A Bloodsail lookout with an enchanted eye is worth ten of ours, and they know it." },
        { id = "gls_active", when = { questActive = TODO_QUEST("Keep An Eye Out") }, text = "They jumped me down by the docks, and it's the Bloodsail ye'll find carrying it, so check their pockets, friend. They took the eye and left my purse, so they knew exactly what they wanted." },
      },
      choices = {
        { text = "Then they'll lose more than an eye when I find them.", next = "BACK", fx = { align = { honor = -1 }, learn = { "bloodsail" } } },
        { text = "I'll get it back, and I'll only take what's yours.", next = "BACK", fx = { align = { honor = 1 }, learn = { "bloodsail" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    name = {
      lines = { { id = "nm_default", text = "Because I had one left for a while, after the pitch, and the crew started calling me One-Eye then. When the second one went, nobody had the heart to change it, and I'd grown fond of it anyway." } },
      choices = {
        { text = "And the Dizzy part?", next = "name_dizzy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name_dizzy = {
      lines = { { id = "nmd_default", text = "That one's older, from my first voyage, when I spent three days hanging over the rail. I've got my sea legs now, but sailors never let a name go once they've found a good one, as ye can tell." } },
      choices = {
        { text = "Two good names. Plenty of sailors die with none.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    listen = {
      lines = { { id = "ls_default", text = "Everything, friend, from the gulls fighting over scraps to the Bruisers arguing over cards on the pier. I can tell a Blackwater ship from a Bloodsail one by the creak of her rigging, and that's a skill no lookout with eyes ever bothered to learn." } },
      choices = {
        { text = "Then you're still the best lookout in the Bay.", next = "BACK", fx = { affinity = 1 } },
        { text = "What have you heard lately?", next = "listen_rumor" },
      },
    },
    listen_rumor = {
      lines = { { id = "lsr_default", text = "The Bloodsail have more ships off the coast than they did a month ago, and they've been sailing at night without lanterns, which means they're up to something. I've told Seahorn, and he believes me, but the Baron says he wants it in writing." } },
      choices = {
        { text = "The Baron should listen to his lookout.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "The Baron's right to want proof first.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Maybe, if ye knew the trick of it, though the wizard who made mine said it took him a month and a lot of swearing. Ye wouldn't want to try it on a blind man in a tavern, I'd think, in case it went wrong and I ended up seeing nothing but sheep." } },
      choices = {
        { text = "Magic should be used to help folk like you.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Magic's too dangerous to tinker with on a whim.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriest = {
      big = true,
      lines = { { id = "xpriest_default", text = "A priest in Menethil tried once, and he said the burns had gone too deep for any prayer to reach. He was kind about it and cried a little, which is more than I did, so I don't blame the Light, only the pitch." } },
      choices = {
        { text = "The Light heals what it can. Keep faith.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If the Light can't help, steel and glass will do.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "What I hear, which is more than ye'd think: ships, sailors, gulls and secrets, mostly." } },
    background = { { id = "tp_bg", text = "Lookout for the Blackwater, blind from Bloodsail pitch, and seeing again only when a wizard's glass lets me.", next = "eyes" } },
    bloodsail = { { id = "tp_bloodsail", text = "They took my eyes and then my glass one, and I'll know their ships by the sound of their rigging till I die." } },
    _none = { { id = "tp_none", text = "Never heard that one mentioned by the window, friend, and I hear most things." } },
  },
}

-- Sly Garrett: Shady Goods, a Hillsbrad apothecary's apprentice who sells poison and tells you so.
P:NPC {
  key = "slygarrett", id = TODO_NPC("Sly Garrett"), name = "Sly Garrett", title = "Shady Goods",
  bible = "bibles/booty_bay_salty.md", role = "vendor", tier = "service",
  communities = { "booty_bay" }, temper = { "dry", "sharp" }, values = { "honest", "practical" },
  notices = { "class", "purse" },

  impression = {
    first = "Sly Garrett sells poisons, powders and lockpicks from a narrow counter in Booty Bay, and he's the most straightforward man I've met in the port. He told me exactly what everything would do to a person, and he didn't once pretend any of it was medicine.",
    third = "{name} met Sly Garrett, Booty Bay's poison seller, a Hillsbrad man who calls his trade shady and means it as an honest description.",
  },

  greetings = {
    { id = "g_counter", text = "Shady goods, as the sign says, and I'll never pretend they're anything else. What are you after?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still breathing, so I assume you've been careful with what you bought last time. Good." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and I'd started to wonder whether you'd mixed something wrong. Glad to see you've still got all your fingers." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde coin spends the same as anyone's at this counter, friend, and poison doesn't care who's holding the vial." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Ian Strom has sent you, or soon will, because every rogue in this town ends up at my counter sooner or later. Look around, and ask if you've questions." },
    { id = "n_poor", cat = "purse", when = { money = { max = 2000 } },
      text = "Your purse is light for this counter, friend, and good poison's not cheap. Browse all you like, though, since looking's free." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Sly Garrett, and before you ask, the name was given by a goblin who thought it was clever, and I kept it because it's good for trade. I sell poisons, powders, vials and thieves' tools, and I'll tell you exactly what each one does." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "One of the trade, and I can tell from the way you're eyeing my vials that you know what's in them. Deadly, crippling, instant or mind-numbing, I've the lot, and none of it watered, unlike the goblins on the docks." },
        { id = "h_rogue_vet", when = { class = "ROGUE", minLevel = 40 },
          text = "You've been through this counter enough times that I could guess your order without asking, though I'll ask anyway out of politeness. What'll it be this time, and how many?" },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest at a poison counter, now there's a sight I don't see often. If you're here to tell me I'm a sinner, I'll agree with you and we can both get on with our day." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "A paladin, and you're looking at my stock like it's a nest of vipers, which isn't entirely wrong. I'll not sell to you, I expect, but you're welcome to stand there and disapprove." },
        { id = "h_scourge", when = { race = "Scourge" },
          text = "One of the Undercity's, and I'll warn you now that my poisons are made for the living, so they'll do you little harm and less good. I can still sell you vials, if the Apothecaries are short." },
        { id = "h_seen", when = { metBefore = true },
          text = "Back for more, I see, so the last lot must have done its work. I'll not ask on whom." },
      },
      again = {
        { id = "h_again", text = "What else? I've got customers, though none as talkative as you." },
        { id = "h_again2", text = "Go on, ask. I'd rather answer questions than have you guess." },
      },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "How does a man end up selling poison?", next = "origin" },
        { text = "Someone must buy all this from you.", next = "buyers" },
        { text = "Is it safe to keep poison in a tavern?", next = "safety" },
        { text = "Strom says never buy from goblins on the docks.", next = "rogue_strom", when = { class = "ROGUE", any = { { heardLine = "ianstrom.trp_default" }, { heardLine = "ianstrom.trp_vet" } } } },
        { text = "Selling poison is a vile trade.", next = "xpala", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "I'll be on my way.", next = "END" },
      },
    },

    origin = {
      lines = { { id = "or_default", text = "I was an apothecary's apprentice in Hillsbrad, making tonics for the farmers and rat poison for their barns. Then the plague swept through Lordaeron, and my master fled, and I came south with his recipe book and a bad feeling about anything sold as medicine." } },
      choices = {
        { text = "Why not keep making tonics?", next = "origin_tonics" },
        { text = "You must miss Hillsbrad some days.", next = "origin_home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    origin_tonics = {
      lines = { { id = "ort_default", text = "Because I saw what a tonic sold by a liar could do when the grain went bad, and I wanted no more part of it. Poison's honest, at least, since nobody ever buys it thinking it'll make them well." } },
      choices = {
        { text = "An honest poisoner. There's a strange thing.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Every trade can be done with honor.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Honesty doesn't make poison any less deadly.", next = "BACK", fx = { align = { honor = -1 }, trait = { skeptical = 1 } } },
      },
    },
    origin_home = {
      lines = { { id = "orh_default", text = "Some days, when the heat's bad and I remember the orchards in autumn. But the plague's up there still, and the Syndicate's in the hills, and Southshore smells of fish and fear these days, so I'll take the jungle." } },
      choices = {
        { text = "The Syndicate needs rooting out.", next = "BACK", fx = { learn = { "syndicate" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    buyers = {
      lines = { { id = "by_default", text = "Rogues, mostly, sent by Strom, and Blackwater sailors who want their cutlasses to bite a little deeper when the Bloodsail come aboard. Now and then a hunter wants something to bring down a raptor, and I've sold a vial or two to folk who didn't say why, though I sleep well enough." } },
      choices = {
        { text = "Doesn't it trouble you, not knowing their purpose?", next = "buyers_trouble" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_trouble = {
      lines = { { id = "byt_default", text = "Not much, because I'm not the one holding the knife. A smith sells swords and a carpenter sells coffins, and nobody asks them what their customers do with them afterward." } },
      choices = {
        { text = "You're responsible for what you sell, Garrett.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A merchant's not a magistrate. You're right.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    safety = {
      lines = { { id = "sf_default", text = "Safer than a tavern full of drunk sailors with swords, which is what it's sitting in. Every vial's sealed with wax and labeled in my own hand, and the dangerous ones are locked behind the counter where only I can reach them." } },
      choices = {
        { text = "What happens if one breaks?", next = "safety_break" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safety_break = {
      lines = { { id = "sfb_default", text = "Then the whole tavern clears out for an hour and Skindle sends me a bill, which has happened exactly once. The rats under the floorboards haven't come back since, so Skindle grumbled less than you'd expect." } },
      choices = {
        { text = "Ha! A service to the tavern, then.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    rogue_strom = {
      lines = { { id = "rs_default", text = "He's right, and it's why he sends his students to me. The ones on the docks cut their poisons with seawater and charge you extra for the vial, and I've lost count of the rogues who came to me afterward asking why their blades stopped working." } },
      choices = {
        { text = "Then I'll buy from you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xpala = {
      big = true,
      lines = { { id = "xpala_default", text = "It is, and I've never said otherwise. But the Bloodsail would burn this town to the waterline if the Blackwater didn't stop them, and the Blackwater fight a little better with my oil on their blades." } },
      choices = {
        { text = "Some trades can't be justified, whatever the cause.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If it keeps the Bay safe, I can live with it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Poisons, powders, locks and the folk who buy them, and what each one does to a person." } },
    background = { { id = "tp_bg", text = "Hillsbrad apothecary's apprentice, until the plague came north and I came south.", next = "origin" } },
    syndicate = { { id = "tp_syndicate", text = "They're in the hills above Hillsbrad, and I'll not sell to anyone wearing their colors." } },
    _none = { { id = "tp_none", text = "That's nothing I sell, friend, and nothing I've heard of, so I can't help you." } },
  },
}

-- Pix Xizzix: the Undermine Trader, newly set up in Booty Bay after pirates took her and her brothers' start-up money.
P:NPC {
  key = "pix", id = TODO_NPC("Pix Xizzix"), name = "Pix Xizzix", title = "Undermine Trader",
  bible = "bibles/booty_bay_salty.md", role = "vendor", tier = "quest",
  communities = { "booty_bay" }, temper = { "eager", "brash" }, values = { "greedy", "loyal" },
  notices = { "purse", "kit" },

  impression = {
    first = "Pix Xizzix is a young goblin trader who talks faster than I can follow and prices everything in sight, including the conversation. She's fresh from Undermine, short of capital and determined to make it big in Booty Bay.",
    third = "{name} met Pix Xizzix, a goblin trader from Undermine who set up shop in Booty Bay after pirates robbed her and her brothers of their start-up money.",
  },

  greetings = {
    { id = "g_shop", text = "Hey, hey, a customer! Come on in, pal, everything's for sale and most of it's even legal." },
    { id = "g_back", when = { metBefore = true }, text = "Repeat business! That's what I like to see, sweetheart, so come on over and let's talk numbers." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, pal, and I've got new stock, new prices and a new sign, though the old sign was better and cost less." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde coin, Alliance coin, it's all coin to me, buddy, and coin is what keeps the lamps lit." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "Whoa, whoa, that's a heavy purse you've got there, pal. Let me show you some things that'll make it lighter, and you'll thank me for it." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Sparks and sprockets, your gear's in rough shape, buddy! You need repairs, and I happen to offer repairs, so let's call that fate." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Pix Xizzix, Undermine Trader, and I'm the newest, sharpest, most ambitious goblin in this port, pal. I've got gear, I've got goods, I've got repairs, and I've got two brothers who owe me money, so step right up." },
        { id = "h_money", tags = { "news" }, when = { questActive = TODO_QUEST("Show Me The Money!") },
          text = "Have you found those pirates yet, sweetheart? My brothers and I had every copper we'd saved in that chest, and I want it back with interest, or at least without bite marks." },
        { id = "h_money_done", when = { questDone = TODO_QUEST("Show Me The Money!") },
          text = "There's my favorite investor! You got our money back, pal, and on my mother's ledger, I'll remember it as long as I'm in business, which is gonna be a long time." },
        { id = "h_vet", when = { minLevel = 60 },
          text = "Now you look like somebody who's been places, buddy, the kind of places that have old relics lying around. I'm buying curiosities, so if you've got any, let's talk." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome! Don't take this wrong, pal, but the last gnome in my shop tried to fix my cash box and now it only opens on Tuesdays. What can I sell you?" },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf, and dwarves always pay on time, which makes you my favorite customer already, friend. What are you looking for?" },
        { id = "h_seen", when = { metBefore = true },
          text = "Back again, and you've still got money, I hope, because I've got new stock and it's not gonna buy itself." },
      },
      again = {
        { id = "h_again", text = "What else, pal? Time's tickin', and every minute's a minute I'm not selling." },
        { id = "h_again2", text = "Go on, ask, and then buy something, because that's how this works." },
        { id = "h_again3", text = "More questions? I charge for those, sweetheart, but you get the first few free." },
      },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "What brings an Undermine trader to Booty Bay?", next = "origin" },
        { text = "Why do your brothers owe you money?", next = "money" },
        { text = "Tell me about your brothers.", next = "brothers" },
        { text = "What kind of curiosities do you buy?", next = "relics", when = { minLevel = 50 } },
        { text = "You seem to have taken to Booty Bay.", next = "bay" },
        { text = "A goblin repairing gnomish gear? Really?", next = "k_gnome", when = { race = "Gnome" } },
        { text = "I'll come back when I've got more coin.", next = "END" },
      },
    },

    origin = {
      lines = { { id = "or_default", text = "Undermine's crowded, pal, wall to wall with trade princes and their cousins and their cousins' accountants, and there's no room for a new face to grow. So my brothers and I scraped together everything we had and sailed for Booty Bay, because the Steamwheedle say there's money in Stranglethorn for anybody quick enough to grab it." } },
      choices = {
        { text = "I'd have thought Ratchet or Gadgetzan suited you better than Booty Bay.", next = "origin_why" },
        { text = "Do you miss Undermine?", next = "origin_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    origin_why = {
      lines = { { id = "orw_default", text = "Ratchet's got Gazlowe, and Gadgetzan's got Noggenfogger, and they both charge rent like it's a hobby. Booty Bay's got pirates, sure, but pirates buy things, and they buy 'em fast and they don't haggle, which makes them the best customers on the coast." } },
      choices = {
        { text = "Selling to pirates is asking for trouble.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    origin_miss = {
      lines = { { id = "orm_default", text = "Sure, I miss the noise and the smell of burnt oil and my mother's cooking, which was terrible but cheap. But you don't make a fortune by sitting home, sweetheart, so I'll visit when I'm rich and not a minute before." } },
      choices = {
        { text = "You'll make it, Pix. I can tell.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    money = {
      lines = {
        { id = "mn_default", text = "Pirates, pal, that's what happened! We sailed in with a chest full of start-up capital, and before we'd even unpacked, a gang of cutthroats rowed off with it in the night, and now I'm running a shop on credit and spite." },
        { id = "mn_done", when = { questDone = TODO_QUEST("Show Me The Money!") }, text = "You know what happened, since you're the one who fixed it! Pirates took our chest, you took it back, and now I'm running a real business instead of a shop on credit and spite." },
      },
      choices = {
        { text = "Did you report it to the Baron?", next = "money_baron" },
        { text = "I'll find those pirates for you.", next = "money_help", when = { ["not"] = { questDone = TODO_QUEST("Show Me The Money!") } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    money_baron = {
      lines = { { id = "mnb_default", text = "Sure I did, and he said that what happens on the water is the Blackwater's business, and the Blackwater said it was the Bruisers', and the Bruisers asked me to fill out a form in triplicate. I've learned more about Booty Bay's paperwork in a week than about its customers." } },
      choices = {
        { text = "The Baron should protect every merchant in his port.", next = "BACK", fx = { align = { order = 1 }, learn = { "steamwheedle" } } },
        { text = "In a pirate port, you look after yourself.", next = "BACK", fx = { align = { order = -1 }, learn = { "steamwheedle" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    money_help = {
      lines = {
        { id = "mnh_default", text = "Would you, pal? Because that's a valued customer right there, and I'll remember it, but I need somebody who's been around a bit, so come back when you look tougher." },
        { id = "mnh_active", when = { questActive = TODO_QUEST("Show Me The Money!") }, text = "You're already on it, buddy, and every hour that chest's out there, it's earning interest for somebody else, so get moving!" },
      },
      choices = {
        { text = "I'm on it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    brothers = {
      lines = { { id = "br_default", text = "Rix and Frix, and they're twins, and they're both useless, though I love 'em. Rix wanted to open a rocket shop on the pier, and Frix wanted to sell insurance against Rix's rockets, and I told 'em both we'd sell gear, because gear doesn't explode." } },
      choices = {
        { text = "Where are they now?", next = "brothers_where" },
        { text = "Rockets and insurance? That's a business plan.", next = "brothers_plan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brothers_where = {
      lines = { { id = "brw_default", text = "Out working off the debt, pal, since they're the ones who left the chest unguarded. Last I heard, Rix was hauling crates on the docks and Frix was haggling with old Kebok over cargo, and losing, which is good for him." } },
      choices = {
        { text = "Family should work together, Pix.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If they lost your money, cut them loose.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    brothers_plan = {
      lines = { { id = "brp_default", text = "That's what Frix said, and it would've been a great plan, except Rix's first rocket blew the roof off our cabin on the ship down. Nobody got hurt, except his eyebrows, and he's growing them back slowly." } },
      choices = {
        { text = "Ha! Goblin rockets always find a roof.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    relics = {
      lines = { { id = "rl_default", text = "Old stuff, pal, the older the better, like elven trinkets, dwarven ledgers, things with runes on 'em that hum when you pick them up. There are collectors in Undermine who'll pay through the nose for anything with a story, and I'm the middle goblin, so bring 'em here first." } },
      choices = {
        { text = "Where would I find such things?", next = "relics_where" },
        { text = "Selling old relics feels wrong somehow.", next = "relics_wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    relics_where = {
      lines = { { id = "rlw_default", text = "Anywhere dangerous, buddy, which is where all the good stuff ends up, funny enough. Dire Maul, Blackrock, the plague lands up north, anywhere nobody sensible goes, so you'll do just fine." } },
      choices = {
        { text = "I'll keep my eyes open.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    relics_wrong = {
      lines = { { id = "rlwr_default", text = "Wrong? Sweetheart, those relics are just sitting in the dark collecting dust, and I'm giving 'em a second life in a nice collector's case. That's practically charity, and I'm only taking a small fee for my trouble." } },
      choices = {
        { text = "History belongs where it was found.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Relics rotting in the dark help nobody. Sell them.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    bay = {
      lines = { { id = "bay_default", text = "It's loud, it's wet, it smells of fish and gunpowder, and I love it, pal! Everybody here's selling something, and everybody's buying something, and the Baron takes a cut of all of it, which is the most beautiful thing I've ever seen." } },
      choices = {
        { text = "You must have competition here.", next = "bay_rivals" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bay_rivals = {
      lines = { { id = "bayr_default", text = "Everybody, sweetheart, but mostly Kebok and his cousins, who've been here so long they think they own the docks. They don't, of course, because the Baron owns the docks, and he rents them out by the plank." } },
      choices = {
        { text = "Then out-sell them all, Pix.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    k_gnome = {
      lines = { { id = "kg_default", text = "Hey, gear's gear, pal, and a goblin can fix anything, as long as you don't ask how. Your gnomish stuff's all springs and clockwork, and mine's all bolts and spit, but they both run on gold, so we're not so different." } },
      choices = {
        { text = "Gnomish engineering is far superior.", next = "BACK", fx = { trait = { proud = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Prices, pal, and who's buying, and who's selling, and where the good relics are hiding." } },
    background = { { id = "tp_bg", text = "Undermine trader, newly arrived, robbed by pirates, and still in business out of sheer spite.", next = "origin" } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The Cartel runs the port and the Baron runs the Cartel's port, and I pay rent to both, so I'm a big fan." } },
    _none = { { id = "tp_none", text = "Never heard of it, pal, and if I can't sell it, I don't need to know about it." } },
  },
}
