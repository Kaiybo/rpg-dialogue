-- Farmer Furlbrow (Theodore), squatting at the Jansen Stead. Voice: bibles/furlbrow.md
-- Lost his farm to the Defias and his wagon to the road.
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "furlbrow", id = TODO_NPC("Farmer Furlbrow"), name = "Farmer Furlbrow",
  bible = "bibles/furlbrow.md", role = "farmer", tier = "quest",
  communities = { "westfall_farms" }, temper = { "cowardly" }, values = { "honest" },
  notices = { "startle", "mount" },
  impression = {
    first = "Theodore Furlbrow lost his farm to thieves and now waits beside a broken wagon with his wife. He insists they're only minding this place for now, as if saying so might make it true.",
    third = "{name} met Farmer Furlbrow, driven from his pumpkin farm by thieves, who still hopes to go home.",
  },

  greetings = {
    { id = "g_porch", text = "This isn't our place, you understand. We're just minding it for now." },
    { id = "g_deed", when = { questActive = TODO_QUEST("Furlbrow's Deed") }, text = "The deed? You've found our deed? Oh, let me see it, please, let me see." },
    { id = "g_watch", when = { questDone = TODO_QUEST("The Forgotten Heirloom") }, text = "It still ticks, you know, and I wind it every morning like a silly old man." },
    { id = "g_away", when = { away = 14 }, text = "Oh, it's you, and after {away}! I'd half feared something dreadful had happened, though I fear that about most things these days." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown so strong since we first met by this wagon, and I'm a little in awe of it. I wish I'd half your nerve, and I'd settle for a quarter of it." },
    { id = "g_word_intim", when = { word = "intimidated" }, text = "I heard you gave someone round the farms a proper fright. Please don't do it to me, because I frighten easily enough on my own." },
  },

  notice = {
    { id = "n_startle", cat = "startle", place = "replace", when = { stealthed = true },
      text = "Light's sake! Don't creep up on a man like that, not out here, not after what we've been through." },
    { id = "n_horse", cat = "mount", when = { mounted = true },
      text = "Lovely animal. Don't let it near our wagon wheel; it's the only one that still turns." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I tell Verna we will, and I mostly believe it. The land's still ours in my heart, whatever the thieves think. Maybe the earth remembers whose it was." } },
      choices = {
        { text = "Hold on to hope, Theodore. The land remembers you.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Let it go. Start fresh somewhere safer.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Any means? I've lain awake thinking about that, I'll not lie to you, and some nights I'd have shaken hands with anything that offered. But Verna would know, and she'd never look at me the same, so the farm stays lost until somebody honest fetches it." },
      },
      choices = {
        { text = "Then I'll leave it to honest hands, Theodore.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Honest hands lost it. Mine could bring it back.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Theodore.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Not one, no; there were too many, and they came at night with torches. But a dozen like you might have, and the king sent none, so here we sit, with Blanchy and a broken wagon." } },
      choices = {
        { text = "I'll help take back what's yours.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "It's gone, old man. Look forward instead.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "He chased the first of them off the porch and never came back, and I like to think he's out there somewhere, chasing gnolls. Verna says I'm a fool for hoping, and she's right, but I hope anyway." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} has the look of a loyal beast. Keep it close; the Defias don't spare animals any more than people." },
      },
      choices = {
        { text = "I'll keep watch for him, Theodore.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "He's gone. Best not to hope.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "I asked a mage that once, on the road out of Elwynn, and he looked at the axle like I'd asked him to raise the dead. Turns out spells don't come cheap and wheels do, so here we sit." } },
      choices = {
        { text = "A proper wheelwright beats any spell, Theodore.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Forget the wagon. Take what you need and walk.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Will you ever go back to the farm?", next = "back" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "Stormwind needed timber to rebuild after the orcs burned it, and Westfall had timber to give. They paid us for it, too, for a while. Now the wind blows straight off the sea, and the topsoil goes with it." } },
      choices = {
        { text = "Plant a windbreak. I'll show you which saplings will take.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "That's what comes of selling your land to a city.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every night, and Verna does it twice as often as I do. Nobody's answered with a wheelwright yet, but you came up the road, so maybe somebody's listening after all." } },
      choices = {
        { text = "Someone is listening, Theodore. Hold on to that.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayer won't mend a wagon wheel. Hands will.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Nobody, I expect. The thieves have the house, Stormwind has its own troubles, and I've a broken wagon and a tired horse, so if there's justice left in this kingdom, it hasn't come down the road to Westfall yet." } },
      choices = {
        { text = "The law will reach Westfall again. I'll see that it does.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Forget the law, Theodore. Take your farm back by force.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Theodore.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_druidx", when = { class = "DRUID" },
          text = "You've the look of the forest about you. We had trees here once, before the war and the woodcutters took them all." },
        { id = "h_default", text = "Theodore Furlbrow's the name. Verna and I grew pumpkins north of here until the thieves came, and now we grow nothing." },
        { id = "h_deed_before", when = { questBefore = TODO_QUEST("Furlbrow's Deed") },
          text = "They made me give up the deed. Stood over me till I did. It's out there somewhere, in one of their pockets." },
        { id = "h_deed_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Furlbrow's Deed"), days = 3 } },
          text = "Our deed, with our names on it, Verna's and mine. The note says they kept it to copy for their forgeries, but not anymore." },
        { id = "h_heirloom", when = { questActive = TODO_QUEST("The Forgotten Heirloom") },
          text = "It's my pocket watch. Verna's father gave it to me the day we wed, and it's in the wardrobe at the old house, with thieves sleeping in our beds." },
        { id = "h_heirloom_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Forgotten Heirloom"), days = 3 } },
          text = "Her father's watch, and you brought it back to me. I've nothing to give you but this handshake, and it's a good one." },
        { id = "h_wagon", text = "We tried to leave for Elwynn, but the wagon broke on the road. So here we are in someone else's empty house, sharing it with the mice and waiting on a wheel." },
        { id = "h_dream", when = { metBefore = true }, text = "I dreamt about the pumpkins again, every one of them as big as a wagon wheel. Then I woke up and remembered, but it was a good dream while it lasted." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. If you'd come a year ago, maybe I'd still be on my farm, and maybe not, but I'd have liked to see you try." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. We had a dog once, a good dog, before the thieves came, and I miss him more than the pumpkins." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Verna will be glad of you, since she's been doing all the praying and I've not been much help with it." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. If the Light's finally come to Westfall, it'll find plenty of work waiting." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "You've a smell of brimstone about you, stranger. Verna won't like it, but I'm past minding much." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman. We're only minding this spot for now, you understand. If your spirits could speak to our farm, they'd find it full of thieves." },
      },
      again = {
        { id = "h_again", text = "Something else? I've time enough, since time's about all I've got." },
        { id = "h_again2", text = "Go on. I'm only watching the road for a wheelwright." },
      },
      choices = {
        { text = "What became of the old trees here?", next = "druid_talk", when = { class = "DRUID" } },
        { text = "Will you go back to your farm?", next = "back" },
        { text = "What happened the night you left?", next = "night" },
        { text = "Why not fix the wagon and go?", next = "wagon" },
        { text = "Tell me about your deed.", next = "deed" },
        { text = "Fear isn't a sin, Theodore.", next = "courage", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "I remember your pumpkins. Everyone did.", next = "pumpkins", when = { origin = "human_westfall_farmhand" } },
        { text = "Can I help?", next = "BUSINESS" },
        { text = "I could get your deed back from the Defias.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Couldn't magic mend your wagon, Theodore?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Could a warrior have saved your farm, Theodore?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What happened to your dog, Theodore?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Have you prayed about the farm, Theodore?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Who'll answer for taking your farm, Theodore?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would you take back your farm by any means, Theodore?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you think you'll get your farm back, Theodore?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Take care, Theodore.", next = "END" },
      },
    },
    back = {
      big = true,
      lines = {
        { id = "b_default", text = "Verna says yes. I say yes when she's listening. Truth is, I don't know if I've the stomach for it anymore." },
      },
      choices = {
        { text = "You will. Give it time.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 }, align = { light = 1 } } },
        { text = "There's no shame in starting over.", next = "BACK", fx = { align = { light = -1 }, affinity = 1, trait = { skeptical = 1 } } },
        { text = "What would it take?", next = "back_take" },
      },
    },
    back_take = {
      lines = { { id = "bt_default", text = "The thieves gone and the walking scarecrows gone, and me not jumping every time a crow lands. That last one's the hardest." } },
      choices = {
        { text = "The first two, I can help with.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Thieves and scarecrows are the militia's problem, not mine.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    night = {
      lines = {
        { id = "ni_default", text = "Verna heard it first, a noise out in the fields. I looked out and they were everywhere, red in the lamplight, so we took what we could carry and ran." },
        { id = "ni_done", when = { questDone = TODO_QUEST("The Forgotten Heirloom") },
          text = "We ran so fast I left the one thing I'd have carried through fire, and you fetched it back. I still can't believe it." },
      },
      choices = {
        { text = "Did you leave anything behind?", next = "watch" },
        { text = "Running kept you both alive.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    watch = {
      lines = { { id = "wa_default", key = true, text = "My pocket watch, in the wardrobe. Verna's father gave it to me on our wedding day, and I left it for thieves. I'd like it back before I'm too old to wind it." } },
      choices = {
        { text = "I'll find it.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wagon = {
      lines = { { id = "wg_default", text = "With what? The wheel's split clean through, and nobody out here mends wheels anymore, because they've all gone east. So we sit, and Verna calls it resting." } },
      choices = {
        { text = "Saldean stayed. Why not you?", next = "saldean" },
        { text = "Something else.", next = "BACK" },
      },
    },
    saldean = {
      lines = { { id = "sd_default", text = "Saldean's as stubborn as a stump. I begged him to pack up and come with us, and he laughed at me. Well, I'm not stubborn, I'm stuck, and there's a difference." } },
      choices = {
        { text = "He calls you the fool.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Maybe staying takes a different courage.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
    deed = {
      lines = { { id = "de_default", text = "The thieves leaned on me till I signed it over, and I'm not proud of it. They'd have burned the house with us in it." } },
      choices = {
        { text = "Why would thieves want a deed?", next = "forgery" },
        { text = "You did what you had to.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    forgery = {
      lines = { { id = "fg_default", text = "To copy, the note said. Forge their own and call our farms theirs, all neat and legal. Paper's a weapon too, in the wrong hands." } },
      choices = {
        { text = "Then the deed's worth fighting for.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Paper's only paper. Hold the land and let them forge all they like.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    courage = {
      big = true,
      lines = { { id = "co_default", text = "Isn't it? It feels like one. A man's supposed to stand in front of his wife, not behind her holding the lamp." } },
      choices = {
        { text = "You got her out alive, Theodore. Wagons can be mended.", next = "BACK", fx = { affinity = 3, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Then stand in front of her next time.", next = "BACK", fx = { align = { light = -1 }, affinity = -1, trait = { stern = 1 } } },
      },
    },
    pumpkins = {
      lines = { { id = "pu_default", text = "You remember them? Rows and rows of them, orange right up to the hills, and somebody still remembers. Thank you for that." } },
      choices = {
        { text = "They'll grow again.", next = "BACK", fx = { affinity = 3, align = { light = 1 } } },
        { text = "Those fields are gone, friend. Best let them go.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    rogue = {
      lines = { { id = "rogue_l", text = "Could you? Quietly, I mean, without anyone getting hurt? Because I've no wish to see another soul die over a piece of paper with my name on it." } },
      choices = {
        { text = "Quietly. Nobody will even know I was there.", next = "BACK", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "Not quietly. They should know who took it back.", next = "BACK", fx = { align = { honor = 1 }, trait = { brave = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've had a lot of time to think, sitting here by a broken wagon. Ask me about any of this, if you've a mind to." },
    },
    background = { { id = "tp_bg", text = "A pumpkin farmer, and husband to Verna, which is the better job of the two. There's not much else to me, these days.", next = "night" } },
    advice = { { id = "tp_ad", text = "Get out of Westfall while you still can, or don't, since nobody listens to me anyway. Saldean certainly doesn't." } },
    defias = { { id = "tp_defias", text = "Please, don't ask me about them. I see red masks every time I close my eyes." } },
    old_blanchy = { { id = "tp_blanchy", text = "Pulled our wagon longer than I can remember. Now she can barely pull herself. Verna won't hear of selling her." } },
    westfall = { { id = "tp_westfall", text = "Pumpkins, rows of them all the way to the hills. You'd never believe it now." } },
    _none = { { id = "tp_none", text = "I don't know much anymore. Ask Verna; she remembers for both of us." } },
  },
}
