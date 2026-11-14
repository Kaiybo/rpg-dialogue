-- Jitters, hiding in Raven Hill. Voice: bibles/jitters.md
-- Ex-Defias. Saw things in the woods. Saw worse at the Yorgen farm. Hungry, mostly.
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "jitters", id = TODO_NPC("Jitters"), name = "Jitters",
  bible = "bibles/jitters.md", role = "questgiver", tier = "quest",
  communities = { "raven_hill" }, temper = { "cowardly" }, values = { "honest" },
  notices = { "fright", "hunger" },

  greetings = {
    { id = "g_flinch", text = "Wh- who's there? Oh. Oh, it's a person. Good. You're a person, right?" },
    { id = "g_food", when = { questActive = TODO_QUEST("Jitters' Growling Gut") }, text = "Food? Is that food? Please say that's food." },
    { id = "g_after", when = { questDone = TODO_QUEST("Return to Sven") }, text = "Oh. You. You told him. Didn't you. It's fine. It's fine." },
  },

  notice = {
    { id = "n_stealth", cat = "fright", place = "replace", when = { stealthed = true },
      text = "AH! Don't do that! Don't ever do that! My heart's not what it was. It was never much to start with." },
    { id = "n_worgen", cat = "fright", when = { form = { "bear", "cat" } },
      text = "Get back! Get- oh. A druid. You're a druid. I knew that. I'm going to sit down now." },
    { id = "n_cook", cat = "hunger", when = { profession = "Cooking" },
      text = "You smell like a kitchen. Any chance you've got something? Anything? I've been eating bark. The bark here tastes like fog." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Jitters, they call me. On account of the jitters. I jump at things. You'd jump too, if you'd seen what I've seen in these woods." },
        { id = "h_gut", tags = { "news" }, when = { questActive = TODO_QUEST("Jitters' Growling Gut") },
          text = "Can't go to town. Can't go in the woods. Can't go anywhere. And I'm so hungry I can hear my stomach arguing with itself." },
        { id = "h_gut_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Jitters' Growling Gut"), days = 3 } },
          text = "That was the best meal I've had in a year. Maybe ever. Don't tell anyone where I am. Please." },
        { id = "h_sven", when = { questActive = TODO_QUEST("Return to Sven") },
          text = "You're going to tell Sven, aren't you. Tell him I didn't do anything. Tell him I just watched. That's worse, isn't it. It's worse." },
        { id = "h_defias", when = { topicKnown = "defias" },
          text = "I wore the red, once. Before. I'm not proud of it. I'm not proud of much. I'm alive, though. That's something." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "AH! Oh. An elf. From the sky? I didn't know elves came from the sky. I don't know anything. That's fine. That's fine." },
      },
      choices = {
        { text = "What did you see?", next = "saw" },
        { text = "Why are you hiding?", next = "hiding" },
        { text = "Stay safe, Jitters.", next = "END" },
      },
    },
    saw = {
      big = true,
      lines = {
        { id = "s_default", key = true,
          text = "Riders. In black. At the Yorgen farm, looking for something. They killed everyone. I was in the barn. I didn't move. I didn't do anything. I just watched." },
      },
      choices = {
        { text = "You couldn't have stopped them.", next = "END", fx = { affinity = 2, trait = { kind = 1 }, align = { light = 1 } } },
        { text = "You should have tried.", next = "END", fx = { affinity = -2, trait = { stern = 1 } } },
      },
    },
    hiding = {
      lines = {
        { id = "h2_default", text = "From the worgen. From the riders. From Sven, mostly. He saw me burying something once. He thinks it's my fault. Maybe he's right." },
      },
      choices = { { text = "...", next = "END", fx = { learn = { "worgen" } } } },
    },
  },

  topics = {
    worgen = { { id = "tp_worgen", text = "My friends. The ones I came here with. The wolves got them. I ran. I'm good at running." } },
    defias = { { id = "tp_defias", text = "Don't. Please. They don't let people leave. I left." } },
    stalvan = { { id = "tp_stalvan", text = "The manor? I don't go near the manor. I don't go near anything." } },
    _none = { { id = "tp_none", text = "I don't know! I don't know anything! That's how I've stayed alive." } },
  },
}
