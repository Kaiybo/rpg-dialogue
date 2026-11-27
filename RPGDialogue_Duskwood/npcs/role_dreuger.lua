-- Role Dreuger, Deputy Mayor of Darkshire, in the town hall. Voice: bibles/role_dreuger.md
-- Impatient with the council's bickering; wants action against the evil in the woods.
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "role_dreuger", id = TODO_NPC("Role Dreuger"), name = "Role Dreuger",
  title = "Deputy Mayor of Darkshire",
  bible = "bibles/role_dreuger.md", role = "noble", tier = "quest",
  communities = { "darkshire" }, temper = { "brisk" }, values = { "order", "duty" },
  notices = { "status", "soldier" },

  impression = {
    first = "He wants the council to act and can't make it.",
    third = "{name} met Role Dreuger, Darkshire's deputy mayor, who is weary of the council's bickering and wants action against the evil in the woods.",
  },

  greetings = {
    { id = "dp_warm", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, good to see you. Come, I'll put you ahead of the queue; the council owes you that much." },
    { id = "dp_cold", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'll see you, but I'll see you after everyone else, and the queue is long." },
    { id = "g_hall", text = "You've business with the council? Then you've come to the right hall and, I'm afraid, the wrong week." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Good; one of us should be getting something done." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and in that time the council has met four times and decided nothing. Welcome back." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've made a name for yourself since you first came into this hall. I wish I could say the same for the council." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "I've heard your name spoken kindly in town, and kind words are scarce in Darkshire these days." },
    { id = "g_word_intim", when = { word = "intimidated" }, text = "They tell me you've been threatening folk. I want action in Darkshire, but not that kind." },
  },

  notice = {
    { id = "n_noble", cat = "status", when = { origin = "human_minor_noble" },
      text = "You've the bearing of someone raised among the nobility. Don't expect it to impress anyone in this town; we've had our fill of Stormwind's nobles." },
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "A fighter, thank the Light. I spend all day among men who fight with words, and the woods don't fear words." },
  },

  start = "hello",
  nodes = {
    rol_led1 = {
      lines = {
        { id = "rol_led1_1", text = "Clerk Daltry, in theory, and I check every page of it, in practice. The council votes money it doesn't have and Daltry writes it down, and afterwards I go through the columns to see which of our promises we can actually keep." },
      },
      choices = {
        { text = "How many can you keep?", next = "rol_led2" },
        { text = "Something else, Deputy Mayor.", next = "BACK" },
      },
    },
    rol_led2 = {
      lines = {
        { id = "rol_led2_1", text = "The Watch's oil, the Watch's bread, and the roof on the town hall, in that order. Everything else is a hope with a number next to it, and I've learned not to read the numbers aloud in the chamber." },
      },
      choices = {
        { text = "The Watch comes first, then.", next = "rol_led3" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    rol_led3 = {
      lines = {
        { id = "rol_led3_1", text = "It has to, because without the Watch there's no town to have a council. Councilman Millstipe disagrees in principle, but he's never once voted against the oil, and I notice he walks home by the lamps." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    rol_sw1 = {
      lines = {
        { id = "rol_sw1_1", text = "Rebuild the old garrison and post real soldiers on the roads, then send the Watch home to their farms for a season. They've earned the rest, and most of them have forgotten what their own fields look like." },
      },
      choices = {
        { text = "Will Stormwind send anyone?", next = "rol_sw2" },
        { text = "I'm from Stormwind. They have troubles of their own.", next = "rol_sw2", when = { race = "Human" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rol_sw2 = {
      lines = {
        { id = "rol_sw2_1", text = "Not this year, nor the next, by the tone of the last reply, which thanked us for our loyalty and enclosed nothing. Until then we have the Commander, and the Watch, and folk like you, and we make that do." },
      },
      choices = {
        { text = "Then I'll do what I can.", next = "BACK" },
        { text = "Back to other matters.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Role Dreuger, Deputy Mayor. The people of Darkshire expect more from their council, and so do I, but constant bickering gets us nowhere." },
        { id = "h_morbent", when = { questDone = TODO_QUEST("Morbent Fel") },
          text = "I'm told Morbent Fel is dead, and that you had a hand in it. The council will argue about whose idea that was for a month, but I know it wasn't ours." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "A paladin. This place stinks of grave-dirt and worse, and I'd welcome anyone who can push back against it." },
      },
      again = {
        { id = "h_again", text = "Anything else? The council reconvenes shortly, more's the pity." },
        { id = "h_again2", text = "Go on. I'd rather talk to you than to them." },
      },
      choices = {
        { text = "What's the council arguing about?", next = "council" },
        { text = "The town looks short of nearly everything.", next = "needs" },
        { text = "What do you think of Lord Ebonlocke?", next = "ello" },
        { text = "Lord Ebonlocke has sent me after Dextren Ward.", next = "dextren", when = { questActive = TODO_QUEST("Crime and Punishment") } },
        { text = "Who keeps the town's ledgers?", next = "rol_led1" },
        { text = "What would you do with Stormwind's help, if it came?", next = "rol_sw1" },
        { text = "Who waits in the council's queue?", next = "e3_queue" },
        { text = "Good day, Deputy Mayor.", next = "END" },
      },
    },
    council = {
      lines = { { id = "c_default", text = "Everything. Who should pay for the Watch, whether to write to Stormwind again, whose turn it is to speak. Meanwhile something in the woods is taking our people, and we argue about the agenda." },
      },
      choices = {
        { text = "Why not act without them?", next = "council_act" },
        { text = "Something else.", next = "BACK" },
      },
    },
    council_act = {
      big = true,
      lines = { { id = "ca_default", text = "Because a deputy mayor who goes around the council is the next thing the council argues about. I've thought about it, I'll admit. What would you do?" },
      },
      choices = {
        { text = "Work through the council. Break it, and you've nothing.", next = "BACK", reply = "That's the sensible answer, and I hate that it's right. A broken council would leave Darkshire with nothing but me and a stack of unsigned orders.", fx = { align = { order = 1 } } },
        { text = "Act. The dead don't wait for a vote.", next = "BACK", reply = "You'd make a poor councilman and a fine deputy, which is more than I can say for half the town hall. I'll think on it, and not for as long as they would.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "That's for you to decide.", next = "BACK" },
      },
    },
    needs = {
      lines = { { id = "n_default", text = "More watchers, more lamp oil, and fewer families moving away. Every empty house is one more place for something to hide." },
      },
      choices = {
        { text = "What's taking people?", next = "needs_what" },
        { text = "Something else.", next = "BACK" },
      },
    },
    needs_what = {
      lines = { { id = "nw_default", text = "Worgen in the north woods, the dead at Raven Hill, Defias on the western road, and worse things I won't name in the hall. Commander Ebonlocke could give you the full list, if you've an hour." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ello = {
      lines = { { id = "e_default", text = "He's our lord, and he does his best, and his best is very loud. I'd sooner not say more than that inside his own hall." },
      },
      choices = { { text = "Understood. Something else.", next = "BACK", fx = { trait = { discreet = 1 } } } },
    },
    dextren = {
      lines = { { id = "dx_default", text = "Good. Every councilman in this hall knows he's alive in that Stockade, and nobody will say it aloud, because Stormwind's nobles took him out of our justice." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    e3_queue = {
      lines = {
        { id = "e3_queue_l0", text = "Farmers asking for the Watch to guard their last fields, widows asking for the Watch's pensions, and the Watch asking for more oil. Every one of them has a right to be heard, and every one leaves without what they came for, because the council has nothing left to give." },
      },
      choices = {
        { text = "What do you tell them?", next = "e3_queue2" },
        { text = "That's a hard queue to face.", next = "BACK" },
      },
    },
    e3_queue2 = {
      lines = {
        { id = "e3_queue2_l0", text = "The truth, mostly, because they can smell anything else. I write their names down, and once a month I read the list aloud to the council, and once a month Lord Ello thumps the table and nothing changes." },
      },
      choices = {
        { text = "Keep reading it. Something else.", next = "BACK" },
        { text = "The truth won't feed them.", next = "BACK" },
      },
    },
  },

  topics = {
    regard = {
      { id = "dp_rg", text = "You get things done, which is more than the council does. I wish I had ten of you on the payroll." },
    },
    grievance = {
      { id = "dp_gv", text = "You've been nothing but trouble for this hall, and I have enough trouble already. Mind yourself." },
    },
    background = { { id = "tp_bg", text = "Deputy Mayor to Lord Ebonlocke, member of the council, and the man who keeps the minutes nobody reads." } },
    advice = { { id = "tp_ad", text = "Don't wait for permission to do what's right in Duskwood. Nobody here will give it." } },
    _none = { { id = "tp_none", text = "That's not a matter for the council, as far as I know. Ask Clerk Daltry; he keeps the records." } },
    varian = { { id = "tp_varian", text = "The Council of Darkshire expects more of the Crown, and the Crown, in the king's absence, expects less of itself. I keep the minutes of every letter, and nobody reads those either." } },
    prestor = { { id = "tp_prestor", text = "Every reply from the Keep is signed on the Highlord's behalf by his advisers, and Lady Prestor's hand appears on more of them than his own does. The people of Darkshire expect more than courtesy." } },
    raven_hill = { { id = "tp_raven_hill", text = "Raven Hill is a failure of this council, and I've said so in session twice. Evil lingers in the air there, and we must act before it lingers here." } },
    dark_riders = { { id = "tp_dark_riders", text = "The riders are a matter for the council and the Watch, and neither has the men to deal with them. That's the plain truth, and the council would prefer I didn't say it." } },
  },
}
