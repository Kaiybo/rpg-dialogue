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
    first = "Role Dreuger is Darkshire's deputy mayor and the only councilman I met who seemed tired of talking. He wants the council to act and can't make it.",
    third = "{name} met Role Dreuger, Darkshire's deputy mayor, who is weary of the council's bickering and wants action against the evil in the woods.",
  },

  greetings = {
    { id = "g_hall", text = "You've business with the council? Then you've come to the right hall and, I'm afraid, the wrong week." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Good; one of us should be getting something done." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and in that time the council has met four times and decided nothing. Welcome back." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've made a name for yourself since you first came into this hall. I wish I could say the same for the council." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "I've heard your name spoken kindly in town, which is rarer here than you'd think." },
    { id = "g_word_intim", when = { word = "intimidated" }, text = "I hear you've been threatening folk. I want action in Darkshire, but not that kind." },
  },

  notice = {
    { id = "n_noble", cat = "status", when = { origin = "human_minor_noble" },
      text = "You've the bearing of someone raised among the nobility. Don't expect it to impress anyone in this town; we've had our fill of Stormwind's nobles." },
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "A fighter, thank the Light. I spend all day among men who fight with words, and the woods don't fear words." },
  },

  start = "hello",
  nodes = {
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
        { text = "What does the town need most?", next = "needs" },
        { text = "What do you think of Lord Ebonlocke?", next = "ello" },
        { text = "Lord Ebonlocke has sent me after Dextren Ward.", next = "dextren", when = { questActive = TODO_QUEST("Crime and Punishment") } },
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
        { text = "Work through the council. Break it, and you've nothing.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Act. The dead don't wait for a vote.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
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
  },

  topics = {
    background = { { id = "tp_bg", text = "Deputy Mayor to Lord Ebonlocke, member of the council, and the man who keeps the minutes nobody reads." } },
    advice = { { id = "tp_ad", text = "Don't wait for permission to do what's right in Duskwood. Nobody here will give it." } },
    _none = { { id = "tp_none", text = "That's not a matter for the council, as far as I know. Ask Clerk Daltry; he keeps the records." } },
  },
}
