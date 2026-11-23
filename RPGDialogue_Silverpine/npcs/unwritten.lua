-- Silverpine spirits no earlier pass reached: the Minor Manifestation of Water on the North Tide's Run,
-- freed of its corruption during the shaman's Call of Water. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.silverpine")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Minor Manifestation of Water: North Tide's Run, west of the Sepulcher.
P:NPC {
  key = "sp_minor_manifestation_water", id = TODO_NPC("Minor Manifestation of Water"), name = "Minor Manifestation of Water",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "north_tides_run" }, temper = { "calm", "slow" }, values = { "patient" },
  impression = {
    first = "The water elemental rises out of the shallows of the North Tide's Run, clear now where it was dark, and its voice sounds like a tide drawing back over stones.",
    third = "{name} met a minor manifestation of water on the Silverpine coast, freed from the corruption that fouled it.",
  },
  greetings = {
    { id = "g_default", text = "You stand at the edge of the tide, mortal. The water remembers who comes to it, and it remembers whether they come with clean hands." },
    { id = "g_shaman", when = { class = "SHAMAN" }, text = "A child of the elements walks to the shore. The water has been waiting for you, shaman, longer than you know." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am a small voice of a great sea. Something foul ran into these waters from the land, and it bent me until I struck at anyone who came near." },
        { id = "h_shaman_q", when = { questActive = TODO_QUEST("Call of Water") }, text = "You have done what was needed, and the darkness has gone out of me. Now listen, shaman, and I will tell you how to carry the water's favour." },
      },
      again = { { id = "h_again", text = "Ask, and the tide will answer." }, { id = "h_again2", text = "The water is patient. Speak." } },
      choices = {
        { text = { normal = "What corrupted you?", polite = "Will you tell me what corrupted you?", blunt = "What fouled the water?" }, next = "foul" },
        { text = "You seem calm now.", next = "calm" },
        { text = "What must I do to earn the water's favour?", next = "favour", when = { class = "SHAMAN" } },
        { text = "I'll leave you to the tide.", next = "END" },
      },
    },
    foul = {
      lines = { { id = "f_default", text = "Poison seeped down from the land where the dead brew their tinctures, and from the wizards' works across the lake. Water carries everything that is poured into it, mortal, and it cannot choose what it carries." } },
      choices = {
        { text = "The Forsaken poisoned you?", next = "forsaken" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forsaken = {
      lines = { { id = "fo_default", text = "Some of them, and the gnolls and the Dalaran mages, and every careless hand that dumps its waste in a river. I do not judge them as you judge one another; I only know that the stream tasted of death." } },
      choices = {
        { text = "Those who foul the water should answer for it.", next = "BACK", reply = "Then you speak with the voice of a flood, and floods do not forgive.", fx = { align = { order = 1 } } },
        { text = "Nature heals itself in time.", next = "BACK", reply = "In time, yes, but time is long for a stream and short for a fish.", fx = { align = { order = -1 } } },
      },
    },
    calm = {
      lines = { { id = "c_default", text = "Calm as still water, for now. The tide will rise again and fall again, and when it falls I will be quiet, and when it rises I will remember you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    favour = {
      lines = { { id = "fa_default", text = "Carry clean water from this place to the one who sent you, and the water will know your hand is honest. A totem of water is not made with wood, shaman, but with trust." } },
      choices = {
        { text = "Who sent me, in your eyes?", next = "sender" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sender = {
      lines = { { id = "s_default", text = "One who listens to the elements and taught you to listen too. When you bring the water back, they will see that the sea has spoken to you, and they will teach you to speak back." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That is a matter for earth or fire, mortal. Water knows only what flows." } },
  },
}

---------------------------------------------------------------------------
-- Silverpine Deathguard: Forsaken soldiers of the Sepulcher and the roads.
---------------------------------------------------------------------------
P:NPC {
  key = "sil_deathguard", id = 7489, name = "Silverpine Deathguard",
  role = "guard", tier = "service",
  communities = { "sepulcher" }, temper = { "dry", "watchful" }, values = { "the Dark Lady", "duty" },
  impression = {
    first = "A Forsaken soldier in grey mail, standing guard among the pines as if he has forgotten how to be tired.",
    third = "{name} spoke with a Silverpine Deathguard on the roads around the Sepulcher.",
  },
  greetings = {
    { id = "g_default", text = "Walk carefully in Silverpine. The worgen don't care which side of death you're on." },
    { id = "g_alive", when = { race = "Orc" }, text = "Orc. Keep to the road and you'll keep your skin. The woods are less polite than we are." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Still in one piece, which is more than most of the Dark Lady's errand-runners manage." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "The Deathguard hold the Sepulcher and the roads around it for the Dark Lady. Between the worgen, the Scourge and Gilneas behind its wall, we're never short of work." },
      },
      again = { { id = "h_again", text = "Anything else? I'm on watch, and the pines are never quiet for long." } },
      choices = {
        { text = "What are the worgen?", next = "worgen" },
        { text = "What lies beyond the Greymane Wall?", next = "gilneas" },
        { text = "Why do you serve Sylvanas?", next = "serve" },
        { text = "Carry on, Deathguard.", next = "END" },
      },
    },
    worgen = {
      lines = { { id = "wo_default", text = "Wolf-men, out of Shadowfang Keep and the woods round about. Arugal brought them here, the mad wizard, and now they hunt anything that moves. We've lost good soldiers to their teeth." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gilneas = {
      lines = { { id = "gi_default", text = "Gilneas, sealed up tight behind Greymane's wall. They shut the door on Lordaeron when we needed them, and they've not opened it since. I'd like a word with their king one day." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    serve = {
      lines = { { id = "se_default", text = "She broke the Lich King's hold on us and gave us back our own minds. A debt like that, you pay with your whole unlife and count yourself lucky." } },
      choices = {
        { text = "That's loyalty worth having.", next = "BACK", reply = "It is. Remember it, if you ever think of crossing her.", fx = { align = { order = 1 } } },
        { text = "Trading one master for another is no freedom.", next = "BACK", reply = "Careful. Not everyone here will take that as a joke.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
}
